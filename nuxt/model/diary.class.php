<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28
 * Time: 17:11
 */
namespace model;
include_once '../extends/DB.class.php';
include_once '../extends/tools.class.php';

use \Database;

class Diary{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }
    public function getDiary($uid){
        return $this->link->sql_query("select * from movie_diary inner join movie on movie_diary.movie_id = movie.movie_id where uid ="."'{$uid}'");
    }
}