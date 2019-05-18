<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/1
 * Time: 13:41
 */

namespace controller;
include_once '../model/activity.class.php';

use \model\Activity as act;

class Activity{
    public $temp;
    public function __construct(){
        $this->temp = new act();
    }

    public function getActivity(){
        $res = $this->temp->getActivity();
        return $res;
    }
}