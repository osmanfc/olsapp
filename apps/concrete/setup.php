<?php

return array(
    "database_info" => array(
        
            "db_file" => "/concrete/database.sql",
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
            "table" => "Users",
            "column" => "uName",
            "where" => "uID=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "Users",
            "column" => "uPassword",
            "where" => "uID=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "Users",
            "column" => "uEmail",
            "where" => "uID=1",
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
     array(
        "file_name" => "application/config/database.php",
        "type" => "create",
        "location" => "root",
        "content" =>  <<<PHP
<?php

return [
    'default-connection' => 'concrete',
    'connections' => [
        'concrete' => [
            'driver' => 'concrete_pdo_mysql',
            'server' => '{{dbHost}}',
            'database' => '{{dbName}}',
            'username' => '{{dbUser}}',
            'password' => '{{dbPass}}',
            'character_set' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
        ],
    ],
];
PHP
    ),
    
     array(
        "file_name" => "site.php",
        "type" => "create",
        "location" => "application/config/generated_overrides/",
        "content" =>  <<<PHP
<?php return [
    'sites' => [
        'default' => [
            'name' => '{{siteTitle}}',
        ],
    ],
];
PHP
    ),
    
    
),

   "change_file" => array(
    array(
        "file_name" => "application/config/database.php",
        "sample_file_name" => "",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array()
    )
)

,
    
 "move" => array(
        array(
            "move" => 1,
            "source_path_pattern" => "concrete-cms-*",
            
        ),
        // Add more file rules here if needed
    ),
    
 "download" => array(
        
            "url" => "concrete",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
    ,
    

    
);
