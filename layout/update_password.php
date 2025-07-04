<?php
$user_id = $_POST['user_id'] ?? 0;
$ols_id = $_POST['ols_id'] ?? '';
$new_password = $_POST['new_password'] ?? '';

if (!$user_id || !$ols_id || !$new_password) {
    echo json_encode(['success' => false, 'message' => 'Missing data']);
    exit;
}

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
$table_prefix = $install['table_prefix'] ?? 'wp_';

require_once rtrim($install['folder'], '/') . '/wp-includes/class-phpass.php';
$wp_hasher = new PasswordHash(8, true);
$hashed_password = $wp_hasher->HashPassword($user_pass);
$mysqli->query("UPDATE {$table_prefix}users SET user_pass = '$hashed_password' WHERE ID = $user_id");

echo json_encode(['success' => true,'message' => 'Update successfull']);
