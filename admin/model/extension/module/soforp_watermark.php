<?php

require_once( DIR_SYSTEM . "/engine/soforp_model.php");

class ModelExtensionModuleSoforpWatermark extends SoforpModel
{

    public function __construct($registry) {
        parent::__construct($registry);
        $this->_moduleSysName = "soforp_watermark";
        $this->_logFile = $this->_moduleSysName . ".log";
        $this->debug = $this->config->get($this->_moduleSysName . "_debug");
    }

	public function install(){

	}

	public function uninstall(){

	}

	public function upgrade(){

	}

}