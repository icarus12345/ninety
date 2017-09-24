<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Project_Model extends API_Model {

    function __construct()
    {
        parent::__construct();
    }
    
    function insert($params){
        $this->db->set('created', 'NOW()', FALSE);
        $this->db->set('type', $this->client_id);
        if(isset($params['data'])) $params['data'] = serialize($params['data']);
        $this->db->set('status', 'true');
        @$this->db->insert('ninety_project',$params);
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    
    function get($id){
        $query = $this->db
            ->where(array(
                'id' => $id
                ))
            ->where("type", $this->client_id)
            ->get('ninety_project');
        $row = $query->row();
        if($row) {
            $data = unserialize($row->data);
            if($data) foreach ($data as $key => $value) {
                $row->$key = $value;
            }
            unset($row->data);
        }
        return $row;
    }
    function update($id,$params = null){
        $this->db->set('modified', 'NOW()', FALSE);
        if(isset($params['data'])) $params['data'] = serialize($params['data']);
        @$this->db
            ->where('id',$id)
            ->where("type", $this->client_id)
            ->update('ninety_project',$params);

        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }

    function get_list($uid,$page=1,$perpage=10){
        $query = $this->db
            ->where(array(
                'uid' => $uid
                ))
            ->where("type", $this->client_id)
            ->order_by('created','desc')
            ->limit($perpage, ($page - 1) * $perpage)
            ->get('ninety_project');
        $entrys = $query->result();
        if($entrys) foreach ($entrys as $key => $value) {
            $data = unserialize($entrys[$key]->data);
            if($data) foreach ($data as $dkey => $dvalue) {
                $entrys[$key]->$dkey = $dvalue;
            }
            unset($entrys[$key]->data);
        }
        return $entrys;
    }

    function get_shared_by_uid($uid){
        $query=$this->db
            ->select('ninety_shared.*')
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
        $result = $query->result();
        return $result;
    }

    function get_all_by_uid($uid, $page=1, $perpage=10){
        $shareds = $this->get_shared_by_uid($uid);
        foreach ($shareds as $key => $value) {
            $pids[] = $value->pid;
            $modes[$value->pid] = $value->mode;
        }
        if(empty($pids)) $pids = array(-1);
        $query = $this->db
            ->select('id,title,uid,data')
            ->where('status','true')
            ->where("type", $this->client_id)
            ->group_start()
            ->where_in('id',$pids)
            ->or_where('uid',$uid)
            ->group_end()
            ->order_by('created','desc')
            ->limit($perpage, ($page - 1) * $perpage)
            ->get('ninety_project');
        $result = $query->result();
        foreach ($result as $key => $value) {
            // $result[$key]->created = date('Y M d',strtotime($result[$key]->created));
            $result[$key]->alias = convertUrl($result[$key]->title);
            if($result[$key]->uid != $uid){
                $result[$key]->mode = $modes[$result[$key]->id];
            } else {
                $result[$key]->mode = 2;
            }
            $data = unserialize($result[$key]->data);
            if($data)
            foreach ($data as $dkey => $dvalue) {
                $result[$key]->$dkey = $dvalue;
            }
            unset($result[$key]->data);
        }
        return $result;
    }
    function delete($id){
        @$this->db
            ->where('id',$id)
            ->where("type", $this->client_id)
            ->delete('ninety_project');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
}

?>
