<?php

$host = $_SERVER['HTTP_HOST'];

// HTTP
define('HTTP_SERVER', 'http://'.$host.'/admin/');
define('HTTP_CATALOG', 'http://'.$host.'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$host.'/admin/');
define('HTTPS_CATALOG', 'http://'.$host.'/');

$dir = dirname(dirname(__FILE__));

// DIR
define('DIR_APPLICATION', 'C:/OSPanel/domains/overlook/admin/');
define('DIR_SYSTEM', 'C:/OSPanel/domains/overlook/system/');
define('DIR_IMAGE', 'C:/OSPanel/domains/overlook/image/');
define('DIR_LANGUAGE', 'C:/OSPanel/domains/overlook/admin/language/');
define('DIR_TEMPLATE', 'C:/OSPanel/domains/overlook/admin/view/template/');
define('DIR_CONFIG', 'C:/OSPanel/domains/overlook/system/config/');
define('DIR_CACHE', 'C:/OSPanel/domains/overlook/system/storage/cache/');
define('DIR_DOWNLOAD', 'C:/OSPanel/domains/overlook/system/storage/download/');
define('DIR_LOGS', 'C:/OSPanel/domains/overlook/system/storage/logs/');
define('DIR_MODIFICATION', 'C:/OSPanel/domains/overlook/system/storage/modification/');
define('DIR_UPLOAD', 'C:/OSPanel/domains/overlook/system/storage/upload/');
define('DIR_CATALOG', 'C:/OSPanel/domains/overlook/catalog/');

// DB

define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'overlook_admin');
define('DB_PASSWORD', 'overlook1508!');
define('DB_DATABASE', 'overlook_db');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');