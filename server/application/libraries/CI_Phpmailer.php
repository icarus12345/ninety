<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once('phpmailer/class.phpmailer.php');
require_once('phpmailer/class.smtp.php');

class CI_Phpmailer extends PHPMailer {
    function __construct($exceptions = false) {
        parent::__construct($exceptions);
        $this->Module_Model = new Core_Model('tbl_data');
        $this->mailer_info = $this->Module_Model->get_by_alias('mailer-setting');
    }
    function init_mail(){
        // set CharSet is utf-8
        $this->CharSet = 'utf-8';
        // telling the class to use SMTP
        $this->IsSMTP();
        // Sets SMTP class debugging on or off
        $this->SMTPDebug = 1;
        // 1 = errors and messages
        // 2 = messages only
        // enable SMTP authentication
        $this->SMTPAuth = $this->mailer_info->data['smtpauth'] == '1';
        // sets the prefix to the servier
        if(!empty($this->mailer_info->data['smtpsecure'])){
            $this->SMTPSecure = $this->mailer_info->data['smtpsecure'];
        }
        $this->Mailer  = $this->mailer_info->data['mailer'];
        // sets GMAIL as the SMTP server
        $this->Host = $this->mailer_info->data['host'];
        // relay-hosting.secureserver.net
        // set the SMTP port for the GMAIL server
        $this->Port = $this->mailer_info->data['port'];;//465;//587
        // 25
        // GMAIL username
        $this->Username = $this->mailer_info->data['username'];
        // GMAIL password
        $this->Password = $this->mailer_info->data['password'];
        $this->SetFrom($this->Username, $this->mailer_info->data['sender']);
    }
    function send_mail($to,$subject, $message, $priority = 3) {
        if($this->mailer_info->data['active'] == '1'){
            $this->init_mail();
            $this->Priority = $priority;
            $this->Subject = $subject;
            $this->MsgHTML($message);
            //$this->AddAddress($recipient);
            $this->AddAddress($to);
            $rs = $this->Send();
            return  $rs;
        }
    }
    function debug(){
        // set CharSet is utf-8
        $this->CharSet = 'utf-8';
        // telling the class to use SMTP
        $this->IsSMTP();
        // Sets SMTP class debugging on or off
        $this->SMTPDebug = 1;
        // 1 = errors and messages
        // 2 = messages only
        // enable SMTP authentication
        $this->SMTPAuth = true;
        // sets the prefix to the servier
        
        $this->Mailer  = 'tls';
        // sets GMAIL as the SMTP server
        $this->Host = 'smtp.office365.com';
        // relay-hosting.secureserver.net
        // set the SMTP port for the GMAIL server
        $this->Port = 578;
        // 25
        // GMAIL username
        $this->Username = 'info@mielab.com.au';
        // GMAIL password
        $this->Password = 'Booyacka01';
        $this->SetFrom('info@mielab.com.au', 'Mie Lab');
        $this->Priority = 3;
        $this->Subject = 'AAAA';
        $this->MsgHTML('AAA');
        //$this->AddAddress($recipient);
        $this->AddAddress('khuongxuantruong@gmail.com');
        $rs = $this->Send();
        var_dump($rs);
    }
    function send_grid(){
        $key = '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';
    }
}
