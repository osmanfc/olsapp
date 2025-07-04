<?php if($_GET['download']){
    $back = $core->get_backup_metadata($metadataDb,$_GET['download']);
    
   if (!file_exists($back[0]['folder'])) {
          header("Location: " . $globals['index'] . $core->buildCleanQueryString(['view' => 'my_backup']));
        exit;
        }
    $core->download_backup_file($back[0]['folder']);
 
    
}else if($_GET['delete']){
    $back = $core->get_backup_metadata($metadataDb,$_GET['delete']);
   
    $core->delete_directory_recursive($back[0]['folder']);
  $core->delete_backup_by_id($metadataDb,$_GET['delete']);
    header("Location: " . $globals['index'] . $core->buildCleanQueryString(['view' => 'my_backup']));
        exit;
}else if($_GET['delete_full_app']){
    
    $install = $core->get_single_install_metadata($metadataDb,$_GET['delete_full_app']);
   
    $core->delete_directory_recursive($install['folder']);
     $softpanel->deldb($install['db_name'], $install['db_user']);
  $core->delete_install_by_id($metadataDb,$_GET['delete_full_app']);
  
    header("Location: " . $globals['index'] . $core->buildCleanQueryString(['view' => 'my_install']));
        exit;
}else if($_GET['delete_app']){
   
  $core->delete_install_by_id($metadataDb,$_GET['delete_app']);
    header("Location: " . $globals['index'] . $core->buildCleanQueryString(['view' => 'my_install']));
        exit;
}else if (isset($_GET['logout'])) {

    // Start session if not already started
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    // Unset all session variables
    $_SESSION = [];

    // Destroy the session
    session_destroy();

    // Unset all cookies
    if (!empty($_COOKIE)) {
        foreach ($_COOKIE as $name => $value) {
            setcookie($name, '', time() - 3600, '/');
            setcookie($name, '', time() - 3600); // in case path wasn't '/'
        }
    }

    // Redirect to your desired page
    header("Location: " .$softpanel->theme['logout']);
    exit;
}
