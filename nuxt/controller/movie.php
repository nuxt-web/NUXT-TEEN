<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/2
 * Time: 2:18
 */
namespace controller;
include_once '../model/movie.class.php';

use \model\Movie as mov;

class Movie{
    public $temp;
    public function __construct(){
        $this->temp = new mov();
    }

    public function getMovieDetail($movie_id){
        $res = $this->temp->getMovieDetail($movie_id);
        return $res;
    }
}