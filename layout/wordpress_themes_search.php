<?php
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id']);

if ($mysqli === false) {
    echo "Could not connect to WordPress database.";
    exit;
}

$wp_theme_dir = rtrim($install['folder'], '/') . '/wp-content/themes';
$search = trim($_POST['search'] ?? '');
$theme_api_url = 'https://api.wordpress.org/themes/info/1.2/?action=query_themes';

if ($search !== '') {
    $theme_api_url .= '&request[search]=' . urlencode($search);
} else {
    $theme_api_url .= '&request[browse]=popular';
}
$theme_api_url .= '&request[per_page]=50';

$table_prefix = $install['table_prefix'] ?? 'wp_';

// Fetch current active theme slug
$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'template' LIMIT 1");
$row = $res->fetch_assoc();
$active_theme_slug = $row['option_value'] ?? '';

// Scan installed themes
$installed_themes = [];
foreach (glob("$wp_theme_dir/*", GLOB_ONLYDIR) as $theme_folder) {
    $slug = basename($theme_folder);
    $style_file = "$theme_folder/style.css";

    if (!file_exists($style_file)) continue;

    $contents = file_get_contents($style_file);
    $theme_name = 'Unknown';
    $theme_version = 'Unknown';

    if (preg_match('/^[ \t\/*#@]*Theme Name\s*:\s*(.+)$/mi', $contents, $name_match)) {
        $theme_name = trim($name_match[1]);
    }

    if (preg_match('/^[ \t\/*#@]*Version\s*:\s*(.+)$/mi', $contents, $version_match)) {
        $theme_version = trim($version_match[1]);
    }

    $installed_themes[$slug] = [
        'name' => $theme_name,
        'version' => $theme_version,
    ];
}

// Fetch remote themes from WordPress.org
$response = file_get_contents($theme_api_url);
$data = json_decode($response, true);
$remote_themes = $data['themes'] ?? [];
?>

<div class="row">
<?php foreach ($remote_themes as $theme):
    $slug = $theme['slug'];
    $name = $theme['name'];
    $version = $theme['version'];
    $description = $theme['description'] ?? '';
    $screenshot_url = $theme['screenshot_url'] ?? 'https://s.w.org/style/images/codeispoetry.png';

    $is_installed = isset($installed_themes[$slug]);
    $is_active = ($slug === $active_theme_slug);

    $btn_label = !$is_installed ? 'Install' : ($is_active ? 'Active' : 'Installed');
    $btn_class = !$is_installed ? 'btn-primary' : ($is_active ? 'btn-success' : 'btn-secondary');
    $btn_disabled = $is_active ? 'disabled' : '';
?>
   <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
  <div class="card h-100 shadow-sm border-0">
    <img
      src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQv///wAAACH5BAEAAAEALAAAAAAQABAAAANMSLrc/jDKSau9OOvNu/9gKI5kaZ5oqub7zG1fqvrhRu/QAAOw=="
      data-src="<?= htmlspecialchars($screenshot_url); ?>"
      alt="<?= htmlspecialchars($name) ?> preview"
      class="lazy img-fluid rounded-top"
      loading="lazy"
      style="object-fit: contain; background-color: #f8f9fa;"
    >

    <div class="card-body p-3 d-flex flex-column">
      <h5 class="card-title mb-1" style="font-size: 1.1rem; font-weight: 600;">
        <?= htmlspecialchars($name) ?>
      </h5>
      <small class="text-muted mb-2">Version: <?= htmlspecialchars($version) ?></small>

      <p class="card-text text-muted mb-3" style="
        font-size: 0.9rem;
        line-height: 1.3;
        max-height: 2.6em; /* about 2 lines */
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
      ">
        <?= htmlspecialchars($description, ENT_QUOTES, 'UTF-8'); ?>
      </p>

      <div class="mt-auto">
        <button
          type="button"
          id="installThemeBtn_<?= $slug ?>"
          <?= !$is_installed ? "onclick=\"installThemes('{$slug}')\"" : '' ?>
          class="btn btn-sm <?= $btn_class ?>"
          <?= $btn_disabled ?>
        >
          <?= $btn_label ?>
        </button>
      </div>
    </div>
  </div>
</div>


<?php endforeach; ?>
</div>
