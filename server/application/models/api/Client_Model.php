<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Client_Model extends CI_Model {

    function __construct() {
        parent::__construct();
    }
    
    function get($app_id='',$app_secret=''){
        $query = $this->db
            ->where(array(
                'app_id' => $app_id,
                'app_secret' => $app_secret,
                ))
            ->get('ninety_client');
        $row = $query->row();
        return $row;
    }
    function get_device($uuid){
        $query = $this->db
            ->where(array(
                'uuid' => $uuid
                ))
            ->get('ninety_device');
        $row = $query->row();
        return $row;
    }
    function insert_device($params){
        $this->db->set('created', 'NOW()', FALSE);
        @$this->db->insert('ninety_device',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function update_device($uuid,$params){
        $this->db->set('modified', 'NOW()', FALSE);
        @$this->db
            ->where('uuid',$uuid)
            ->update('ninety_device',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
}

?>
