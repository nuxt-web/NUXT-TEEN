<?php
namespace model;
include_once '../extends/DB.class.php';

use \Database;


class Avatar{
    public $link;

    public function __construct()
    {
        $this->link = new Database();
    }


    public function setAvatar($avator,$uid){
        $sql = "UPDATE user_info SET avator = '{$avator}' WHERE uid = '{$uid}' ";
        $res = $this->link->sql_update($sql);
        if (!$res) {
            return array('code'=>'5002','status'=>'设置头像失败');
        } else {
            return array('code'=>'200','status'=>'设置头像成功');
        }
    }
}