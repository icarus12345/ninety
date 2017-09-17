<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Share_Model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }
    function get($id){

    }
    function get_by_uid($uid){
        $query=$this->db
            ->select('ninety_shared.id,ninety_shared.pid,ninety_shared.email,ninety_shared.mode')
            ->from('ninety_shared')
            ->join('ninety_account','ninety_shared.email = ninety_account.email')
            ->where("ninety_account.id", $uid)
            ->where("type", $this->client_id)
            ->get();
        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        return $entrys;
    }
    function get_by_email($email){
        $query=$this->db
            ->select('ninety_shared.id,ninety_shared.pid,ninety_shared.email,ninety_shared.mode')
            ->from('ninety_shared')
            ->where("email", $email)
            ->where("type", $this->client_id)
            ->get();
        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        return $entrys;
    }
    function get_by_pid_email($pid,$email){
        $query=$this->db
            ->select('ninety_shared.id,ninety_shared.pid,ninety_shared.email,ninety_shared.mode')
            ->from('ninety_shared')
            ->where("pid", $pid)
            ->where("email", $email)
            ->where("type", $this->client_id)
            ->get();

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $row = $query->row();
        return $row;
    }
    function get_by_pid($pid){
        $query=$this->db
            ->select('ninety_shared.id,ninety_shared.pid,ninety_shared.email,ninety_shared.mode')
            ->from('ninety_shared')
            ->where("pid", $pid)
            ->where("type", $this->client_id)
            ->get();

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        return $entrys;
    }
    function insert($params){
        $this->db->set('created', 'NOW()', FALSE);
        $this->db->set('type', $this->client_id);
        @$this->db->insert('ninety_shared',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function update($id,$params){
        $this->db->set('modified', 'NOW()', FALSE);
        @$this->db
            ->where('id',$id)
            ->where("type", $this->client_id)
            ->update('ninety_shared',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }

    function delete($id){
        @$this->db
            ->where('id',$id)
            ->where("type", $this->client_id)
            ->delete('ninety_shared');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function delete_by_pid($pid){
        @$this->db
            ->where('pid',$pid)
            ->where("type", $this->client_id)
            ->delete('ninety_shared');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
}

?>
