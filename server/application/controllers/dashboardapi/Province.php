<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Province extends Core_Controller {
    function __construct() {
        parent::__construct();
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
    public function get_all(){
        $output = array(
            'text' => 'ok',
            'code' => 1,
            'data' => $this->Province_Model->get_all()
        );
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($output));
    }
    public function bind() {
        //Important to NOT load the model and let the library load it instead.  
        $this -> load -> library('Datatable', array(
            'model' => 'province_dt', 
            'model_path' => 'state/province_dt',
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
                'country_title' => 'string',
                'cteated' => 'date',
            ),true
        );
        
        $this -> output -> set_header("Pragma: no-cache");
        $this -> output -> set_header("Cache-Control: no-store, no-cache");
        $this -> output -> set_content_type('application/json') -> set_output(json_encode($json));
 
    }
    
}
