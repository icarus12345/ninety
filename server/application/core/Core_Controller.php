<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Core_Controller extends CI_Controller {
    public $assigns;
    public $layout = 'main';
    public function __construct($table = '', $prefix = '', $colid = 'id') {
        parent::__construct();
        $this->CI =& get_instance();
        $this->assigns = array();
        $this->table = $table;
        $this->prefix = $prefix;
        $this->colid = $colid;
        $this->isAjax = $this->input->is_ajax_request();
        $this->checklogin();
        
        $this->load->model('dashboard/Category_Model');
        $this->load->model('dashboard/Auth_Model');
        $cat_type = 'dashboard';
        $this->db->where('status','true');
        $menu_model = new Core_Model('__menu');
        $this->db->order_by('value','ASC');
        $cate_data = $menu_model
            ->gets();
        $dashboard_menus = $menu_model
            ->_buildTree($cate_data);
        $this->load->vars(array(
            'dashboard_menus' => $dashboard_menus
        ));
        $this->load->vars(array(
            'users' => $this->Auth_Model
            ->get_all()
        ));
    }

    function checklogin() {
        $user = $this->session->userdata('dasbboard_user');
        if (!$user) {
            if ($this->isAjax) {
                $output = array(
                    'text' => 'fail',
                    'message' => 'Permission denied',
                    'code' => -1,
                    'data' => null
                );
                $this->output
                    ->set_content_type('application/json')
                    ->set_status_header(403)
                    ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES))
                    ->_display();
                die;
            } else {
                $this->load->view('dashboard/auth/login',null);
                $this->output->_display();
                die();
            }
        }
    }
    
    function render($path_view = '',$data = array()){
        $this->load->vars(array(
            'path_view' => $path_view
            ));
        $this->load->vars($this->assigns);
        $this->load->vars($data);
        $this->load->view("dashboard/layout/{$this->layout}",null);
    }
    
    

    protected function beforeinsert() {
    }

    protected function beforeupdate() {
    }

    protected function beforecommit() {
    }

    protected function beforedelete() {
    }

    function oncommit() {
        $this->beforecommit();
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege()) {
            $Id = $this->input->post('Id');
            if (!empty($Id)) {
                $this->onupdate();
            } else {
                $this->oninsert();
            }
        }else{
            $this->output->set_header('Content-type: application/json');
            $this->output->set_output(json_encode($output));
        }
    }

    function onupdate() {
        $this->beforeupdate();
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Params = $this->input->get_post('Params');
        if (!empty($Params)) {
            $Id = $this->input->post('Id');
            if (!empty($Id)) {
                $record = $this->Core_Model->onGet($Id);
                if ($record) {
                    $rs = $this->Core_Model->onUpdate($Id, $Params);
                    if ($rs === true) {
                        $output["result"] = 1;
                        $output["message"] = ("Record successfully updated.");
                    } else {
                        $output["result"] = -1;
                        $output["message"] = ("Record faily to update. Please check data input and try again.<br/>");
                    }
                } else {
                    $output["result"] = -203;
                    $output["message"] = "Record doesn't exist.";
                }
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function oninsert() {
        $this->beforeinsert();
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Params = $this->input->get_post('Params');
        if (!empty($Params)) {
            $rs = $this->Core_Model->onInsert($Params);
            if ($rs === true) {
                $output["result"] = 1;
                $output["message"] = ("Record successfully inserted .");
            } else {
                $output["result"] = -1;
                $output["message"] = ("Record faily to insert. Please check data input and try again.<br/>");
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function ondelete() {
        $this->beforedelete();
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege()) {
            $id = $this->input->post('Id');
            if (!empty($id)) {
                $tmp = $this->Core_Model->onGet($id);
                if ($tmp) {
                    if (
                            (
                            isset($tmp->{$this->prefix . "lock"}) &&
                            $tmp->{$this->prefix . "lock"} == 'true'
                            ) ||
                            (
                            isset($tmp->{$this->prefix . "Lock"}) &&
                            $tmp->{$this->prefix . "Lock"} == 'true'
                            )
                    ) {
                        $output["message"] = ("Can't delete 'System' record. Record have been locked.");
                    } else {
                        $rs = false;
                        $rs = $this->Core_Model->onDelete($id);
                        if ($rs === true) {
                            $output["result"] = 1;
                            $output["message"] = ("Record have been deleted.");
                        } else {
                            $output["result"] = -1;
                            $output["error_number"] = $this->Core_Model->db->_error_number();
                            $output["error_message"] = $this->Core_Model->db->_error_message();
                            $output["message"] = ("Fail. Please check data input and try again.");
                        }
                    }
                }else {
                    $output["message"] = ("Record does't exist.");
                }
            } else {
                $output["message"] = ("Id invalid.");
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function onstatuschange(){
        $this->beforeupdate();
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Params = $this->input->get_post('Params');
        if (!empty($Params)) {
            $Id = $this->input->post('Id');
            if (!empty($Id)) {
                $record = $this->Core_Model->onGet($Id);
                if ($record) {
                    $rs = $this->Core_Model->onUpdate($Id, $Params);
                    if ($rs === true) {
                        $output["result"] = 1;
                        $output["message"] = ("Status of Record successfully updated.");
                    } else {
                        $output["result"] = -1;
                        $output["message"] = ("Record faily to update. Please check data input and try again.<br/>");
                    }
                } else {
                    $output["result"] = -203;
                    $output["message"] = "Record doesn't exist.";
                }
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingdata() {
        
        $result = $this->Core_Model->databinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }

}

include 'Api_Controller.php';
include 'DApi_Controller.php';
include 'Front_Controller.php';
