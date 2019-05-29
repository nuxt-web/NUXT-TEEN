<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:56
 */

include_once '../controller/graphic.php';

use \controller\Graphic;

$graphic_id = $_GET['graphic_id'];
$user_id = $_GET['user_id'];

$graphic = new Graphic();
$sql = "SELECT progress FROM viewd_graphic WHERE user_id = {$user_id} AND graphic_id = {$graphic_id}";
$res = $graphic->getProgress($sql);
if (!empty($res)) {
    $res = $res[0];
} else {
    $res = '';
}
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);