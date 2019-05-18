<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/24
 * Time: 22:16
 * 数据库类
 */
header('Access-Control-Allow-Origin:*');
header('Content-Type:text/html;charset=utf-8');
header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
// header("Access-Control-Allow-Credentials: true");

class Database{
    // 主机名
    public $host;
    // 端口
    public $port;
    // 用户名
    public $user;
    // 数据库名字
    public $pass;
    // 数据库密码
    public $dbname;
    // 字符集
    public $charset;

    // 连接
    public $link;

    public function __construct(array $info = array()){
        $this->host = $info['host'] ?? 'localhost';
        $this->port = $info['port'] ?? '3306';
        $this->user = $info['user'] ??  'root';
        $this->pass = $info['pass'] ??  '';
        $this->dbname = $info['dbname'] ?? 'teen';
        $this->charset = $info['charset'] ?? 'utf8';
        $this ->sql_connect();
        $this->sql_charset();
    }

    public function sql_connect(){
        $this->link = new Mysqli($this->host,$this->user,$this->pass,$this->dbname,$this->port);

        if ($this->link->connect_error) {
            die('Connect Error(' .$this->link ->connect_errno . ')' . $this->link -> connect_error);
        }
    }

    public function sql_charset(){
        $sql = "set names {$this->charset}";

        $res = $this->link->query($sql);

        if (!$res) {
            die('Charset Error('.$this->link->errno.')');
        }
    }

    public function sql_query($sql,$all = true){
        $res = $this->link->query($sql);
        if (!$res) {
            die('Charset Error('.$this->link->errno.')'.$this->link->error);
        }

        if($all) {
            return $res->fetch_all(MYSQLI_ASSOC);
        } else {
            return $res->fetch_assoc();
        }
    }

    public function sql_inset($sql){
        $res = $this->link->query($sql);
        if (!$res) {
            die('Charset Error('.$this->link->errno.')'.$this->link->error);
        } else {
            return array('code'=> 200, 'status'=> '操作成功', 'data'=>false);
        }
    }

    public function sql_delete($sql){
        $res = $this->link->query($sql);
        if (!$res) {
            die('Charset Error('.$this->link->errno.')'.$this->link->error);
        } else {
            return array('code'=> 200, 'status'=> '操作成功','data'=>true);
        }
    }

    public function get_insert_id() {
        $res = mysqli_insert_id($this->link);
        if (!$res) {
            die();
        } else {
            return $res;
        }
    }
}