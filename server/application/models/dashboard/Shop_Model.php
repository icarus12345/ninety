<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Shop_Model extends Core_Model {

    function __construct()
    {
        parent::__construct('__shop','','id');
    }
    function get_by_trademark_id($trademark_id){
        $query=$this->db
            ->select('id,title')
            ->where("trademark_id", $trademark_id)
            ->get('__shop');

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        return $query->result();
    }
}

?>
