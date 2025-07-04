<?php
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb,$_GET['ols_id']);

if ($mysqli === false) {
    echo "Could not connect to WordPress database.";
    exit;
} else {
    //  $mysqli and updated $install['db_*']
}




$wp_plugin_dir = rtrim($install['folder'], '/') . '/wp-content/plugins';
$search = trim($_POST['search'] ?? '');
$plugin_api_url = 'https://api.wordpress.org/plugins/info/1.2/?action=query_plugins';

if ($search !== '') {
    $plugin_api_url .= '&request[search]=' . urlencode($search);
} else {
    $plugin_api_url .= '&request[browse]=popular';
}

$plugin_api_url .= '&request[per_page]=50';

// --- Read active_plugins from DB ---
$table_prefix = $install['table_prefix'] ?? 'wp_';
$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'active_plugins' LIMIT 1");
$row = $res->fetch_assoc();
$active_plugins_raw = $row['option_value'] ?? '';
$active_plugins_array = @unserialize($active_plugins_raw);
if (!is_array($active_plugins_array)) $active_plugins_array = [];

$active_slugs = [];
foreach ($active_plugins_array as $plugin_file) {
    $slug = explode('/', $plugin_file)[0];
    $active_slugs[$slug] = true;
}

// --- Scan installed plugins from file system ---
$installed_plugins = [];
foreach (glob("$wp_plugin_dir/*", GLOB_ONLYDIR) as $plugin_folder) {
    $slug = basename($plugin_folder);
     $main_file = "$plugin_folder/$slug.php";

    if ($main_file) {
        $contents = file_get_contents($main_file);

      $plugin_name = 'Unknown';
$plugin_version = 'Unknown';

if (preg_match('/^[ \t\/*#@]*Plugin Name\s*:\s*(.+)$/mi', $contents, $name_match)) {
    $plugin_name = trim($name_match[1]);
}

if (preg_match('/^[ \t\/*#@]*Version\s*:\s*(.+)$/mi', $contents, $version_match)) {
    $plugin_version = trim($version_match[1]);
}

        $installed_plugins[$slug] = [
            'name' => trim($plugin_name),
            'version' => trim($plugin_version),
        ];
    }
}

// --- Fetch plugins from WordPress.org ---
$response = file_get_contents($plugin_api_url);
$data = json_decode($response, true);
$remote_plugins = $data['plugins'] ?? [];

?>




   
             <div class="row">
<?php foreach ($remote_plugins as $plugin):
    $slug = $plugin['slug'];
    $name = $plugin['name'];
    $version = $plugin['version'];

    $is_installed = isset($installed_plugins[$slug]);
    $is_active = isset($active_slugs[$slug]);

    $status_text = $is_installed
        ? ($is_active ? 'Active' : 'Inactive')
        : 'Not Installed';

    $status_class = $is_installed
        ? ($is_active ? 'bg-success' : 'bg-warning text-dark')
        : 'bg-danger';

    $icon_url = $core->get_plugin_icon_url($plugin);

    // Decide button label and style
    if (!$is_installed) {
        $btn_label = 'Install';
        $btn_class = 'btn-primary';
    } else {
        $btn_label = 'Installed';
        $btn_class = 'btn-success';
    }
?>

 <div class="col-12 col-md-6 col-lg-4 mb-4">
  <div class="card h-100 shadow-sm border-0 p-3 d-flex flex-row align-items-start" style="min-height: 140px;">
    
    <img
      src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQv///wAAACH5BAEAAAEALAAAAAAQABAAAANMSLrc/jDKSau9OOvNu/9gKI5kaZ5oqub7zG1fqvrhRu/QAAOw=="
      data-src="<?= $icon_url ?>"
      alt="<?= $name ?> icon"
      class="lazy me-3"
      loading="lazy"
      style="width: 96px; height: 96px; object-fit: contain; flex-shrink: 0;padding-right: 1rem;"
    >

    <div class="flex-grow-1 d-flex flex-column">
      <h5 class="mb-1" style="font-size: 1.1rem;"><?= $name ?></h5>
      <small class="text-muted mb-2">Version: <?= $version ?></small>
      <p class="mb-2 text-muted" style="font-size: 0.9rem; line-height: 1.3;"><?= htmlspecialchars($app['description'], ENT_QUOTES, 'UTF-8'); ?></p>

      <div class="mt-auto d-flex justify-content-between align-items-center">
        
        <button
          type="button"
          id="installBtn_<?= $slug ?>"
           <?= !$is_installed ? "onclick=\"installPlugin('{$slug}')\"" : '' ?>
          class="btn btn-sm <?= $btn_class ?> plugin-action-btn"
          data-slug="<?= $slug; ?>"
          data-installed="<?= $is_installed ? '1' : '0' ?>"
          data-active="<?= $is_active ? '1' : '0' ?>"
        >
          <?= $btn_label ?>
        </button>
      </div>
    </div>

  </div>
</div>





 
<?php endforeach; ?>
</div>
           
<script>
    
    
    
</script>
