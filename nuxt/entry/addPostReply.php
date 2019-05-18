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
$sql = "INSERT INTO post(content,user_id,create_tm,topic_id) 
VALUES ('{$content}', '{$user_id}', '{$create_tm}', '{$topic_str}')";
$res = $post->addPost($sql);
// $resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($res);