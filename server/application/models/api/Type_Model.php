<?php

/*
  Project     : 48c6c450f1a4a0cc53d9585dc0fee742
  Created on  : Mar 16, 2013, 11:29:15 PM
  Author      : Truong Khuong - khuongxuantruong@gmail.com
  Description :
  Purpose of the stylesheet follows.
 */

class Type_Model extends API_Model {
    function __construct() {
        parent::__construct('tbl_type');
        $this->_select = array('id','title','data','sorting');
    }
}

?>
