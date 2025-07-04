<?php
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id']);

if ($mysqli === false) {
    echo "Could not connect to WordPress database.";
    exit;
}

$wp_theme_dir = rtrim($install['folder'], '/') . '/wp-content/themes';

// --- Get active theme slug from DB ---
$table_prefix = $install['table_prefix'] ?? 'wp_';
$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'stylesheet' LIMIT 1");
$row = $res->fetch_assoc();
$active_theme_slug = $row['option_value'] ?? '';

// --- Scan installed themes from file system ---
$installed_themes = [];

foreach (glob("$wp_theme_dir/*", GLOB_ONLYDIR) as $theme_folder) {
    $slug = basename($theme_folder);
    $style_css = "$theme_folder/style.css";
    $theme_name = 'Unknown';
    $theme_version = 'Unknown';

    if (file_exists($style_css)) {
        $contents = file_get_contents($style_css);

        if (preg_match('/^[ \t\/*#@]*Theme Name\s*:\s*(.+)$/mi', $contents, $name_match)) {
            $theme_name = trim($name_match[1]);
        }
        if (preg_match('/^[ \t\/*#@]*Version\s*:\s*(.+)$/mi', $contents, $version_match)) {
            $theme_version = trim($version_match[1]);
        }
    }

    $installed_themes[$slug] = [
        'name' => $theme_name,
        'version' => $theme_version,
    ];
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
        <?php foreach ($installed_themes as $slug => $theme): 
          $name = htmlspecialchars($theme['name']);
          $version = htmlspecialchars($theme['version']);
          $is_active = ($slug === $active_theme_slug);
        ?>
        <tr>
          <td><?= $name; ?></td>
          <td><?= $version; ?></td>
         <td>
              <span class="dashboard-spinner spinner-xs d-none" id="spinner_<?= htmlspecialchars($slug); ?>"></span>

<label class="custom-control custom-radio">
  <input
    type="radio"
    name="active_theme"
    class="custom-control-input"
    id="theme_<?= htmlspecialchars($slug); ?>"
    value="<?= htmlspecialchars($slug); ?>"
    data-slug="<?= htmlspecialchars($slug); ?>"
    data-ols-id="<?= htmlspecialchars($install['id']); ?>"
    <?= $is_active ? 'checked' : '' ?>
    onclick="toggleThemeStatus(this)"
  >
  <span class="custom-control-label"></span>
</label>


</td>

          <td style="text-align: right;">
            <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'delete_themes', 'ols_id' => $install['id'], 'slug' => $slug]); ?>"
               class="icon-btn mx-1"
               style="color: #FF5D00;"
               role="button"
               data-bs-toggle="tooltip"
               data-bs-placement="bottom"
               title="Delete"
               onclick="return confirm('Are you sure you want to delete this theme?');"
               <?= $is_active ? 'style="pointer-events:none; opacity:0.5;"' : ''; ?>>
              <i class="fas fa-trash-alt"></i>
            </a>
          </td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

