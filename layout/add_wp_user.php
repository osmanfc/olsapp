<?php

$ols_id = $_POST['ols_id'] ?? '';
if (!$ols_id) {
    echo json_encode(['success' => false, 'message' => 'Missing install ID']);
    exit;
}

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    echo json_encode(['success' => false, 'message' => 'Could not connect to WordPress DB']);
    exit;
}

$table_prefix = $install['table_prefix'] ?? 'wp_';
$users_table = $table_prefix . 'users';
$usermeta_table = $table_prefix . 'usermeta';

// Gather form data
$user_login = trim($_POST['user_login'] ?? '');
$user_email = trim($_POST['user_email'] ?? '');
$user_pass = $_POST['user_pass'] ?? '';
$first_name = trim($_POST['first_name'] ?? '');
$last_name = trim($_POST['last_name'] ?? '');
$user_url = trim($_POST['user_url'] ?? '');
$role = $_POST['role'] ?? 'subscriber';

if (!$user_login || !$user_email || !$user_pass) {
    echo json_encode(['success' => false, 'message' => 'Username, Email, and Password are required']);
    exit;
}

// Check if user exists
$check = $mysqli->prepare("SELECT ID FROM $users_table WHERE user_login = ? OR user_email = ?");
$check->bind_param("ss", $user_login, $user_email);
$check->execute();
$check->store_result();
if ($check->num_rows > 0) {
    echo json_encode(['success' => false, 'message' => 'User already exists with this username or email']);
    exit;
}
$check->close();

// Hash password using WordPress-compatible algorithm
require_once rtrim($install['folder'], '/') . '/wp-includes/class-phpass.php';
$wp_hasher = new PasswordHash(8, true);
$hashed_password = $wp_hasher->HashPassword($user_pass);

$registered = gmdate('Y-m-d H:i:s');
$user_nicename = sanitize_title($user_login);

// Insert into wp_users
$stmt = $mysqli->prepare("INSERT INTO $users_table (user_login, user_pass, user_nicename, user_email, user_url, user_registered, display_name) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssss", $user_login, $hashed_password, $user_nicename, $user_email, $user_url, $registered, $user_login);
if (!$stmt->execute()) {
    echo json_encode(['success' => false, 'message' => 'Failed to add user']);
    exit;
}
$user_id = $stmt->insert_id;
$stmt->close();

// Add metadata (first/last name, role, etc.)
$meta = [
    'first_name' => $first_name,
    'last_name' => $last_name,
    'nickname' => $user_login,
    'description' => '',
    $table_prefix . 'capabilities' => serialize([$role => true]),
    $table_prefix . 'user_level' => role_to_level($role),
];

foreach ($meta as $key => $value) {
    $meta_stmt = $mysqli->prepare("INSERT INTO $usermeta_table (user_id, meta_key, meta_value) VALUES (?, ?, ?)");
    $meta_stmt->bind_param("iss", $user_id, $key, $value);
    $meta_stmt->execute();
    $meta_stmt->close();
}

echo json_encode(['success' => true, 'message' => 'User created successfully']);


// --- Helpers ---
function sanitize_title($string) {
    $string = strtolower(trim($string));
    $string = preg_replace('/[^a-z0-9]+/', '-', $string);
    return trim($string, '-');
}

function role_to_level($role) {
    $map = [
        'subscriber' => '0',
        'contributor' => '1',
        'author' => '2',
        'editor' => '7',
        'administrator' => '10',
    ];
    return $map[$role] ?? '0';
}
