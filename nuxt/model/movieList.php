<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:06
 */
namespace model;
include_once '../extends/DB.class.php';
use \Database;

class MovieList{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getMovieList($sql){
        $res = $this->link->sql_query($sql);
//        var_dump($res);
        return $res;
    }
}