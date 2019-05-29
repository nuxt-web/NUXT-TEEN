<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/2
 * Time: 2:22
 */
namespace model;
include_once '../extends/DB.class.php';

use \Database;

class Topic{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getTopicList(){
        $sql = "select * from topic LIMIT 10";
        $res = $this->link->sql_query($sql);
        return $res;
    }

    public function getTopicDetail($sql){
        $res = $this->link->sql_query($sql);
        return $res;
     }

    public function selectTopic($sql){
        $res = $this->link->sql_query($sql);
        return $res;
    }

    public function addTopic($sql) {
        $res = $this->link->sql_inset($sql);
        return $res;
    }

    public function getInsertId() {
        $res = $this->link->get_insert_id();
        return $res;
    }
}