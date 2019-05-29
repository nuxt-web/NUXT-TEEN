<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/post.php';

use \controller\Post;

$post_id = $_GET['post_id'];

$post = new Post();
$sql = "SELECT a.content, a.create_tm, b.user_name, b.avator  FROM post_reply a 
        INNER JOIN user_info b ON a.post_id = {$post_id} AND a.user_id = b.uid ORDER BY a.create_tm DESC";
$res = $post->getPostReply($sql);
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);