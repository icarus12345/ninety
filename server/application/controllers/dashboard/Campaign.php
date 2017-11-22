<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campaign extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->layout = 'main2';
    }
    
    function index(){
        // $this->Core_Model = new Core_Model($this->table, $this->prefix, $this->colid);
        $this->render('dashboard/campaign/index',null);
    }
}
