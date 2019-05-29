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

$post = new Post();
function mkdirs($dir, $mode = 0777){
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mkdirs(dirname($dir), $mode)) return FALSE;
    return @mkdir($dir, $mode);
} 
$savename = date('YmdHis',time()).mt_rand(0,9999).'.jpg';//

// $imgdirs = "../images/post/";
$imgdirs = "../images/post/";
mkdirs($imgdirs);

$savepath = $imgdirs.$savename; 
// $data['data'] = $savepath; 
move_uploaded_file($_FILES["file"]['tmp_name'],$savepath);
$fullpath = "http://teen.com/nuxt/images/post/".$savename; 
$resArr = array('code'=> 200,'data'=> $fullpath,'status'=>'请求成功');
echo json_encode($resArr);