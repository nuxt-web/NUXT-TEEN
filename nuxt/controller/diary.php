<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/29
 * Time: 17:38
 */
namespace controller;
include_once '../model/diary.class.php';

use \model\Diary as d;

class Diary{
    public $temp;
    public function __construct(){
        $this->temp = new d();
    }

    public function getDiary($uid){
        return $this->temp->getDiary($uid);
    }
}