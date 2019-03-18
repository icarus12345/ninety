<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Project extends Core_Controller {
    function __construct() {
        parent::__construct();
        $this->Module_Model = new Core_Model('ninety_project');
    }
    
    function index(){
        echo 'Welcome API';
    }

    function bind(){
        $this->Module_Model->table_config=array(
            "table"     =>"ninety_project",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS ninety_project.id,ninety_project.title,ninety_project.created,ninety_project.modified,ninety_account.email,ninety_project.status, count(ninety_answer.id) as total_answered, sum(ninety_answer.ans + 1) as sum_score
                ",
            "from"      => "
                FROM ninety_project 
                    INNER JOIN ninety_account ON ninety_project.uid = ninety_account.id
                    LEFT JOIN ninety_answer ON (ninety_answer.pid = ninety_project.id and ninety_account.id = ninety_answer.uid)
            ",
            "where"     => "",
            "order_by"  => "ORDER BY sum_score DESC",
            "group_by"  => "GROUP BY ninety_project.id",
            "columnmaps"=>array(
                'id' => 'ninety_project.id',
                'title' => 'ninety_project.title',
                'created' => 'ninety_project.created',
                'modified' => 'ninety_project.modified',
                'status' => 'ninety_project.status',
                'email' => 'ninety_account.email',
            ),
            "filterfields"=>array(

            )
        );
        $output = $this->Module_Model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    
}
