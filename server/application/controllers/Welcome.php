<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *      http://example.com/index.php/welcome
     *  - or -
     *      http://example.com/index.php/welcome/index
     *  - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    function __construct() {
        parent::__construct();
    }
    public function index()
    {
        echo 'Welcome';
    }
    function sync(){
        echo user_hash_password('shaphia');die;
        $data = json_decode(read_file(APPPATH . '../db/category.json'),true);
        echo '<pre>';
        $this->run($data['data']['items']);
    }
    function run($items,$pid = 95){
        foreach ($items as $key => $row) {
            $params = array(
                'id' => $row['tid'],
                'name' => $row['name']
                );
            $rs = $this->db->where(array(
                        'id'=>$row['tid']
                        ))
                        ->get('ninety_category')
                        ->row();
                        $rs->parent_id = $pid;
            // if($rs) $this->db->where(array(
            //     'id'=>$rs->id
            //     ))
            //     ->update('ninety_category',array(
            //         'parent_id'=>$pid
            //         ));
            print_r($rs);
            if($row['items']){
                $this->run($row['items'],$row['tid']);
            }else if($row['questions']){
                foreach ($row['questions'] as $q) {
                    $params = array(
                    'id' => $q['question_id'],
                    'title' => $q['title'],
                    'category_id'=>$row['tid']
                    );
                    $rs = $this->db->where(array(
                        'id'=>$q['question_id'],
                        'type'=>'raw'
                        ))
                        ->get('ninety_question')
                        ->row();
                    // if($rs) $this->db->where(array(
                    //         'id'=>$rs->id
                    //         ))
                    //         ->update('ninety_question',array(
                    //             'category_id'=>$row['tid']
                    //             ));
                    // print_r($rs);
                }
            }
            // if(!empty($row['pid'])){
                
                // $rs = $this->db->insert('ninety_shared',$params);
                
                // print_r($row);
            // }
        }
    }


}
