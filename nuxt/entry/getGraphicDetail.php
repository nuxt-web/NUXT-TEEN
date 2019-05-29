<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/graphic.php';

use \controller\Graphic;

$id = $_GET['id'];
$graphic = new Graphic();
$sql = "SELECT id, label, info,img_list,name,detail_img FROM graphic WHERE id = {$id}";
$res = $graphic->getGraphicDetail($sql);
if (!empty($res)) {
    $res[0]['img_list'] = explode(",", $res[0]['img_list']);
    $send_res = $res[0];
} else {
    $send_res = [];
}

$resArr = array('code'=> 200,'data'=>$send_res,'status'=>'请求成功');
echo json_encode($resArr);