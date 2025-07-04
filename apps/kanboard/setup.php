<?php

return array(
    "database_info" => array(
        
            "db_file" => "/kanboard/database.sql",
            "default_prefix" => "",
            "default_prefix_change_able" =>0
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[timestamp_nextday]]" => "{{timestamp}}",
          "[[siteURL]]" => "{{siteURL}}",
            
       
    ),  
    "database" => array(
     array(
            "table" => "users",
            "column" => "username",
            "where" => "id=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "users",
            "column" => "password",
            "where" => "id=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
array(
            "table" => "users",
            "column" => "email",
            "where" => "id=1",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        )
        
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
      
    
),

   "change_file" => array(
    array(
        "file_name" => "config.php",
        "sample_file_name" => "config.default.php",
        "location" => "root",
        "replace_map" => array(
            "define('DB_DRIVER', 'sqlite');"     => "define('DB_DRIVER', 'mysql');",
            "define('DB_USERNAME', 'root');"     => "define('DB_USERNAME', '{{dbUser}}');",
            "define('DB_PASSWORD', '');"         => "define('DB_PASSWORD', '{{dbPass}}');",
            "define('DB_HOSTNAME', 'localhost');"=> "define('DB_HOSTNAME', '{{dbHost}}');",
            "define('DB_NAME', 'kanboard');"     => "define('DB_NAME', '{{dbName}}');"
        )
    ),
)


,
    

    
 "download" => array(
        
            "url" => "kanboard",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
   ,
 "move" => array(
        array(
            "move" => 1,
            "source_path" => "kanboard-main",
            
        ),
        // Add more file rules here if needed
    ),

    
);
