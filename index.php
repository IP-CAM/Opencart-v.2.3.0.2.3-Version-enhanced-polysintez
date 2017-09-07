<?php
// Version
define('VERSION', '2.3.0.2.3');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

/* SOFORP Profiler - begin */
require_once(DIR_SYSTEM . "engine/profiler.php");
$GLOBALS['profiler'] = new Profiler();
$begin = $GLOBALS['profiler']->page_started();
/* SOFORP Profiler - end */


// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');

/* SOFORP Profiler - begin */
if(isset($GLOBALS['profiler'])) {
        $GLOBALS['profiler']->page_finished($begin);
}
/* SOFORP Profiler - end */
