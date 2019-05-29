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
if (array_key_exists('imgList', $_POST)){
    $img_list = $_POST['imgList'];
    $topic_img = $_POST['imgList'][0];
    $img_str = implode(',', $img_list);
} else {
    $img_str = '';
    $topic_img = 'http://teen.com/nuxt/images/post/default.jpg';
}

// print_r($_POST);
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
    $sql = "INSERT INTO topic(name, create_tm, img) VALUES ('{$value}', '{$create_tm}', '{$topic_img}')";
    $res = $topic -> addTopic($sql);
    $id = $topic->getInsertId();
    array_push($topic_id, $id);
}
$topic_str = implode(',', $topic_id);
// if ($img_list) {
//     $img_str = implode(',', $img_list);
// } else {
//     $img_str = '';
// }

$post = new Post();
$sql = "INSERT INTO post(content,user_id,create_tm,topic_id,img_list) 
VALUES ('{$content}', '{$user_id}', '{$create_tm}', '{$topic_str}', '{$img_str}')";
$res = $post->addPost($sql);
// $resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($res);