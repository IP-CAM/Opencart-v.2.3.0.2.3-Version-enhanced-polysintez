<?php
set_time_limit(0);

// Configuration
require_once(dirname(__FILE__) . "/../admin/config.php");

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

function delete_dirty_data($result){

	while( true ) {
		$result2 = preg_replace("#(\r).*(\r)#", "\r", $result);
		if( $result2 == $result ) {
			$result = $result2;
			break;
		}
		$result = $result2;
	}
	return $result;
}


function write_log( $message ){
	file_put_contents(DIR_LOGS . "soforp_optimizer.log" , date("Y-m-d H:i:s - ") . $message . "\r\n", FILE_APPEND );
}

// Settings
$query = $db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key`= 'soforp_optimizer_image_dir'");
if($query->num_rows){
	$conf_image_dir = trim($query->row['value']);
}else{
	$conf_image_dir = '/cache/';
}


write_log("Начинаем оптимизировать данные");

$image_dir = rtrim(DIR_IMAGE, "/") . $conf_image_dir;

$dir = new RecursiveDirectoryIterator($image_dir);
$iterator = new RecursiveIteratorIterator($dir);
$files = new RegexIterator( $iterator, '/^.+\.png/i',RecursiveRegexIterator::GET_MATCH);

foreach ($files as $file) {
	$filename = $file[0];

	$cmd = 'pngout -y "' . $filename . '"';
	echo "$cmd\n";
	write_log($cmd);
	$result = shell_exec($cmd);
	echo "$result\n";
	$result = delete_dirty_data($result);
	write_log($result);
}

$dir = new RecursiveDirectoryIterator($image_dir);
$iterator = new RecursiveIteratorIterator($dir);
$files = new RegexIterator($iterator, '/^.+\.jpg/i', RecursiveRegexIterator::GET_MATCH);

foreach ($files as $file) {
	$filename = $file[0];

	$cmd = 'jpegoptim -m85 --all-progressive --strip-all "' . $filename . '"';
	echo "$cmd\n";
	write_log($cmd);
	$result = shell_exec($cmd);
	echo "$result\n";
	$result = delete_dirty_data($result);
	write_log($result);
}
