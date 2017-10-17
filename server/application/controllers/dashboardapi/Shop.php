<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Shop extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('dashboard/Trademark_Model');
        $this->load->model('dashboard/Shop_Model');
        $this->load->model('dashboard/Province_Model');
        $this->load->model('dashboard/Country_Model');
    }
    
    function index(){
        echo 'Welcome API';
    }
    public $rules = array(
        'unique' => array(
            'data[title]' => array(
                'field'=>'data[title]',
                'label'=>'Title',
                'rules'=>'callback_title_check'
            ),
        ),
        'insert' => array(
            'data[title]' => array(
                'field'=>'data[title]',
                'label'=>'Title',
                'rules'=>'trim|required|max_length[255]'
                ),
            // 'data[alias]' => array(
            //     'field'=>'data[alias]',
            //     'label'=>'Alias',
            //     'rules'=>'trim|required|max_length[255]'
            //     ),
            // 'data[type]' => array(
            //     'field'=>'data[type]',
            //     'label'=>'Type',
            //     'rules'=>'trim|max_length[50]'
            //     ),
            // 'data[category]' => array(
            //     'field'=>'data[category]',
            //     'label'=>'Category',
            //     'rules'=>'trim|integer'
            //     ),
        ),
        'update' => array(
            // 'data[title]' => array(
            //     'field'=>'data[title]',
            //     'label'=>'Title',
            //     'rules'=>'trim|required|max_length[255]'
            //     ),
            // 'data[alias]' => array(
            //     'field'=>'data[alias]',
            //     'label'=>'Alias',
            //     'rules'=>'trim|required|max_length[255]'
            //     ),
            // 'data[type]' => array(
            //     'field'=>'data[type]',
            //     'label'=>'Type',
            //     'rules'=>'trim|max_length[50]'
            //     ),
            // 'data[category]' => array(
            //     'field'=>'data[category]',
            //     'label'=>'Category',
            //     'rules'=>'trim|integer'
            //     ),
            'id' => array(
                'field'=>'id',
                'label'=>'Id',
                'rules'=>'trim|is_natural_no_zero|required'
            ),
        )
    );
    public function bind() {
        //Important to NOT load the model and let the library load it instead.  
        $this -> load -> library('Datatable', array(
            'model' => 'shop_dt', 
            'model_path' => 'state/shop_dt',
            'rowIdCol' => 't.id'
            ));
        
        //format array is optional, but shown here for the sake of example
        $json = $this -> datatable -> datatableJson(
            array(
                // 'a_date_col' => 'date',
                // 'a_boolean_col' => 'boolean',
                // 'a_percent_col' => 'percent',
                // 'a_currency_col' => 'currency'
                'id' => 'string',
                'title' => 'string',
                'province_title' => 'string',
                'cteated' => 'date',
            ),true
        );
        
        $this -> output -> set_header("Pragma: no-cache");
        $this -> output -> set_header("Cache-Control: no-store, no-cache");
        $this -> output -> set_content_type('application/json') -> set_output(json_encode($json));
 
    }
    function load_province_by_trademark(){
        $output = array(
            'text' => 'ok',
            'code' => 1,
            'data' => null
        );
        $id = $this->input->post('id');
        if(!empty($id)) {
            $entry_detail = $this->Trademark_Model->get($id);
            if($entry_detail){
                $provincies = $this->Province_Model->get_by_country_id($entry_detail->country_id);
                $this->load->vars(array(
                    'entry_detail' => $entry_detail,
                    'provincies' => $provincies,
                ));
            }
        }
        $output['html'] = $this->load->view('dashboard/shop/province-dropdown',null,true);
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    function detail(){
        $output = array(
            'text' => 'ok',
            'code' => 1,
            'data' => null
        );
        $id = $this->input->post('id');
        $trademarks = $this->Trademark_Model->gets();
        $countries = $this->Country_Model->gets();
        $this->load->vars(array(
            'trademarks' => $trademarks,
        ));
        if(!empty($id)) {
            $entry_detail = $this->Trademark_Model->get($id);
            $this->load->vars(array(
                'entry_detail' => $entry_detail
                ));
            $output['data'] = $entry_detail;
            // $output['trademark_category_ids'] = $trademark_category_ids;
        }
        $output['html'] = $this->load->view('dashboard/shop/detail',null,true);
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    public function oncreate(){
        $output = array(
            'text' => 'fail',
            'code' => -1,
            'data' => null
        );
        $user = $this->session->userdata('dasbboard_user');
        $data = $this->input->post('data');

        
        $this->form_validation->set_rules($this->rules['insert']);
        if ($this->form_validation->run() == FALSE) {
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
            // $output['code'] = -1;
        } else {

            $params = $data;
            $category_ids = $params['category_id'];

            unset($params['category_id']);
            $params['status'] = 'true';
            $params['author'] = $user->ause_id;
            $this->db->trans_begin();
            $this->Trademark_Model->onInsert($params);
            $insert_id = $this->db->insert_id();
            if(!empty($category_ids)) foreach ($category_ids as $category_id) {
                $batchData[] = array(
                    'trademark_id'=>$insert_id,
                    'category_id'=>$category_id,
                    );
            }
            $this->Trademark_Model->insertBatchCategory($batchData);
            if ($this->db->trans_status() !== FALSE) {
                $output["code"] = 1;
                $output["text"] = 'ok';
                $output["message"] = 'Register record to database.';
                $this->db->trans_commit();

            } else {
                $this->db->trans_rollback();
                $output["code"] = -1;
                $output["message"] = "Record faily to insert. Please check data input and try again.";
            }
        }

        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    public function onupdate(){
        $output = array(
            'text' => 'fail',
            'code' => -1,
            'data' => null
        );
        $user = $this->session->userdata('dasbboard_user');
        $data = $this->input->post('data');
        $id = $this->input->post('id');

        
        $this->form_validation->set_rules($this->rules['update']);
        if ($this->form_validation->run() == FALSE) {
            $output['validation'] = validation_errors_array();
            $output['message'] = validation_errors();
            // $output['code'] = -1;
        } else {

            $params = $data;
            $category_ids = $params['category_id'];
            
            unset($params['category_id']);
            $entry_detail = $this->Trademark_Model->get($id);
            if($entry_detail){
                if(empty($entry_detail->author)) 
                    $params['author'] = $user->ause_id;
                
                $this->db->trans_begin();
                $this->Trademark_Model->onUpdate($id, $params);
                $this->Trademark_Model->deleteCategoryByTrademarkId($id);
                if(!empty($category_ids)) foreach ($category_ids as $category_id) {
                    $batchData[] = array(
                        'trademark_id'=>$id,
                        'category_id'=>$category_id,
                        );
                }
                $this->Trademark_Model->insertBatchCategory($batchData);
                if ($this->db->trans_status() !== FALSE) {
                    $output["code"] = 1;
                    $output["text"] = 'ok';
                    $output["message"] = 'Updated Entry to database.';
                    $this->db->trans_commit();
                } else {
                    $this->db->trans_rollback();
                    $output["code"] = -1;
                    $output["message"] = "Entry faily to update. Please check data input and try again.";
                }
            }else{
                $output["message"] = 'Entry doest exists.';
            }
        }

        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    function commit(){
        $id = $this->input->post('id');
        if(!empty($id)) $this->onupdate();
        else $this->oncreate();
    }
}
