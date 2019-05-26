<?php

header("Content-type:text/html; charset=utf-8");
include_once '../model/login.class.php';

use \model\Login;

$username = $_GET['username'];
$password = $_GET['password'];


$login = new Login();
$res = $login->register($username,$password);
echo json_encode($res);