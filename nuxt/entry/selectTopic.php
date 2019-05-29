<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/topic.php';

use \controller\Topic;

// $type = $_GET['type'];
$key = $_GET['key'];

$topic = new Topic();
$sql = "SELECT name,id FROM topic WHERE name LIKE '%{$key}%'";
$res = $topic->selectTopic($sql);
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);