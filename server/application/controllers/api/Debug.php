<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
ini_set('display_errors', 1);
        // error_reporting(E_ALL & ~E_NOTICE );
        error_reporting(1);
require(APPPATH."libraries/sendgrid/sendgrid-php.php");

class Debug extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->library('CI_Phpmailer');
        // $this->load->model("api/Account_Model");
    }

    

    function index(){
        echo 'Welcome API';
    }
    function test(){
        echo '%^A^A^';
        $this->ci_phpmailer->debug();
        var_dump($this->ci_phpmailer->MIMEHeader);
        var_dump($this->ci_phpmailer->MIMEBody);
        var_dump($this->ci_phpmailer->to);
    }
    function debug(){
        $email = new \SendGrid\Mail\Mail(); 
        $email->setFrom("info@mielab.com.au", "Mie Lab");
        $email->setSubject("I want to share the project [] with you");
        $email->addTo("squall.design@gmail.com ", "squall.design@gmail.com ");
        $email->addContent("text/plain", "I want to share the project '{$project->title}' with you");
        $email->addContent(
            "text/html", '<div style="background:#f0f0f0;padding:80px 0;font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #666;">
    <div style="max-width:640px;margin: auto;">
        <div style="background:#fff;padding:40px;">
            Hello,<br/>
            <br/>
            You are invited to join the project [] from our Shark Tank Entrepreneur app. Please register or login to the app with this email to Read Only the project.<br/>
            If you have not installed the app, please download it via these links:<br/>
            <a href="https://itunes.apple.com/app/shark-tank-entrepreneur/id1390358746?mt=8">Download the Shark Tank Entrepreneur App on Apple Store</a><br/>
            <a href="https://play.google.com/store/apps/details?id=net.sharktankentrepreneur.ste">Download the Shark Tank Entrepreneur App on Play Store</a><br/>
            <br/>
            Thank you.<br/>
            Shark Tank Entrepreneur Team
        </div>
    </div>
</div>'
        );
        $sendgrid_username = 'MIELab';
        $sendgrid_password = 'Booyacka/01';
        $sendgrid = new SendGrid('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');
        //$sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        try {
            $response = $sendgrid->send($email);
            print $response->statusCode() . "\n";
            print_r($response->headers());
            print $response->body() . "\n";
        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }
    }
}