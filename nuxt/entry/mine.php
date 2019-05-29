<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 13:46
 */
include_once '../controller/user.php';
include_once '../controller/diary.php';


use \controller\User;
use \controller\Diary;


$uid = $_GET['uid'];
$user = new User;
$res = $user->getUserInfo($uid);

$diary = new Diary();
$diaryRes = $diary->getDiary($uid);

$res = array('code'=>200, 'data'=>$res, 'diary'=>$diaryRes,'status'=>'请求成功');
echo json_encode($res);
