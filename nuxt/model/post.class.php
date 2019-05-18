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

class Post{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getPostList($sql){
        $res = $this->link->sql_query($sql);
        return $res;
    }

    public function addPost($sql) {
        $res = $this->link->sql_inset($sql);
        return $res;
    } 

    public function addReply($sql) {
        $res = $this->link->sql_inset($sql);
        return $res;
    }
}