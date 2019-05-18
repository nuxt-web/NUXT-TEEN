<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/post.php';
include_once '../controller/topic.php';

use \controller\Post;
use \controller\Topic;

$content = $_POST['content'];
$user_id = $_POST['user_id'];
$create_tm = $_POST['create_tm'];
$topic_arr = $_POST['topic'];

$topic = new Topic();
$new_topic = array();
$topic_id = array();

foreach($topic_arr as $key => $value) {
    if (array_key_exists('isNew', $value)) {
        array_push($new_topic, $value['name']);
    } else {
        array_push($topic_id, $value['id']);
    }
}

foreach($new_topic as $key => $value) {
    $sql = "INSERT INTO topic(name, create_tm) VALUES ('{$value}', {$create_tm})";
    $res = $topic -> addTopic($sql);
    $id = $topic->getInsertId();
    array_push($topic_id, $id);
}

$topic_str = implode(',', $topic_id);

$post = new Post();
$sql = "INSERT INTO post(content,user_id,create_tm,topic_id) 
VALUES ('{$content}', '{$user_id}', '{$create_tm}', '{$topic_str}')";
$res = $post->addPost($sql);
// $resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($res);