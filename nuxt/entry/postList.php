<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/post.php';

use \controller\Post;
// echo array_key_exists('topic_id', $_GET);
if (array_key_exists('topic_id', $_GET)) {
    $topic_id = $_GET['topic_id'];
    $sql = "SELECT a.id, a.content, a.reply_num, a.img_list, a.create_tm, b.user_name, b.avator FROM post a INNER JOIN user_info b ON a.topic_id REGEXP '^{$topic_id},|^{$topic_id}$|,{$topic_id},|,{$topic_id}$' AND a.user_id = b.uid ORDER BY a.create_tm DESC";
} 
if (array_key_exists('user_id', $_GET)) {
    $user_id = $_GET['user_id'];
    $sql = "SELECT a.id, a.content, a.reply_num, a.img_list, a.create_tm, b.user_name, b.avator FROM post a INNER JOIN user_info b ON a.user_id = {$user_id} AND a.user_id = b.uid ORDER BY a.create_tm DESC";
} 
// else {
//     $sql = "SELECT a.id, a.content, a.reply_num, a.img_list, a.create_tm, b.user_name, b.avator FROM post a INNER JOIN user_info b ON a.topic_id REGEXP '^{$topic_id},|^{$topic_id}$|,{$topic_id},|,{$topic_id}$' AND a.user_id = b.uid ORDER BY a.create_tm DESC";
// }

$post = new Post();
// $sql = "SELECT post.content, post.reply_num, post.img_list, post.create_tm, user_info.user_name, user_info.avator FROM post, user_info WHERE post.topic_id = " . $topic_id . " AND user_info.uid = post.user_id";
// $sql = "SELECT a.content, a.reply_num, a.img_list, a.create_tm, b.user_name, b.avator FROM post a INNER JOIN user_info b ON a.topic_id = " . $topic_id . " AND a.user_id = b.uid";
// $sql = "SELECT a.id, a.content, a.reply_num, a.img_list, a.create_tm, b.user_name, b.avator FROM post a INNER JOIN user_info b ON a.topic_id REGEXP '^{$topic_id},|^{$topic_id}$|,{$topic_id},|,{$topic_id}$' AND a.user_id = b.uid ORDER BY a.create_tm DESC";
$res = $post->getPostList($sql);
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);
