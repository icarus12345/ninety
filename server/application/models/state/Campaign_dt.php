<?php
class Campaign_dt extends Core_Model implements DatatableModel{
        
        function __construct()
        {
            parent::__construct('__campaign','','id');
        }

        public function appendToSelectStr() {
                return array(
                    // 'id' => 'concat(s.s_name, \'  \', c.c_name, \'  \', c.c_zip)'
                    'id' => 'c.id',
                    'title' => 'c.title',
                    'start_date' => 'c.start_date',
                    'end_date' => 'c.end_date',
                    'created' => 'c.created',
                    'trademark_title' => 't.title',
                );
                
        }
        public function fromTableStr() {
            return '__campaign c';
        }
        
    

        public function joinArray(){
            return array(
              // 'city c|left outer' => 'c.state_id = s.id',
              '__trademark t|left outer' => 'c.trademark_id = t.id',
              );
        }
        
        public function whereClauseArray(){
            return array(
                // 'u.id' => $this -> ion_auth -> get_user_id() 
                );
        }
   }