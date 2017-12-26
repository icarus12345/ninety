<?php

/** This file is part of KCFinder project
 *
 *      @desc Base configuration file
 *   @package KCFinder
 *   @version 2.51
 *    @author Pavel Tzonkov <pavelc@users.sourceforge.net>
 * @copyright 2010, 2011 KCFinder Project
 *   @license http://www.opensource.org/licenses/gpl-2.0.php GPLv2
 *   @license http://www.opensource.org/licenses/lgpl-2.1.php LGPLv2
 *      @link http://kcfinder.sunhater.com
 */
// IMPORTANT!!! Do not remove uncommented settings in this file even if
// you are using session configuration.
// See http://kcfinder.sunhater.com/install for setting descriptions
ob_start();
define("REQUEST", "external");
$temp_system_path = '../../system';
$temp_application_folder = '../../application';
include('../../index.php');
ob_end_clean();
$CI =& get_instance();

if(!empty($CI->session->userdata('KCFINDER'))) {
    $KCFINDER = $CI->session->userdata('KCFINDER');
    // echo '<pre>',print_r($KCFINDER),'</pre>';die;
}

$_CONFIG = array(
    'disabled' => true,
    'denyZipDownload' => false,
    'denyUpdateCheck' => false,
    'denyExtensionRename' => false,
    'theme' => "oxygen",
    'uploadURL' => "../../data",
    'uploadDir' => "../../data",
    'dirPerms' => 0755,
    'filePerms' => 0644,
    'access' => array(
        'files' => array(
            'upload' => false,
            'delete' => false,
            'copy' => false,
            'move' => false,
            'rename' => false,
            'edit' => false,
        ),
        'dirs' => array(
            'create' => false,
            'delete' => false,
            'rename' => false
        )
    ),
    'deniedExts' => "exe com msi bat php phps phtml php3 php4 cgi pl tpl ch chm htm html xhtml",
    'types' => array(
        // CKEditor & FCKEditor types
        'image' => array(
            'type' => "jpg gif ico jpeg png",
            'deniedExts'=>'exe com msi bat php phps phtml php3 php4 cgi pl tpl ch chm htm html xhtml',
            'upload_max_filesize'=>2*1024*1024
        )
        
    ),
    'filenameChangeChars' => array(
        ' ' => "_",
        ':' => "."
    ),
    'dirnameChangeChars' => array(
        ' ' => "_",
        ':' => "."
    ),
    'mime_magic' => "",
    'maxImageWidth' => 1920,
    'maxImageHeight' => 1280,
    'thumbWidth' => 212,
    'thumbHeight' => 212,
    'thumbsDir' => "thumbs",
    'jpegQuality' => 100,
    'cookieDomain' => "",
    'cookiePath' => "",
    'cookiePrefix' => 'KCFINDER_',
    // THE FOLLOWING SETTINGS CANNOT BE OVERRIDED WITH SESSION CONFIGURATION
    '_check4htaccess' => true,
    '_tinyMCEPath' => "../tiny_mce",
    '_sessionVar' => &$KCFINDER,
    '_sessionLifetime' => 30,
        //'_sessionDir' => "/full/directory/path",
        //'_sessionDomain' => ".mysite.com",
        //'_sessionPath' => "/my/path",
);
?>