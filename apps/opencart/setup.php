<?php

return array(
    "database_info" => array(
        
            "db_file" => "/opencart/database.sql",
            "default_prefix" => "myopencart_",
            "default_prefix_change_able" =>1
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[timestamp_nextday]]" => "{{timestamp}}",
          "[[siteURL]]" => "{{siteURL}}",
            
       
    ),  
    "database" => array(
     array(
            "table" => "{{tablePrefix}}user",
            "column" => "username",
            "where" => "user_id=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}user",
            "column" => "password",
            "where" => "user_id=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "{{tablePrefix}}user",
            "column" => "email",
            "where" => "user_id=1",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        ),
        
        array(
    "table" => "{{tablePrefix}}setting",
    "column" => "value",
    "where" => "`key`='config_name'",
    "value" => "{{siteTitle}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}setting",
    "column" => "value",
    "where" => "`key`='config_owner'",
    "value" => "{{siteTitle}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}setting",
    "column" => "value",
    "where" => "`key`='config_email'",
    "value" => "{{adminEmail}}",
    "type" => "plain"
),

        
    ),

   "create_file" => array(
   
    array(
        "file_name" => "olsapp.txt",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
app.olspnel.com
TEXT
    ),  
     array(
        "file_name" => "config.php",
        "type" => "create",
        "location" => "root",
        "content" =>  <<<PHP
<?php
// APPLICATION
define('APPLICATION', 'Catalog');

// HTTP
define('HTTP_SERVER', '{{siteURL}}/');

// DIR
define('DIR_OPENCART', '{{install_path}}/');
define('DIR_APPLICATION', DIR_OPENCART . 'catalog/');
define('DIR_EXTENSION', DIR_OPENCART . 'extension/');
define('DIR_IMAGE', DIR_OPENCART . 'image/');
define('DIR_SYSTEM', DIR_OPENCART . 'system/');
define('DIR_STORAGE', DIR_SYSTEM . 'storage/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('DIR_CACHE', DIR_STORAGE . 'cache/');
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');
define('DIR_LOGS', DIR_STORAGE . 'logs/');
define('DIR_SESSION', DIR_STORAGE . 'session/');
define('DIR_UPLOAD', DIR_STORAGE . '/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '{{dbHost}}');
define('DB_USERNAME', '{{dbUser}}');
define('DB_PASSWORD', '{{dbPass}}');
define('DB_DATABASE', '{{dbName}}');
define('DB_PORT', '3306');
define('DB_PREFIX', '{{tablePrefix}}');
define('DB_SSL_KEY', '');
define('DB_SSL_CERT', '');
define('DB_SSL_CA', '');
PHP
    ),
    
array(
        "file_name" => "admin/config.php",
        "type" => "create",
        "location" => "root",
        "content" => <<<PHP
<?php
// APPLICATION
define('APPLICATION', 'Admin');

// HTTP
define('HTTP_SERVER', '{{siteURL}}/admin/');
define('HTTP_CATALOG', '{{siteURL}}/');

// DIR
define('DIR_OPENCART', '{{install_path}}/');
define('DIR_APPLICATION', DIR_OPENCART . 'admin/');
define('DIR_EXTENSION', DIR_OPENCART . 'extension/');
define('DIR_IMAGE', DIR_OPENCART . 'image/');
define('DIR_SYSTEM', DIR_OPENCART . 'system/');
define('DIR_CATALOG', DIR_OPENCART . 'catalog/');
define('DIR_STORAGE', DIR_SYSTEM . 'storage/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('DIR_CACHE', DIR_STORAGE . 'cache/');
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');
define('DIR_LOGS', DIR_STORAGE . 'logs/');
define('DIR_SESSION', DIR_STORAGE . 'session/');
define('DIR_UPLOAD', DIR_STORAGE . '/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '{{dbHost}}');
define('DB_USERNAME', '{{dbUser}}');
define('DB_PASSWORD', '{{dbPass}}');
define('DB_DATABASE', '{{dbName}}');
define('DB_PORT', '3306');
define('DB_PREFIX', '{{tablePrefix}}');

define('DB_SSL_KEY', '');
define('DB_SSL_CERT', '');
define('DB_SSL_CA', '');

// OpenCart API
define('OPENCART_SERVER', 'https://www.opencart.com/');

PHP
    ),    
    
),

   "change_file" => array(
    array(
        "file_name" => "config.php",
        "sample_file_name" => "",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array()
    ),
     array(
        "file_name" => "admin/config.php",
        "sample_file_name" => "",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array()
    )
)

,
    

    
 "download" => array(
        
            "url" => "opencart",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
    ,
    "delete" => array(
    array(
        "path" => "install"
    )
),
 "move" => array(
        array(
            "move" => 1,
            "source_path" => "upload",
            
        ),
        // Add more file rules here if needed
    ),

    
);
