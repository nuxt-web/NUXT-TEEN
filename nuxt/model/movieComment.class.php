<?php

namespace model;
include_once '../extends/DB.class.php';

use \Database;

class MovieComment{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function addComment($uid, $movie_id, $comment){
        $time = date("Y-m-d");
        $sql = "INSERT INTO comment VALUES ('{$movie_id}','{$uid}','{$comment}','{$time}')";
        return $this->link->sql_inset($sql);
    }
}