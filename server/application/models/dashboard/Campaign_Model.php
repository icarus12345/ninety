<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Campaign_Model extends Core_Model {

    function __construct()
    {
        parent::__construct('__campaign','','id');
    }
    function insertBatchCategory($data){
        $rs = $this->db->insert_batch('__campaign_category', $data); 
        return $rs;
    }
    function insertBatchShop($data){
        $rs = $this->db->insert_batch('__campaign_shop', $data); 
        return $rs;
    }
    function delete_category_by_campaign_id($campaign_id){
        $rs = $this->db->where_in('campaign_id', $campaign_id)
            ->delete('__campaign_category'); 
        return $rs;
    }
    function get_category_by_campaign_id($campaign_id){
        $query=$this->db
            ->where("campaign_id", $campaign_id)
            ->get("__campaign_category");

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        return $query->result();
    }
    function delete_shop_by_campaign_id($campaign_id){
        $rs = $this->db->where_in('campaign_id', $campaign_id)
            ->delete('__campaign_shop'); 
        return $rs;
    }
    function get_shop_by_campaign_id($campaign_id){
        $query=$this->db
            ->where("campaign_id", $campaign_id)
            ->get("__campaign_shop");

        $errordb = $this->db->error();
        $error_message = $errordb['message'];
        if($errordb['code']!==0){
            return null;
        }
        return $query->result();
    }
}

?>
