<?php

$soforp_extension_shutdown_redirect = "";

function soforp_extension_shutdown()
{
	global $soforp_extension_shutdown_redirect;
	if ($soforp_extension_shutdown_redirect)
		header("location: " . $soforp_extension_shutdown_redirect);
}

class SoforpController extends Controller
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
			if ($route[1] == 'extension') {
				$this->_route = $route[2];
			} else {
				$this->_route = $route[1];
			}
		} else {
			$this->_route = 'module';
		}

	}

	public function checkLicense()
	{
		global $soforp_extension_shutdown_redirect;

		if (!function_exists('ioncube_file_info')) {
			return $this->ioncube();
		}

		$soforp_extension_shutdown_redirect = str_replace("&amp;", "&", $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName . '/license', 'token=' . $this->session->data['token'], 'SSL'));
		register_shutdown_function('soforp_extension_shutdown');
		require_once(DIR_APPLICATION . "controller/tool/" . $this->_moduleSysName . ".php");
		$soforp_extension_shutdown_redirect = "";
	}

	public function initButtons($data)
	{

		if (!isset($this->request->get['module_id'])) {
			$data['save'] = $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL');
			$data['save_and_close'] = $this->url->link("extension/extension", 'token=' . $this->session->data['token'] . "&close=1", 'SSL');
		} else {
			$data['save'] = $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName, 'module_id=' . $this->request->get['module_id'] . '&token=' . $this->session->data['token'], 'SSL');
			$data['save_and_close'] = $this->url->link("extension/extension", 'module_id=' . $this->request->get['module_id'] . '&token=' . $this->session->data['token'] . "&close=1", 'SSL');
		}

		$data['recheck'] = $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL');
		$data['close'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		$data['clear'] = $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName . '/clear', 'token=' . $this->session->data['token'], 'SSL');
		$data['download'] = $this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName . '/downloadLogFile', 'token=' . $this->session->data['token'], 'SSL');

		return $data;
	}

	public function install()
	{
		$this->load->model("extension/". $this->_route . "/" . $this->_moduleSysName);
		$this->{"model_extension_" . $this->_route . "_" . $this->_moduleSysName}->install();
	}

	public function upgrade()
	{
		$this->load->model("extension/". $this->_route . "/" . $this->_moduleSysName);
		$this->{"model_extension_" . $this->_route . "_" . $this->_moduleSysName}->upgrade();
	}

	public function uninstall()
	{
		$this->load->model("extension/". $this->_route . "/" . $this->_moduleSysName);
		$this->{"model_extension_" . $this->_route . "_" . $this->_moduleSysName}->uninstall();
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

	protected function getLogs($limit = 10000)
	{
		$result = "";
		if (is_file(DIR_LOGS . $this->_logFile)) {
			$file = fopen(DIR_LOGS . $this->_logFile, "r");
			fseek($file, -$limit, SEEK_END);
			$result = fread($file, $limit);
			fclose($file);
		}
		return $result;
	}

	protected function initBreadcrumbs($items, $data)
	{
		$newItems = array_merge(array(array("common/dashboard", "text_home")), $items);

		$data['breadcrumbs'] = array();

		foreach ($newItems as $item) {
			$params = (count($item) > 2) ? $item[2] : '';
			if (isset($this->session->data['token'])) {
				$data['breadcrumbs'][] = array('href' => $this->url->link($item[0], 'token=' . $this->session->data['token'] . $params, 'SSL'), 'text' => $this->language->get($item[1]), 'separator' => (count($this->data['breadcrumbs']) == 0 ? FALSE : ' :: '));
			} else {
				$data['breadcrumbs'][] = array('href' => $this->url->link($item[0], 'SSL'), 'text' => $this->language->get($item[1]), 'separator' => (count($this->data['breadcrumbs']) == 0 ? FALSE : ' :: '));
			}
		}
		return $data;
	}

	protected function initParams($items, $data)
	{

		foreach ($items as $item) {
			if (isset($this->request->post[$item[0]])) {
				$data[$item[0]] = $this->request->post[$item[0]];
			} else if ($this->config->has($item[0])) {
				$data[$item[0]] = $this->config->get($item[0]);
			} else if (isset($item[1])) {
				$data[$item[0]] = $item[1]; // default value
			}
		}

		return $data;
	}

	protected function initParamsList($items, $data)
	{

		foreach ($items as $item) {
			if (isset($this->request->post[$this->_moduleSysName . "_" . $item])) {
				$data[$this->_moduleSysName . "_" . $item] = $this->request->post[$this->_moduleSysName . "_" . $item];
			} else if ($this->config->has($this->_moduleSysName . "_" . $item)) {
				$data[$this->_moduleSysName . "_" . $item] = $this->config->get($this->_moduleSysName . "_" . $item);
			} else {
				$data[$this->_moduleSysName . "_" . $item] = '';
			}
		}

		return $data;
	}

	protected function initModuleParams($items, $data, $moduleName)
	{

		$module_info = null;
		if (isset($this->request->get['module_id'])) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		foreach ($items as $item) {
			$paramName = str_replace($this->_moduleSysName . "_", "", $item[0]);
			if (isset($this->request->post[$item[0]])) {
				$data[$item[0]] = $this->request->post[$item[0]];
			} else if ($module_info && isset($module_info[$paramName])) {
				$data[$item[0]] = $module_info[$paramName];
			} else if (isset($item[1])) {
				$data[$item[0]] = $item[1]; // default value
			}
		}

		return $data;
	}

	protected function initSessionParams($items, $data)
	{
		foreach ($items as $item) {
			if (!is_array($item))
				$item = array($item);

			$param_name = $item[0];
			$session_name = isset($item[1]) ? $item[1] : $item[0];
			$default_value = isset($item[2]) ? $item[2] : '';

			if (isset($this->session->data[$session_name])) {
				$data[$param_name] = $this->session->data[$session_name];
			} else {
				$data[$param_name] = $default_value;
			}
		}

		return $data;
	}

	protected function initConfigParams($items, $data)
	{

		foreach ($items as $item) {
			if (!is_array($item))
				$item = array($item);

			$param_name = $item[0];
			$config_name = isset($item[1]) ? $item[1] : $item[0];

			$data[$param_name] = $this->config->get($config_name);
		}

		return $data;
	}

	protected function addThemeStyle($file)
	{
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/' . $file)) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/' . $file);
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/' . $file);
		}
	}

	protected function outputJson($data)
	{
		$this->response->setOutput(json_encode($data));
	}

	public function license()
	{
		$data = $this->language->load("extension/" . $this->_route . '/' . $this->_moduleSysName);

		$this->document->setTitle($this->language->get('heading_title_raw'));

		$data = $this->initBreadcrumbs(array(
			array("extension/" . $this->_route, "text_module"),
			array($this->_route . '/' . $this->_moduleSysName, "heading_title_raw")
				), $data);

		$data['error_warning'] = "";

		$data = $this->initButtons($data);

		$data['license_error'] = $this->language->get('error_license_missing');

		$data['params'] = $data;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view("extension/" . $this->_route . '/' . $this->_moduleSysName . '.tpl', $data));
	}

	public function ioncube()
	{
		$data = $this->language->load("extension/" . $this->_route . '/' . $this->_moduleSysName);
		$this->document->setTitle($this->language->get('heading_title_raw'));

		$data = $this->initBreadcrumbs(array(
			array("extension/" . $this->_route, "text_module"),
			array($this->_route . '/' . $this->_moduleSysName, "heading_title_raw")
				), $data);

		$data['error_warning'] = "";

		$data = $this->initButtons($data);

		$data['license_error'] = $this->language->get('error_ioncube_missing');

		$data['params'] = $data;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view("extension/" . $this->_route . '/' . $this->_moduleSysName . '.tpl', $data));
	}

	public function error()
	{
		$data = $this->language->load("extension/" . $this->_route . '/' . $this->_moduleSysName);

		$this->document->setTitle($this->language->get('heading_title_raw'));

		$data = $this->initBreadcrumbs(array(
			array("extension/" . $this->_route, "text_module"),
			array($this->_route . '/' . $this->_moduleSysName, "heading_title_raw")
				), $data);

		$data['error_warning'] = "";

		$data = $this->initButtons($data);

		$data['license_error'] = $this->language->get('error_other_errors');

		$data['params'] = $data;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view("extension/" . $this->_route . '/' . $this->_moduleSysName . '.tpl', $data));
	}

	public function clear()
	{
		$this->language->load("extension/" . $this->_route . '/' . $this->_moduleSysName);

		if (is_file(DIR_LOGS . $this->_logFile)) {
			$f = fopen(DIR_LOGS . $this->_logFile, "w");
			fclose($f);
		}

		$this->session->data['success'] = $this->language->get('text_success_clear');

		$this->response->redirect($this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName, 'token=' . $this->session->data['token'].'#tab-logs', 'SSL'));
	}

	public function downloadLogFile()
	{
		$this->language->load("extension/" . $this->_route . '/' . $this->_moduleSysName);
		if (is_file(DIR_LOGS . $this->_logFile) && file_get_contents(DIR_LOGS . $this->_logFile)) {
			$this->response->addheader('Pragma: public');
			$this->response->addheader('Expires: 0');
			$this->response->addheader('Content-Description: File Transfer');
			$this->response->addheader('Content-Type: application/octet-stream');
			$this->response->addheader('Content-Disposition: attachment; filename=' . $this->language->get('heading_title_raw') . '_' . date('Y-m-d_H-i-s', time()) . '_error.log');
			$this->response->addheader('Content-Transfer-Encoding: binary');
			$this->response->setOutput(file_get_contents(DIR_LOGS . $this->_logFile, FILE_USE_INCLUDE_PATH, null));
		} else {
			$this->session->data['error_warning'] = $this->language->get('error_download_logs');
			$this->response->redirect($this->url->link("extension/" . $this->_route . '/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL'));
		}
	}

}
