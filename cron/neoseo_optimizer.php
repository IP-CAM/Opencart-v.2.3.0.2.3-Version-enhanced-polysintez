<?php
set_time_limit(0);

// Configuration
require_once(dirname(__FILE__) . "/../admin/config.php");

if (!isset($_SERVER['SERVER_PORT'])) {
	$_SERVER['SERVER_PORT'] = null;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Config
$config = new Config();
$config->load('default');
$config->load('admin');
$registry->set('config', $config);

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Database
$db = new DB($config->get('db_type'), $config->get('db_hostname'), $config->get('db_username'), $config->get('db_password'), $config->get('db_database'), $config->get('db_port'));
$registry->set('db', $db);

function delete_dirty_data($result) {
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
$query = $db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key`= 'soforp_optimizer_image_dir_list'");
if($query->num_rows){
	$conf_image_dir = trim($query->row['value']);
}else{
	$conf_image_dir = "/image/cache/";
}

// ищем настройку уровень компрессии
$query = $db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key`= 'soforp_optimizer_compress_level'");
if($query->num_rows){
	$compress_level = trim($query->row['value']);
}else{
	$compress_level = 85;
}

$image_dir_links = array();
$image_dir_links = explode("\n", $conf_image_dir);
write_log("Используем следующие директории для поиска изображений: " . print_r($image_dir_links, true));

write_log("Начинаем оптимизировать данные, уровень комрпесии " . $compress_level);



foreach ($image_dir_links as $image_dir){
	$image_dir = trim(str_replace('\\',"/",$image_dir));

	$image_dir = ltrim($image_dir,'/');
	if($image_dir{0} != '/' || $image_dir{0} != '\\'){
		$image_dir = '/'.$image_dir;
	}


	$image_dir =  dirname(dirname(__FILE__)) . $image_dir;
	write_log("Сжимаем картинки в каталоге: " .  $image_dir);
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

		$cmd = 'jpegoptim -m' . $compress_level . ' --all-progressive --strip-all "' . $filename . '"';
		echo "$cmd\n";
		write_log($cmd);
		$result = shell_exec($cmd);
		echo "$result\n";
		$result = delete_dirty_data($result);
		write_log($result);
	}

}

