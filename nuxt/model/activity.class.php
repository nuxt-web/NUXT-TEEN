<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/1
 * Time: 13:42
 */
namespace model;
include_once '../extends/DB.class.php';

use \Database;

class Activity{
    public $link;
    public function __construct(){
        $this->link = new Database();
    }

    public function getActivity(){
        $sql = "select * from activity_map inner join activity on  activity_map.activity_id = activity.activity_id inner join movie on activity.movie_id = movie.movie_id";
        return $this->link->sql_query($sql);
    }
}