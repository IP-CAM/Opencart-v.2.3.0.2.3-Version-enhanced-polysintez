<?php

/*
 * CSV Price import/export 4 CLI - v2.0.2 (29.09.2016)
 * Require OpenCart 2.0/2.3
 *
 * Email: support@costaslabs.com
 * Website: http://www.costaslabs.com/
 *
 * Changes:
 * 2.0.1 - first release
 *
 */
define('CSVPRICE_PRO_DEBUG', '0');

define('OPENCART_ADMIN_DIR', '/home/user/www/example.com/admin/');

// Config file
if ( file_exists(OPENCART_ADMIN_DIR . 'config.php') ) {
	require_once (OPENCART_ADMIN_DIR . 'config.php');
} else {
	die("ERROR: cli cannot access to config.php");
}

// Check VERSION
$data = file_get_contents(OPENCART_ADMIN_DIR . 'index.php');
preg_match("/define\('VERSION', '([0-9]*\.[0-9]*)/i", $data, $matches);
if ( isset($matches[1]) ) {
	$version = $matches[1];
} else {
	$version = '2.0';
}

// Startup
require_once (DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);


// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");

foreach ( $query->rows as $setting ) {
	if ( !$setting['serialized'] ) {
		$config->set($setting['key'], $setting['value']);
	} else {
		switch ($version) {
			case '2.1':
			case '2.2':
			case '2.3':
			case '2.4':
				$config->set($setting['key'], json_decode($setting['value'], true));
				break;
			default :
				$config->set($setting['key'], unserialize($setting['value']));
				break;
		}
	}
}

// Url
$url = new Url(HTTP_SERVER, $config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);
$registry->set('url', $url);

// log File
$log = new Log(date("Y-m-d") . '_csvprice_cli.log');
$registry->set('log', $log);

function error_handler($errno, $errstr, $errfile, $errline) {
	global $log, $config;

	// error suppressed with @
	if ( error_reporting() === 0 ) {
		return false;
	}

	switch ($errno) {
		case E_NOTICE :
		case E_USER_NOTICE :
			$error = 'Notice';
			break;
		case E_WARNING :
		case E_USER_WARNING :
			$error = 'Warning';
			break;
		case E_ERROR :
		case E_USER_ERROR :
			$error = 'Fatal Error';
			break;
		default :
			$error = 'Unknown';
			break;
	}

	if ( CSVPRICE_PRO_DEBUG ) {
		$log->write('PHP ' . $error . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
	}

	return true;
}

// Error Handler
set_error_handler('error_handler');

// Request
$request = new Request();
$registry->set('request', $request);

// Response
$response = new Response();
$registry->set('response', $response);

// Cache
$registry->set('cache', new Cache('file'));

// Language
$languages = array();

$query = $db->query("SELECT * FROM `" . DB_PREFIX . "language`");

foreach ( $query->rows as $result ) {
	$languages[$result['code']] = $result;
}

$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

// Language
$language = new Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['directory']);
$registry->set('language', $language);

// Default Store
$config->set('config_store_id', 0);

// Event
$event = new Event($registry);
$registry->set('event', $event);

$query = $db->query("SELECT * FROM " . DB_PREFIX . "event");

foreach ( $query->rows as $result ) {
	$event->register($result['trigger'], $result['action']);
}

// Front Controller
$controller = new Front($registry);

// Router
$action = new Action('csvprice_pro/app_cli');

// Dispatch
$controller->dispatch($action, new Action('error/not_found'));

// Output
$response->output();
?>