<?php
ini_set('memory_limit','-1');
require_once "".$globals['path']."/core/main_core.php"; 
require_once "".$globals['path']."/core/int_core.php";
require_once "".$globals['path']."/core/clone_core.php";
require_once "".$globals['path']."/core/softpanel.php"; 
require_once "".$globals['path']."/core/download_latest.php";

$core = new main_core();
$install = new int_core();
$clone = new clone_core();
$softpanel = new softpanel();
$user = $softpanel->userdata();
$download_latest = new download_latest();
$phpScriptsByCategory = require_once "".$globals['path']."/core/list.php"; 
?>