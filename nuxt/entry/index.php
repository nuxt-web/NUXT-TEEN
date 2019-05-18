<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/24
 * Time: 22:02
 * 首页电影接口
 */

include_once '../controller/index.php';
include_once '../controller/banner.php';
include_once '../controller/activity.php';

use \controller\Index;
use \controller\Banner;
use \controller\Activity;

$index = new Index();
$res = $index->getIndexInfo();

$banner = new Banner();
$bannerRes = $banner->getBanner();

$activity = new Activity();
$activityRes = $activity->getActivity();


//var_dump($activityRes);
$res = array('code'=>200,'hotMovieList'=>$res, 'banner'=> $bannerRes,'status'=>'请求成功','activity'=>$activityRes);
echo json_encode($res);