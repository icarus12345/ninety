<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Trademark_Model extends Core_Model {

    function __construct()
    {
        parent::__construct('__trademark','','id');
    }
    function insertBatchCategory($data){
        $rs = $this->db->insert_batch('__trademark_category', $data); 
        return $rs;
    }
    function deleteCategoryByTrademarkId($id){
        $rs = $this->db->where_in('trademark_id', $id)
            ->delete('__trademark_category'); 
        return $rs;
    }
    function get_category_by_trademark_id($id){
        $query=$this->db
            ->where("trademark_id", $id)
            ->get("__trademark_category");

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        return $query->result();
    }
}

?>
