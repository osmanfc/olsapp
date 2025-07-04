<?php
header('Content-Type: application/json');

$response = [
    'success' => false,
    'message' => '',
];

if (!empty($_POST['target_folder'])) {
    // Assume $user, $core, $metadataDb, $phpScriptsByCategory are already initialized and available
    
    // Clean input values safely
    $targetFolderRaw = isset($_POST['target_folder']) ? $core->safe_input($_POST['target_folder']) : '';
    $is_backup_dir = !empty($_POST['backup_dir']) ? 1 : 0;
    $is_backup_db = !empty($_POST['backup_db']) ? 1 : 0;
    $backup_note = isset($_POST['backup_note']) ? $core->safe_input($_POST['backup_note']) : '';

    // Retrieve installation metadata by some identifier (example: ols_id)
    $install = $core->get_single_install_metadata($metadataDb, $_GET['ols_id']);
      $app = $core->getAppByNickname($phpScriptsByCategory, $install['type']);
    if (!$install) {
        $response['message'] = 'Installation metadata not found.';
        echo json_encode($response);
        exit;
    }

    // Verify folder is inside user's home directory
    if (!$core->isPathInHomedir($install['folder'], $user['homedir'])) {
        $response['message'] = "Invalid source folder path.";
        echo json_encode($response);
        exit;
    }

    // Prepare target folder path inside backups directory (adjust as needed)
  $outputDir = rtrim($user['softdir'], '/') . '/.olsapp';

    if ($targetFolderRaw !== '') {
        $outputDir .= '/' . basename($targetFolderRaw);
    }

    // Validate and create target backup folder
    $validationResult = $core->validateTargetFolderName($targetFolderRaw);
    if ($validationResult !== true) {
        $response['message'] = $validationResult;
        echo json_encode($response);
        exit;
    }

    
    if (!is_dir($outputDir) && !mkdir($outputDir, 0755, true)) {
        $response['message'] = "Failed to create backup directory: $outputDir";
        echo json_encode($response);
        exit;
    }

    // Prepare $data array for backup
    $data = [
        'softpath' => $install['folder'],
        'sid' => (int)$install['id'],
        'insid' => (int)$install['id'],
        'ver' => 'unknown',
        'softurl' => $install['site_url'],
        'admin_link' => $app['admin_path'],
        'admin_username' => $install['user'],
        'admin_email' => $install['email'] ?? '',
        'softdomain' => parse_url($install['site_url'], PHP_URL_HOST),
        'softdb' => $install['db_name'] ?? '',
        'softdbuser' => $install['db_user'] ?? '',
        'softdbpass' => $install['db_pass'] ?? '',
        'softdbhost' => $install['db_host'] ?? 'localhost',
        'dbprefix' => $install['table_prefix'],
        'app' => $install['type'],
        'backup_dir' => $is_backup_dir,
        'backup_db' => $is_backup_db,
        'backup_note' => $backup_note,
        'ssk' => '',
        'license' => '',
        'site_name' => $install['title'] ?? '',
        'soft_version' => '',
    ];

    // Call your backup method
    list($success, $message) = $core->create_backup_metadata($data, $install['type'], $outputDir);

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
