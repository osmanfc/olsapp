<?php

return array(
    "database_info" => array(
        
            "db_file" => "/phpbb/database.sql",
            "default_prefix" => "myphpbb_",
            "default_prefix_change_able" =>1
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[timestamp_nextday]]" => "{{timestamp}}",
          "[[siteURL]]" => "{{siteURL}}",
          "[[adminUser]]" => "{{adminUser}}",
            
       
    ),  
    "database" => array(
        
      

        array(
            "table" => "{{tablePrefix}}users",
            "column" => "username",
            "where" => "user_id=2",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "user_password",
            "where" => "user_id=2",
            "value" => "{{adminPass}}",
            "type" => "ARGON2ID"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "user_email",
            "where" => "user_id=2",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        )
        ,
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "username_clean",
            "where" => "user_id=2",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='sitename'",
            "value" => "{{siteTitle}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='newest_username'",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
         array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='board_email'",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        ),
         array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='board_contact'",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='server_name'",
            "value" => "{{siteDomain}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}config",
            "column" => "config_value",
            "where" => "config_name='cookie_domain'",
            "value" => "{{siteDomain}}",
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
        "content" => <<<PHP
<?php
// phpBB 3.3.x auto-generated configuration file
// Do not change anything in this file!
\$dbms = 'phpbb\\\\db\\\\driver\\\\mysqli';
\$dbhost = '{{dbHost}}';
\$dbport = '';
\$dbname = '{{dbName}}';
\$dbuser = '{{dbUser}}';
\$dbpasswd = '{{dbPass}}';
\$table_prefix = '{{tablePrefix}}';
\$phpbb_adm_relative_path = 'adm/';
\$acm_type = 'phpbb\\\\cache\\\\driver\\\\file';

@define('PHPBB_INSTALLED', true);
@define('PHPBB_ENVIRONMENT', 'production');
// @define('DEBUG_CONTAINER', true);

PHP
    )
),

   "change_file" => array(
    array(
        "file_name" => "config.php",
        "sample_file_name" => "",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array()
    )
)

,
    
 "move" => array(
        array(
            "move" => 1,
            "source_path_pattern" => "phpBB*",
            
        ),
        // Add more file rules here if needed
    ),
    
 "download" => array(
        
            "url" => "phpbb",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
    ,
    
"delete" => array(
    array(
        "path" => "install"
    )
)
    
);
