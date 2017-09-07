<?php

require_once( DIR_SYSTEM . "/engine/soforp_controller.php");

class ControllerExtensionModuleSoforpRedirectManager extends SoforpController {

	private $error = array();

	public function __construct($registry) {
		parent::__construct($registry);
		$this->_moduleSysName = "soforp_redirect_manager";
		$this->_logFile = $this->_moduleSysName . ".log";
		$this->debug = $this->config->get($this->_moduleSysName . "_debug");
	}

	public function index() {
		$this->checkLicense();
		$this->upgrade();

		$data = $this->language->load('extension/module/' . $this->_moduleSysName );

		$this->document->setTitle($this->language->get('heading_title_raw'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting($this->_moduleSysName, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if (isset($_GET["close"])) {
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('extension/' . $this->_route . "/" . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL'));
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
			array("extension/extension", "text_module"),
			array("extension/module/" . $this->_moduleSysName, "heading_title_raw")
		), $data);

		$data = $this->initButtons($data);

		$data = $this->initParamsList(array(
			"status",
			"debug",
			"joomla_status",
			"joomla_product",
			"joomla_category",
			"oscommerce_status",
		), $data);

		$data['params'] = $data;

		$data["logs"] = $this->getLogs();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/' . $this->_moduleSysName .'.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/' . $this->_moduleSysName )) {
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