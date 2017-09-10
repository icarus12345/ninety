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
        $data = json_decode(read_file(APPPATH . '../ninety.json'),true);
        echo '<pre>';
        $this->run($data['data']['items']);
    }
    function run($items,$pid = 0){
        if($items) foreach ($items as $item) {
            $params = array(
                'data' => serialize(array(
                    'lower' => $item['lowcomment'],
                    'higher' => $item['hightcomment']
                    ))
                );
            // $rs = $this->db->insert('ninety_category',$params);
            $c = $this->db->where(array(
                'company_id'=>1006,
                'author'=> 10030,
                'type'=> 'raw',
                'title'=>$item['name'],
                ))->get('ninety_category')->row();
            $this->db
                ->where(array(
                'company_id'=>1006,
                'author'=> 10030,
                'type'=> 'raw',
                'title'=>$item['name'],
                ))
                ->where('id',$c->id)
                ->update('ninety_category',$params);
            print_r($c);
            // if($rs){
                // $cid = $this->db->insert_id();
                if(!empty($item['items'])) {
                    $this->run($item['items'], $cid);
                } elseif(!empty($item['questions'])){
                    // foreach ($item['questions'] as $quest) {
                    //     $answers = array();
                    //     if(!empty($quest['label_1'])){
                    //         $answers[] = array('title'=> $quest['label_1'], 'score'=>1);
                    //     }
                    //     if(!empty($quest['label_2'])){
                    //         $answers[] = array('title'=> $quest['label_2'], 'score'=>2);
                    //     }
                    //     if(!empty($quest['label_3'])){
                    //         $answers[] = array('title'=> $quest['label_3'], 'score'=>3);
                    //     }
                    //     if(!empty($quest['label_4'])){
                    //         $answers[] = array('title'=> $quest['label_4'], 'score'=>4);
                    //     }
                    //     if(!empty($quest['label_5'])){
                    //         $answers[] = array('title'=> $quest['label_5'], 'score'=>5);
                    //     }

                    //     $params = array(
                    //         'company_id'=>1006,
                    //         'author'=> 10030,
                    //         'type'=> 'raw',
                    //         'status'=> 'true',
                    //         'created'=>date('Y-m-d H:i:s'),
                    //         'sorting'=> 1,
                    //         'category_id'=>$cid,
                    //         'title'=>$quest['title'],
                    //         'data' => serialize(array(
                    //             'question' => $quest['question_body'],
                    //             'lower' => $quest['lowcomment'],
                    //             'higher' => $quest['hightcomment'],
                    //             'answers' => $answers
                    //             ))
                    //     );
                    //     $rs = $this->db->insert('ninety_question',$params);
                    // }
                }
            // }
            // insert
            // get
        }
    }

}
