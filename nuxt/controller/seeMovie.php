<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 22:21
 */
namespace controller;
include_once '../model/seeMovie.class.php';

use \model\seeMovie as SM;

class SeeMovie{
    public $temp;
    public function __construct(){
        $this->temp = new SM();
    }

    public function doSeeMovie($movie_id, $uid, $type){
        if ($type == 2){
            $sql = "insert into watched_movie (`movie_id`,`uid`) values ('{$movie_id}','{$uid}')";
            return $this->temp->doSeeMovie($sql);
        } else {
            $sql = "delete from watched_movie where movie_id = '{$movie_id}' and uid = '{$uid}'";
            return $this->temp->delMovie($sql);
        }
    }

    public function ifSeeMovie($movie_id, $uid){
        $sql = "select * from watched_movie where movie_id ='{$movie_id}' and uid ='{$uid}'";
        $res = $this->temp->ifSeeMovie($sql);
        if ($res) {
            return array('code'=> 200,'data'=>false,'msg'=>'已经看过电影了');
        } else {
            return array('code'=> 200,'data'=>true,'msg'=>'还没看过电影');
        }
    }
}
