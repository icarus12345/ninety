<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Auth extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model("dashboard/Auth_Model");
    }
    
    function index(){
        echo 'Welcome API';
    }
    
    function logout(){
        $this->session->sess_destroy();
        $output = array(
            'text' => 'ok',
            'code' => 1,
            'data' => null
        );

        $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    function check_dir($u){

    }
    function login(){
        $output = array(
            'text' => 'fail',
            'code' => -1,
            'data' => null
        );
        $code = 1;
        $username = $this->input->get_post('username');
        $password = $this->input->get_post('password');

        $this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[4]|max_length[100]');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|max_length[100]');
        // $this->form_validation->set_rules('passconf', 'Password Confirmation', 'required');
        // $this->form_validation->set_rules('email', 'Email', 'required');
        if ($this->form_validation->run() == FALSE) {
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
            // $output['code'] = -1;
        } else if ($this->session->userdata('dasbboard_user')) {
            $output['code'] = 1;
            $output['message'] = 'You already signed in on Dashboard System.';
            $output['text'] = 'ok';
        } else {

            $nlogin = (int)$this->session->userdata('nlogin');
            $this->session->set_userdata('nlogin', ++$nlogin);
            $user = $this->Auth_Model->getuser($username);
            if (!$user) {
                $output['message'] = 'Username or Password don\'t match.';
            } else {
                if (!user_check_password($password,$user->ause_password)) {
                    $name = $user->ause_name;
                    $output['code'] = -906;
                    $output['message'] = "Login failed for user '$name'.";
                }elseif ($user->ause_deleted !== null) {
                    $output['code'] = -901;
                    $output['message'] = "Valid login but user have been deleted.";
                }elseif ($user->ause_status == 'true') {
                    unset($user->ause_password);
                    unset($user->ause_salt);
                    unset($user->ause_secretkey);
                    
                    
                    $this->fileverify($user);

                    $this->session->set_userdata('dasbboard_user', $user);

                    $output['code'] = 1;
                    $output['text'] = 'ok';
                    $output['data'] = $user;
                    $output['nlogin'] = $nlogin;
                    $this->session->set_userdata('nlogin', 0);
                } else {
                    $output['code'] = -902;
                    $output['message'] = "Valid login but user is not active.";
                }
            }
        }

        $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    private function fileverify($user) {
        $KCFINDER = array();
        $authoritys = $authoritys = explode(',', $user->ause_authority);
        $this->session->unset_userdata('KCFINDER');
        if(!empty($user->ause_company_id)){
            $dir = APPPATH . '../data/'. $user->ause_company_id;
            if(!file_exists($dir)){
                mkdir($dir,0755);
            }
            $types = array(
                // CKEditor & FCKEditor types
                $user->ause_company_id => array(
                    'type' => "jpg gif ico jpeg png",
                    'deniedExts'=>'exe com msi bat php phps phtml php3 php4 cgi pl tpl ch chm htm html xhtml',
                    'upload_max_filesize'=>2*1024*1024
                )
                
            );
            $KCFINDER['types'] = $types;
        }
        

        // Create folder.

        if (
                !!array_intersect(array('1', '2', '3'), $authoritys)
        ) {
             $KCFINDER['disabled'] = false;
             $KCFINDER['uploadURL'] = base_url('data');
             $KCFINDER['uploadDir'] = BASEPATH.'../data';
            $files = array(
                'upload' => true,
                'delete' => true,
                'copy' => true,
                'move' => true,
                'rename' => true,
                'edit' => true,
            );
            $dirs = array(
                'create' => true,
                'delete' => true,
                'rename' => true
            );
            
        } elseif (
                !!array_intersect(array('View'), $authoritys)
        ) {
             $KCFINDER['uploadURL'] = base_url('data'); //base_url("data");
             $KCFINDER['uploadDir'] = BASEPATH.'../data';
             $KCFINDER['disabled'] = false;
            $files = array(
                'upload' => false,
                'delete' => false,
                'copy' => false,
                'move' => false,
                'rename' => false,
                'edit' => false,
            );
            $dirs = array(
                'create' => false,
                'delete' => false,
                'rename' => false
            );

        } else {
             $KCFINDER['uploadURL'] = base_url("data");
             $KCFINDER['uploadDir'] = BASEPATH.'../data';
             $KCFINDER['disabled'] = true;

            $files = array(
                'upload' => false,
                'delete' => false,
                'copy' => false,
                'move' => false,
                'rename' => false
            );
            $dirs = array(
                'create' => false,
                'delete' => false,
                'rename' => false
            );
        }
        $KCFINDER['access'] = array(
            'files' => $files,
            'dirs' => $dirs
        );
        
        $this->session->set_userdata('KCFINDER',$KCFINDER);
    }
    public $rules = array(
        'insert' => array(
                'username' => array(
                    'field'=>'username',
                    'label'=>'Username',
                    'rules'=>'trim|required'
                    ),
                        
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required',
                    'errors' => array (
                        'required' => 'Error Message rule "required" for field email',
                        'trim' => 'Error message for rule "trim" for field email',
                        'valid_email' => 'Error message for rule "valid_email" for field email'
                    )
                ),
        ),
        'update' => array(
                'username' => array(
                    'field'=>'username',
                    'label'=>'Username',
                    'rules'=>'trim|required'
                ),
                        
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required',
                    'errors' => array (
                        'required' => 'Error Message rule "required" for field email',
                        'trim' => 'Error message for rule "trim" for field email',
                        'valid_email' => 'Error message for rule "valid_email" for field email'
                    )
                ),
                'id' => array(
                    'field'=>'id',
                    'label'=>'ID',
                    'rules'=>'trim|is_natural_no_zero|required'
                ),
        )                    
    );
    public function create(){
        $output = array(
            'text' => 'fail',
            'code' => -1,
            'data' => null
        );
        $this->form_validation->set_rules($this->rules['insert']);
        if ($this->form_validation->run() == FALSE) {
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
            // $output['code'] = -1;
        }
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
}
