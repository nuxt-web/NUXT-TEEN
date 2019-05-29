<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/25
 * Time: 23:29
 */
namespace controller;
include_once '../model/banner.class.php';
use \model\banner as b;
class Banner{
    public $temp;
    public function __construct(){
        $this->temp = new b();
    }

    public function getBanner(){
        return $this->temp->getBanner();
    }
}