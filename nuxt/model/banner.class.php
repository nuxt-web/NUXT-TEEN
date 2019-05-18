<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/25
 * Time: 23:05
 */
namespace model;
include_once '../extends/DB.class.php';

use \Database;


class banner{
    public $link;
    // 7天内
    public $MAX_RAGE = 60 * 60 * 24 * 7 ;
    public function __construct()
    {
        $this->link = new Database();
    }


    public function getBanner(){
        $res = $this->link->sql_query('select * from banner');
        return $res;
    }
}