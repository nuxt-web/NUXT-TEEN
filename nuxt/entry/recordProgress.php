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
$progress = $_GET['progress'];
$graphic = new Graphic();
$select_sql = "SELECT * FROM viewd_graphic WHERE user_id = {$user_id}";
$select_res = $graphic->getProgress($select_sql);
// echo $select_res;
if (empty($select_res)) {
    $insert_sql = "INSERT INTO viewd_graphic (`graphic_id`, `user_id`, `progress`) values ('{$graphic_id}','{$user_id}', '{$progress}')";
    $res = $graphic->recordProgress($insert_sql);
} else {
    $update_sql = "UPDATE viewd_graphic SET progress={$progress} WHERE user_id = {$user_id}";
    $res = $graphic->recordProgress($update_sql);
}
$resArr = array('code'=> 200,'data'=>$res,'status'=>'请求成功');
echo json_encode($resArr);