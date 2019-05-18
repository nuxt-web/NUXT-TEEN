<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/2
 * Time: 19:15
 */
namespace controller;

include_once '../model/comment.php';

use \model\Comment as com;

class Comment{
    public $temp;

    public function __construct(){
        $this->temp = new com();
    }

    public function getMovieComment($movie_id){
        return $this->temp->getMovieComment($movie_id);
    }

}