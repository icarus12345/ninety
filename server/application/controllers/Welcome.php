<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends Front_Controller {

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
        $this->layout='home';
        $this->assigns['actived_menu'] = 'home';
        $slider = $this->model
            ->set_type('homeslider')
            ->asc()
            ->gets();
        $this->assigns['slider'] = $slider;
        $ourbrands = $this->model
            ->set_type('our-brand')
            ->asc()
            ->gets();
        $this->assigns['ourbrands'] = $ourbrands;
        $this->render(null,null);
    }
    public function about(){

        $this->assigns['actived_menu'] = 'about';
        $this->layout='about';
        $this->assigns['detail'] = $this->model->get('80');
        $this->assigns['staffs'] = $this->model
            ->set_type('staffs')
            ->gets();
        $this->render(null,null);

    }
    public function services($alias = null){
        $this->assigns['actived_menu'] = 'service';
        $this->layout='service';
        $this->assigns['detail'] = $this->model->get('81');
        $this->assigns['services'] = $this->model
            ->set_type('services')
            ->gets();
        $this->render(null,null);
    }



    public function project($alias = null,$page = 1){
        if($page<=1) $page = 1;
        if($alias=='all') $alias = null;
        $this->layout='project';
        $this->assigns['actived_menu'] = 'project';
        $this->Category_Model = new Core_Model('__category');
        $perpage = 4;
        $categories = $this->Category_Model
            ->set_type('cds')
            ->gets();
        $this->assigns['categories'] = $categories;
        if($alias){
            $category_detail = $this->Category_Model
                ->set_type('cds')
                ->get_by_alias($alias);
            $this->assigns['category_detail'] = $category_detail;
            if($category_detail){
                $this->db->where('category',$category_detail->id);
                $this->assigns['projects'] = $this->model
                    ->CALC_FOUND_ROWS()
                    ->select('tbl_data.*')
                    ->set_type('cds')
                    // ->join_category()
                    ->limit($page,$perpage)
                    ->gets();
                    // ->get_by_category($category_detail->id);
                $query = $this->db->query('SELECT FOUND_ROWS() AS `found_rows`;');
                $tmp = $query->row_array();
                $total_rows = $tmp['found_rows'];
                $this->assigns['total_rows'] = $total_rows;
                $this->assigns['page'] = $page;
                $this->assigns['perpage'] = $perpage;
                // $this->assigns['paging'] = $this->paging($page,$perpage,base_url("tin-tuc/{$category_detail->alias}/page"));
                $this->render(null,null);
            } else {
                $this->project_detail($alias);
            }
        } else {
            $this->assigns['projects'] = $this->model
                ->CALC_FOUND_ROWS()
                ->select('tbl_data.*')
                ->set_type('cds')
                ->asc()
                // ->join_category()
                ->limit($page,$perpage)
                ->gets();
            $query = $this->db->query('SELECT FOUND_ROWS() AS `found_rows`;');
                $tmp = $query->row_array();
                $total_rows = $tmp['found_rows'];
                $this->assigns['total_rows'] = $total_rows;
                $this->assigns['page'] = $page;
                $this->assigns['perpage'] = $perpage;
            // $this->assigns['paging'] = $this->paging($page,$perpage,base_url('tin-tuc/page'));
            $this->render(null,null);
        }
    }
    function project_detail($alias=''){
        $this->assigns['detail'] = $this->model->get_by_alias($alias);
        if($this->assigns['detail']){
            $category_detail = $this->Category_Model
                ->set_type('cds')
                ->get($this->assigns['detail']->category);
            $this->assigns['category_detail'] = $category_detail;
        }
        $perpage = 4;
        $page = 1;
        $this->layout='detail';
        $this->assigns['actived_menu'] = 'project';
        $categories = $this->Category_Model
            ->set_type('cds')
            ->gets();
        $this->assigns['categories'] = $categories;
        $this->assigns['projects'] = $this->model
            ->CALC_FOUND_ROWS()
            ->select('tbl_data.*')
            ->set_type('cds')
            ->asc()
            // ->join_category()
            ->limit($page,$perpage)
            ->gets();
        $query = $this->db->query('SELECT FOUND_ROWS() AS `found_rows`;');
            $tmp = $query->row_array();
            $total_rows = $tmp['found_rows'];
            $this->assigns['total_rows'] = $total_rows;
            $this->assigns['page'] = $page;
            $this->assigns['perpage'] = $perpage;
        $this->render(null,null);
    }

    // public function service_detail($alias = null){
    //     $this->layout='main';
    //     $this->assigns['actived_menu'] = 'service';
    //     // $this->assigns['abouts'] = $this->model->get('15');
    //     $category_detail = $this->Category_Model
    //         ->set_type('services')
    //         ->get_by_alias($alias);
    //     if($category_detail){
    //         $this->assigns['category_detail'] = $category_detail;
    //         $this->assigns['services'] = $this->model
    //             ->set_type('services')
    //             ->get_by_category($category_detail->id);
    //         $this->render('creative/page/service_detail',null);
    //     } else {
    //         show_404();
    //     }
    // }
    // public function events($alias = null){
    //     $this->layout='main';
    //     $this->assigns['actived_menu'] = 'event';
    //     // $this->assigns['abouts'] = $this->model->get('15');
    //     if($alias){
    //         $category_detail = $this->Category_Model
    //             ->set_type('events')
    //             ->get_by_alias($alias);
    //         if($category_detail){
    //             $this->assigns['category_detail'] = $category_detail;
    //             $this->assigns['events'] = $this->model
    //                 ->set_type('events')
    //                 ->get_by_category($category_detail->id);
    //             $this->render('creative/page/events',null);
    //         } else {
    //             $this->event_detail($alias);
    //         }
    //     } else {
    //         $this->assigns['events'] = $this->model
    //             ->set_type('events')
    //             ->gets();
    //         $this->render('creative/page/events',null);
    //     }
    // }
    // public function event_detail($alias = null){
    //     $this->layout='main';
    //     $this->assigns['actived_menu'] = 'event';
    //     $event_detail = $this->model
    //         ->set_type('events')
    //         ->get_by_alias($alias);
    //     if($event_detail){
    //         $this->get_seo_tags($event_detail);
    //         $this->assigns['event_detail'] = $event_detail;
    //         $category_detail = $this->Category_Model
    //             ->set_type('events')
    //             ->get($event_detail->category);
    //         $this->assigns['category_detail'] = $category_detail;

    //         $this->assigns['related_events'] = $this->model
    //             ->limit(4)
    //             ->random()
    //             ->get_related($event_detail);
    //         $this->render('creative/page/event_detail',null);
    //     } else {
    //         show_404();
    //     }
    // }

    // public function projects($alias = null){
    //     $this->layout='main';
    //     $this->assigns['actived_menu'] = 'project';
    //     // $this->assigns['abouts'] = $this->model->get('15');
    //     if($alias){
    //         $category_detail = $this->Category_Model
    //             ->set_type('services')
    //             ->get_by_alias($alias);
    //         if($category_detail){
    //             $this->assigns['category_detail'] = $category_detail;
    //             $this->assigns['projects'] = $this->model
    //                 ->set_type('projects')
    //                 ->get_by_category($category_detail->id);
    //             $this->render('creative/page/projects',null);
    //         } else {
    //             $this->project_detail($alias);
    //         }
    //     } else {
    //         $this->assigns['projects'] = $this->model
    //             ->set_type('projects')
    //             ->asc()
    //             ->gets();
    //         $this->render('creative/page/projects',null);
    //     }
    // }
    // public function project_detail($alias = null){
    //     $this->layout='main';
    //     $this->assigns['actived_menu'] = 'project';
    //     $project_detail = $this->model
    //         ->set_type('projects')
    //         ->get_by_alias($alias);
    //     if($project_detail){
    //         $this->get_seo_tags($project_detail);
    //         $this->assigns['project_detail'] = $project_detail;
    //         $category_detail = $this->Category_Model
    //             ->set_type('services')
    //             ->get($project_detail->category);
    //         $this->assigns['category_detail'] = $category_detail;

    //         $this->assigns['related_projects'] = $this->model
    //             ->limit(4)
    //             ->random()
    //             ->get_related($project_detail);
    //         $this->render('creative/page/project_detail',null);
    //     } else {
    //         show_404();
    //     }
    // }

    public function blogs($alias = null,$page = 1){
        if($alias=='all') $alias = null;
        $this->layout='main';
        $this->assigns['actived_menu'] = 'news';
        $perpage = 6;
        if($alias){
            $category_detail = $this->Category_Model
                ->set_type('services')
                ->get_by_alias($alias);
            if($category_detail){
                $this->get_seo_tags($category_detail);
                $this->assigns['category_detail'] = $category_detail;
                $this->assigns['blogs'] = $this->model
                    ->CALC_FOUND_ROWS()
                    ->set_type('news-blogs')
                    ->join_category()
                    ->limit($page,$perpage)
                    ->get_by_category($category_detail->id);
                $this->assigns['paging'] = $this->paging($page,$perpage,base_url("tin-tuc/{$category_detail->alias}/page"));
                $this->render('creative/page/blogs',null);
            } else {
                $this->blog_detail($alias);
            }
        } else {
            $this->assigns['blogs'] = $this->model
                ->CALC_FOUND_ROWS()
                ->set_type('news-blogs')
                ->asc()
                ->join_category()
                ->limit($page,$perpage)
                ->gets();
            $this->assigns['paging'] = $this->paging($page,$perpage,base_url('tin-tuc/page'));
            $this->render('creative/page/blogs',null);
        }
    }
    public function blog_detail($alias = null){
        $this->layout='main';
        $this->assigns['actived_menu'] = 'news';
        $blog_detail = $this->model
            ->set_type('news-blogs')
            ->get_by_alias($alias);
        if($blog_detail){
            $this->get_seo_tags($blog_detail);

            $this->assigns['blog_detail'] = $blog_detail;
            $category_detail = $this->Category_Model
                ->set_type('services')
                ->get($blog_detail->category);
            $this->assigns['category_detail'] = $category_detail;

            $this->assigns['related_blogs'] = $this->model
                ->limit(4)
                ->random()
                ->get_related($blog_detail);
            $this->render('creative/page/blog_detail',null);
        } else {
            show_404();
        }
    }
    function contact(){
        $this->layout='main';
        $this->render('creative/page/contact',null);
    }
    function recruitment(){
        $this->layout='main';
        $this->assigns['actived_menu'] = 'recruitment';
        $this->assigns['recruitments'] = $this->model
                    ->set_type('recruitment')
                    ->gets();
        $this->render('creative/page/recruitment',null);
    }

}
