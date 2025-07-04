<?php

header('Content-Type: application/json'); // Send JSON response

$response = [
    'success' => false,
    'message' => '',
];

if (empty($_POST['id'])) {
    $response['message'] = 'No POST data received.';
    echo json_encode($response);
    exit;
}

$main_path = rtrim($user['homedir'], '/');
$backup = $core->get_backup_metadata($metadataDb, $_POST['id']);

list($ok, $msg) = $core->unpackTarGz($backup[0]['folder']);
if (!$ok) {
    $response['message'] = "error on unpack: $msg";
    echo json_encode($response);
    exit;
}
$source = preg_replace('/\.tar\.gz$/', '', $backup[0]['folder']);
$lastSegment = basename($source);

$old_file_del = (isset($_POST['old_file_del']) && $_POST['old_file_del'] === 'on') ? 1 : 0;

$rawData = $core->recover_from_serialize($source . '/' . $lastSegment);

// Check and normalize
if (is_array($rawData)) {
    // If softpath is inside index 1, use it
    if (isset($rawData[1]['softpath'])) {
        $data = $rawData[1];
    }
    // Or if softpath is in root level (rare case)
    elseif (isset($rawData['softpath'])) {
        $data = $rawData;
    } else {
        $data = null;
    }
} else {
    $data = null;
}

if (!$data || !is_array($data)) {
    $response['message'] = "Invalid or corrupted serialized data.";
    echo json_encode($response);
    exit;
}

$sid         = (int)$data['sid'];
$siteURL     = $data['softurl'];
$siteTitle   = $data['site_name'];
$adminUser   = $data['admin_username'];
$adminEmail  = $data['admin_email'] ?? '';
$softdomain  = $data['softdomain'];
$tablePrefix = $data['dbprefix'];
$adminPass   = '';
$sub_path    = $data['softpath'];
$dbUser      = $data['softdbuser'];
$dbName      = $data['softdb'];
$dbPass      = $data['softdbpass'];
$dbHost      = $data['softdbhost'] ?? 'localhost';
$script_name = $data['script_name'];
$site_desc  = $data['site_desc'];
$app         = $core->getAppByNickname($phpScriptsByCategory, $script_name);

// Determine target folder path
if ($core->isPathInHomedir($sub_path, $user['homedir'])) {
    $targetFolder = $sub_path;
} else {
    $sub_path_clean = preg_replace('#^' . preg_quote($user['homedir'], '#') . '/?#', '', $sub_path);
    $targetFolder = rtrim($main_path, '/') . '/' . rtrim($sub_path_clean, '/') . '/';
}

// Validate and possibly prepend user name to dbUser and dbName
$validation = $core->validate_db_prefix_with_main_user($user['name'], $dbUser, $dbName);
if ($validation !== true) {
    $dbName = $user['name'] . '_' . $dbName;
    $dbUser = $user['name'] . '_' . $dbUser;
}

// Check target folder if not empty and old_file_del is not set
if ($old_file_del != 1 && !$core->checkTargetFolderIfNotEmpty($targetFolder, $targetFolder)) {
    $response['message'] = "Target folder exists and is not empty.";
    echo json_encode($response);
    exit;
}

// Database connection check if credentials exist
if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
   
    try {
        $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
        $mysqli->set_charset("utf8mb4"); // Optional but recommended
    } catch (mysqli_sql_exception $e) {
        $response['message'] = "DB Connection Error: ".$data['softdbuser'] . $e->getMessage();
       
        echo json_encode($response);
        exit;
    }
}


// Delete old files and drop tables if flagged
if ($old_file_del == 1) {
    $core->delete_directory_recursive($targetFolder);
    $core->drop_all_tables($dbHost, $dbUser, $dbPass, $dbName);
}

// Ensure target folder exists
list($ok, $msg) = $core->folder_make($targetFolder);
    if (!$ok) { 
        $response['message'] = "Folder make error: $msg";
        echo json_encode($response);
        exit;
        
    }
            
    

// Import DB backup if possible
if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
    $dbFilePath = $source . '/softsql.sql';
    list($ok, $msg) = $core->import_db_backup($dbFilePath, $dbHost, $dbUser, $dbPass, $dbName);
    if (!$ok) {
        $response['message'] = "DB Import Error: $msg";
        echo json_encode($response);
        exit;
    }
}

// Copy backup files recursively
$core->copy_folder_recursive($source, $targetFolder);
 if (method_exists($softpanel, 'set_permission')) {
              $softpanel->set_permission($targetFolder); }
// Check if metadata exists, if not save it
$in = $core->get_single_install_metadata($metadataDb, $sid);
if (!$in) {
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
        basename($targetFolder),
        $siteURL,
        $script_name
    );
}
$core->delete_directory_recursive($source);
$response['success'] = true;
$response['message'] = "Successfully restored backup";

echo json_encode($response);
exit;
