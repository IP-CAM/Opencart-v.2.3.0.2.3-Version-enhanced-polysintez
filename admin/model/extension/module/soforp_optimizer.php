<?php

require_once( DIR_SYSTEM . "/engine/soforp_model.php");

class ModelExtensionModuleSoforpOptimizer extends SoforpModel {

    public function __construct($registry) {
        parent::__construct($registry);
        $this->_moduleSysName = "soforp_optimizer";
        $this->_logFile = $this->_moduleSysName . ".log";
        $this->debug = $this->config->get($this->_moduleSysName . "_debug") == 1;
    }

    // Install/Uninstall
    public function install() {

        $this->initParamsDefaults(array(
            'status' => 0,
            'debug' => 0,
            'image_dir' => '/cache/',
        ));
    }

    public function upgrade() {

    }

    public function uninstall() {

    }

}
