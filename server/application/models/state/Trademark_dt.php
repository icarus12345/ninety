<?php
class Trademark_dt extends Core_Model implements DatatableModel{
        
        function __construct()
        {
            parent::__construct('__trademark','','id');
        }

        public function appendToSelectStr() {
                return array(
                    // 'id' => 'concat(s.s_name, \'  \', c.c_name, \'  \', c.c_zip)'
                    'id' => 't.id',
                    'title' => 't.title',
                    'created' => 't.created',
                );
                
        }
        
        public function fromTableStr() {
            return '__trademark t';
        }
        
    

        public function joinArray(){
            return array(
              // 'city c|left outer' => 'c.state_id = s.id',
              // 'user u' => 'u.state_id = s.id'
              );
        }
        
        public function whereClauseArray(){
            return array(
                // 'u.id' => $this -> ion_auth -> get_user_id() 
                );
        }
   }