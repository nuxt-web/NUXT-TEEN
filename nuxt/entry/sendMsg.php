<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:text/html;charset=utf-8');
header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 
header('Access-Control-Allow-Headers:Content-type');
// include './socket_server.php';
//     $msg = json_encode(array('type' => 'updateMessage', 'message' => '我收到啦'));
//     $msg = code($msg);
//     socket_write($msgsock, $msg, strlen($msg));