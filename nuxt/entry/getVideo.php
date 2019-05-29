<?php
include_once '../controller/video.php';

use \controller\Video;

// $post_id = $_GET['post_id'];
date_default_timezone_set('Asia/Shanghai');
$tm = $_GET['tm'];

$video = new Video();
// echo strtotime("2019-05-26 14:00:00");
$sql = "SELECT src, start_time, end_time, film_name FROM video WHERE UNIX_TIMESTAMP(start_time) <= {$tm} AND UNIX_TIMESTAMP(end_time) >= ${tm}";
// OR UNIX_TIMESTAMP(start_time) > {$tm}
$res = $video->getVideo($sql);
if (empty($res)) {
     $sql = "SELECT src, start_time, end_time, film_name FROM video WHERE UNIX_TIMESTAMP(start_time) > {$tm}";
     $res = $video->getVideo($sql);
}
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);