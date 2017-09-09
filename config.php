<?php

$host = $_SERVER['HTTP_HOST'];

// HTTP
define('HTTP_SERVER', 'http://overlook/');

// HTTPS
define('HTTPS_SERVER', 'http://overlook/');

$dir = dirname(__FILE__);

// DIR

define('DIR_APPLICATION',  'C:/OS/OpenServer/domains/overlook/catalog/');
define('DIR_SYSTEM',  'C:/OS/OpenServer/domains/overlook/system/');
define('DIR_IMAGE',  'C:/OS/OpenServer/domains/overlook/image/');
define('DIR_LANGUAGE',  'C:/OS/OpenServer/domains/overlook/catalog/language/');
define('DIR_TEMPLATE', 'C:/OS/OpenServer/domains/overlook/catalog/view/theme/');
define('DIR_CONFIG',  'C:/OS/OpenServer/domains/overlook/system/config/');
define('DIR_CACHE',  'C:/OS/OpenServer/domains/overlook/system/storage/cache/');
define('DIR_DOWNLOAD',  'C:/OS/OpenServer/domains/overlook/system/storage/download/');
define('DIR_LOGS',  'C:/OS/OpenServer/domains/overlook/system/storage/logs/');
define('DIR_MODIFICATION',  'C:/OS/OpenServer/domains/overlook/system/storage/modification/');
define('DIR_UPLOAD',  'C:/OS/OpenServer/domains/overlook/system/storage/upload/');

// DB

define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'overlook_admin');
define('DB_PASSWORD', 'overlook1508!');
define('DB_DATABASE', 'overlook_db');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');