<?php

header("Content-type:text/html; charset=utf-8");
include_once '../model/avatar.class.php';

use \model\Avatar;

$uid = $_GET['uid'];
$avatars = $_GET['avatar'];


$avatar = new Avatar();
$res = $avatar->setAvatar($avatars,$uid);
echo json_encode($res);