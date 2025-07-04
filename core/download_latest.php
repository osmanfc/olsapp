<?php
class download_latest{
    
public function fetchUrlContentWithCurl($url, $timeout = 30) {
    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_TIMEOUT => $timeout,
        CURLOPT_SSL_VERIFYPEER => true,
        CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0 Safari/537.36',
        CURLOPT_HTTPHEADER => [
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language: en-US,en;q=0.5',
            'Connection: keep-alive',
        ],
    ]);

    $response = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);

    return $response ?: false;
}


public function getGithubLatestBranchZip($owner, $repo) {
    $apiUrl = "https://api.github.com/repos/$owner/$repo";

    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $apiUrl,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_USERAGENT => 'Appnizo-Agent', // GitHub requires a user-agent
        CURLOPT_HTTPHEADER => [
            'Accept: application/vnd.github.v3+json'
        ]
    ]);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200 || !$response) {
        return false;
    }

    $data = json_decode($response, true);
    if (!isset($data['default_branch'])) {
        return false;
    }

    $branch = $data['default_branch'];
    return "https://github.com/$owner/$repo/archive/refs/heads/$branch.zip";
}


public function drupal() {
    $url = "https://updates.drupal.org/release-history/drupal/current";

    // Load XML from Drupal updates URL
    $xml = @simplexml_load_file($url);
    if ($xml === false) {
        return [false, "Failed to load version info from $url"];
    }

    // Look for latest stable (non-beta/rc/alpha) version with .zip
    foreach ($xml->releases->release as $release) {
        $status = (string)$release->status;
        $version = (string)$release->version;

        // Skip pre-releases
        if ($status === 'published' && !preg_match('/-(beta|alpha|rc)/i', $version)) {
            foreach ($release->files->file as $file) {
                if ((string)$file->archive_type === 'zip') {
                    $downloadUrl = (string)$file->url;
                    return [true, $downloadUrl];
                }
            }
        }
    }

    // Fallback to constructing URL using latest version if loop fails
    $latestVersion = (string)$xml->releases->release[0]->version;
    $fallbackUrl = "https://ftp.drupal.org/files/projects/drupal-$latestVersion.zip";

    return [false, "Could not find a stable .zip in XML, fallback URL: $fallbackUrl"];
}



public function prestashop()
{
    $url = "https://api.prestashop.com/xml/channel.xml";

    // Load XML from PrestaShop
    $xml = @simplexml_load_file($url);
    if ($xml === false) {
        return [false, "Failed to load version info from $url"];
    }

    $latestNum = '';
    $downloadUrl = '';

    foreach ($xml->channel as $channel) {
        if ((string)$channel['name'] === 'stable' && (int)$channel['available'] === 1) {
            foreach ($channel->branch as $branch) {
                if ((int)$branch['available'] === 1) {
                    $num = (string)$branch->num;
                    $link = (string)$branch->download->link;

                    if (str_ends_with($link, '.zip') && version_compare($num, $latestNum, '>')) {
                        $latestNum = $num;
                        $downloadUrl = $link;
                    }
                }
            }
        }
    }

    if ($downloadUrl) {
        return [true, $downloadUrl];
    }

    return [false, "No stable version found"];
}

    
    
public function concrete() {
        $downloadPageUrl = 'https://www.concretecms.org/download';
        $html = $this->fetchUrlContentWithCurl($downloadPageUrl);

        if (!$html) {
            return [false, "Failed to fetch page from " . $downloadPageUrl];
        }

        // --- Debugging: Uncomment to see the fetched HTML ---
        // echo "Fetched HTML:\n" . htmlspecialchars($html) . "\n";
        // exit; // Stop execution to inspect the HTML

        // Updated pattern to be more flexible regarding the domain, but still look for /download_file/
        // This pattern expects href to start with either /download_file/ OR https://www.concretecms.org/download_file/
        // This is more robust as it captures the full path regardless of whether it's relative or absolute in the HTML.
        $pattern = '/<a\s[^>]*href="((?:https:\/\/www\.concretecms\.org)?\/download_file\/[^"]+)"[^>]*>(.*?)<\/a>/is';


        if (preg_match_all($pattern, $html, $matches, PREG_SET_ORDER)) {
            foreach ($matches as $match) {
                // $match[1] will contain the captured URL part (e.g., /download_file/...)
                // $match[2] will contain the inner text (e.g., "Download")

                // Check if the inner text contains "Download"
                if (stripos($match[2], 'Download') !== false) {
                    $extractedUrl = $match[1];
                    // If the URL is relative, prepend the base domain
                    if (strpos($extractedUrl, 'http') === 0) {
                        return [true, $extractedUrl]; // Already an absolute URL
                    } else {
                        return [true, 'https://www.concretecms.org' . $extractedUrl];
                    }
                }
            }
        }

        return [false, "No stable version 'Download' link found on " . $downloadPageUrl];
    }

                                             

public function phpbb() {
    $downloadPageUrl = 'https://www.phpbb.com/downloads/';
    $html = $this->fetchUrlContentWithCurl($downloadPageUrl);

    if (!$html) {
        return [false, "Failed to fetch page from " . $downloadPageUrl];
    }

    // Regex to match phpBB download link on download.phpbb.com without "-stable"
    // Example: https://download.phpbb.com/pub/release/3.3/3.3.15/phpBB-3.3.15.zip
    $pattern = '/href=["\'](https?:\/\/download\.phpbb\.com\/pub\/release\/[\d\.]+\/[\d\.]+\/phpBB-[\d\.]+\.zip)["\']/i';

    if (preg_match_all($pattern, $html, $matches)) {
        // Return the first matched download link
        return [true, $matches[1][0]];
    }else{
        return [true, "https://github.com/osmanfc/olsapp/releases/download/script/phpBB-3.3.15.zip"]; 
        
    }

    return [false, "No stable version download link found on " . $downloadPageUrl];
}

public function codeigniter() {
    $zipUrl = $this->getGithubLatestBranchZip('codeigniter4', 'CodeIgniter4');

    if (!$zipUrl || empty($zipUrl)) {
        return [false, "Failed to fetch download link"];
    }

    return [true, $zipUrl];     
}


 public function opencart() {
        $downloadPageUrl = 'https://www.opencart.com/index.php?route=cms/download/download&download_id=78';
        $html = $this->fetchUrlContentWithCurl($downloadPageUrl);

        if (!$html) {
            return [false, "Failed to fetch page from " . $downloadPageUrl];
        }

        // Adjusted pattern to account for 'opencart-' in the filename
        $pattern = '/href=["\'](https?:\/\/github\.com\/opencart\/opencart\/releases\/download\/[\d\.]+\/opencart-[\d\.]+\.zip)["\']/i';

        if (preg_match_all($pattern, $html, $matches)) {
            // Return the first matched download link
            return [true, $matches[1][0]];
        }

        return [false, "No OpenCart release download link found on " . $downloadPageUrl];
    }

public function kanboard() {
    $zipUrl = $this->getGithubLatestBranchZip('kanboard', 'kanboard');

    if (!$zipUrl || empty($zipUrl)) {
        return [false, "Failed to fetch download link"];
    }

    return [true, $zipUrl];     
}    
    
}