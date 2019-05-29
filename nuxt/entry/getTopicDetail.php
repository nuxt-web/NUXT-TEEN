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
$id = $_GET['id'];

$topic = new Topic();
$sql = "SELECT name, img, attention_num FROM topic WHERE id = {$id}";
$res = $topic->getTopicDetail($sql);
$resArr = array('code'=> 200,'data'=>$res[0],'status'=>'请求成功');
echo json_encode($resArr);
