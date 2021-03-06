<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Welcome extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->Module_Model = new Core_Model('tbl_module');
    }
    
    function index(){
        // $this->Core_Model = new Core_Model($this->table, $this->prefix, $this->colid);
        $this->render('dashboard/main',null);
    }
    function _check_permission($entry_setting){
        $user = $this->session->userdata('dasbboard_user');
        $user_privileges = explode(',',$user->ause_authority);
        $privileges = $entry_setting->data['privieges'];
        if(gettype($privileges) == 'string') $privileges = [$privileges];
        // var_dump($privileges);die;
        $check = !!array_intersect($user_privileges,$privileges);
        if(!$check){
            $this->load->view('dashboard/auth/accessdenied',null);
            $this->output->_display();
            die();
        }
    }
    function load_setting($sid){
        $entry_setting = $this->Module_Model->get($sid);
        $this->_check_permission($entry_setting);
        if($entry_setting) $settings[$entry_setting->id] = $entry_setting;
        if($entry_setting->data['columns'])
        foreach ($entry_setting->data['columns'] as $key => $column) {
            if($column['type'] == 'catetree'){
                $cat_type = $column['name'];
                $cate_data = $this->Category_Model->get_by_type($cat_type);
                $entry_setting->data['columns'][$key]['categories'] = $this->Category_Model
                    ->buildTreeArray($cate_data);
            } else if($column['type'] == 'catelist'){
                $cat_type = $column['name'];
                $cate_data = $this->Category_Model->get_by_type($cat_type);
                $entry_setting->data['columns'][$key]['categories'] = $cate_data;
            } else if($column['type'] == 'list') {
                $setting = $this->Module_Model->get($column['sid']);
                if($setting) $settings[$setting->id] = $setting;
            }
        }

         $this->load->vars(array(
            'settings' => $settings,
            'sid'=>$sid
        ));
        
    }
    function view($sid){
        $this->load_setting($sid);
        $this->index();
    }
    function detail($sid,$id){
        $this->load_setting($sid);
        $this->render('dashboard/detail',array('id'=>$id));
    }
}
