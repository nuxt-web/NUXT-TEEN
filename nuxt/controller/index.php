<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/24
 * Time: 22:14
 */

namespace controller;
include_once '../model/index.class.php';
use \model\Index as i;

class Index{
    public $temp;
    public function __construct()
    {
        $this->temp = new i();
    }

    public function getIndexInfo (){
        return $this->temp->getMovie();
    }

}
