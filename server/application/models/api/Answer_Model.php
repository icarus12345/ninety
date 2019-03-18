<?php
class Answer_Model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }
    function get_by_uid_pid_cid($uid,$pid,$cid){
        $query=$this->db
            ->select('ninety_answer.uid,ninety_answer.pid,ninety_answer.qid,ninety_answer.ans')
            ->from('ninety_answer')
            ->join('ninety_question','ninety_answer.qid = ninety_question.id','left')
            ->where("uid", $uid)
            ->where("pid", $pid)
            ->where("ninety_question.status", 'true')
            ->where("category", $cid)
            ->get();

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        return $entrys;
    }
    function get_by_uid_pid($uid,$pid){
        $query=$this->db
            ->select('ninety_answer.uid,ninety_answer.pid,ninety_answer.qid,ninety_answer.ans')
            ->from('ninety_answer')
            ->join('ninety_question','ninety_answer.qid = ninety_question.id')
            ->where("uid", $uid)
            ->where("pid", $pid)
            ->where("status", 'true')
            ->get();

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        return $entrys;
    }
    function get_answer($uid,$pid,$qid){
        $query=$this->db
        
            ->where("uid", $uid)
            ->where("pid", $pid)
            ->where("qid", $qid)
            ->get('ninety_answer');

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $row = $query->row();
        return $row;
    }
    function insert($params){
        $this->db->set('created', 'NOW()', FALSE);
        @$this->db->insert('ninety_answer',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function update($id,$params){
        $this->db->set('modified', 'NOW()', FALSE);
        @$this->db
            ->where('id',$id)
            ->update('ninety_answer',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function delete_by_uid_pid($uid,$pid){
        @$this->db
            ->where('uid',$uid)
            ->where('pid',$pid)
            ->delete('ninety_answer');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count >= 0)
            return true;
        return false;
    }
    function delete_by_pid($pid){
        @$this->db
            ->where('pid',$pid)
            ->delete('ninety_answer');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count >= 0)
            return true;
        return false;
    }
}