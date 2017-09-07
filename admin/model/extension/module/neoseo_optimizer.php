<?php

require_once( DIR_SYSTEM . "/engine/neoseo_model.php");

class ModelExtensionModuleNeoSeoOptimizer extends NeoSeoModel {
	public function __construct($registry) {
		parent::__construct($registry);
		$this->_moduleSysName = "neoseo_optimizer";
		$this->_logFile = $this->_moduleSysName . ".log";
		$this->debug = $this->config->get($this->_moduleSysName . "_debug") == 1;
	}

	// Install/Uninstall
	public function install() {
		$this->initParamsDefaults(array(
			'status' => 0,
			'debug' => 0,
			'image_dir_list' => '/image/cache/',
			"compress_level" => 85,
		));
	}

	public function upgrade() {

	}

	public function uninstall() {
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting($this->_moduleSysName, $this->config->get('config_store_id'));
	}
}
