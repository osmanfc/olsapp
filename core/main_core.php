<?php
class main_core{

public function downloadFileCurl(string $url, string $savePath): bool {
    $fp = fopen($savePath, 'w+');
    if (!$fp) {
        throw new Exception("Unable to open file for writing: $savePath");
    }

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_FAILONERROR, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 300); // 5 minutes max
    curl_exec($ch);

    if (curl_errno($ch)) {
        fclose($fp);
        throw new Exception("Download failed: " . curl_error($ch));
    }

    curl_close($ch);
    fclose($fp);
    return true;
}

public function folder_make(string $folderPath): array {
    try {
        if (is_dir($folderPath)) {
            return [true, "Folder already exists: $folderPath"];
        }

        if (mkdir($folderPath, 0755, true)) {
            return [true, "Folder created successfully: $folderPath"];
        } else {
            return [false, "Failed to create folder: $folderPath"];
        }
    } catch (Exception $e) {
        return [false, "Exception while creating folder: " . $e->getMessage()];
    }
}


public function moveFolderContentsUp($sourceDir, $targetDir) {
    global $user;
    if (!is_dir($sourceDir)) return false;

    $files = scandir($sourceDir);
    foreach ($files as $file) {
        if ($file === '.' || $file === '..') continue;

        $sourcePath = $sourceDir . DIRECTORY_SEPARATOR . $file;
        $targetPath = $targetDir . DIRECTORY_SEPARATOR . $file;

        // Move file or directory
        rename($sourcePath, $targetPath);
    }

    // Remove the now empty source folder
     $this->set_ownership_with_self($targetDir, $user['name'], $user['name']);
    return rmdir($sourceDir);
}



public function change_db_prefix_in_sql_file($sqlContent, $oldPrefix, $newPrefix) {
   

    // Read the entire SQL file content
   
    if ($sqlContent === false) {
       
        return false;
    }

    // Define patterns for replacing table names and options
    // This handles CREATE TABLE, INSERT INTO, and references to table names
    // It also handles the 'option_name' and 'meta_key' fields
    $patterns = [
        // Replace table names in CREATE TABLE, INSERT INTO, UPDATE, ALTER TABLE, etc.
        // This is a more robust regex to catch various SQL statements.
        // It looks for the old prefix followed by alphanumeric characters and an underscore,
        // often delimited by backticks or whitespace.
        '/`' . preg_quote($oldPrefix, '/') . '([a-zA-Z0-9_]+)`/',
        '/`' . preg_quote($oldPrefix, '/') . '([a-zA-Z0-9_]+)`\./', // For cases like `oldprefix_tablename`.`column`
        '/\b' . preg_quote($oldPrefix, '/') . '([a-zA-Z0-9_]+)\b/', // For cases not enclosed in backticks, e.g., in views or stored procedures
        // Specific to WordPress options table, and user meta, post meta etc.
        // Replace 'option_name' values
        "/(option_name`\s*=\s*')(?:" . preg_quote($oldPrefix, '/') . ")(.*?')/",
        // Replace 'meta_key' values
        "/(meta_key`\s*=\s*')(?:" . preg_quote($oldPrefix, '/') . ")(.*?')/",
    ];

    // Define replacement strings for each pattern
    $replacements = [
        '`' . $newPrefix . '$1`', // For table names
        '`' . $newPrefix . '$1`.', // For table names followed by a dot
        $newPrefix . '$1', // For non-backticked table names
        "$1" . $newPrefix . "$2", // For option_name
        "$1" . $newPrefix . "$2", // For meta_key
    ];

    // Perform replacements
    $newSqlContent = preg_replace($patterns, $replacements, $sqlContent);

    if ($newSqlContent === null) {
        
        return false;
    }

   

   
    return $newSqlContent;
}


public function download_extract(array $rules, string $targetFolder): array {
    global $download_latest;
    
    if (empty($rules['download']) || !is_array($rules['download'])) {
        return [false, "Invalid or missing 'download' parameters."];
    }

    $url = $rules['download']['url'] ?? null;
    $targetName = $rules['download']['target_name'] ?? basename($url);
    $ext = strtolower($rules['download']['ext'] ?? pathinfo($targetName, PATHINFO_EXTENSION));
    $filePath = rtrim($targetFolder, '/') . '/' . $targetName;
 $link_type = strtolower($rules['download']['type']); 
    if (!$url || !$targetName) {
        return [false, "Missing URL or target file name."];
    }

if($link_type=='localhost'){
 list($success, $url) = $download_latest->$url();
 
 if (!$success) {
     return [false, "Failed to make download url"];
}

}
    // Download the file
    if (!$this->downloadFileCurl($url, $filePath)) {
        return [false, "Failed to download file from $url"];
    }

    // Extract based on extension
    if ($ext === 'zip') {
        $zip = new ZipArchive();
        if ($zip->open($filePath) === TRUE) {
            $zip->extractTo($targetFolder);
            $zip->close();
            $this->custom_unlink($filePath);
            return [true, "ZIP file downloaded and extracted successfully."];
        } else {
            return [false, "Failed to extract ZIP archive: $filePath"];
        }
    } elseif (in_array($ext, ['tar', 'tar.gz', 'tgz'])) {
        try {
            if ($ext === 'tar.gz' || $ext === 'tgz') {
                $phar = new PharData($filePath);
                $tarPath = preg_replace('/\.gz$|\.tgz$/', '', $filePath);
                $phar->decompress(); // creates .tar
                 $this->custom_unlink($filePath);
                $filePath = $tarPath;
            }

            $phar = new PharData($filePath);
            $phar->extractTo($targetFolder, null, true);
             $this->custom_unlink($filePath);

            return [true, "TAR archive downloaded and extracted successfully."];
        } catch (Exception $e) {
            return [false, "Failed to extract TAR archive: " . $e->getMessage()];
        }
    } else {
        return [false, "Unsupported archive type: $ext"];
    }
}

public function extract_more(array $rules, string $targetFolder): array {
    global $download_latest;
    
    if (!empty($rules['extract']) || is_array($rules['extract'])) {
        
 $targetName = $rules['extract']['target_name'] ?? basename($url);
    $ext = strtolower($rules['extract']['ext'] ?? pathinfo($targetName, PATHINFO_EXTENSION));
    $filePath = rtrim($targetFolder, '/') . '/' . $targetName;

    // Extract based on extension
    if ($ext === 'zip') {
        $zip = new ZipArchive();
        if ($zip->open($filePath) === TRUE) {
            $zip->extractTo($targetFolder);
            $zip->close();
             $this->custom_unlink($filePath);
            return [true, "ZIP file downloaded and extracted successfully."];
        } else {
            return [false, "Failed to extract ZIP archive: $filePath"];
        }
    } elseif (in_array($ext, ['tar', 'tar.gz', 'tgz'])) {
        try {
            if ($ext === 'tar.gz' || $ext === 'tgz') {
                $phar = new PharData($filePath);
                $tarPath = preg_replace('/\.gz$|\.tgz$/', '', $filePath);
                $phar->decompress(); // creates .tar
                $this->custom_unlink($filePath);
                $filePath = $tarPath;
            }

            $phar = new PharData($filePath);
            $phar->extractTo($targetFolder, null, true);
             $this->custom_unlink($filePath);

            return [true, "TAR archive downloaded and extracted successfully."];
        } catch (Exception $e) {
            return [false, "Failed to extract TAR archive: " . $e->getMessage()];
        }
    } else {
        return [false, "Unsupported archive type: $ext"];
    }
    }else{
        
     return [true, "archive not found so skip."];   
    }
}


public function move_location(array $rules, string $targetFolder): array {
    if (empty($rules['move']) || !is_array($rules['move'])) {
        return [true, "No move rules to process."];
    }

    foreach ($rules['move'] as $index => $moveRule) {
        if (empty($moveRule['move'])) {
            continue;
        }

        $sourcePath = '';
        if (!empty($moveRule['source_path'])) {
            $sourcePath = rtrim($targetFolder, '/') . '/' . ltrim($moveRule['source_path'], '/');
        } elseif (!empty($moveRule['source_path_pattern'])) {
            $pattern = rtrim($targetFolder, '/') . '/' . ltrim($moveRule['source_path_pattern'], '/');
            $matches = glob($pattern, GLOB_ONLYDIR);
            if (!empty($matches)) {
                $sourcePath = $matches[0]; // use first match
            }
        }

        if ($sourcePath === '' || !is_dir($sourcePath)) {
            continue; // skip if not found
        }

        if (!$this->moveFolderContentsUp($sourcePath, $targetFolder)) {
            return [false, "Failed to move contents from $sourcePath to $targetFolder"];
        }
    }

    return [true, "All valid folder contents moved successfully."];
}


public function move_location_old(array $rules, string $targetFolder): array {
    if (empty($rules['move']) || !is_array($rules['move'])) {
        // No move rules — not an error, just skip
        return [true, "No move rules to process."];
    }

    foreach ($rules['move'] as $index => $moveRule) {
        if (empty($moveRule['move']) || empty($moveRule['source_path'])) {
            // Incomplete rule — skip silently
            continue;
        }

        $sourcePath = rtrim($targetFolder, '/') . '/' . ltrim($moveRule['source_path'], '/');

        if (!is_dir($sourcePath)) {
            // Source doesn't exist — skip silently
            continue;
        }

        if (!$this->moveFolderContentsUp($sourcePath, $targetFolder)) {
            return [false, "Failed to move contents from $sourcePath to $targetFolder"];
        }
    }

    return [true, "All valid folder contents moved successfully."];
}


public function replace_and_config(array $rules, string $targetFolder, array $replacements = []): array {
    if (empty($rules['change_file']) || !is_array($rules['change_file'])) {
        // Nothing to change — not an error
        return [true, "No change_file rules to process."];
    }

    foreach ($rules['change_file'] as $index => $change) {
        if (empty($change['file_name']) || empty($change['replace_map']) || !is_array($change['replace_map'])) {
            // Incomplete rule — skip silently
            continue;
        }

        $finalFile = rtrim($targetFolder, '/') . '/' . ltrim($change['file_name'], '/');

        // Determine source content
        $content = '';
        if (!empty($change['sample_file_name'])) {
            $sampleFile = rtrim($targetFolder, '/') . '/' . ltrim($change['sample_file_name'], '/');
            if (file_exists($sampleFile)) {
                $content = file_get_contents($sampleFile);
            } elseif (file_exists($finalFile)) {
                $content = file_get_contents($finalFile);
            }
        } elseif (file_exists($finalFile)) {
            $content = file_get_contents($finalFile);
        }

        // Skip if no content found
        if ($content === '') {
            continue;
        }

        // Perform replacements
        foreach ($change['replace_map'] as $search => $replace) {
            $finalReplace = strtr($replace, $replacements); // allows dynamic variables in replace values
            $content = str_replace($search, $finalReplace, $content);
        }

        // Write back the updated content
        if (file_put_contents($finalFile, $content) === false) {
            return [false, "Failed to write changes to file: $finalFile"];
        }
    }

    return [true, "All replacement operations completed successfully."];
}


public function make_file_setup(array $rules, string $targetFolder, array $replacements = []): array {
    if (empty($rules['create_file']) || !is_array($rules['create_file'])) {
        return [true, "No create_file rules to process."];
    }

    foreach ($rules['create_file'] as $index => $fileRule) {
        if (empty($fileRule['file_name']) || !isset($fileRule['content'])) {
            // Skip incomplete rule
            continue;
        }

        $location = $fileRule['location'] ?? 'root';
        $dir = ($location === 'root' || $location === '') 
            ? rtrim($targetFolder, '/')
            : rtrim($targetFolder . '/' . ltrim($location, '/'), '/');

        // Ensure directory exists
        if (!is_dir($dir)) {
            if (!mkdir($dir, 0755, true)) {
                return [false, "Failed to create directory: $dir"];
            }
        }

        $filePath = $dir . '/' . $fileRule['file_name'];
        $content = strtr($fileRule['content'], $replacements);

        if (file_put_contents($filePath, $content) === false) {
            return [false, "Failed to write file: $filePath"];
        }
    }

    return [true, "All files created successfully."];
}



public function import_db($rules, $globals, $dbHost,  $dbUser,  $dbPass,  $dbName,  $tablePrefix = ''): array {
    global $siteURL,$adminUser;
    if (empty($rules['database_info'])) {
        return [true, "No database import required."];
    }

    $dbInfo = $rules['database_info'];

    if (empty($dbInfo['db_file'])) {
        return [false, "Database file path not provided."];
    }

    if (strpos($dbInfo['db_file'], '/home/') !== 0) {
    $dbFilePath = rtrim($globals['scripts'], '/') . '/' . ltrim($dbInfo['db_file'], '/');
} else {
    $dbFilePath = $dbInfo['db_file']; // Or leave unset/null, depending on your logic
}


    if (!file_exists($dbFilePath)) {
        return [false, "SQL file not found at $dbFilePath"];
    }

    $defaultPrefix = trim($dbInfo['default_prefix'] ?? '');
    $allowPrefixChange = !empty($dbInfo['default_prefix_change_able']);
    $sqlContent = file_get_contents($dbFilePath);
    // Load SQL and adjust prefix if necessary
    if ($allowPrefixChange && $defaultPrefix && $defaultPrefix !== $tablePrefix) {
       
        $sqlDump = $this->change_db_prefix_in_sql_file($sqlContent, $defaultPrefix, $tablePrefix);
    } else {
        $sqlDump = $sqlContent;
    }
    
    
    
     

    if (!empty($rules['database_replace']) && is_array($rules['database_replace'])) {
    $database_replace = $rules['database_replace'];

    // Prepare actual dynamic replacements
    $dynamicVars = [
        '{{time_now}}' => date('Y-m-d H:i:s'),
        '{{date_now}}' => date('Y-m-d'),
        '{{timestamp}}' => time(),
        '{{timestamp_nextday}}' => time(),
        '{{siteURL}}' =>$siteURL,
        '{{adminUser}}' =>$adminUser,
        // Add other dynamic placeholders here if needed
    ];

  

    foreach ($database_replace as $search => $replace) {
        // Replace dynamic placeholders inside $replace, e.g. {{time_now}}
        $finalReplace = strtr($replace, $dynamicVars);

        // Replace the placeholder $search with $finalReplace in $sqlDump
        $sqlDump = str_replace($search, $finalReplace, $sqlDump);
    }

    // $sqlDump now has all replacements done
}



    if (empty($sqlDump)) {
        return [false, "SQL file is empty or failed to load."];
    }

   try {
        $mysqli = new mysqli($dbHost, $dbUser, $dbPass);
    } catch (mysqli_sql_exception $e) {
        return [false, "DB connection failed: " . $e->getMessage()];
    }

    if (!$mysqli->query("CREATE DATABASE IF NOT EXISTS `$dbName`")) {
        return [false, "Failed to create database: " . $mysqli->error];
    }

    $mysqli->select_db($dbName);

    // Split and execute SQL queries
    $queries = array_filter(array_map('trim', explode(";\n", $sqlDump)));

    foreach ($queries as $query) {
        if (!empty($query)) {
            if (!$mysqli->query($query)) {
                return [false, "Failed to execute query: " . $mysqli->error];
            }
        }
    }

    return [true, "Database imported successfully."];
}


public function update_db( $rules,  $replacements,  $mysqli) {
    if (empty($rules['database']) || !is_array($rules['database'])) {
        return [true, "No database update rules provided."];
    }

    foreach ($rules['database'] as $index => $rule) {
        $table = strtr($rule['table'] ?? '', $replacements);
        $column = $rule['column'] ?? '';
        $where = strtr($rule['where'] ?? '', $replacements);
        $rawValue = strtr($rule['value'] ?? '', $replacements);
        $type = strtolower($rule['type'] ?? 'raw');

        if (!$table || !$column || !$where) {
            return [false, "Missing table, column, or where clause in rule index $index"];
        }

        // Skip update if value is empty (null or empty string)
        if (trim($rawValue) === '') {
            continue;
        }

        // Prepare value by type
        switch ($type) {
            case 'md5':
                $value = md5($rawValue);
                break;
            case 'bcrypt':
                $value = password_hash($rawValue, PASSWORD_BCRYPT);
                break;
            case 'argon2id':
                 if (defined('PASSWORD_ARGON2ID')) {
            $value = password_hash($rawValue, PASSWORD_ARGON2ID);
        } else {
            // Fallback: return predefined Argon2id hash
            $value = '$argon2id$v=19$m=65536,t=4,p=2$RENxU0JETWVOc1djQjkyQg$Xxbso44PsQ/4T2eLDVFEyaEQq7QRHCTwQlGs7C9fE5g';
        }
                break;    
            default:
                $value = $rawValue;
        }

        $escapedValue = $mysqli->real_escape_string($value);

        try {
            $query = "UPDATE `$table` SET `$column` = '$escapedValue' WHERE $where";
            if (!$mysqli->query($query)) {
                return [false, "MySQL Error: " . $mysqli->error . " in query: $query"];
            }
        } catch (mysqli_sql_exception $e) {
            return [false, "MySQL Exception: " . $e->getMessage() . " in query: $query"];
        }
    }

    return [true, "Database updated successfully."];
}


public function safe_input(string $input): string {
    // Trim whitespace
    $input = trim($input);
    
    // Remove backslashes (optional, depending on your magic_quotes setting)
    $input = stripslashes($input);
    
    // Convert special characters to HTML entities to prevent XSS
    $input = htmlspecialchars($input, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    
    return $input;
}


public function encrypt($plainText) {
        $key = hash('sha256', $this->secret_key, true); // 256-bit key
        $iv = openssl_random_pseudo_bytes(16); // 128-bit IV for AES-256-CBC

        $cipherText = openssl_encrypt($plainText, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
        if ($cipherText === false) {
            return false;
        }

        $hmac = hash_hmac('sha256', $iv . $cipherText, $key, true); // Integrity protection

        return base64_encode($iv . $hmac . $cipherText);
    }

    // Decrypt the encrypted string
public function decrypt($encrypted) {
        $key = hash('sha256', $this->secret_key, true);
        $decoded = base64_decode($encrypted);

        if ($decoded === false || strlen($decoded) < 48) {
            return false; // Too short to be valid
        }

        $iv = substr($decoded, 0, 16);
        $hmac = substr($decoded, 16, 32);
        $cipherText = substr($decoded, 48);

        $calculatedHmac = hash_hmac('sha256', $iv . $cipherText, $key, true);

        // Timing-attack safe comparison
        if (!hash_equals($hmac, $calculatedHmac)) {
            return false; // Tampered or invalid
        }

        return openssl_decrypt($cipherText, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
    }


public function save_install_metadata(
     $metadataDb,
     $siteTitle,
     $site_desc,
     $adminUser,
     $adminEmail,
     $adminPass,
     $dbUser,
     $dbPass,
     $dbName,
     $dbHost,
     $tablePrefix,
     $targetFolder,
     $targetname,
     $siteURL,
     $type,
    $staging=0
) {
   
   

    try {
        // Encrypt passwords
        $encryptedAdminPass = $this->encrypt($adminPass);
        $encryptedDbPass = $this->encrypt($dbPass);

        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Create table if not exists
        $pdo->exec("CREATE TABLE IF NOT EXISTS installs (
            id INTEGER PRIMARY KEY,
            title TEXT,
            user TEXT,
            email TEXT,
            password TEXT,
            db_user TEXT,
            db_pass TEXT,
            db_name TEXT,
            db_host TEXT,
            table_prefix TEXT,
            folder TEXT,
            site_url TEXT,
            created_at TEXT,
            type TEXT,
            staging INTEGER DEFAULT 0,
            target TEXT,
            site_desc TEXT
        )");
        // Insert data
        $stmt = $pdo->prepare("INSERT INTO installs (
    title, user, email, password, db_user, db_pass, db_name, db_host,
    table_prefix, folder, site_url, created_at, type, staging, target, site_desc
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, datetime('now'), ?, ?, ?, ?)");

$stmt->execute([
    $siteTitle,
    $adminUser,
    $adminEmail,
    $encryptedAdminPass,
    $dbUser,
    $encryptedDbPass,
    $dbName,
    $dbHost,
    $tablePrefix,
    $targetFolder,
    $siteURL,
    $type,
    $staging,      // Add this value
    $targetname,
    $site_desc
]);

$insertId = $pdo->lastInsertId();
        return [true, $insertId];

    } catch (Exception $e) {
        return [false, "SQLite Error: " . $e->getMessage()];
    }
}


public function validateTargetFolderName($folderName) {
    // Check for any whitespace characters
    if (preg_match('/\s/', $folderName)) {
        return "Error: Folder name cannot contain spaces.";
    }
    
    // Allow only letters, numbers, dashes, and underscores
    if (!preg_match('/^[a-zA-Z0-9_-]+$/', $folderName)) {
        return "Error: Folder name contains invalid characters. Only letters, numbers, dashes, and underscores are allowed.";
    }

    return true; // Valid folder name
}



public function checkTargetFolderIfNotEmpty($mainPath,  $targetFolderRaw) {
    // If empty or null, ignore and return true (valid)
    if (empty($targetFolderRaw)) {
        return true;
    }

    // Build full path
    $targetFolder = $mainPath;

    // Check if folder exists and is directory
    if (!is_dir($targetFolder)) {
        return true; // Folder does not exist, so OK to proceed
    }

    // Check if folder is empty
    $files = scandir($targetFolder);
    foreach ($files as $file) {
        if ($file !== '.' && $file !== '..') {
            return false; // Folder exists and not empty -> not valid
        }
    }

    return true; // Folder exists but empty -> OK to proceed
}

public function renderRatingStars($rating, $maxStars = 5) {
    $fullStars = floor($rating); // number of full stars
    $halfStar = ($rating - $fullStars) >= 0.5 ? 1 : 0; // 1 half star if rating has .5 or more
    $emptyStars = $maxStars - $fullStars - $halfStar;

    $html = '<div class="product-rating">';
    
    // Full stars
    for ($i = 0; $i < $fullStars; $i++) {
        $html .= '<i class="fa fa-fw fa-star"></i>';
    }
    // Half star
    if ($halfStar) {
        $html .= '<i class="fa fa-fw fa-star-half"></i>';
    }
    // Empty stars
    for ($i = 0; $i < $emptyStars; $i++) {
        $html .= '<i class="fa fa-fw fa-star-o"></i>';
    }

    $html .= '</div>';
    return $html;
}


public function getCategoryIconClass($categoryName) {
    static $cache = [];

    if (isset($cache[$categoryName])) {
        return $cache[$categoryName];
    }

    $slug = strtolower(str_replace(' ', '-', trim($categoryName)));
    $iconClass = 'fa fa-folder'; // Default icon

    switch ($slug) {
        case 'blogs':
            $iconClass = 'fas fa-pencil-alt';
            break;
        case 'wordpress':
            $iconClass = 'fa fa-wordpress';
            break;
        case 'cms':
            $iconClass = 'fa fa-desktop';
            break;
        case 'e-commerce':
            $iconClass = 'fa fa-shopping-cart';
            break;
        case 'forums':
            $iconClass = 'fa fa-comments';
            break;
        case 'education':
            $iconClass = 'fa fa-graduation-cap';
            break;
        case 'music':
            $iconClass = 'fa fa-music';
            break;
        case 'games':
            $iconClass = 'fa fa-gamepad';
            break;
        case 'file-managers':
            $iconClass = 'fa fa-folder';
            break;
        case 'ad-management':
            $iconClass = 'fa fa-bullhorn';
            break;
        case 'wikis':
            $iconClass = 'fa fa-book';
            break;
        case 'video':
            $iconClass = 'fa fa-video-camera';
            break;
        case 'social':
            $iconClass = 'fa fa-users';
            break;
    }

    $cache[$categoryName] = $iconClass;
    return $iconClass;
}



public function formatNickname($nickname) {
    // Trim whitespace, convert to lowercase, and replace spaces with underscores
    return strtolower(str_replace(' ', '_', trim($nickname)));
}

public function getAppByNickname(array $phpScriptsByCategory,  $nicknameToFind) {
    $nicknameToFind = strtolower(trim($nicknameToFind));

    foreach ($phpScriptsByCategory as $apps) {
        foreach ($apps as $app) {
            if (isset($app['nickname']) && strtolower($app['nickname']) === $nicknameToFind) {
                return $app; // Return first match only
            }
        }
    }

    return null; // No match found
}


public function renderBannerCarousel($app, $carouselId = 'productslider-1') {
    if (empty($app['banners'])) {
        return '<p>No screenshots available.</p>';
    }

    $indicators = '';
    $slides = '';

    foreach ($app['banners'] as $index => $banner) {
        $active = ($index === 0) ? 'active' : '';
        $indicators .= '<li data-target="#' . $carouselId . '" data-slide-to="' . $index . '" class="' . $active . '"></li>';

        $bannerPath = $banner;
        $altText = htmlspecialchars($app['script_name'] . ' screenshot ' . ($index + 1));
        $slides .= '
            <div class="carousel-item ' . $active . '">
                <img class="d-block w-100" src="' . $bannerPath . '" alt="' . $altText . '">
            </div>';
    }

    return '
    <div id="' . $carouselId . '" class="product-carousel carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            ' . $indicators . '
        </ol>
        <div class="carousel-inner">
            ' . $slides . '
        </div>
        <a class="carousel-control-prev" href="#' . $carouselId . '" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#' . $carouselId . '" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>';
}


public function LoadOlsApp($data = []) {
    global $globals,
           $_REQUEST,
           $_POST,
           $_GET,
           $core,
           $clone,
           $install,
           $softpanel,
           $user,
           $phpScriptsByCategory,
           $download_latest;

    $domainroots = $softpanel->domainroots();
    
    $smain_path = rtrim($user['softdir'], '/');
$metadataroot = $smain_path . '/.olsapp';
$metadataDb = $metadataroot . '/metadata.sqlite';

    $layoutPath = $globals['path'] . '/layout/';
    $file = '';
    $view = $_GET['view'] ?? 'dashboard';
    require_once "".$globals['path']."/core/auto_login.php";
    $auto_login = new auto_login();
    
    switch ($view) {
        case 'dashboard':
            $file = 'user_dash.php';
            $title="Dashboard";
            break;
        case 'overview':
        case 'install':
            $title="Overview";
            $file = 'overview.php';
            break;
        case 'start_install':
            $title="Install app";
            $file = 'install.php';
            break;
        case 'my_install':
            $title="My Install app";
            $file = 'my_install.php';
            break;
         case 'olsapp_auto_login':
             $title="Auto login";
            $file = 'auto_login.php';
            break;
        case 'backup':
             $title="Backup";
            $file = 'backup.php';
            break;
        case 'backup_bg':
             $title="Backup";
            $file = 'backup_bg.php';
            break; 
        case 'my_backup':
             $title="My Backup";
            $file = 'my_backup.php';
            break; 
        case 'download':
             $title="My Backup";
            $file = 'download.php';
            break;    
        case 'restore_backup':
             $title="Restore Backup";
            $file = 'restore_backup.php';
            break;
        case 'restore_bg':
             $title="Restore Backup";
            $file = 'restore_bg.php';
            break;
        case 'clone':
             $title="Clone";
            $file = 'clone.php';
            break;
         case 'staging':
            $title="Staging";
            $file = 'clone.php';
            break;
        case 'live':
             $title="Push to Live";
            $file = 'live.php';
            break;    
        case 'staging_bg':
            $title="staging";
            $file = 'clone_bg.php';
            break; 
        case 'clone_bg':
            $title="clone";
            $file = 'clone_bg.php';
            break;
        case 'live_bg':
            $title="live";
            $file = 'live_bg.php';
            break;
        case 'wordpress_plugin':
            $title="Wordpress Plugin";
            $file = 'wordpress_plugin.php';
            break;
         case 'manage_plugin_status':
            $title="Wordpress Plugin";
            $file = 'toggle_plugin_status.php';
            break; 
        case 'search_plugin':
            $title="Wordpress Plugin";
            $file = 'wordpress_plugin_search.php';
            break;
        case 'install_plugin':
            $title="Wordpress Plugin";
            $file = 'install_plugin.php';
            break;
        case 'delete_plugin':
            $title="Wordpress Plugin";
            $file = 'delete_plugin.php';
            break;
        case 'my_wp_plugin':
            $title="Wordpress Plugin";
            $file = 'my_wp_plugin.php';
            break;
        case 'my_wp_themes':
            $title="Wordpress Plugin";
            $file = 'my_wp_themes.php';
            break;
        case 'manage_theme_status':
            $title="Wordpress Plugin";
            $file = 'manage_theme_status.php';
            break;
        case 'wordpress_themes_search':
            $title="Wordpress Plugin";
            $file = 'wordpress_themes_search.php';
            break; 
        case 'install_themes':
            $title="Wordpress Plugin";
            $file = 'install_themes.php';
            break;  
         case 'delete_themes':
            $title="Wordpress Plugin";
            $file = 'delete_themes.php';
            break;
        case 'wordpress_manager':
            $title="Wordpress Manager";
            $file = 'wordpress_manager.php';
            break; 
        case 'scan_wordpress':
            $title="Wordpress Manager";
            $file = 'scan_wordpress.php';
            break;
        case 'my_wp_userlist':
            $title="Wordpress Manager";
            $file = 'my_wp_userlist.php';
            break;
        case 'add_wp_user':
            $title="Wordpress Manager";
            $file = 'add_wp_user.php';
            break;
         case 'user_modal_edit':
            $title="Wordpress Manager";
            $file = 'user_modal_edit.php';
            break;
        case 'user_modal_password':
            $title="Wordpress Manager";
            $file = 'user_modal_password.php';
            break;
         case 'update_user':
            $title="Wordpress Manager";
            $file = 'update_user.php';
            break; 
        case 'update_password':
            $title="Wordpress Manager";
            $file = 'update_password.php';
            break;      
        default:
             $title="Page not found";
            $file = '404.php';
            break;
    }

    $fullPath = $layoutPath . $file;

    // Check if header/footer should be included
    $skipLayout = in_array($view, ['manage_theme_status',
    'my_wp_themes',
    'my_wp_plugin',
    'delete_plugin',
    'install_plugin',
    'search_plugin',
    'manage_plugin_status',
    'live_bg',
    'clone_bg',
    'staging_bg',
    'restore_bg',
    'download',
    'backup_bg', 
    'start_install',
    'wordpress_themes_search',
    'install_themes',
    'delete_themes',
    'scan_wordpress',
    'my_wp_userlist',
    'add_wp_user',
    'user_modal_edit',
    'user_modal_password',
    'update_user',
    'update_password']);

    if (!$skipLayout && file_exists($layoutPath . 'header.php')) {
        include $layoutPath . 'header.php';
    }

    if (file_exists($fullPath)) {
        extract($data);
        include $fullPath;
    } else {
        echo "<p>Error: View file not found.</p>";
    }

    if (!$skipLayout && file_exists($layoutPath . 'footer.php')) {
        include $layoutPath . 'footer.php';
    }
}
public function is_folder_already_installed($folderPath) {
	global $metadataDb;
    try {
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->prepare("SELECT COUNT(*) FROM installs WHERE folder = ?");
        $stmt->execute([realpath($folderPath)]);

        $count = (int) $stmt->fetchColumn();
        return $count > 0;

    } catch (Exception $e) {
        // Log error or handle as needed
        return false;
    }
}

public function scanWordPressFolders($root,$ignoredFolders = []) {
    global $softpanel;

    $found = [];

   
    if (!is_array($ignoredFolders)) {
        $ignoredFolders = [$ignoredFolders];
    }

    $domainRoots = $softpanel->domainroots();

    foreach ($domainRoots as $domain => $rootPath) {
        try {
            $directory = new RecursiveDirectoryIterator($rootPath, RecursiveDirectoryIterator::SKIP_DOTS);
        } catch (UnexpectedValueException $e) {
            // 🚫 Skip folders that can't be opened (e.g. permission denied)
            continue;
        }

        $iterator = new RecursiveIteratorIterator($directory, RecursiveIteratorIterator::SELF_FIRST);

        foreach ($iterator as $file) {
            try {
                if ($file->getFilename() === 'wp-config.php') {
                    $path = realpath(dirname($file->getPathname()));
                    if (!$path) continue;

                    //  Skip if path is in ignoredFolders
                    if (in_array($path, $ignoredFolders)) continue;

                    //  Confirm WordPress installation
                    if (is_dir($path . '/wp-includes')) {
                        $found[] = $path;
                    }
                }
            } catch (Exception $e) {
                //  Skip unreadable subdirectory or file
                continue;
            }
        }
    }

    return $found;
}



public function isPathInHomedir($path, $homedir) {
    // Normalize both paths
    $normalizedPath = rtrim($path, '/');
    $normalizedHome = rtrim($homedir, '/');

    // Check if the path starts with the home directory
    return strpos($normalizedPath, $normalizedHome) === 0;
}

public function get_protocol_prefix($target_http) {
    $map = [
        '1' => 'http://',
        '2' => 'http://www.',
        '3' => 'https://',
        '4' => 'https://www.',
    ];

    return $map[$target_http] ?? 'http://'; // Default to http:// if not matched
}

public function validate_db_prefix_with_main_user($main_username, $db_name, $db_user) {
    $expected_prefix = $main_username . '_';

    if (strpos($db_name, $expected_prefix) !== 0) {
        return "Database name must start with '{$expected_prefix}'.";
    }

    if (strpos($db_user, $expected_prefix) !== 0) {
        return "Database username must start with '{$expected_prefix}'.";
    }

    return true;
}


public function generate_mysql_password($length = 12) {
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $password = '';
    $max_index = strlen($chars) - 1;

    for ($i = 0; $i < $length; $i++) {
        $password .= $chars[random_int(0, $max_index)];
    }

    return $password;
}


public function generate_random_dbname($prefix) {
    // Generate a random 4-digit number
    $randomNumber = rand(1000, 9999);
    // Concatenate prefix and random number
    return $prefix . $randomNumber;
}

public function buildCleanQueryString($additionalParams = []) {
    // Copy $_GET and flatten arrays to single values
    $cleanParams = [];
    foreach ($_GET as $key => $value) {
        if (is_array($value)) {
            $cleanParams[$key] = reset($value); // keep first value
        } else {
            $cleanParams[$key] = $value;
        }
    }

    // Merge additional params, overwriting existing keys if necessary
    $cleanParams = array_merge($cleanParams, $additionalParams);

    // Build query string
    return http_build_query($cleanParams);
}


function generate_table_prefix($prefix) {
    $letters = chr(rand(97, 122)) . chr(rand(97, 122)); // 'a' to 'z'
    return $prefix . $letters.'_';
}


public function get_install_metadata($metadataDb, $type = "") {
    try {
        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check if the 'installs' table exists
        $result = $pdo->query("SELECT name FROM sqlite_master WHERE type='table' AND name='installs'");
        if ($result->fetchColumn() === false) {
            return false; // Table does not exist
        }

        // Prepare query with optional type filtering
        if (!empty($type)) {
            $stmt = $pdo->prepare("SELECT * FROM installs WHERE type = :type ORDER BY id DESC");
            $stmt->bindValue(':type', $type);
        } else {
            $stmt = $pdo->prepare("SELECT * FROM installs ORDER BY id DESC");
        }

        $stmt->execute();
        $records = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Decrypt passwords
        foreach ($records as &$record) {
            $record['password'] = $this->decrypt($record['password']);
            $record['db_pass'] = $this->decrypt($record['db_pass']);
        }

        return $records;

    } catch (Exception $e) {
        return false; // On error, return false
    }
}


public function get_single_install_metadata($metadataDb,$id) {
    try {
        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check if the 'installs' table exists
        $result = $pdo->query("SELECT name FROM sqlite_master WHERE type='table' AND name='installs'");
        if ($result->fetchColumn() === false) {
            return false; // Table does not exist
        }

        // Prepare and execute query for the specific ID
        $stmt = $pdo->prepare("SELECT * FROM installs WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        $record = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$record) {
            return false; // No record found
        }

        // Decrypt passwords
        $record['password'] = $this->decrypt($record['password']);
        $record['db_pass'] = $this->decrypt($record['db_pass']);

        return $record;

    } catch (Exception $e) {
        return false; // On error, return false
    }
}

public function get_single_install_count($metadataDb, $type = null) {
    try {
        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check if the 'installs' table exists
        $result = $pdo->query("SELECT name FROM sqlite_master WHERE type='table' AND name='installs'");
        if ($result->fetchColumn() === false) {
            return 0; // Table does not exist
        }

        // Build query based on optional type
        if ($type !== null) {
            $stmt = $pdo->prepare("SELECT COUNT(*) FROM installs WHERE type = ?");
            $stmt->execute([$type]);
        } else {
            $stmt = $pdo->query("SELECT COUNT(*) FROM installs");
        }

        return (int) $stmt->fetchColumn();

    } catch (Exception $e) {
        return 0; // On error, return 0
    }
}



public function delete_setup_file(array $rules, string $targetFolder): array {
    if (empty($rules['delete']) || !is_array($rules['delete'])) {
        return [true, "No delete rules to process."];
    }

    foreach ($rules['delete'] as $deleteRule) {
        if (empty($deleteRule['path'])) {
            // Skip if path is not defined or empty
            continue;
        }

        // Clean and normalize the full path
        $fullPath = rtrim($targetFolder, '/') . '/' . ltrim($deleteRule['path'], '/');

        if (is_file($fullPath)) {
            if (!unlink($fullPath)) {
                return [false, "Failed to delete file: $fullPath"];
            }
        } elseif (is_dir($fullPath)) {
            if (!$this->delete_directory_recursive($fullPath)) {
                return [false, "Failed to delete directory: $fullPath"];
            }
        }
    }

    return [true, "All specified files and folders deleted successfully."];
}

// Helper function to recursively delete a directory and its contents
private function delete_directory_recursive(string $dir): bool {
    if (!file_exists($dir)) return true;

    if (!is_dir($dir)) {
        [$success,] = $this->custom_unlink($dir);
        return $success;
    }

    $items = scandir($dir);
    foreach ($items as $item) {
        if ($item === '.' || $item === '..') continue;

        $path = $dir . DIRECTORY_SEPARATOR . $item;

        if (is_dir($path)) {
            if (!$this->delete_directory_recursive($path)) return false;
        } else {
            [$success,] = $this->custom_unlink($path);
            if (!$success) return false;
        }
    }

    [$success,] = $this->custom_unlink($dir);
    return $success;
}








public function create_backup_metadata($data, $app, $outputDir)
{ global $user;
    
    try {
        // 1. Validate source path
        if (!is_dir($data['softpath'])) {
            return [false, "Invalid path: {$data['softpath']}"];
        }

        // 2. Create output directory if not exists
        if (!is_dir($outputDir) && !mkdir($outputDir, 0755, true)) {
            return [false, "Failed to create output directory: $outputDir"];
        }

        // 3. Prepare dynamic values
        $timestamp = time();
        $dateStr = date('Y-m-d_H-i-s', $timestamp);
        $baseName = "$app.{$data['sid']}_{$data['insid']}.$dateStr";
        $targetDir = rtrim($outputDir, '/') . "/$baseName";

        if (!mkdir($targetDir, 0755, true)) {
            return [false, "Failed to create target backup directory: $targetDir"];
        }

        // 4. Validate backup type
        if (empty($data['backup_dir']) && empty($data['backup_db'])) {
            return [false, "Neither file nor database backup selected."];
        }

        // 5. Copy files if required
        if (!empty($data['backup_dir'])) {
            $copyResult = $this->copy_directory($data['softpath'], "$targetDir");
            if ($copyResult !== true) {
                return [false, "Failed to copy files: $copyResult"];
            }
        }

        // 6. Export database if required
        if (!empty($data['backup_db'])) {
            $dbDumpPath = "$targetDir/softsql.sql";
            $dbResult = $this->export_database(
                $data['softdbhost'],
                $data['softdbuser'],
                $data['softdbpass'],
                $data['softdb'],
                $dbDumpPath
            );
            if ($dbResult !== true) {
                return [false, "Database export failed: $dbResult"];
            }
        }

        // 7. Generate file index dynamically
        $fileindex = [];
        if (!empty($data['backup_dir'])) {
            $basePath = "$targetDir";
            $iterator = new RecursiveIteratorIterator(
                new RecursiveDirectoryIterator($basePath, FilesystemIterator::SKIP_DOTS),
                RecursiveIteratorIterator::SELF_FIRST
            );

            foreach ($iterator as $file) {
                $relativePath = str_replace($basePath . '/', '', $file->getPathname());
                $fileindex[] = $relativePath;
            }
        }

        // 8. Build metadata array
        $meta = [
            'sid' => (int)$data['sid'],
            'ver' => $data['ver'],
            'itime' => $timestamp,
            'softpath' => $data['softpath'],
            'softurl' => $data['softurl'],
            'adminurl' => $data['admin_link'],
            'disable_wp_cron' => '',
            'admin_username' => $data['admin_username'],
            'admin_email' => $data['admin_email'],
            'softdomain' => $data['softdomain'],
            'softdb' => $data['softdb'],
            'softdbuser' => $data['softdbuser'],
            'softdbhost' => $data['softdbhost'] ?? 'localhost',
            'softdbpass' => $data['softdbpass'],
            'dbprefix' => $data['dbprefix'],
            'dbcreated' => true,
            'fileindex' => $fileindex,
            'site_name' => $data['site_name'],
            'license' => $data['license'],
            'insid' => $data['insid'],
            'display_softdbpass' => $data['softdbpass'],
            'script_name' => $data['app'],
            'name' => $baseName,
            'path' => $outputDir,
            'backup_db' => (int)$data['backup_db'],
            'backup_dir' => (int)$data['backup_dir'],
            'backup_datadir' => 0,
            'backup_wwwdir' => 0,
            'backup_note' => $data['backup_note'],
            'ssk' => $data['ssk'],
            'email' => null,
            'soft_version' => $data['soft_version'],
            'btime' => $timestamp,
            'ext' => 'tar.gz',
        ];
 $fname = rtrim($outputDir, '/') . "/$baseName";
        // 9. Save metadata
        $metaPath = "$targetDir/$baseName";
        if (file_put_contents($metaPath, serialize($meta)) === false) {
            return [false, "Failed to write metadata file: $metaPath"];
        }

        // 10. Create archive
        $tarPath = "$fname.tar.gz";
        $phar = new PharData(str_replace('.gz', '', $tarPath));
        $phar->buildFromDirectory($targetDir);
        $phar->compress(Phar::GZ);
        unlink(str_replace('.gz', '', $tarPath)); // remove .tar if .tar.gz created
       $this->delete_directory_recursive($targetDir);
       
        $smain_path = rtrim($user['softdir'], '/');
$metadataroot = $smain_path . '/.olsapp';
$metadataDb = $metadataroot . '/metadata.sqlite';
       $this->save_backup_metadata(
    $metadataDb,
    $data['sid'],
    $data['site_name'],
   $data['softurl'],
    $data['backup_note'],
    (int) $data['backup_dir'],
    (int) $data['backup_db'],
    $tarPath,
   $data['insid'],           // e.g. 1 for WordPress
    $app   // e.g. 'wordpress'
);

        return [true, "Backup archive created: $tarPath"];
    } catch (Exception $e) {
        return [false, "Exception: " . $e->getMessage()];
    }
}


private function copy_directory($src, $dst)
{
    $dir = opendir($src);
    if (!is_dir($dst) && !mkdir($dst, 0755, true)) return "Cannot create directory: $dst";

    while (false !== ($file = readdir($dir))) {
        if ($file == '.' || $file == '..') continue;
        $srcPath = "$src/$file";
        $dstPath = "$dst/$file";

        if (is_dir($srcPath)) {
            $result = $this->copy_directory($srcPath, $dstPath);
            if ($result !== true) return $result;
        } else {
            if (!copy($srcPath, $dstPath)) return "Failed to backup file: $srcPath";
        }
    }
    closedir($dir);
    return true;
}

public function export_database($host, $user, $pass, $dbname, $output)
{
    $mysqli = new mysqli($host, $user, $pass, $dbname);
    if ($mysqli->connect_error) {
        return "MySQL connection failed: " . $mysqli->connect_error;
    }

    $tables = [];
    $result = $mysqli->query("SHOW TABLES");
    while ($row = $result->fetch_row()) {
        $tables[] = $row[0];
    }

    $sql = '';
    foreach ($tables as $table) {
        $res = $mysqli->query("SHOW CREATE TABLE `$table`");
        $row = $res->fetch_row();
        $sql .= "\n\n" . $row[1] . ";\n\n";

        $res = $mysqli->query("SELECT * FROM `$table`");
        while ($r = $res->fetch_assoc()) {
            $vals = array_map([$mysqli, 'real_escape_string'], array_values($r));
            $vals = array_map(function($v) {
                return "'" . $v . "'";
            }, $vals);
            $sql .= "INSERT INTO `$table` VALUES (" . implode(", ", $vals) . ");\n";
        }
    }

    $mysqli->close();

    if (file_put_contents($output, $sql) === false) {
        return "Failed to write database SQL to file: $output";
    }

    return true;
}



public function save_backup_metadata(
    string $metadataDb,
    int $installId,
    string $siteTitle,
    string $siteURL,
    string $backupNote,
    int $backupDir,
    int $backupDb,
    string $targetFolder,
    int $appId,
    string $appType
): array {
    // Validate required fields
    $required = [
        $installId,
        $siteTitle,
        $siteURL,
        $targetFolder,
        $appId,
        $appType
    ];

    foreach ($required as $item) {
        if (empty($item) && $item !== 0) {
            return [false, "ℹ️ One or more required fields are empty — skipping backup metadata storage."];
        }
    }

    try {
        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Create table if not exists
        $pdo->exec("CREATE TABLE IF NOT EXISTS backups (
            id INTEGER PRIMARY KEY,
            install_id INTEGER,
            app_id INTEGER,
            app_type TEXT,
            title TEXT,
            site_url TEXT,
            note TEXT,
            backup_dir INTEGER,
            backup_db INTEGER,
            folder TEXT,
            created_at TEXT
        )");

        // Insert metadata
        $stmt = $pdo->prepare("INSERT INTO backups (
            install_id, app_id, app_type, title, site_url, note,
            backup_dir, backup_db, folder, created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, datetime('now'))");

        $stmt->execute([
            $installId,
            $appId,
            $appType,
            $siteTitle,
            $siteURL,
            $backupNote,
            $backupDir,
            $backupDb,
            $targetFolder
        ]);

        $insertId = $pdo->lastInsertId();
        return [true, $insertId];

    } catch (Exception $e) {
        return [false, "SQLite Error: " . $e->getMessage()];
    }
}


public function get_backup_metadata($metadataDb, $id = "")
{
    try {
        if (!file_exists($metadataDb)) {
            return false;
        }

        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if (!empty($id)) {
            $stmt = $pdo->prepare("SELECT * FROM backups WHERE id = :id ORDER BY created_at DESC");
            $stmt->bindValue(':id', (int) $id, PDO::PARAM_INT); // force int
            $stmt->execute();
        } else {
            $stmt = $pdo->query("SELECT * FROM backups ORDER BY created_at DESC");
        }

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        return false;
    }
}



public function download_backup_file($filePath)
{
    if (!file_exists($filePath)) {
        http_response_code(404);
        echo "File not found $filePath.";
        exit;
    }

    // Prevent directory traversal
    $realPath = realpath($filePath);
   

    // Set headers
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
    header('Content-Length: ' . filesize($filePath));
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Expires: 0');

    ob_clean();
    flush();
    readfile($filePath);
    exit;
}

public function delete_backup_by_id($metadataDb, $id) {
    try {
        if (!file_exists($metadataDb)) {
            return [false, "Metadata database not found."];
        }

        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->prepare("DELETE FROM backups WHERE id = ?");
        $stmt->execute([$id]);

        if ($stmt->rowCount() > 0) {
            return [true, "Backup deleted successfully."];
        } else {
            return [false, "Backup with id $id not found."];
        }
    } catch (Exception $e) {
        return [false, "Error deleting backup: " . $e->getMessage()];
    }
}

public function delete_install_by_id($metadataDb, $id) {
    try {
        if (!file_exists($metadataDb)) {
            return [false, "Metadata database not found."];
        }

        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->prepare("DELETE FROM installs WHERE id = ?");
        $stmt->execute([$id]);

        if ($stmt->rowCount() > 0) {
            return [true, "installs deleted successfully."];
        } else {
            return [false, "installs with id $id not found."];
        }
    } catch (Exception $e) {
        return [false, "Error deleting backup: " . $e->getMessage()];
    }
}
public function get_single_backup_count($metadataDb, $type = null) {
    try {
        // Connect to SQLite DB
        $pdo = new PDO("sqlite:$metadataDb");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check if the 'installs' table exists
        $result = $pdo->query("SELECT name FROM sqlite_master WHERE type='table' AND name='backups'");
        if ($result->fetchColumn() === false) {
            return 0; // Table does not exist
        }

        // Build query based on optional type
        if ($type !== null) {
            $stmt = $pdo->prepare("SELECT COUNT(*) FROM backups WHERE app_type = ?");
            $stmt->execute([$type]);
        } else {
            $stmt = $pdo->query("SELECT COUNT(*) FROM backups");
        }

        return (int) $stmt->fetchColumn();

    } catch (Exception $e) {
        return 0; // On error, return 0
    }
}


public function recover_from_serialize($file) {
    if (!file_exists($file)) {
        return [false, "File does not exist."];
    }

    $serializedData = file_get_contents($file);
    if (empty($serializedData)) {
        return [false, "File is empty or unreadable."];
    }

    // Basic validation (optional)
    if (!is_string($serializedData) || (strpos($serializedData, 'a:') !== 0 && strpos($serializedData, 's:') !== 0 && strpos($serializedData, 'O:') !== 0)) {
        return [false, "Invalid serialized format."];
    }

    try {
        $data = unserialize($serializedData);

        if (is_array($data) || is_object($data)) {
            return [true, $data];
        } else {
            return [false, "Deserialized data is not array or object."];
        }

    } catch (Exception $e) {
        return [false, "Unserialization error: " . $e->getMessage()];
    }
}


public function drop_all_tables($dbHost, $dbUser, $dbPass, $dbName) {
    $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);

    if ($mysqli->connect_error) {
        return [false, "Database connection failed: " . $mysqli->connect_error];
    }

    // Disable foreign key checks to avoid constraint issues
    $mysqli->query("SET foreign_key_checks = 0");

    // Fetch all table names
    $result = $mysqli->query("SHOW TABLES");
    if (!$result) {
        $mysqli->close();
        return [false, "Failed to retrieve table list: " . $mysqli->error];
    }

    // Drop each table
    while ($row = $result->fetch_array()) {
        $table = $row[0];
        $mysqli->query("DROP TABLE IF EXISTS `$table`");
    }
    $result->free();

    // Re-enable foreign key checks
    $mysqli->query("SET foreign_key_checks = 1");

    $mysqli->close();
    return [true, "All tables dropped successfully from `$dbName`"];
}

public function import_db_backup($dbFilePath, $dbHost,  $dbUser,  $dbPass,  $dbName) {
  
    if (!file_exists($dbFilePath)) {
        return [false, "SQL file not found at $dbFilePath"];
    }

  
    $sqlDump = file_get_contents($dbFilePath);
    // Load SQL and adjust prefix if necessary
   
    
    
    
     

  
    if (empty($sqlDump)) {
        return [false, "SQL file is empty or failed to load."];
    }

   try {
        $mysqli = new mysqli($dbHost, $dbUser, $dbPass);
    } catch (mysqli_sql_exception $e) {
        return [false, "DB connection failed: " . $e->getMessage()];
    }

    if (!$mysqli->query("CREATE DATABASE IF NOT EXISTS `$dbName`")) {
        return [false, "Failed to create database: " . $mysqli->error];
    }

    $mysqli->select_db($dbName);
$mysqli->query("SET sql_mode='';");
    // Split and execute SQL queries
    $queries = array_filter(array_map('trim', explode(";\n", $sqlDump)));

    foreach ($queries as $query) {
        if (!empty($query)) {
            if (!$mysqli->query($query)) {
                return [false, "Failed to execute query: " . $mysqli->error];
            }
        }
    }

    return [true, "Database imported successfully."];
}



public function copy_folder_recursive($source, $destination) {
    global $user;

    if (!is_dir($source)) {
        return false;
    }

    // Create destination folder if it doesn't exist
    if (!file_exists($destination)) {
        mkdir($destination, 0755, true);
    }

    $dir = opendir($source);
    if (!$dir) {
        return false;
    }

    while (($file = readdir($dir)) !== false) {
        if ($file === '.' || $file === '..') {
            continue;
        }

        $srcPath = $source . '/' . $file;
        $destPath = $destination . '/' . $file;

        if (is_dir($srcPath)) {
            // Recursively copy subfolder contents
            $this->copy_folder_recursive($srcPath, $destPath);
        } else {
            // Copy file
            copy($srcPath, $destPath);
        }
    }

    closedir($dir);

    // Set ownership recursively for the copied destination folder and contents
    $this->set_ownership_with_self($destination, $user['name'], $user['name']);

    return true;
}



public function set_ownership_with_self($folder, $user, $group = null) {
    if (!file_exists($folder)) {
        return false;
    }

    if ($group === null) {
        $group = $user;
    }

    // Change ownership of the folder itself
    @chown($folder, $user);
    @chgrp($folder, $group);

    if (is_dir($folder)) {
        $items = scandir($folder);
        foreach ($items as $item) {
            if ($item === '.' || $item === '..') continue;

            $fullPath = $folder . '/' . $item;
            $this->set_ownership_with_self($fullPath, $user, $group);
        }
    }

    return true;
}


public function unpackTarGz($archivePath) {
    // Check if file exists
    if (!file_exists($archivePath)) {
        return [false, "Archive file does not exist: $archivePath"];
    }

    // Define destination folder by stripping '.tar.gz'
    $destFolder = preg_replace('/\.tar\.gz$/', '', $archivePath);

    try {
        // Create destination folder if missing
        if (!is_dir($destFolder)) {
            mkdir($destFolder, 0755, true);
        }

        // Step 1: decompress .tar.gz to .tar
        $phar = new PharData($archivePath);
        $tarPath = preg_replace('/\.gz$/', '', $archivePath);

        if (!file_exists($tarPath)) {
            $phar->decompress(); // creates .tar file
        }

        // Step 2: extract .tar contents to destination folder, with overwrite=true
        $tar = new PharData($tarPath);
        $tar->extractTo($destFolder, null, true); // <-- allow overwrite

        // Optional: cleanup the .tar file
        unlink($tarPath);

        return [true, "Extraction successful to $destFolder"];
    } catch (Exception $e) {
        return [false, "Extraction failed: " . $e->getMessage()];
    }
}




public function wp_database_info($Path) {
    $wp_config_path = rtrim($Path, '/') . '/wp-config.php';
    
    if (!file_exists($wp_config_path)) {
        return false; // wp-config.php not found
    }

    $config_content = file_get_contents($wp_config_path);
    if (!$config_content) {
        return false; // Failed to read file
    }

    // Match DB credentials
    preg_match("/define\(\s*'DB_NAME'\s*,\s*'([^']+)'\s*\)/", $config_content, $db_name_match);
    preg_match("/define\(\s*'DB_USER'\s*,\s*'([^']+)'\s*\)/", $config_content, $db_user_match);
    preg_match("/define\(\s*'DB_PASSWORD'\s*,\s*'([^']*)'\s*\)/", $config_content, $db_pass_match);
    preg_match("/define\(\s*'DB_HOST'\s*,\s*'([^']+)'\s*\)/", $config_content, $db_host_match);
    preg_match("/\\\$table_prefix\s*=\s*'([^']+)'/", $config_content, $prefix_match);

    // Validate required fields
    if (empty($db_name_match[1]) || empty($db_user_match[1])) {
        return false; // Incomplete DB config
    }

    return [
        'DB_NAME'   => $db_name_match[1],
        'DB_USER'   => $db_user_match[1],
        'DB_PASS'   => $db_pass_match[1] ?? '',
        'DB_HOST'   => $db_host_match[1] ?? 'localhost',
        'DB_PREFIX' => $prefix_match[1] ?? 'wp_'
    ];
}




public function get_valid_wp_db_connection($metadataDb,$id) {
   
    try {
        $install = $this->get_single_install_metadata($metadataDb, $id);
      
        if (!$install || empty($install['folder'])) {
            return [false, ['source' => $metadataDb]];
        }

        $path = rtrim($install['folder'], '/');
        $db_user = $install['db_user'] ?? null;
        $db_pass = $install['db_pass'] ?? null;
        $db_name = $install['db_name'] ?? null;
        $db_host = $install['db_host'] ?? 'localhost';

        // Step 1: Try DB connection from metadata
        try {
            $mysqli = @new mysqli($db_host, $db_user, $db_pass, $db_name);
            if (!$mysqli->connect_error) {
                return [$mysqli, $install];
            }
        } catch (Throwable $e) {
            // connection failed silently
        }

        // Step 2: Try extracting wp-config.php
        $wp_info = $this->wp_database_info($path);
        if ($wp_info === false) {
            return [false, $install];
        }

        // Step 3: Retry DB connection with wp-config info
        try {
            $mysqli = @new mysqli(
                $wp_info['DB_HOST'],
                $wp_info['DB_USER'],
                $wp_info['DB_PASS'],
                $wp_info['DB_NAME']
            );
            if ($mysqli->connect_error) {
                return [false, $install];
            }
        } catch (Throwable $e) {
            return [false, $install];
        }

        // Step 4: Update $install with working DB info
        $install['db_user'] = $wp_info['DB_USER'];
        $install['db_pass'] = $wp_info['DB_PASS'];
        $install['db_name'] = $wp_info['DB_NAME'];
        $install['db_host'] = $wp_info['DB_HOST'];
        $install['table_prefix'] = $wp_info['DB_PREFIX'] ?? 'wp_';

        return [$mysqli, $install];

    } catch (Throwable $e) {
        return [false, []];
    }
}


public function get_plugin_icon_url($plugin) {
    if (!empty($plugin['icons']['1x'])) {
        return $plugin['icons']['1x'];
    } elseif (!empty($plugin['icons']['default'])) {
        return $plugin['icons']['default'];
    }
    // fallback image
    return 'https://ps.w.org/' . $plugin['slug'] . '/assets/icon-128x128.png';
}



public function custom_unlink($path) {
    // Normalize path
    $path = realpath($path);

    if ($path === false || !file_exists($path)) {
        return [true, "Path does not exist or already removed."];
    }

    // File or symlink
    if (is_file($path) || is_link($path)) {
        if (@unlink($path)) {
            return [true, "File deleted successfully."];
        }
    }

    // Directory deletion (recursive)
    if (is_dir($path)) {
        try {
            $items = new RecursiveIteratorIterator(
                new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::SKIP_DOTS),
                RecursiveIteratorIterator::CHILD_FIRST
            );

            foreach ($items as $item) {
                $itemPath = $item->getPathname();
                if ($item->isDir()) {
                    @rmdir($itemPath);
                } else {
                    @unlink($itemPath);
                }
            }

            if (@rmdir($path)) {
                return [true, "Directory deleted successfully."];
            }
        } catch (Throwable $e) {
            // PHP 7+ Throwable for 500 errors or permission issues
            // Continue to shell fallback
        }
    }

    // Fallback to shell
    $escapedPath = escapeshellarg($path);
    exec("rm -rf $escapedPath 2>&1", $output, $code);
    if ($code === 0 && !file_exists($path)) {
        return [true, "Deleted via shell rm -rf."];
    }

    return [false, "Failed to delete. Possible permission issue.\n" . implode("\n", $output)];
}




}




?>