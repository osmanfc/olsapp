<?php


header('Content-Type: application/json'); // <-- Send JSON response

$response = [
    'success' => false,
    'message' => '',
];

if (!empty($_POST)) {
    $main_path = rtrim($user['homedir'], '/');
  
   
    $siteTitle = '';
    
    $installs = $core->get_single_install_metadata($metadataDb,$_POST['id']);
  $tars= $core->get_single_install_metadata($metadataDb,$installs['staging']);
    $adminUser = '';
    $adminPass = '';
    $adminEmail = '';
    $dbName = $core->safe_input($tars['db_name'] ?? 'wp');
    $dbUser = $core->safe_input($tars['db_user'] ?? 'root');
    $dbPass = $tars['db_pass'] ?? '';
    $dbHost = $core->safe_input($tars['db_host'] ?? 'localhost');
    $tablePrefix = $core->safe_input($tars['table_prefix'] ?? 'wp_');
    
    $site_desc='';
    $old_file_del = (isset($_POST['old_file_del']) && $_POST['old_file_del'] === 'on') ? 1 : 0;
    $old_db_del = (isset($_POST['old_db_del']) && $_POST['old_db_del'] === 'on') ? 1 : 0;
    
  

 $sub_path = $tars['folder'];
 
if ($core->isPathInHomedir($sub_path, $user['homedir'])) {
   $sub_path="$sub_path/";
} else {
   $sub_path="$main_path/$sub_path/";
}


    $targetFolderRaw = $tars['target'] ?? '';
    $targetFolder = $sub_path;
    $metadataroot = $main_path . '/.olsapp';

if ($old_file_del != 1 && !$core->checkTargetFolderIfNotEmpty($targetFolder, $targetFolder)) {
    $response['message'] = "Target folder exists and is not empty.";
    echo json_encode($response);
    exit;
}

 if ($old_file_del == 1) {
    $this->delete_directory_recursive($targetFolder);
    }

if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
   
    try {
        $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
        $mysqli->set_charset("utf8mb4"); // Optional but recommended
    } catch (mysqli_sql_exception $e) {
        $response['message'] = "DB Connection Error: ".$data['softdbuser'] . $e->getMessage();
       
        echo json_encode($response);
        exit;
    }
    
    
    
   
    if ($old_db_del == 1) {
    $core->drop_all_tables($dbHost, $dbUser, $dbPass, $dbName);
}

}


   list($ok, $msg) = $core->folder_make($targetFolder);
    if (!$ok) { 
        $response['message'] = "Folder make error: $msg";
        echo json_encode($response);
        exit;
        
    }
            
    list($ok, $msg) = $core->folder_make($metadataroot);
    if (!$ok) { 
        $response['message'] = "Meta data Folder make error: $msg";
        echo json_encode($response);
        exit;
        
    }    

    $metadataDb = $metadataroot . '/metadata.sqlite';
    $siteURL =$tars['site_url'];

    $validation = $core->validate_db_prefix_with_main_user($user['name'], $dbUser, $dbName);

if ($validation !== true) {
    $dbName=$user['name'].'_'.$dbName;
    $dbUser=$user['name'].'_'.$dbUser;
} 

    $targetFolder_ht = $targetFolderRaw !== '' ? '/' . ltrim($targetFolderRaw, '/') : '';

    $replacements = [
        '{{tablePrefix}}' => $tablePrefix,
        '{{dbName}}' => $dbName,
        '{{dbUser}}' => $dbUser,
        '{{dbPass}}' => $dbPass,
        '{{dbHost}}' => $dbHost,
        '{{rewriteBase}}' => $targetFolder_ht,
        '{{siteURL}}'     => $siteURL,
        '{{siteTitle}}'   => $siteTitle,
        '{{siteDesc}}'   =>  $site_desc,
        '{{adminUser}}'   => $adminUser,
        '{{adminPass}}'   => $adminPass,
        '{{adminEmail}}'  => $adminEmail,
        '{{targetName}}'  => ltrim($targetFolderRaw, '/'),
    ];

    $validationResult = $core->validateTargetFolderName($targetFolderRaw);
    if ($validationResult !== true) {
        $response['message'] = $validationResult;
        echo json_encode($response);
        exit;
    }

    if (!$core->checkTargetFolderIfNotEmpty($targetFolder, $targetFolderRaw)) {
        $response['message'] = "Target folder exists and is not empty.";
        echo json_encode($response);
        exit;
    }
    
    
$staging='01835314';
    list($success, $message) = $clone->run(
        $installs['type'],
        $targetFolder,
       ltrim($targetFolderRaw, '/'),
        $replacements,
        $globals,
        $dbHost,
        $dbUser,
        $dbPass,
        $dbName,
        $tablePrefix,
        $metadataroot,
        $siteTitle,
        $site_desc,
        $adminUser,
        $adminEmail,
        $adminPass,
        $siteURL,
        $installs,
        $staging
    );

    if (!$success) {
        $response['message'] = $message;
    } else {
        $response['success'] = true;
        $response['message'] = $message;
    }

 

    echo json_encode($response);
    exit;
    
}

$response['message'] = 'No POST data received.';
echo json_encode($response);
exit;
