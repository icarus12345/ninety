<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project extends Api_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model("api/Project_Model");
        $this->load->model("api/Answer_Model");
        $this->load->model("api/Share_Model");
        $this->load->library('CI_Phpmailer');
        // $this->load->model("api/Account_Model");
    }

    public $rules = array(
        'create' => array(
                'title' => array(
                    'field'=>'title',
                    'label'=>'Project Name',
                    'rules'=>'trim|required|min_length[2]|max_length[20]|alpha_numeric_spaces',
                    'errors' => array (
                        'required' => 'The title must be less than 20 characters long with no unique symbols.',
                        'trim' => 'The title must be less than 20 characters long with no unique symbols.',
                        'max_length' => 'The title must be less than 20 characters long with no unique symbols.',
                        'alpha_numeric_spaces' => 'The title must be less than 20 characters long with no unique symbols.'
                        )
                    ),
                'desc' => array(
                    'field'=>'desc',
                    'label'=>'Description',
                    'rules'=>'trim|max_length[50]|alpha_numeric_spaces',
                    'errors' => array (
                        'required' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'trim' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'max_length' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'alpha_numeric_spaces' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.'
                        )
                    ),
        ),
        'update' => array(
                'title' => array(
                    'field'=>'title',
                    'label'=>'Project Name',
                    'rules'=>'trim|required|min_length[2]|max_length[20]|alpha_numeric_spaces',
                    'errors' => array (
                        'required' => 'The title must be less than 20 characters long with no unique symbols.',
                        'trim' => 'The title must be less than 20 characters long with no unique symbols.',
                        'max_length' => 'The title is required and must be less than 20 characters long with no unique symbols.',
                        'alpha_numeric_spaces' => 'The title is required and must be less than 20 characters long with no unique symbols.'
                        )
                    ),
                'desc' => array(
                    'field'=>'desc',
                    'label'=>'Description',
                    'rules'=>'trim|max_length[50]|alpha_numeric_spaces',
                    'errors' => array (
                        'required' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'trim' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'max_length' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.',
                        'alpha_numeric_spaces' => 'The description can only be 100 characters long and only contain alphanumeric characters and spaces.'
                        )
                    ),
        ),
        'share' => array(
                'pid' => array(
                    'field'=>'pid',
                    'label'=>'Project',
                    'rules'=>'trim|required'
                    ),
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required'
                    ),
                'mode' => array(
                    'field'=>'mode',
                    'label'=>'Mode',
                    'rules'=>'trim|required'
                    ),
        ),
        'send' => array(
                'pid' => array(
                    'field'=>'pid',
                    'label'=>'Project',
                    'rules'=>'trim|required'
                    ),
                'email' => array(
                    'field'=>'email',
                    'label'=>'Email',
                    'rules'=>'trim|valid_email|required'
                    ),
                'pdf' => array(
                    'field'=>'pdf',
                    'label'=>'PDF File',
                    'rules'=>'trim|required'
                    ),
        )
    );

    function index(){
        echo 'Welcome API';
    }

    function gets(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'message' => 'Bad request.',
            'code' => -1,
        );
        $perpage = 20;
        $page = $this->input->get_post('page');
        $perpage = $this->input->get_post('perpage');
        if($page<=0) $page = 1;
        if($perpage<=0) $perpage = 100;
        // $this->form_validation->set_rules($this->rules['get_list']);
        // if ($this->form_validation->run() == FALSE) {
        //     $output['text'] = 'Fail.';
        //     $output['validation'] = validation_errors_array();
        //     $output['message'] = validation_errors();
        // } else {
            $rs = $this->Project_Model->get_all_by_uid($this->user->id,$page,$perpage);

            $output['code'] = 1;
            $output['text'] = 'Success.';
            $output['message'] = 'Get list project success.';
            $output['data'] = $rs;
        // }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    function create(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'message' => 'Bad request.',
            'code' => -1,
        );
        $title = $this->input->post('title');
        $desc = $this->input->post('desc');
        $id = $this->input->post('id');
        $this->form_validation->set_rules($this->rules['create']);
        if ($this->form_validation->run() == FALSE) {
            $output['text'] = 'Fail.';
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
        } else {
            $project = $this->Project_Model->get($id);
            if($project){
                $params = array(
                    'title' => $title,
                    'data'=>array('desc' => $desc)
                    );
                $rs = $this->Project_Model->update($id, $params);
                if($rs){
                    $output['message'] = 'Update project success.';
                } else {
                    $output['message'] = 'Can\'t update project.';
                }
            }else{
                $params = array(
                    'title' => $title,
                    'data'=>array('desc' => $desc),
                    'status' => 'true',
                    // 'type' => $this->client_id,
                    'uid' => $this->user->id
                    );
                $rs = $this->Project_Model->insert($params);
                if($rs){
                    $output['message'] = 'Created project success.';
                } else {
                    $output['message'] = 'Can\'t create project.';
                }
            }
            
            if($rs){
                $code = 200;
                $output['code'] = 1;
                $output['text'] = 'Success.';
                $insert_id = $this->db->insert_id();
                $project = $this->Project_Model->get($insert_id);
                $output['data'] = $project;
            } else {
                $code = 200;
                $output['text'] = 'Fail.';
            }
        }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }

    function get(){
        $code = 200;
        $output = array(
            'text' => 'fail',
            'message' => 'Bad request.',
            'code' => -1,
        );
        $id = $this->input->post('id');
        $uid = $this->user->id;
        // $this->form_validation->set_rules($this->rules['get_list']);
        // if ($this->form_validation->run() == FALSE) {
        //     $output['text'] = 'Fail.';
        //     $output['validation'] = validation_errors_array();
        //     $output['message'] = validation_errors();
        // } else {
            $project = $this->Project_Model->get($id);
            if($project){
                $project->alias = convertUrl($project->title);
                $author = $this->Account_Model->get_by_id($project->uid);
                
                $answereds[] = $this->Answer_Model->get_by_uid_pid($uid,$id);
                
                $this->db->where('ninety_shared.email !=',$author->email);
                $this->db->where('ninety_shared.email !=',$this->user->email);
                $shareds = $this->Share_Model->get_by_pid($id);
                foreach ($shareds as $key => $value) {
                    $u = $this->Account_Model->get_by_email($value->email);
                    $answereds[] = $this->Answer_Model->get_by_uid_pid($u->id,$id);
                }
                // my project
                if($this->user->id != $project->uid){
                    $answereds[] = $this->Answer_Model->get_by_uid_pid($author->id,$id);
                    $shareds[] = $author;
                }
                // author project

                if($project->uid == $uid){
                    $project->mode = 2;
                } else {
                    $mode = $this->Share_Model->get_by_pid_email($id,$this->user->email);
                    if($mode){
                        $project->mode = $mode->mode;
                    } else {
                        $project->mode = 0;
                    }
                }

                $output['code'] = 1;
                $output['text'] = 'Success.';
                $output['message'] = 'Get project success.';
                $output['data'] = array(
                    'info' => $project,
                    'answereds' => $answereds,
                    'shareds' => $shareds,
                    );
            } else {
                $output['message'] = 'Project does\'t not exists.';
            }
        // }
        $this->output
            ->set_content_type('application/json')
            ->set_status_header($code)
            ->set_output(json_encode($output,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    }
    function _export(){

    }
    function export(){
        $this->load->library('mpdf/Mpdf');
        
        $id = $this->input->post('id');
        $project = $this->Project_Model->get($id);
        $uid = $this->user->id;
        if($project){
            $author = $this->Account_Model->get_by_id($project->uid);

            $this->db->where('ninety_shared.email !=',$author->email);
            $this->db->where('ninety_shared.email !=',$this->user->email);
            $shareds = $this->Share_Model->get_by_pid($id);
            
            // my project
            if($this->user->id != $project->uid){
                $shareds[] = $author;
            }
            // author project

            $items = $this->input->post('items');
            $info = $this->input->post('info');
            $setting = $this->input->post('setting');
            $show_global = $this->input->post('show_global');
            $this->load->vars(array(
                'items' => $items,
                'info' => $info,
                'shareds' => $shareds,
                'user' => $this->user,
                'setting' => $setting,
                'show_global' => (bool)$show_global,
            ));
            if($this->client_id == 'risk')
                $html = $this->load->view('risk/pdf',null,true);
            elseif($this->client_id == 'raw')
                $html = $this->load->view('raw/pdf',null,true);

            $file_name = convertUrl($project->title)."-{$uid}";
            if($setting['all_user']){
                $file_name.="-user";
            }
            if($setting['all_comment']){
                $file_name.="-comment";
            }
            $mpdf = new Mpdf('c','A4','','' , 0 , 0 , 0 , 0 , 0 , 0); 
            $mpdf->SetDisplayMode('fullpage');
            // $mpdf->SetHTMLFooter('<div class="footer">{PAGENO}/{nbpg}</div>');
            $mpdf->list_indent_first_level = 0;  // 1 or 0 - whether to indent the first level of a list
            $mpdf->WriteHTML($html);
            $pdffile = APPPATH . "../pdf/{$this->client_id}/{$file_name}.pdf";
            $mpdf->Output($pdffile,'F');
            $this->_output['text'] = 'Success.';
            $this->_output['code'] = 1;
            $this->_output['message'] = 'Export success.';
            $this->_output['data'] = array(
                'url' => base_url("pdf/{$this->client_id}/{$file_name}.pdf"),
                'file_name' => "{$file_name}.pdf",
                );
        } else {
            $this->_output['message'] = 'Project doest exits.';
        }
        $this->_code = 200;
        $this->display();
    }
    function share(){
        $email = $this->input->post('email');
        $mode = $this->input->post('mode');
        $pid = $this->input->post('pid');
        $this->form_validation->set_rules($this->rules['share']);
        if ($this->form_validation->run() == FALSE) {
            $this->_output['text'] = 'Fail.';
            $this->_output['validation'] = validation_errors_array();
            $this->_output['message'] = validation_errors('','');
        } else {
            $shareds = $this->Share_Model->get_by_pid($pid);
            if(count($shareds) < 5){
                $project = $this->Project_Model->get($pid);
                $user = $this->Account_Model->get_by_email($email);
                if($project){
                    $this->load->vars(array(
                        'project' => $project,
                        'mode' => $mode
                    ));
                    if(!$user || $user->id != $project->uid){
                        $shared = $this->Share_Model->get_by_pid_email($pid,$email);
                        if($shared){
                            $params = array(
                                'pid' => $pid,
                                'email' => $email,
                                'mode' => $mode,
                                );
                            $rs = $this->Share_Model->update($shared->id,$params);
                        }else{
                            $params = array(
                                'pid' => $pid,
                                'email' => $email,
                                'mode' => $mode,
                                'type' => $this->client_id,
                                );
                            $rs = $this->Share_Model->insert($params);
                        }
                        if($rs){
                            $this->_output['code'] = 1;
                            $this->_output['text'] = 'Success.';
                            $this->_output['message'] = 'The project has been successfully shared. If you don’t see our e-mail in your inbox please check your spam/junk box.';
                            $shareds = $this->Share_Model->get_by_pid($pid);
                            $this->_output['data'] = $shareds;
                            // $output['data'] = $rs;
                            $to = $email;
                            $subject = "I want to share the project '{$project->title}' with you";
                            $message = $this->load->view("{$this->client_id}/share_mail_body",null,true);
                            $this->ci_phpmailer->send_mail($to,$subject, $message);
                        } else {
                            $this->_output['text'] = 'fail';
                            $this->_output['message'] = 'Cant share.';
                        }
                    }else{
                        $this->_output['message'] = 'This is your project.';
                        $this->_output['data'] = array($project,$user
                            );
                    }
                }else{
                    $this->_output['message'] = 'Project not found.';
                }
            }else{
                $this->_output['message'] = 'Maximum sharing.';
            }
        }
        $this->_code = 200;
        $this->display();
    }
    function unshare(){
        $id = $this->input->post('id');
        $this->form_validation->set_rules($this->rules['share']);
        $email = $this->input->post('email');
        $pid = $this->input->post('pid');
        if ($this->form_validation->run() == FALSE) {
            $this->_output['text'] = 'Fail.';
            $this->_output['validation'] = validation_errors_array();
            $this->_output['message'] = validation_errors('','');
        } else {
            $shared = $this->Share_Model->get_by_pid_email($pid,$email);
            $user = $this->Account_Model->get_by_email($email);
            if($shared){
                $this->db->trans_begin();
                if($user) $this->Answer_Model->delete_by_uid_pid($user->id,$pid);
                $this->Share_Model->delete($shared->id);
                if($this->db->trans_status() === FALSE){
                    $this->db->trans_rollback();
                    $this->_output['text'] = 'fail';
                    $this->_output['message'] = 'Cant unshare.';
                } else {
                    $this->_output['code'] = 1;
                    $this->_output['text'] = 'Success.';
                    $this->_output['message'] = 'You have successfully unshared your project.';
                    $shareds = $this->Share_Model->get_by_pid($pid);
                    $this->_output['data'] = $shareds;
                    $this->db->trans_commit();
                }
            }else{
                $this->_output['message'] = 'People not found.';
            }
        }
        $this->_code = 200;
        $this->display();
    }
    function delete(){
        $pid = $this->input->post('id');
        
        $project = $this->Project_Model->get($pid);
        if($project){
            $this->db->trans_begin();
            $this->Answer_Model->delete_by_pid($pid);
            $this->Share_Model->delete_by_pid($pid);
            $this->Project_Model->delete($pid);
            if($this->db->trans_status() === FALSE){
                $this->db->trans_rollback();
                $this->_output['text'] = 'fail';
                $this->_output['message'] = 'Cant delete.';
            } else {
                $this->_output['code'] = 1;
                $this->_output['text'] = 'Success.';
                $this->_output['message'] = 'Project successfully deleted';
                $this->db->trans_commit();
            }
        }else{
            $this->_output['message'] = 'Project not found.';
        }
        
        $this->_code = 200;
        $this->display();
    }
    function send(){
        $email = $this->input->post('email');
        $pdf = $this->input->post('pdf');
        $pid = $this->input->post('pid');
        $this->form_validation->set_rules($this->rules['send']);
        if ($this->form_validation->run() == FALSE) {
            $this->_output['text'] = 'Fail.';
            $this->_output['validation'] = validation_errors_array();
            $this->_output['message'] = validation_errors('','');
        } else {
            $project = $this->Project_Model->get($pid);
            if($project){
                $this->load->vars(array(
                    'project' => $project,
                    'pdf' => $pdf
                ));
                
                $this->_output['code'] = 1;
                $this->_output['text'] = 'Success.';
                $this->_output['message'] = 'Project successfully sent. If you don’t see our e-mail in your inbox please check your spam/junk box.';
                // $output['data'] = $rs;
                $to = $email;
                $subject = "Project Report '{$project->title}'";;
                $message = $this->load->view("{$this->client_id}/send_mail_body",null,true);
                $this->ci_phpmailer->AddAttachment(APPPATH . '../' . $pdf, 'shark-tank-entrepreneur_'.convertUrl($project->title).'.pdf');
                $this->ci_phpmailer->send_mail($to,$subject, $message);
                    
            }else{
                $this->_output['message'] = 'Project not found.';
            }
        }
        $this->_code = 200;
        $this->display();
    }
    function debug(){
        $this->ci_phpmailer->send_mail('khuongxuantruong@gmail.com','blabla', 'blabla');
    }
}