<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/movieList.php';

use \controller\MovieList;

$type = $_GET['type'];

$movieList = new MovieList();
$sql = "";
switch ($type){
    case 1:
        $sql = "select * from movie order by appear_time DESC";
        break;
    case 2:
        $sql = "select * from movie order by appear_time DESC";
        break;
    case 3:
        $sql = "select * from movie order by score DESC";
        break;
}
$res = $movieList->getMovieList($sql);
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);
