<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:05
 */
namespace controller;

include_once '../model/post.class.php';

// use \model\MovieList as ML;
use \model\Post as P;

class Post{
    public $temp;
    public function __construct(){
        $this->temp = new P();
    }

    public function getPostList($sql){
       $res = $this->temp->getPostList($sql);
       return $res;
    }

    public function addPost($sql) {
        $res = $this->temp->addPost($sql);
        return $res;
    }

    public function addReply($sql) {
        $res = $this->temp->sql_inset($sql);
        return $res;
    }
}