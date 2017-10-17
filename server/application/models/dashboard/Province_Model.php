<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Province_Model extends Core_Model {

    function __construct()
    {
        parent::__construct('__province','','id');
    }
    function get_by_country_id($cid){
        $query=$this->db
            ->where("country_id", $cid)
            ->get("__province");

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        return $query->result();
    }
}

?>
