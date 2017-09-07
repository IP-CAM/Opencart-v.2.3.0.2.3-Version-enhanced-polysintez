<?php

class SoforpModel extends Model
{
	protected $_moduleSysName = "soforp_";
	protected $_logFile = "error.txt";
	protected $debug = false;

	public function __construct($registry)
	{
		parent::__construct($registry);
		$this->_logFile = $this->config->get("config_error_filename");
		if (isset($this->request->get["route"])) {
			$route = explode('/', $this->request->get["route"]);
			if( $route[0] == 'extension' ) {
				$this->_route = $route[1];
			} else {
				$this->_route = $route[0];
			}
		} else {
			$this->_route = 'module';
		}
	}

	protected function debug($message)
	{
		$this->log($message);
	}

	protected function log($message)
	{
		if (!$this->debug)
			return;

		if (file_exists(DIR_LOGS . $this->_logFile) && filesize(DIR_LOGS . $this->_logFile) >= 100 * 1024 * 1024) {
			unlink(DIR_LOGS . $this->_logFile);
		}
		
		file_put_contents(DIR_LOGS . $this->_logFile, date("Y-m-d H:i:s - ") . $message . "\r\n", FILE_APPEND);
	}

	protected function initParamsDefaults($items)
	{
		$params = array();
		foreach($items as $name => $value) {
			$params[$this->_moduleSysName . "_" . $name] = $value;
		}

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting($this->_moduleSysName, $params);
	}

}