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
                    'ctitle' => 'c.title',
                );
                
        }
        public function fromTableStr() {
            return '__trademark t';
        }
        
    

        public function joinArray(){
            return array(
              // 'city c|left outer' => 'c.state_id = s.id',
              '__countries c|left outer' => 't.country_id = c.id'
              );
        }
        
        public function whereClauseArray(){
            return array(
                // 'u.id' => $this -> ion_auth -> get_user_id() 
                );
        }
   }