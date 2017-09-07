<?php

require_once( DIR_SYSTEM . "/engine/soforp_controller.php");

class ControllerExtensionModuleSoforpOptimizer extends SoforpController {

	private $error = array();

	public function __construct($registry) {
		parent::__construct($registry);
		$this->_moduleSysName = "soforp_optimizer";
		$this->_logFile = $this->_moduleSysName . ".log";
		$this->debug = $this->config->get($this->_moduleSysName . "_debug") == 1;
	}

	public function index() {
		$this->checkLicense();
		$this->upgrade();

		$data = $this->language->load('extension/module/' . $this->_moduleSysName);

		$this->document->setTitle($this->language->get('heading_title_raw'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting($this->_moduleSysName, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if (isset($this->request->get['close'])) {
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('extension/module/'.$this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}

		$data = $this->initBreadcrumbs(array(
			array("extension/module", "text_module"),
			array("extension/module/" . $this->_moduleSysName, "heading_title_raw")
		), $data);

		$data = $this->initButtons($data);

		$data = $this->initParamsList(array(
			"status",
			"image_dir",
			"debug",
		), $data);

		$data[$this->_moduleSysName . "_cron"] = "php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		if (PHP_VERSION_ID < 50300) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php52/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 50400) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php53/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 50500) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php54/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 50600) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php55/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 50700) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php56/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 70100) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php70/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else if (PHP_VERSION_ID < 70200) {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php71/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		} else {
			$data[$this->_moduleSysName . "_cron_cpanel"] = "/opt/cpanel/ea-php72/root/usr/bin/php " . realpath(DIR_SYSTEM . "../cron/" . $this->_moduleSysName . ".php");
		}
		// /opt/cpanel/ea-php56/root/usr/bin/php -f /home/prokreat/public_html/cron/soforp_class365.php
		$data[$this->_moduleSysName . "_sync_link"] = ((!empty($_SERVER['HTTPS']) ? 'https://' : 'http://').$_SERVER['SERVER_NAME'].'/'). "cron/" . $this->_moduleSysName . ".php";


		$data['params'] = $data;

		$data["logs"] = $this->getLogs();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/' . $this->_moduleSysName . '.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/' . $this->_moduleSysName)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}

?>