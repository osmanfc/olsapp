<?php
$user_id = $_POST['user_id'] ?? 0;
$ols_id = $_POST['ols_id'] ?? '';
$user_email = $_POST['user_email'] ?? '';

if (!$user_id || !$ols_id || !$user_email) {
    echo json_encode(['success' => false, 'message' => 'Missing data']);
    exit;
}

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    echo json_encode(['success' => false, 'message' => 'DB connection failed']);
    exit;
}

$table_prefix = $install['table_prefix'] ?? 'wp_';
$user_email = $mysqli->real_escape_string($user_email);

// ✅ Check for duplicate email (exclude current user)
$check = $mysqli->query("SELECT ID FROM {$table_prefix}users WHERE user_email = '$user_email' AND ID != $user_id");
if ($check && $check->num_rows > 0) {
    echo json_encode(['success' => false, 'message' => 'Email already in use by another user']);
    exit;
}

// ✅ Proceed with update
$update = $mysqli->query("UPDATE {$table_prefix}users SET user_email = '$user_email' WHERE ID = $user_id");

if ($update) {
    echo json_encode(['success' => true, 'message' => 'Update successful']);
} else {
    echo json_encode(['success' => false, 'message' => 'Update failed']);
}
