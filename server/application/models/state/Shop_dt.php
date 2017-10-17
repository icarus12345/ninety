<?php
class Shop_dt extends Core_Model implements DatatableModel{
        
        function __construct()
        {
            parent::__construct('__shop','','id');
        }

        public function appendToSelectStr() {
                return array(
                    // 'id' => 'concat(s.s_name, \'  \', c.c_name, \'  \', c.c_zip)'
                    'id' => 's.id',
                    'title' => 's.title',
                    'created' => 's.created',
                    'province_title' => 'p.title',
                );
                
        }
        public function fromTableStr() {
            return '__shop s';
        }
        
    

        public function joinArray(){
            return array(
              // 'city c|left outer' => 'c.state_id = s.id',
              '__province p|left outer' => 's.city_id = p.id'
              );
        }
        
        public function whereClauseArray(){
            return array(
                // 'u.id' => $this -> ion_auth -> get_user_id() 
                );
        }
   }