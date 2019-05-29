<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/1
 * Time: 13:42
 */
namespace model;
include_once '../extends/DB.class.php';

use \Database;

class Graphic{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getGraphicList($sql){
        return $this->link->sql_query($sql);
    }

    public function getGraphicDetail($sql){
        return $this->link->sql_query($sql);
    }

    public function recordProgress($sql){
        return $this->link->sql_inset($sql);
    }

    public function getProgress($sql) {
        return $this->link->sql_query($sql);
    }
}