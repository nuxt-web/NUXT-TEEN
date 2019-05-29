<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 13:44
 */
namespace controller;
include_once '../model/video.class.php';

use \model\Video as v;

class Video{
    public $temp;
    public function __construct(){
        $this->temp = new v();
    }

    public function getVideo($sql){
        return $this->temp->getVideo($sql);
    }
}