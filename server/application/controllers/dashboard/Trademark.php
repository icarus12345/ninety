<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Trademark extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('dashboard/Trademark_Model');
        $this->layout = 'main2';
    }
    
    function index(){
        // $this->Core_Model = new Core_Model($this->table, $this->prefix, $this->colid);
        $this->render('dashboard/trademark/index',null);
    }
    
    function view($sid){
        $this->load_setting($sid);
        $this->index();
    }
    function detail($sid,$id){
        $this->load_setting($sid);
        $this->render('dashboard/detail',array('id'=>$id));
    }
    function databinding(){
        
    }
}
