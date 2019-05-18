<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/25
 * Time: 15:03
 */
class Tools{
    public static function checkTime($item){
        echo json_encode($item);
        if($item['time'].date() > 1556180932){
            return true;
        } else {
            return false;
        }
    }
}