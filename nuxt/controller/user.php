<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 13:44
 */
namespace controller;
include_once '../model/user.class.php';

use \model\User as u;

class User{
    public $temp;
    public function __construct(){
        $this->temp = new u();
    }

    public function getUserInfo($uid){
        return $this->temp->getUserInfo($uid);
    }
}
