<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/24
 * Time: 22:14
 * 首页表
 */
namespace model;
include_once '../extends/DB.class.php';
include_once '../extends/tools.class.php';

use \Database;

class Index{
    public $link;
    // 7天内
    public $MAX_RAGE = 60 * 60 * 24 * 7 ;
    public function __construct()
    {
        $this->link = new Database();
    }

    public function checkTime($item){
        if(strtotime($item['appear_time']) > time() - $this->MAX_RAGE){
            return true;
        } else {
            return false;
        }
    }

    public function getMovie(){
        $res_temp = $this->link->sql_query('select * from movie where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= appear_time');
        return $res_temp;
    }

}
