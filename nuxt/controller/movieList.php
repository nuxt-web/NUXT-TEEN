<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:05
 */
namespace controller;

include_once '../model/movieList.php';

use \model\MovieList as ML;

class MovieList{
    public $temp;
    public function __construct(){
        $this->temp = new Ml();
    }

    public function getMovieList($sql){
       $res = $this->temp->getMovieList($sql);
       return $res;
    }
}