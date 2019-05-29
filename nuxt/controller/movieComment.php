<?php

namespace controller;


include_once '../model/movieComment.class.php';

use \model\MovieComment as mc;


class MovieComments{
    public $temp;

    public function __construct(){
        $this->temp = new mc();
    }

    public function addComment($uid,$movie_id,$comment){
       $res = $this->temp->addComment($uid, $movie_id, $comment);
       return $res;
    }
}