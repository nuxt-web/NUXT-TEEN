<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:05
 */
namespace controller;

include_once '../model/graphic.class.php';

use \model\Graphic as G;

class Graphic{
    public $temp;
    public function __construct(){
        $this->temp = new G();
    }

    public function getGraphicList($sql){
       $res = $this->temp->getGraphicList($sql);
       return $res;
    }

    public function getGraphicDetail($sql){
        $res = $this->temp->getGraphicDetail($sql);
        return $res;
     }

    public function recordProgress($sql){
        return $this->temp->recordProgress($sql);
    }

    public function getProgress($sql) {
        return $this->temp->getProgress($sql);
    }
}