<?php
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id']);

if ($mysqli === false) {
    echo "Could not connect to WordPress database.";
    exit;
}

$wp_plugin_dir = rtrim($install['folder'], '/') . '/wp-content/plugins';

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
    $main_file_found = false;
    $plugin_name = 'Unknown';
    $plugin_version = 'Unknown';

    foreach (glob("$plugin_folder/*.php") as $file) {
        $contents = file_get_contents($file);

        if (preg_match('/^[ \t\/*#@]*Plugin Name\s*:\s*(.+)$/mi', $contents, $name_match)) {
            // Main file detected
            $plugin_name = trim($name_match[1]);

            if (preg_match('/^[ \t\/*#@]*Version\s*:\s*(.+)$/mi', $contents, $version_match)) {
                $plugin_version = trim($version_match[1]);
            }

            $main_file_found = true;
            break; // Stop scanning after finding the main file
        }
    }

    if ($main_file_found) {
        $installed_plugins[$slug] = [
            'name' => $plugin_name,
            'version' => $plugin_version,
        ];
    }
}

?>


<div class="card-body p-0">
        <div class="table-responsive">
          <table class="table">
            <thead class="bg-light">
              <tr class="border-0">
                <th class="border-0">Name</th>
                <th class="border-0">Version</th>
                <th class="border-0">Status</th>
                <th class="border-0" style="text-align: right;">Option</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($installed_plugins as $slug => $plugin): 
                  $name = htmlspecialchars($plugin['name']);
                  $version = htmlspecialchars($plugin['version']);
                  $is_active = isset($active_slugs[$slug]);
              ?>
              <tr>
                <td><?= $name; ?></td>
                <td><?= $version; ?></td>
               <td>
  <div class="form-group row align-items-center">
    <div class="col-12 col-sm-8 col-lg-6 pt-1 position-relative">
      <span class="dashboard-spinner spinner-xs d-none" id="spinner_<?= htmlspecialchars($slug); ?>"></span>

      <div class="switch-button switch-button-success">
        <input type="checkbox"
        onclick="togglePluginStatus(this)"
               class="plugin-toggle"
               data-slug="<?= htmlspecialchars($slug); ?>"
               data-ols-id="<?= htmlspecialchars($install['id']); ?>"
               id="plugin_<?= htmlspecialchars($slug); ?>"
               <?= $is_active ? 'checked' : ''; ?>>
        <span><label for="plugin_<?= htmlspecialchars($slug); ?>"></label></span>
      </div>
    </div>
  </div>
</td>

                <td style="text-align: right;">
                  <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'delete_plugin', 'ols_id' => $install['id'], 'slug' => $slug]); ?>"
   class="icon-btn mx-1"
   style="color: #FF5D00;"
   role="button"
   data-bs-toggle="tooltip"
   data-bs-placement="bottom"
   title="Delete"
   onclick="return confirm('Are you sure you want to delete this plugin?');">
  <i class="fas fa-trash-alt"></i>
</a>

                </td>
              </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
        </div>
      </div>