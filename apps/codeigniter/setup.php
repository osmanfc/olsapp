<?php

return array(
    "database_info" => array(
        
            "db_file" => "/codeigniter/database.sql",
            "default_prefix" => "mycodeIgniter_",
            "default_prefix_change_able" =>1
            
       
    ), 
    "database_replace" => array(
        
            "[[regtime]]" => "{{time_now}}",
           "[[timestamp]]" => "{{timestamp}}",
            
       
    ),   
    "database" => array(),

   "create_file" => array(
   array(
    "file_name" => "index.php", 
    "type" => "create",
    "location" => "root",
    "content" => <<<PHP
<?php
header("Location: public/");
exit;
PHP
)
,
    array(
        "file_name" => "olsapp.txt",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
app.olspnel.com
TEXT
    )
),

    "change_file" => array(
    array(
            "file_name" => "app/Config/App.php",
            "location" => "root",
            "replace_map" => array(
               "http://localhost:8080/" => "{{siteURL}}",
            )
        ),
     array(
    "file_name" => "app/Config/Database.php",
    "location" => "root",
    "replace_map" => array(
        "'hostname'     => 'localhost'," => "'hostname'     => '{{dbHost}}',",
        "'username'     => ''," => "'username'     => '{{dbUser}}',",
        "'password'     => ''," => "'password'     => '{{dbPass}}',",
        "'database'     => ''," => "'database'     => '{{dbName}}',",
        "'DBPrefix'     => ''," => "'DBPrefix'     => '{{tablePrefix}}',"
    )


),

        // Add more file rules here if needed
    ),
 
"move" => array(
        array(
            "move" => 1,
            "source_path_pattern" => "CodeIgniter*",
            
        ),
        // Add more file rules here if needed
    ),
        
 "download" => array(
        
            "url" => "codeigniter",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    ) ,
    


    
    
    
);
