<?php

$scanRoot = rtrim($user['homedir'], '/');
$installs = $core->get_install_metadata($metadataDb);

// Prepare ignore list
$ignoredFolders = [];
if (is_array($installs)) {
    foreach ($installs as $install) {
        if (!empty($install['folder']) && is_dir($install['folder'])) {
            $ignoredFolders[] = realpath($install['folder']);
        }
    }
}

// Scan for new WP folders
$newWordPressFolders = $core->scanWordPressFolders($scanRoot, $ignoredFolders);
$successInstalls = [];

foreach ($newWordPressFolders as $targetFolder) {
	if ($core->is_folder_already_installed($targetFolder)) {
        continue;
    }
	
    $dbInfo = $core->wp_database_info($targetFolder);
    if (!$dbInfo) continue;

    try {
        $mysqli = @new mysqli(
            $dbInfo['DB_HOST'],
            $dbInfo['DB_USER'],
            $dbInfo['DB_PASS'],
            $dbInfo['DB_NAME']
        );
        if ($mysqli->connect_errno) continue;

        $prefix = $mysqli->real_escape_string($dbInfo['DB_PREFIX']);

        // Get siteurl
        $siteurl = '';
        $res1 = $mysqli->query("SELECT option_value FROM `{$prefix}options` WHERE option_name = 'siteurl' LIMIT 1");
        if ($res1 && $row1 = $res1->fetch_assoc()) {
            $siteurl = $row1['option_value'];
        }

        // Get blogname
        $blogname = '';
        $res2 = $mysqli->query("SELECT option_value FROM `{$prefix}options` WHERE option_name = 'blogname' LIMIT 1");
        if ($res2 && $row2 = $res2->fetch_assoc()) {
            $blogname = $row2['option_value'];
        }

        // Get admin_email
        $adminEmail = '';
        $res3 = $mysqli->query("SELECT option_value FROM `{$prefix}options` WHERE option_name = 'admin_email' LIMIT 1");
        if ($res3 && $row3 = $res3->fetch_assoc()) {
            $adminEmail = $row3['option_value'];
        }

        // Get first admin user
        $adminUser = '';
        $res4 = $mysqli->query("SELECT user_login FROM `{$prefix}users` ORDER BY ID ASC LIMIT 1");
        if ($res4 && $row4 = $res4->fetch_assoc()) {
            $adminUser = $row4['user_login'];
        }

        $mysqli->close();

        if ($siteurl && $blogname && $adminUser) {
            // Save metadata
            $site_desc = '';
            $adminPass = '';  // Cannot be retrieved securely
            $targetname = basename($targetFolder);
            $staging = 0;
            $name = 'wordpress';

            list($ok, $id) = $core->save_install_metadata(
                $metadataDb,
                $blogname,
                $site_desc,
                $adminUser,
                $adminEmail,
                $adminPass,
                $dbInfo['DB_USER'],
                $dbInfo['DB_PASS'],
                $dbInfo['DB_NAME'],
                $dbInfo['DB_HOST'],
                $dbInfo['DB_PREFIX'],
                $targetFolder,
                $targetname,
                $siteurl,
                $name,
                $staging
            );

            if ($ok) {
                $successInstalls[] = [
                    'id' => $id,
                    'folder' => $targetFolder,
                    'siteurl' => $siteurl,
                    'blogname' => $blogname,
                    'admin_user' => $adminUser,
                    'admin_email' => $adminEmail,
                ];
            }
            
            
        }

    } catch (Exception $e) {
        continue;
    }
}

$response = [
    'success' => true,
    'message' => count($successInstalls) . ' WordPress installations saved.',
    'new_installations' => $successInstalls,
];

header('Content-Type: application/json');
echo json_encode($response);
exit;
