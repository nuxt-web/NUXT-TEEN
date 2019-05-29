<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/3
 * Time: 16:05
 */
namespace controller;

include_once '../model/topic.class.php';

// use \model\MovieList as ML;
use \model\Topic as T;

class Topic{
    public $temp;
    public function __construct(){
        $this->temp = new T();
    }

    public function getTopicList($sql){
       $res = $this->temp->getTopicList($sql);
       return $res;
    }

    public function getTopicDetail($sql){
        $res = $this->temp->getTopicDetail($sql);
        return $res;
     }

    public function selectTopic($sql) {
        $res = $this -> temp -> selectTopic($sql);
        return $res;
    }

    public function addTopic($sql) {
        $res = $this->temp->addTopic($sql);
        return $res;
    }

    public function getInsertId() {
        $res = $this->temp->getInsertId();
        return $res;
    }
}