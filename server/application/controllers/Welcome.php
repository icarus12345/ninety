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
        $data = json_decode(read_file(APPPATH . '../db/answers.json'),true);
        echo '<pre>';
        $this->run($data);
    }
    function run($items){
        foreach ($items as $key => $row) {
            if(!empty($row['pid'])){
                $params = array(
                    // 'id' => $row['vid'],
                    'uid' => $row['uid'],
                    'qid' => $row['qid'],
                    'pid' => $row['pid'],
                    'ans' => $row['answer'],
                    // 'title' => $row['title'],
                    // 'alias' => convertUrl($row['title']),
                    // 'status' => $row['status']==1?'true':'false',
                    'created' => date('Y-m-d H:i:s',(int)$row['created']),
                    // 'type' => 'raw',
                    );
                $rs = $this->db->insert('ninety_answer',$params);
                print_r($params);
                // print_r($row);
            }
        }
    }


}
