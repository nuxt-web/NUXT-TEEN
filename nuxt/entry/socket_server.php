<?php
/**
 * author: NickBai
 * createTime: 2016/12/9 0009 下午 4:17
 */
namespace NickBai;

class SocketChat
{
    private $timeout = 60;  //超时时间
    private $handShake = False; //默认未牵手
    private $master = 1;  //主进程
    private $port = 9999;  //监听端口
    private static $connectPool = [];  //连接池
    private static $maxConnectNum = 1024; //最大连接数
    private static $chatUser = [];  //参与聊天的用户


    public function __construct( $port = 0 )
    {
        !empty( $port ) && $this->port = $port;
        $this->startServer();
    }

    //开始服务器
    public function startServer()
    {
        $this->master = socket_create_listen( $this->port );
        if( !$this->master ) throw new \Exception('listen $this->port fail !');

        $this->runLog("Server Started : ".date('Y-m-d H:i:s'));
        $this->runLog("Listening on   : 127.0.0.1 port " . $this->port);
        $this->runLog("Master socket  : ".$this->master."\n");

        self::$connectPool[] = $this->master;

        while( true ){
            $readFds = self::$connectPool;
            //阻塞接收客户端链接
            @socket_select( $readFds, $writeFds, $e = null, $this->timeout );

            foreach( $readFds as $socket ){
                //当前链接 是主进程
                if( $this->master == $socket ){

                    $client = socket_accept( $this->master );  //接收新的链接
                    $this->handShake = False;

                    if ($client < 0){
                        $this->log('clinet connect false!');
                        continue;
                    } else{
                        //超过最大连接数
                        if( count( self::$connectPool ) > self::$maxConnectNum )
                            continue;

                        //加入连接池
                        $this->connect( $client );
                    }

                }else{
                    echo '我不是主进程';
                    //不是主进程,开始接收数据
                    $bytes = @socket_recv($socket, $buffer, 2048, 0);
                    //未读取到数据
                    if( $bytes == 0 ){
                        $this->disConnect( $socket );
                    }else{
                        //未握手 先握手
                        if( !$this->handShake ){

                            $this->doHandShake( $socket, $buffer );
                            echo '握手';
                        }else{

                            //如果是已经握完手的数据，广播其发送的消息
                            $buffer = $this->decode( $buffer );
                            $this->parseMessage( $buffer, $socket );
                        }
                    }

                }
            }

        }
    }

    //解析发送的数据
    public function parseMessage( $message, $socket )
    {
        //msg type  1 初始化  2 通知  3 一般聊天  4 断开链接  5 获取在线用户 6 通知下线
        $message = json_decode( $message, true );
        $this->sendToAll( $socket,  $message );
        // switch ($message['type']) {
        //     case 1:
        //         // $this->bind( $socket, $message );
        //         // $msg = [
        //         //     'type' => '1',
        //         //     'msg' => '新用户进入放映厅'
        //         // ];
        //         $this->sendToAll( $socket,  $msg );
        //         break;
        //     case 2:
        //         $this->sendToAll( $socket, $message );
        //         break;
        // }
        // switch( $message['type'] ){

        //     case 1:
        //         $this->bind( $socket, $message );
        //         //通知其他客户端,当前用户上线
        //         $msg = [
        //             'type' => "2",
        //             'msg' => 'online',
        //             'avar' => $message['avar']
        //         ];
        //         $this->sendToAll( $socket,  $msg );
        //         //更新在线用户
        //         $this->freshOnlineUser();

        //         break;
        //     case 3:
        //         $this->sendToAll( $socket, $message );
        //         break;
        //     case 4:
        //         //通知用户离线
        //         $msgOutline = [
        //             'type' => '6',
        //             'user' => self::$chatUser[(int)$socket]['user']
        //         ];
        //         $this->tellOnlineInfo( $msgOutline );
        //         //断开 要离线的用户
        //         $this->disConnect( $socket );
        //         //更新在线用户
        //         $this->freshOnlineUser();

        //         break;
        //     default:
        //         $this->bind( $socket, $message );
        //         //通知其他客户端,当前用户上线
        //         $msg = [
        //             'type' => "2",
        //             'msg' => 'online',
        //             'avar' => $message['avar']
        //         ];
        //         $this->sendToAll( $socket,  $msg );
        //         //更新在线用户
        //         $this->freshOnlineUser();
        //         break;
        // }
    }

    //用户--链接 绑定
    public function bind( $socket, $user )
    {
        self::$chatUser[(int) $socket] = [
            'user' => $user['user'],
            'avar' => $user['avar']
        ];
    }

    //用户--链接 解绑
    public function unBind( $socket )
    {
        unset( self::$chatUser[(int) $socket] );
    }

    //获取在线用户
    public function getOnlineUser()
    {
        return self::$chatUser;
    }

    //更新在线用户
    public function freshOnlineUser()
    {
        $msgOnlie = [
            'type' => "5",
            'msg' => 'online user',
            'info' => self::$chatUser
        ];
        $this->tellOnlineInfo( $msgOnlie );
    }

    //广播所有的客户端(排除自己和master)
    public function sendToAll( $client, $mess )
    {
        //拼装发送者的名称
        // $mess['user'] = self::$chatUser[(int) $client]['user'];
        $mess['stime'] = date('Y-m-d H:i:s');

        foreach( self::$connectPool as $socket ){
            // if( $socket != $this->master && $socket != $client  ){
            //     $this->send( $socket, $mess );
            // }
            if($socket != $this->master && $socket != $client){
                $this->send( $socket, $mess );
            }
        }
    }

    //广播客户端在线用户信息
    public function tellOnlineInfo( $mess )
    {
        foreach( self::$connectPool as $socket ){
            if( $socket != $this->master ){
                $this->send( $socket, $mess );
            }
        }
    }

    //处理发送信息
   public function send( $client, $msg )
    {
        $msg = $this->frame( json_encode( $msg ) );
        socket_write( $client, $msg, strlen($msg) );
    }

    //握手协议
    function doHandShake($socket, $buffer)
    {
        list($resource, $host, $origin, $key) = $this->getHeaders($buffer);
        $upgrade  = "HTTP/1.1 101 Switching Protocol\r\n" .
            "Upgrade: websocket\r\n" .
            "Connection: Upgrade\r\n" .
            "Sec-WebSocket-Accept: " . $this->calcKey($key) . "\r\n\r\n";  //必须以两个回车结尾

        socket_write($socket, $upgrade, strlen($upgrade));
        $this->handShake = true;
        return true;
    }

    //获取请求头
    function getHeaders( $req )
    {
        $r = $h = $o = $key = null;
        if (preg_match("/GET (.*) HTTP/"              , $req, $match)) { $r = $match[1]; }
        if (preg_match("/Host: (.*)\r\n/"             , $req, $match)) { $h = $match[1]; }
        if (preg_match("/Origin: (.*)\r\n/"           , $req, $match)) { $o = $match[1]; }
        if (preg_match("/Sec-WebSocket-Key: (.*)\r\n/", $req, $match)) { $key = $match[1]; }
        return [$r, $h, $o, $key];
    }

    //验证socket
    function calcKey( $key )
    {
        //基于websocket version 13
        $accept = base64_encode(sha1($key . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11', true));
        return $accept;
    }


    //打包函数 返回帧处理
    public function frame( $buffer )
    {
        $len = strlen($buffer);
        if ($len <= 125) {

            return "\x81" . chr($len) . $buffer;
        } else if ($len <= 65535) {

            return "\x81" . chr(126) . pack("n", $len) . $buffer;
        } else {

            return "\x81" . char(127) . pack("xxxxN", $len) . $buffer;
        }
    }

    //解码 解析数据帧
    function decode( $buffer )
    {
        $len = $masks = $data = $decoded = null;
        $len = ord($buffer[1]) & 127;

        if ($len === 126) {
            $masks = substr($buffer, 4, 4);
            $data = substr($buffer, 8);
        }
        else if ($len === 127) {
            $masks = substr($buffer, 10, 4);
            $data = substr($buffer, 14);
        }
        else {
            $masks = substr($buffer, 2, 4);
            $data = substr($buffer, 6);
        }
        for ($index = 0; $index < strlen($data); $index++) {
            $decoded .= $data[$index] ^ $masks[$index % 4];
        }
        return $decoded;
    }

    //客户端链接处理函数
    function connect( $socket )
    {
        array_push( self::$connectPool, $socket );
        $this->runLog("\n" . $socket . " CONNECTED!");
        $this->runLog(date("Y-n-d H:i:s"));
    }

    //客户端断开链接函数
    function disConnect( $socket )
    {
        $index = array_search( $socket, self::$connectPool );
        socket_close( $socket );

        $this->unBind( $socket );
        $this->runLog( $socket . " DISCONNECTED!" );
        if ($index >= 0){
            array_splice( self::$connectPool, $index, 1 );
        }
    }

    //打印运行信息
    public function runLog( $mess = '' )
    {
        echo $mess . PHP_EOL;
    }

    //系统日志
    public function log( $mess = '' )
    {
        @file_put_contents( './' . date("Y-m-d") . ".log", date('Y-m-d H:i:s') . "  " . $mess . PHP_EOL, FILE_APPEND );
    }
}
new SocketChat();
// class SocketService
// {
//     private $address  = '0.0.0.0';
//     private $port = 9999;
//     private $_sockets;
//     public function __construct($address = '', $port='')
//     {
//             if(!empty($address)){
//                 $this->address = $address;
//             }
//             if(!empty($port)) {
//                 $this->port = $port;
//             }
//     }

//     public function service(){
//         //获取tcp协议号码。
//         $tcp = getprotobyname("tcp");
//         $sock = socket_create(AF_INET, SOCK_STREAM, $tcp);
//         socket_set_option($sock, SOL_SOCKET, SO_REUSEADDR, 1);
//         if($sock < 0)
//         {
//             throw new Exception("failed to create socket: ".socket_strerror($sock)."\n");
//         }
//         socket_bind($sock, $this->address, $this->port);
//         socket_listen($sock, $this->port);
//         echo "listen on $this->address $this->port ... \n";
//         $this->_sockets = $sock;
//     }

//     public function run(){
//         $this->service();
//         $clients[] = $this->_sockets;
//         while (true){
//             $changes = $clients;
//             $write = NULL;
//             $except = NULL;
//             socket_select($changes,  $write,  $except, NULL);
//             foreach ($changes as $key => $_sock){
//                 if($this->_sockets == $_sock){ //判断是不是新接入的socket
//                     if(($newClient = socket_accept($_sock))  === false){
//                         die('failed to accept socket: '.socket_strerror($_sock)."\n");
//                     }
//                     $line = trim(socket_read($newClient, 1024));
//                     $this->handshaking($newClient, $line);
//                     //获取client ip
//                     socket_getpeername ($newClient, $ip);
//                     $clients[$ip] = $newClient;
//                     echo  "Client ip:{$ip}   \n";
//                     echo "Client msg:{$line} \n";
//                 } else {
//                     socket_recv($_sock, $buffer,  2048, 0);
//                     $msg = $this->message($buffer);
//                     //在这里业务代码
//                     echo "{$key} clinet msg:",$msg,"\n";
//                     // fwrite(STDOUT, 'Please input a argument:');
//                     // $response = trim(fgets(STDIN));
//                     $response = $msg;
//                     $this->send($_sock, $response);
//                     echo "{$key} response to Client:".$response,"\n";
//                 }
//             }
//         }
//     }

//     /**
//      * 握手处理
//      * @param $newClient socket
//      * @return int  接收到的信息
//      */
//     public function handshaking($newClient, $line){

//         $headers = array();
//         $lines = preg_split("/\r\n/", $line);
//         foreach($lines as $line)
//         {
//             $line = chop($line);
//             if(preg_match('/\A(\S+): (.*)\z/', $line, $matches))
//             {
//                 $headers[$matches[1]] = $matches[2];
//             }
//         }
//         $secKey = $headers['Sec-WebSocket-Key'];
//         $secAccept = base64_encode(pack('H*', sha1($secKey . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11')));
//         $upgrade  = "HTTP/1.1 101 Web Socket Protocol Handshake\r\n" .
//             "Upgrade: websocket\r\n" .
//             "Connection: Upgrade\r\n" .
//             "WebSocket-Origin: $this->address\r\n" .
//             "WebSocket-Location: ws://$this->address:$this->port/websocket/websocket\r\n".
//             "Sec-WebSocket-Accept:$secAccept\r\n\r\n";
//         return socket_write($newClient, $upgrade, strlen($upgrade));
//     }

//     /**
//      * 解析接收数据
//      * @param $buffer
//      * @return null|string
//      */
//     public function message($buffer){
//         $len = $masks = $data = $decoded = null;
//         $len = ord($buffer[1]) & 127;
//         if ($len === 126)  {
//             $masks = substr($buffer, 4, 4);
//             $data = substr($buffer, 8);
//         } else if ($len === 127)  {
//             $masks = substr($buffer, 10, 4);
//             $data = substr($buffer, 14);
//         } else  {
//             $masks = substr($buffer, 2, 4);
//             $data = substr($buffer, 6);
//         }
//         for ($index = 0; $index < strlen($data); $index++) {
//             $decoded .= $data[$index] ^ $masks[$index % 4];
//         }
//         return $decoded;
//     }

//     /**
//      * 发送数据
//      * @param $newClinet 新接入的socket
//      * @param $msg   要发送的数据
//      * @return int|string
//      */
//     public function send($newClinet, $msg){
//         $msg = $this->frame($msg);
//         socket_write($newClinet, $msg, strlen($msg));
//     }

//     public function frame($s) {
//         $a = str_split($s, 125);
//         if (count($a) == 1) {
//             return "\x81" . chr(strlen($a[0])) . $a[0];
//         }
//         $ns = "";
//         foreach ($a as $o) {
//             $ns .= "\x81" . chr(strlen($o)) . $o;
//         }
//         return $ns;
//     }

//     /**
//      * 关闭socket
//      */
//     public function close(){
//         return socket_close($this->_sockets);
//     }
// }

// $sock = new SocketService();
// $sock->run();

// header('Content-Type:text/html;charset=utf-8');
// $address = "127.0.0.1";
// $port = 9999; //调试的时候，可以多换端口来测试程序！
 
// set_time_limit(0); 
// $sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP) or die("socket_create() 失败的原因是:" . socket_strerror(socket_last_error()) . "/n");
// socket_set_block($sock);
// socket_bind($sock, $address, $port);
// socket_listen($sock, 4);
 
// do
// {
//     echo "Waiting for Connection...\n";
//     $msgsock = socket_accept($sock);
//     echo "Waiting for Request...\n";
//     $buf = socket_read($msgsock, 8192);     //读取请求
//     echo "Request Received: $buf\n";
//     $response = hand_shake($buf);
//     socket_write($msgsock,$response,strlen($response)); //发送响应
 
//     //正式开始通信...
//     $buf = socket_read($msgsock, 8192);

//     // for($i=0; $i<3; $i++){
//         // $msg = "WELCOME $i\n";
//         $msg = json_encode(array('type' => 'updateMessage', 'message' => 'hhhhhhh'));
//         $msg = code($msg);
//         // sleep(1);
//         socket_write($msgsock, $msg, strlen($msg));
//     // }
 
//     // socket_close($msgsock);
// } while (true);


// // socket_close($sock);
 
// function hand_shake($buf){
//     $buf  = substr($buf,strpos($buf,'Sec-WebSocket-Key:')+18);
//     $key  = trim(substr($buf,0,strpos($buf,"\r\n")));
 
//     $new_key = base64_encode(sha1($key."258EAFA5-E914-47DA-95CA-C5AB0DC85B11",true));
 
//     $new_message = "HTTP/1.1 101 Switching Protocols\r\n";
//     $new_message .= "Upgrade: websocket\r\n";
//     $new_message .= "Sec-WebSocket-Version: 13\r\n";
//     $new_message .= "Connection: Upgrade\r\n";
//     $new_message .= "Sec-WebSocket-Accept: " . $new_key . "\r\n\r\n";
//     return $new_message;
// }
// function code($msg){
//     $msg = preg_replace(array('/\r$/','/\n$/','/\r\n$/',), '', $msg);
//     $frame = array();
//     $frame[0] = '81';
//     $len = strlen($msg);
//     $frame[1] = $len<16?'0'.dechex($len):dechex($len);
//     $frame[2] = ord_hex($msg);
//     $data = implode('',$frame);
//     return pack("H*", $data);
// }
// function ord_hex($data)  {
//     $msg = '';
//     $l = strlen($data);
//     for ($i= 0; $i<$l; $i++) {
//         $msg .= dechex(ord($data{$i}));
//     }
//     return $msg;
// }
