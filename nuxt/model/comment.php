<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/2
 * Time: 18:59
 */
namespace model;
include_once '../extends/DB.class.php';
include_once '../extends/tools.class.php';

use \Database;

class Comment{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getMovieComment($movie_id){
        $sql = "select * from comment inner join user_info on comment.uid = user_info.uid where movie_id ="."'{$movie_id}'";
        return $this->link->sql_query($sql);
    }

}