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

$topic = new Topic();
$sql = "";
$res = $topic->getTopicList($sql);
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);
