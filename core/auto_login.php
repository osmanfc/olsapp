<?php
class auto_login{

public function wordpress($filePath, $token) {
    

    $phpContent = <<<PHP
<?php

if (\$_REQUEST['pass'] != '$token') {
    die("Unauthorized Access");
}

if (isset(\$_REQUEST['FLUSH_CACHE'])) {
    @unlink(__FILE__);

    define('WP_USE_THEMES', false);
    require __DIR__ . '/wp-blog-header.php';

    wp_cache_flush();

    \$redirect_to = admin_url();
    if (!empty(\$_REQUEST['redirect_to'])) {
        \$redirect_to = \$_REQUEST['redirect_to'];
    }
    wp_safe_redirect(\$redirect_to);
    exit();
}

\$_SERVER['SCRIPT_NAME'] = '/wp-login.php';

require('wp-blog-header.php');
require('wp-includes/pluggable.php');

if (!is_user_logged_in()) {
    \$signon_user = '';

    if (!empty(\$signon_user) && !preg_match('/^\\[\\[(.*?)\\]\\]\$/is', \$signon_user)) {
        \$user = get_user_by('login', \$signon_user);
    } else {
        \$user_info = get_userdata(1);

        if (empty(\$user_info) || empty(\$user_info->user_login) || !in_array('administrator', \$user_info->roles)) {
            \$admin_id = get_users(['role__in' => ['administrator'], 'number' => 1, 'fields' => ['ID']]);
            \$user_info = get_userdata(\$admin_id[0]->ID);
        }

        \$username = \$user_info->user_login;
        \$user = get_user_by('login', \$username);
    }

    if (!is_wp_error(\$user)) {
        wp_clear_auth_cookie();
        wp_set_current_user(\$user->ID);
        wp_set_auth_cookie(\$user->ID);

        if (file_exists(__DIR__ . '/wp-content/plugins/wp-simple-firewall')) {
            try {
                global \$wpdb;

                \$wpsf_session_id = md5(uniqid('icwp-wpsf'));

                \$wpdb->insert(\$wpdb->prefix . "icwp_wpsf_sessions", [
                    "session_id" => \$wpsf_session_id,
                    "wp_username" => \$user->user_login,
                    "ip" => \$_SERVER['REMOTE_ADDR'],
                    "browser" => md5(\$_SERVER['HTTP_USER_AGENT']),
                    "last_activity_uri" => "/wp-login.php",
                    "logged_in_at" => time(),
                    "last_activity_at" => time(),
                    "login_intent_expires_at" => 0,
                    "secadmin_at" => 0,
                    "created_at" => time(),
                    "deleted_at" => 0,
                ]);

                setcookie("wp-icwp-wpsf", \$wpsf_session_id, time() + DAY_IN_SECONDS * 30);
            } catch (Exception \$e) {}
        }
    }
}

@unlink(__FILE__);

\$redirect_to = admin_url();
if (!empty(\$_REQUEST['redirect_to'])) {
    \$redirect_to = \$_REQUEST['redirect_to'];
}
wp_safe_redirect(\$redirect_to);
exit();

PHP;

    try {
        if (file_put_contents($filePath, $phpContent) !== false) {
            return [true, "✅ index.php created successfully at $filePath"];
        } else {
            return [false, "❌ Failed to write to file: $filePath"];
        }
    } catch (Exception $e) {
        return [false, "❌ Error: " . $e->getMessage()];
    }
}




public function joomla(string $filePath, string $token): array {
    $phpContent = <<<PHP
<?php

@unlink(__FILE__);

if (\$_REQUEST['pass'] != '$token') {
    die("Unauthorized Access");
}

define('_JEXEC', 1);

// Joomla 4.x
if (file_exists(__DIR__ . '/administrator/includes/app.php')) {
    ob_start();
    require_once __DIR__ . '/administrator/includes/app.php';
} else {
    // Joomla 3.x
    if (file_exists(__DIR__ . '/defines.php')) {
        include_once __DIR__ . '/defines.php';
    }

    if (!defined('_JDEFINES')) {
        define('JPATH_BASE', __DIR__ . DIRECTORY_SEPARATOR . 'administrator');
        require_once JPATH_BASE . '/includes/defines.php';
    }

    require_once JPATH_BASE . '/includes/framework.php';
    require_once JPATH_BASE . '/includes/helper.php';
    require_once JPATH_BASE . '/includes/subtoolbar.php';
}

\$app = JFactory::getApplication('administrator');

// Check for a cookie if user is not logged in
if (JFactory::getUser()->get('guest')) {
    \$signon_user = '';
    \$options = array('action' => 'core.login.admin');
    \$instance = Joomla\CMS\User\User::getInstance();
    \$db = JFactory::getDbo();

    if (!empty(\$signon_user) && !preg_match('/^\[\[(.*?)\]\]$/is', \$signon_user)) {
        \$id = (int) Joomla\CMS\User\UserHelper::getUserId(\$signon_user);
    } else {
        \$query = \$db->getQuery(true);
        \$query->select(\$db->quoteName('user_id'))
              ->from(\$db->quoteName('#__user_usergroup_map'))
              ->where(\$db->quoteName('group_id') . ' = 8');
        \$db->setQuery(\$query);
        \$users = \$db->loadColumn();
        \$id = min(\$users);
    }

    if (!\$id) {
        \$app->redirect('administrator/index.php');
        exit();
    }

    \$instance->load(\$id);

    if (\$instance->block == 1) {
        \$app->redirect('administrator/index.php');
        exit();
    }

    \$result = \$instance->authorise(\$options['action']);
    \$instance->guest = 0;

    \$session = Joomla\CMS\Factory::getSession();
    \$oldSessionId = \$session->getId();
    \$session->fork();
    \$session->set('user', \$instance);
    \$app->checkSession();

    \$query = \$db->getQuery(true)
                 ->delete('#__session')
                 ->where(\$db->quoteName('session_id') . ' = ' . \$db->quote(\$oldSessionId));
    \$db->setQuery(\$query)->execute();

    \$instance->setLastVisit();
}

\$app->redirect('administrator/index.php');
exit();

PHP;

    try {
        if (file_put_contents($filePath, $phpContent) !== false) {
            return [true, "✅ index.php created successfully at $filePath"];
        } else {
            return [false, "❌ Failed to write to file: $filePath"];
        }
    } catch (Exception $e) {
        return [false, "❌ Error: " . $e->getMessage()];
    }
}


}

?>