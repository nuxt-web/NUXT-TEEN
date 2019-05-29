<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 13:47
 */
namespace model;
include_once '../extends/DB.class.php';
include_once '../extends/tools.class.php';

use \Database;

class Video{
    public $link;
    // 7天内
    public function __construct()
    {
        $this->link = new Database();
    }

    public function getVideo($sql){
        $res = $this->link->sql_query($sql);
        return $res;
    }
}