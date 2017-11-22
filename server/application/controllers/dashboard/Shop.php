<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Shop extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->layout = 'main2';
    }
    
    function index(){
        // $this->Core_Model = new Core_Model($this->table, $this->prefix, $this->colid);
        $this->render('dashboard/shop/index',null);
    }
}
