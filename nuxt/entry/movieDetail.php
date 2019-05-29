<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/2
 * Time: 2:27
 */
include_once '../controller/movie.php';
include_once '../controller/comment.php';

use \controller\Movie;
use \controller\Comment;

$movie_id = $_GET['movie_id'];
$movie = new Movie();
$res = $movie->getMovieDetail($movie_id);
$comment = new Comment();
$commentRes = $comment->getMovieComment($movie_id);

if ($res) {
    $resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功','comment'=>$commentRes);
} else {
    $resArr = array('code'=> 5001,'msg'=>'找不到该电影','status'=>'请求成功');
}
echo json_encode($resArr);