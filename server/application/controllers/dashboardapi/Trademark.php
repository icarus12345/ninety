<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Trademark extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('dashboard/Trademark_Model');
    }
    
    function index(){
        echo 'Welcome API';
    }

    function bind(){
        $this->Trademark_Model->table_config=array(
            "table"     =>"__trademark",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS __trademark.*
                ",
            "from"      => "FROM __trademark",
            "where"     => "",
            "order_by"  => "",
            "columnmaps"=>array(
                'id' => '__trademark.id',
                'created' => '__trademark.created',
                'modified' => '__trademark.modified',
                'status' => '__trademark.status',
            ),
            "filterfields"=>array(

            )
        );
        $output = $this->Trademark_Model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    public function dataTable() {
        //Important to NOT load the model and let the library load it instead.  
        $this -> load -> library('Datatable', array(
            'model' => 'trademark_dt', 
            'model_path' => 'state/trademark_dt',
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
                'cteated' => 'date',
            )
        );
        
        $this -> output -> set_header("Pragma: no-cache");
        $this -> output -> set_header("Cache-Control: no-store, no-cache");
        $this -> output -> set_content_type('application/json') -> set_output(json_encode($json));
 
    }
}
