<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if (strcasecmp($_SERVER['REQUEST_METHOD'], 'post') === 0 && stripos($_SERVER['CONTENT_TYPE'], 'application/json') !== FALSE) {
    // POST is actually in json format, do an internal translation
    $_POST += json_decode(file_get_contents('php://input'), true);
}
class Auth extends CI_Controller {
    function __construct() {
        parent::__construct();
        
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Credentials: true");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
        header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
        header("Content-Type: application/json; charset=utf-8");
        $this->load->model("api/Token_Model");
        $this->load->model("api/Client_Model");
        $this->load->model("api/Account_Model");
        $this->load->model("api/Project_Model");
        $this->load->model("api/Question_Model");
        $this->load->model("api/Content_Model");
        $this->load->library('CI_Phpmailer');
        $this->form_validation->set_error_delimiters('', '');
        $this->_code = 200;
        $this->_output = array(
            'text' => 'fail',
            'message' => 'Bad request.',
            'code' => -1,
        );
        $this->client_id = $this->input->get_post('client_id');
        $this->client_name = $this->input->get_post('client_name');
        $this->client_secret = $this->input->get_post('client_secret');
    }

    public $rules = array(
        'login' => array(
                'username' => array(
                    'field'=>'username',
                    'label'=>'Username',
                    'rules'=>'trim|required|min_length[4]|max_length[50]'
                    ),
                'password' => array(
                    'field'=>'password',
                    'label'=>'Password',
                    'rules'=>'trim|required|min_length[4]|max_length[50]'
                    ),
        ),
        'register' => array(
                'username' => array(
                    'field'=>'username',
                    'label'=>'Username',
                    'rules'=>'trim|required|alpha_numeric|min_length[4]|max_length[50]|is_unique[ninety_account.username]'
                    ),
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required|is_unique[ninety_account.email]',
                    'errors' => array (
                        'required' => 'Wrong e-mail. Try again',
                        'trim' => 'Wrong e-mail. Try again',
                        'valid_email' => 'Wrong e-mail. Try again'
                    )
                ),
                'first_name' => array(
                    'field'=>'first_name',
                    'label'=>'Fist name',
                    'rules'=>'trim|max_length[50]'
                    ),
                'last_name' => array(
                    'field'=>'last_name',
                    'label'=>'Last name',
                    'rules'=>'trim|max_length[50]'
                    ),
                'password' => array(
                    'field'=>'password',
                    'label'=>'Password',
                    'rules'=>'trim|required|min_length[4]|max_length[50]'
                    ),
                'sex' => array(
                    'field'=>'sex',
                    'label'=>'Sex',
                    'rules'=>'trim|max_length[10]'
                    ),
                'interest' => array(
                    'field'=>'interest',
                    'label'=>'Interest',
                    'rules'=>'trim|max_length[30]'
                    ),
                'professional' => array(
                    'field'=>'professional',
                    'label'=>'Professional',
                    'rules'=>'trim|max_length[30]'
                    ),
        ),
        'sendcode' => array(
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required',
                    'errors' => array (
                        'required' => 'Wrong e-mail. Try again',
                        'trim' => 'Wrong e-mail. Try again',
                        'valid_email' => 'Wrong e-mail. Try again'
                    )
                ),
        ),
        'get_token' => array(
                'app_id' => array(
                    'field'=>'app_id',
                    'label'=>'App ID',
                    'rules'=>'trim|required'
                ),
                        
                'app_secret' => array(
                    'field'=>'app_secret',
                    'label'=>'App Secret',
                    'rules'=>'trim|required'
                )
        ),
        'reset_password' => array(
                'code' => array(
                    'field'=>'code',
                    'label'=>'Reset Password Code',
                    'rules'=>'trim|required'
                ),
                        
                'password' => array(
                    'field'=>'password',
                    'label'=>'Password',
                    'rules'=>'trim|required|min_length[4]|max_length[50]'
                )
        ),
        'update_profile' => array(
                'password' => array(
                    'field'=>'password',
                    'label'=>'Password',
                    'rules'=>'trim|required|min_length[4]|max_length[50]'
                )
        ),
    );

    function index(){
        echo 'Welcome API';
    }
    function display(){
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($this->_code)
            ->set_output(json_encode($this->_output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES))
            ->_display();
            die;
    }
    function terms(){
        $terms = $this->Content_Model->get(44);
        $this->_output['data'] = $terms->content;
        $this->_output['code'] = 1;
        $this->_output['text'] = 'ok';
        $this->_output['message'] = 'Success';
        $this->display();
    }
    function device_info(){
        $this->_output['data'] = $data;
        $this->_output['code'] = -1;
        $this->_output['text'] = 'ok';
        $this->_output['message'] = 'Please update to the newest version of the app to continue';
        $this->display();
       
        // $app_id = $this->input->post('app_id');
        // $app_secret = $this->input->post('app_secret');
        $uuid = $this->input->get_post('uuid');
        $device_info = $this->input->get_post('device_info');
        if($uuid){
        // $this->form_validation->set_rules($this->rules['get_token']);
        // if ($this->form_validation->run() == FALSE) {
            // $output['validation'] = validation_errors_array();
            // $output['message'] = validation_errors();
        // } else {
            $device = $this->Client_Model->get_device($uuid);
            if($device) {
                $user = $this->Account_Model->get_by_id($device->uid);
                if($user){
                    $count_project = $this->Project_Model->count_project($user->id);
                    $count_question = $this->Question_Model->count_questions();
                    
                    unset($user->password);
                    $data = array(
                        'user_info' => $user,
                        'total_project'=>$count_project,
                        'total_question'=>$count_question,
                        );
                    $this->_output['data'] = $data;
                    $this->_output['code'] = 1;
                    $this->_output['text'] = 'ok';
                    $this->_output['message'] = 'Success';
                    $this->user = $user;
                } else {
                    $this->_output['code'] = -1;
                    $this->_output['message'] = 'User not exist.';
                }
            } else {
                $params = array(
                    'uuid'=>$uuid,
                    'data'=>serialize($device_info)
                    );
                $this->Client_Model->insert_device($params);
                $this->_output['code'] = -403;
                $this->_output['message'] = 'Device doesn\' exists.';
            }
        // }
        }
        $this->display();
    }

    function get_client(){
        $code = 403;
        $output = array(
            'text' => 'fail',
            'message' => 'Access Denied.',
            'code' => -1,
        );
        $app_id = $this->input->post('app_id');
        $token = $_SERVER['HTTP_X_CSRF_TOKEN'];
        $tok = $this->Token_Model->get($app_id,$token);
        if($tok){
            $code = 200;
            // $output['code'] = -201;
            // $output['message'] = 'Have Another Device Access To Your Account';
            $output['data'] = $tok;
        } else {
            $code = 403;
            $output['message'] = 'Token invalid.';
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    function register(){
        $code = 403;
        $output = array(
            'text' => 'Access Denied.',
            'code' => -1,
        );
        $client_id = $this->input->post('client_id');
        $username = $this->input->post('username');
        $email = $this->input->post('email');
        $first = $this->input->post('first_name');
        $last = $this->input->post('last_name');
        $password = $this->input->post('password');
        $sex = $this->input->post('sex');
        $iam = $this->input->post('iam');
        $professional = $this->input->post('professional');
        $interest = $this->input->post('interest');
        // $token = $_SERVER['HTTP_X_CSRF_TOKEN'];
        $this->form_validation->set_rules($this->rules['register']);
        if ($this->form_validation->run() == FALSE) {
            $code = 200;
            $output['text'] = 'Fail.';
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
        } else {
            // $tok = $this->Token_Model->get($app_id,$token);
            // if($tok){
                $params = array(
                    'username' => $username,
                    'email' => $email,
                    'password' => user_hash_password($password),
                    'first_name' => $first,
                    'last_name' => $last,
                    'data'=>serialize(array(
                        'sex' => $sex,
                        'iam' => $iam,
                        'professional' => $professional,
                        'interest' => $interest,
                        ))
                    );
                $rs = $this->Account_Model->create($params);
                if($rs){
                    $user = $this->Account_Model->get_by_username($username);
                    $code = 200;
                    $output['code'] = 1;
                    $output['text'] = 'ok';
                    $output['message'] = 'Registration Complete.';
                    if($client_id=='raw'){
                    	$output['message'] = 'Registration Complete.';
                    }elseif($client_id=='risk'){
                    	$output['message'] = 'Registration Complete.';
                    }
                    $output['data'] = $user;
                } else {
                    $code = 200;
                    $output['message'] = 'Can\'t register account.';
                    $output['text'] = 'fail';
                }
            // } else {
                // $code = 403;
                // $output['message'] = 'Token invalid.';
            // }
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    function login(){
        $this->_output['data'] = $data;
        $this->_output['code'] = -1;
        $this->_output['text'] = 'ok';
        $this->_output['message'] = 'Please update to the newest version of the app to continue';
        $this->display();
       
        $uuid = $this->input->post('uuid');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        // $token = $_SERVER['HTTP_X_CSRF_TOKEN'];
        $this->form_validation->set_rules($this->rules['login']);
        if ($this->form_validation->run() == FALSE) {
            $code = 200;
            $output['validation'] = validation_errors_array();
            $output['message'] = 'The Username and Password fields are required';
        } else {
            // $tok = $this->Token_Model->get($app_id,$token);
            // if($tok){
                
                    $code = 200;
                    $user = $this->Account_Model->get_by_username($username);
                    if(!$user){
                        $user = $this->Account_Model->get_by_email($username);
                    }
                    if($user){
                        if(user_check_password($password,$user->password)){
                            if($user->status=='true'){
                                unset($user->password);
                                // $output['code'] = 1;
                                // $output['text'] = 'Success.';
                                $output['code'] = 1;
                                $output['text'] = 'ok';
                                $output['message'] = 'Success';
                                $count_project = $this->Project_Model->count_project($user->id);
                                $count_question = $this->Question_Model->count_questions();
                                unset($user->password);
                                $output['data'] = array(
                                    'user_info' => $user,
                                    'total_project'=>$count_project,
                                    'total_question'=>$count_question,
                                    );
                                $this->Account_Model->update($user->id,array(
                                    'last_login' => date('Y-m-d H:i:s')
                                    ));
                                $this->Client_Model->update_device($uuid,array(
                                    'uid' => $user->id
                                    ));
                            } else {
                                $output['message'] = 'Your account have been deleted.';
                            }
                        } else {
                            $output['message'] = 'Oops. Incorrect password. Please try again';
                            
                        }
                    } else {
                        $output['message'] = 'Incorrect user. Please try again';
                    }
                
            // } else {
                // $code = 403;
                // $output['message'] = 'Token invalid.';
            // }
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    function sendcode(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'message' => 'Fail.',
            'code' => -1,
        );
        $email = $this->input->post('email');
        // $token = $_SERVER['HTTP_X_CSRF_TOKEN'];
        $this->form_validation->set_rules($this->rules['sendcode']);
        if ($this->form_validation->run() == FALSE) {
            $code = 200;
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
        } else {
                    
            $code = 200;
            $user = $this->Account_Model->get_by_email($email);
            if($user){
                $tok = $this->Token_Model->create($user->id, 60*30, 6);
                $output['code'] = 1;
                $output['text'] = 'ok';
                $output['message'] = 'Success';
                // $output['tok'] = $tok;
                $this->load->vars(array(
                    'tok' => $tok
                ));
                $to = $email;
                $subject = "A password reset code";
                $message = $this->load->view('risk/send_code',null,true);
                $this->ci_phpmailer->send_mail($to,$subject, $message);
            } else {
                $output['message'] = 'Email doesn\'t exists.';
            }
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }
    function reset_password(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'message' => 'Fail.',
            'code' => -1,
        );
        $reset_code = $this->input->post('code');
        $password = $this->input->post('password');
        // $token = $_SERVER['HTTP_X_CSRF_TOKEN'];
        $this->form_validation->set_rules($this->rules['reset_password']);
        if ($this->form_validation->run() == FALSE) {
            $code = 200;
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
        } else {
                    
            $code = 200;
            $tok = $this->Token_Model->get_by_token($reset_code);
            if($tok){
                $user = $this->Account_Model->get_by_id($tok->token_app_id);
                if($user){
                    $rs = $this->Account_Model->update($user->id,array(
                        'password' => user_hash_password($password),
                        ));
                    if($rs){
                        $this->Token_Model->delete_by_token($reset_code);
                        $output['code'] = 1;
                        $output['text'] = 'ok';
                        $output['message'] = 'Success';
                    } else {
                        $output['message'] = 'Fail to reset your password.';
                    }
                } else {
                    $output['message'] = 'User doesn\'t exists.';
                }
            } else {
                $output['message'] = 'Reset Password Code doesn\'t valid.';
            }
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }
    function logout(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'code' => -1,
        );
        // $user = $this->session->userdata('api_user');
        $uuid = $this->input->post('uuid');
        $device = $this->Client_Model->get_device($uuid);
        if($device){
            $rs = $this->Client_Model->update_device($uuid,array(
                'uid' => null
                ));
            // if($rs){
                $output['code'] = 1;
                $output['text'] = 'success.';
                $output['message'] = 'Success';
            // } else {
                // $output['message'] = 'Can\'t logout.';
            // }
        } else {
            $output['message'] = 'Device doest exists.';
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    
}
