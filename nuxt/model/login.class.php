<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 20:56
 */
namespace model;
include_once '../extends/DB.class.php';

use \Database;

class Login{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function check($name,$pass){
        $sql = "select * from user_info where user_name = "."'{$name}'" ."or account ="."'{$name}'";
        $res = $this->link->sql_query($sql,false);
        if (sizeof($res) == 0) {
            return array('code'=>'5001','status'=>'没有该用户');
        } else {
            if($res['password'] == $pass){
                return array('code'=>'200','data'=>$res['uid'],'status'=>'登陆成功');
            } else {
                return array('code'=>'5002','status'=>'密码错误');
            }
        }
    }
}