<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 22:05
 */
namespace model;
include_once '../extends/DB.class.php';
include_once '../extends/tools.class.php';

use \Database;

class seeMovie{
    public $link;
    // 7天内
    public function __construct()
    {
        $this->link = new Database();
    }

    public function doSeeMovie($sql){
        $res = $this->link->sql_inset($sql);
        return $res;
    }

    public  function delMovie($sql){
        $res = $this->link->sql_delete($sql);
        return $res;
    }

    public function ifSeeMovie($sql){
        $res = $this->link->sql_query($sql);
        return $res;

    }
}