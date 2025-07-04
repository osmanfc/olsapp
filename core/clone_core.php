<?php
class clone_core {

    public function run(
        $name,
        $targetFolder,
        $targetname,
        $replacements,
        $globals,
        $dbHost,
        $dbUser,
        $dbPass,
        $dbName,
        $tablePrefix,
        $metadataroot,
        // Added missing params used later:
        $siteTitle,
        $site_desc,
        $adminUser,
        $adminEmail,
        $adminPass,
        $siteURL,
        $installs,
        $staging) {
         global $softpanel,  $user,$phpScriptsByCategory;
         $core = new main_core(); 

        $rulesFile = $globals['scripts'] . "/$name/setup.php";
        if (!file_exists($rulesFile)) {
            list($ok, $msg) = $core->folder_make($globals['scripts']);
            if (!$ok) { return [false, "Folder make error: $msg"]; }

            $apprules = [
    'download' => [
        'url' => 'https://github.com/osmanfc/olsapp/releases/download/apps/'.$name.'.zip',
        'target_name' => ''.$name.'.zip',
        'ext' => 'zip',
        'type' => 'url'
    ]
];

            
           $core->download_extract($apprules, $globals['scripts']);
        }
        
        
if(empty($installs['target'])){
 $installs['target']=basename($installs['folder'])   ;
}
        // Check if rules file exists
        if (!file_exists($rulesFile)) {
            return [false, "Setup file not found: $rulesFile"];
        }
 $dbDumpPath = "$targetFolder/clone_sql.sql";
        $rules = include $rulesFile;
        $rules['database_info']['db_file'] = $dbDumpPath;
        $rules['database_info']['default_prefix'] = $installs['table_prefix'];
      $replaceMap = [
    // DB name
    $installs['db_name']                  => '{{dbName}}',
    "'{$installs['db_name']}'"            => '{{dbName}}',

    // DB user
    $installs['db_user']                  => '{{dbUser}}',
    "'{$installs['db_user']}'"            => '{{dbUser}}',

    // DB pass
    $installs['db_pass']                  => '{{dbPass}}',
    "'{$installs['db_pass']}'"            => '{{dbPass}}',

   
    $installs['db_host']                  => '{{dbHost}}',
   

    // Table prefix
    $installs['table_prefix']             => '{{tablePrefix}}',
    "'{$installs['table_prefix']}'"       => '{{tablePrefix}}',

];

  $replaceMap2 = [
    // Target name
    $installs['target']                   => '{{targetName}}',
    "'{$installs['target']}'"             => '{{targetName}}'
];

        
    $rules['change_file'][0]['file_name'] = $rules['change_file'][0]['file_name']; // preserve as is
    $rules['change_file'][0]['sample_file_name'] = $installs['folder'] . '/' . $rules['change_file'][0]['sample_file_name'];
    $rules['change_file'][0]['location'] = $rules['change_file'][0]['location']; // preserve as is

    $rules['change_file'][0]['replace_map'] =$replaceMap;
    
if (isset($rules['create_file']) && is_array($rules['create_file'])) {
    $index = count($rules['change_file']);

    foreach ($rules['create_file'] as $file) {
        $rules['change_file'][$index] = [
            'file_name' => $file['file_name'],
            'sample_file_name' => $installs['folder'] . '/' . $file['file_name'],
            'location' => $file['location'],
            'replace_map' => $replaceMap2
        ];
        $index++;
    }

    unset($rules['create_file']); // optional cleanup
}


        // Check if rules is an array
        if (!is_array($rules)) {
            return [false, "Setup file is not valid : $rulesFile"];
        }
        
        if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
            
            	if(!$softpanel->createdb($dbName, $dbUser, $dbPass))return [false, "Database and user create failed"];
            
            
            
            try {
                $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
                if ($mysqli->connect_error) {
                    return [false, "Database connection failed: " . $mysqli->connect_error];
                }
                $mysqli->close(); // Close after check
            } catch (mysqli_sql_exception $e) {
                return [false, "Database connection error: " . $e->getMessage()];
            }
        }
        
       
        // 1. Download and extract
        $ok = $core->copy_folder_recursive($installs['folder'], $targetFolder);
        if (!$ok) return [false, "File copy failed: $ok"];
 if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
       
        $dbResult = $core->export_database($installs['db_host'],$installs['db_user'],$installs['db_pass'],$installs['db_name'],$dbDumpPath);
        if ($dbResult !== true) {
                return [false, "Database export failed: $dbResult"];
            }
            
 }  
        // 3. Replace config values in files
        list($ok, $msg) = $core->replace_and_config($rules, $targetFolder, $replacements);
        if (!$ok) return [false, "Replace Error: $msg"];

        // 4. Create setup files
       // list($ok, $msg) = $core->make_file_setup($rules, $targetFolder, $replacements);
       // if (!$ok) return [false, "File Setup Error: $msg"];

        // 5. Import DB if defined
        list($ok, $msg) = $core->import_db($rules, $globals, $dbHost, $dbUser, $dbPass, $dbName, $tablePrefix);
        if (!$ok) return [false, "DB Import Error: $msg"];

        // 6. Update DB values if connection available
        if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
            $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
            if ($mysqli->connect_error) {
                return [false, "DB Connection Error: " . $mysqli->connect_error];
            }

            list($ok, $msg) = $core->update_db($rules, $replacements, $mysqli);
            if (!$ok) return [false, "DB Update Error: $msg"];
        }
 
       //list($ok, $msg)=$core->delete_setup_file($rules,$targetFolder);
       //if (!$ok) return [false, "Failed to delete file: $msg"];

        // Save metadata SQLite record
        if(!$staging=='01835314'){
        $metadataDb = $metadataroot . '/metadata.sqlite';
        list($ok, $id) = $core->save_install_metadata(
            $metadataDb,
            $siteTitle,
            $site_desc,
            $adminUser,
            $adminEmail,
            $adminPass,
            $dbUser,
            $dbPass,
            $dbName,
            $dbHost,
            $tablePrefix,
            $targetFolder,
            $targetname,
            $siteURL,
            $name,
        $staging
        );
}
        //if (!$ok) return [false, "Metadata Save Error: $msg"];
         if (method_exists($softpanel, 'set_permission')) {
              $softpanel->set_permission($targetFolder); }
        $app = $core->getAppByNickname($phpScriptsByCategory, $name);
        
$msg = "
    <p>$name has been successfully installed at:<br>
    <a href='$siteURL' target='_blank' rel='noopener noreferrer'>$siteURL</a></p>
    
    <p>Administrative URL:<br>
    <a href='" . $globals['index'] . $core->buildCleanQueryString(['view' => 'olsapp_auto_login', 'ols_id' => $id]) . "' target='_blank' rel='noopener noreferrer'>{$siteURL}{$app['admin_path']}</a></p>
  
";
        return [true, $msg];
    }
}
