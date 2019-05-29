<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 22:28
 */
include_once '../controller/seeMovie.php';

use \controller\SeeMovie;

$seeMovieObj = new SeeMovie();


if (isset($_GET['type'])) {
    $type = $_GET['type'];
}
$uid = $_GET['uid'];
$movie_id = $_GET['movie_id'];

if(!isset($_GET['type'])){
    $res = $seeMovieObj->ifSeeMovie($movie_id,$uid);
} else {
    $res = $seeMovieObj->doSeeMovie($movie_id,$uid,$type);
}

echo json_encode($res);
