<?php
// header('Access-Control-Allow-Origin:*');
// header('Content-Type:text/html;charset=utf-8');
// header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
include_once '../controller/movieComment.php';
use \controller\MovieComments;

$uid = $_GET['uid'];
$movie_id = $_GET['movie_id'];
$comments = $_GET['comment'];

$comment = new MovieComments();

$res = $comment->addComment($uid,$movie_id,$comments);
if(!$res) {
    $resArr = array('code'=> 400,'status'=>'评论失败');
} else {
    $resArr = array('code'=> 200,'status'=>'评论成功');
}

echo json_encode($resArr);

