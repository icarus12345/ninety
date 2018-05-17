<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Question_Model extends Api_Model {

    function __construct()
    {
        parent::__construct();
    }
    function get_by_cid($cid=0){
        $query=$this->db
            ->select('id,title,category_id,data')
            ->where("category", $cid)
            ->where("status", 'true')
            ->where("type", $this->client_id)
            ->get('ninety_question');

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        if($entrys) foreach ($entrys as $key => $value) {
            $data = unserialize($entrys[$key]->data);
            unset($entrys[$key]->data);
            $entrys[$key]->answers = $data['answers'];
        }
        return $entrys;
    }
    
    function get_list(){
        $query=$this->db
            ->select('id,title,category_id,data')
            ->where("status", 'true')
            ->where("type", $this->client_id)
            ->get('ninety_question');

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $entrys = $query->result();
        if($entrys) foreach ($entrys as $key => $value) {
            $data = unserialize($entrys[$key]->data);
            foreach ($data['answers'] as $akey => $answer) {
            	$data['answers'][$akey]['score'] = (int)$data['answers'][$akey]['score'];
                unset($data['answers'][$akey]['alias']);
            }
            $entrys[$key]->answers = $data['answers'];
            $entrys[$key]->question = $data['question'];
            $entrys[$key]->lower = $data['lower'];
            $entrys[$key]->medium = $data['medium'];
            $entrys[$key]->higher = $data['higher'];
            $entrys[$key]->global = $data['global'];
            unset($entrys[$key]->data);
        }
        return $entrys;
    }
    function count_questions(){
        $query = $this->db
            ->select('id')
            ->where('status','true')
            ->where("type", $this->client_id)
            ->get('ninety_question');
        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        $num_rows = $query->num_rows();
        return $num_rows;
    }
}

?>
