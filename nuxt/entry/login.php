<?php

header("Content-type:text/html; charset=utf-8");
include_once '../model/login.class.php';

use \model\Login;

$username = $_GET['username'];
$password = $_GET['password'];
//echo $username;

$login = new Login();
$res = $login->check($username,$password);
echo json_encode($res);


