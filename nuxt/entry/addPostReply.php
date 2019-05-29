<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/post.php';

use \controller\Post;

$post = new Post();

$content = $_POST['content'];
$user_id = $_POST['user_id'];
$post_id = $_POST['post_id'];
$create_tm = $_POST['create_tm'];

$post = new Post();
$sql = "INSERT INTO post_reply(content,user_id,post_id,create_tm) 
VALUES ('{$content}', '{$user_id}', '{$post_id}', '{$create_tm}')";
$res = $post->addPost($sql);
$post_sql = "UPDATE post SET reply_num=reply_num+1 WHERE id = {$post_id}";
$post -> addReplyNum($post_sql);
// $resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($res);