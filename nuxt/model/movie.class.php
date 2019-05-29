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

class Movie{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getMovieDetail($movie_id){
        $sql = "select * from movie where movie_id ="."'{$movie_id}'";
        return $this->link->sql_query($sql,false);
    }
}