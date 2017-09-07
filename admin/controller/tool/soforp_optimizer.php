<?php

require_once( DIR_SYSTEM . "/engine/soforp_controller.php");

class ControllerToolSoforpOptimizer extends SoforpController
{

	private $error = array();

	public function __construct($registry)
	{
		parent::__construct($registry);
		$this->_moduleSysName = "soforp_optimizer";
		$this->_logFile = $this->_moduleSysName . ".log";
		$this->debug = $this->config->get($this->_moduleSysName . "_debug") == 1;
	}

}