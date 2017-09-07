<?php
class ControllerExtensionModuleDocumentation extends Controller {
	private function validateDocumentation() {
		if (stripos($this->request->get['route'], 'extension/module/documentation')!==false) {
			if (isset($this->request->get['product_id']) && (int)$this->request->get['product_id']>0) {
				$this->response->redirect($this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']));
			} else {
				$this->response->redirect($this->url->link('common/home'));
			}
		}
	}

	private function validateGroups() {
		if (!$this->config->get('documentation_customer_group_restrict')) {
			return true;
		}
		$groupid = $this->customer->getGroupId();
		$groupid = (isset($groupid) && (int)$groupid>0)?(int)$groupid:0;
		return !in_array($groupid, $this->config->get('documentation_customer_group_restrict'));
	}

	public function index() {
		$this->validateDocumentation();
		if ($this->validateGroups()) {
			$product_id = 0;
			if (isset($this->request->get['product_id']) && $this->config->get('documentation_status')) {
				$product_id = (int)$this->request->get['product_id'];
			}
			if ($product_id > 0) {
				if (isset($this->request->post['cr_documentation_action']) && $this->request->post['cr_documentation_action']=='load_list') {
					$json = $this->loadData((int)$product_id);
					$sid = $this->session->getId();
					session_write_close();
					$this->session->start($sid);
					header_remove();
					$this->response->addHeader('Content-Type: application/json');
					$this->response->setOutput(json_encode($json));
					$this->response->output();
					exit();
				} else if (isset($this->request->post['cr_documentation_action']) && $this->request->post['cr_documentation_action']=='download' && isset($this->request->post['documentation_id'])) {
					$this->download((int)$product_id, (int)$this->request->post['documentation_id']);
				} else if ($this->config->get('documentation_public_link') && isset($this->request->get['documentation_id'])) {
					$this->download((int)$product_id, (int)$this->request->get['documentation_id']);
				} else if (isset($this->request->get['documentation_id'])) {
					$this->response->redirect($this->url->link('product/product', 'product_id=' . $product_id));
				} else {
					$data['product_url'] = $this->relativeUrl($this->url->link('product/product', 'product_id=' . $product_id));
					$this->load->language('extension/module/documentation');
					$data['tab_documentation_title_default'] = $this->language->get('tab_documentation_title');
					$titles = $this->config->get('documentation_tab_name');
					if (isset($titles[$this->config->get('config_language_id')])) {
						$data['tab_documentation_title'] = $titles[$this->config->get('config_language_id')];
					} else {
						$data['tab_documentation_title'] = false;
					}
					$data['tab_documentation_icon_default'] = ($this->config->get('documentation_show_tab_icon') && $this->config->get('documentation_tab_fa_icon')) ? $this->config->get('documentation_tab_fa_icon') : false;
					$data['text_loading'] = $this->language->get('text_loading');
					$data['show_tab_always'] = $this->config->get('documentation_show_tab_always');

					$data['action'] = 'loadjs';
					$data['product_id'] = $product_id;
					return $this->load->view('extension/module/documentation', $data);
				}
			}
		} else {
			return '';
		}
	}

	private function loadData($product_id) {
		$this->load->language('extension/module/documentation');
		$json = array();
		$product_id = (int)$product_id;
		if ($product_id == 0) {
			$json['documentation'] = $this->language->get('error_loading_docs');
		}
		if (!$json) {
			$this->load->model('extension/module/documentation');
			$data['button_download'] = $this->language->get('button_download');
			$data['documentationRows'] = array();
			$data['product_url'] = $this->relativeUrl($this->url->link('product/product', 'product_id=' . $product_id));
			$documentationData = $this->model_extension_module_documentation->getDocumentationByProduct($product_id);
			if ($documentationData['docs'])
			foreach ($documentationData['docs'] as $documentation_id => $result) {
				$data['documentationRows'][$documentation_id] = array(
					'title'					=> $result['title'],
					'date_modified'			=> $result['date_modified'],
					'date_modified_short'	=> date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
					'date_modified_long'	=> date($this->language->get('date_format_long'), strtotime($result['date_modified'])),
					'size'					=> $this->convertSize($result['size']),
					'ext'					=> $result['ext']
				);
				if ($this->config->get('documentation_public_link')) {
					$data['documentationRows'][$documentation_id]['href'] = $this->relativeUrl($this->url->link('product/product', '&product_id='.$product_id.'&documentation_id=' . $documentation_id));
				} else {
					$data['documentationRows'][$documentation_id]['href'] = false;
				}
			}
			$json['count'] = count($data['documentationRows']);
			$json['count_all'] = $json['count'];
			if ($documentationData['folders']) {
				$data['folders'] = $documentationData['folders'];
				if (count($documentationData['folders'])==1 && $documentationData['folders'][0]['folder_id']>0) {
					if ($this->config->get('documentation_show_tab_icon') && $documentationData['folders'][0]['data']['icon']) {
						$json['tab_icon'] = $documentationData['folders'][0]['data']['icon'];
					} else if ($this->config->get('documentation_show_tab_icon') && $this->config->get('documentation_tab_fa_icon')) {
						$json['tab_icon'] = $this->config->get('documentation_tab_fa_icon');
					} else {
						$json['tab_icon'] = false;
					}
					$json['tab_title'] = $documentationData['folders'][0]['data']['name'];
				} else {
					if ($this->config->get('documentation_show_tab_icon') && $this->config->get('documentation_tab_fa_icon')) {
						$json['tab_icon'] = $this->config->get('documentation_tab_fa_icon');
					} else {
						$json['tab_icon'] = false;
					}
					$json['tab_title'] = false;
					$json['count_all'] = 0;
					foreach ($documentationData['folders'] as $folderData) {
						$json['count_all'] += count($folderData['documents']);
					}
				}
			}
			if (!$data['documentationRows']) {
				$data['text_no_docs'] = $this->language->get('text_no_docs');
			}
			$data['action'] = 'loadtabcontent';
			$json['documentation'] = $this->load->view('extension/module/documentation', $data);
		}
		return $json;
	}

	private function convertSize($bytes) {
		$bytes = (float)$bytes;
		if (!$bytes) {
			return number_format(0,2,$this->language->get('decimal_point'),$this->language->get('thousand_point'))." B";
		}
			$units = array(
			array(
				'unit' => 'Tb',
				'val' => pow(1024, 4)
			),
			array(
				'unit' => 'Gb',
				'val' => pow(1024, 3)
			),
			array(
				'unit' => 'Mb',
				'val' => pow(1024, 2)
			),
			array(
				'unit' => 'Kb',
				'val' => 1024
			),
			array(
				'unit' => 'B',
				'val' => 1
			),
		);
		$bytes = (float)$bytes;
		foreach ($units as $unitData) {
			if ($bytes >= $unitData['val']) {
				$result = number_format($bytes/$unitData['val'],2,$this->language->get('decimal_point'),$this->language->get('thousand_point'))." ".$unitData["unit"];
				break;
			}
		}
		return $result;
	}

	private function download($product_id, $documentation_id) {
		$this->load->model('extension/module/documentation');
		$product_id = (int)$product_id;
		$documentation_id = (int)$documentation_id;
		$documentation_info = $this->model_extension_module_documentation->getDocumentation($product_id, $documentation_id);
		if ($documentation_info) {
			$groupid = $this->customer->getGroupId();
			$groupid = (isset($groupid) && (int)$groupid>0)?(int)$groupid:0;
			if ($documentation_info['customer_groups'] && !in_array($groupid, explode(',', $documentation_info['customer_groups']))) {
				exit('Error: You are not allowed to download this document!');
			}
			$file = DIR_SYSTEM . $this->model_extension_module_documentation->getStorageDir() . $documentation_info['filename'];
			$mask = trim(basename(' '.$documentation_info['mask']));
			if (!headers_sent()) {
				if (file_exists($file) && !empty($mask)) {
					header_remove();
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename*=UTF-8\'\''.rawurlencode($mask ? $mask : basename($file)) . '');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Encoding: none');
					header('Vary: User-Agent');
					header('Content-Length: ' . $this->model_extension_module_documentation->getFileSize($file));
					if (ob_get_level()) {
						ob_end_clean();
					}
					readfile($file);
					exit();
				} else {
					exit('Error: Could not find document "' . $mask . '"!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			exit('Error: No such document!');
		}
	}

	private function relativeUrl($link) {
		return str_replace(array(HTTP_SERVER, HTTPS_SERVER), array('', ''), $link);
	}
}