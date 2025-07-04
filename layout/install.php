<?php


header('Content-Type: application/json'); // <-- Send JSON response

$response = [
    'success' => false,
    'message' => '',
];

if (!empty($_POST['domain'])) {
    $main_path = rtrim($user['homedir'], '/');
    $target_domain = $core->safe_input($_POST['domain']);
    $target_http = $_POST['http'] ?? '1';
    $protocol = $core->get_protocol_prefix($target_http);
    $siteTitle = $core->safe_input($_POST['site_title'] ?? 'My WP Site');
    $site_desc = $core->safe_input($_POST['site_desc'] ?? 'My WP Site');
    $adminUser = $core->safe_input($_POST['admin_user'] ?? 'admin');
    $adminPass = $core->safe_input($_POST['admin_pass'] ?? 'password');
    $adminEmail = $core->safe_input($_POST['admin_email'] ?? 'admin@example.com');
    $dbName = $core->safe_input($_POST['db_name'] ?? 'wp');
    $dbUser = $core->safe_input($_POST['db_user'] ?? 'root');
    $dbPass = $_POST['db_pass'] ?? '';
    $dbHost = $core->safe_input($_POST['db_host'] ?? 'localhost');
    $tablePrefix = $core->safe_input($_POST['table_prefix'] ?? 'wp_');
    
    
    
    
    
    $filterDomain = $target_domain;

// Check if it exists and get the path
if (isset($domainroots[$filterDomain])) {
    $sub_path = $domainroots[$filterDomain];
   // echo "Path for $filterDomain is $path";
} else {
    $response['message'] = "Domain not found";
        echo json_encode($response);
        exit;
}

if ($core->isPathInHomedir($sub_path, $user['homedir'])) {
   $sub_path="$sub_path/";
} else {
   $sub_path="$main_path/$sub_path/";
}


    $targetFolderRaw = $_POST['target_folder'] ?? '';
    $targetFolder = $targetFolderRaw !== '' ? rtrim($sub_path . basename($targetFolderRaw), '/') : '';
    $metadataroot = $main_path . '/.olsapp';

  
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
    $siteURL = $protocol.$target_domain.'/'.$targetFolderRaw;

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
        '{{siteDomain}}'  => $target_domain,
        '{{install_path}}'  => $targetFolder,
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
    
    


    list($success, $message) = $install->run(
        $_GET['app'],
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
        $siteURL
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
