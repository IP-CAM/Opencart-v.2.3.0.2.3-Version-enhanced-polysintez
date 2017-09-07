<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleCustomFooter extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/custom_footer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('custom_footer', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_welcome'] = $this->language->get('entry_welcome');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_maps'] = $this->language->get('entry_maps');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_telephone2'] = $this->language->get('entry_telephone2');
		$data['entry_telephone3'] = $this->language->get('entry_telephone3');
		$data['entry_vk'] = $this->language->get('entry_vk');
		$data['entry_fb'] = $this->language->get('entry_fb');
		$data['entry_googleplus'] = $this->language->get('entry_googleplus');
		$data['entry_youtube'] = $this->language->get('entry_youtube');
		$data['entry_twitter'] = $this->language->get('entry_twitter');
		$data['entry_time'] = $this->language->get('entry_time');
		
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_maps'] = $this->language->get('help_maps');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_footer', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_footer', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/custom_footer', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/custom_footer', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['custom_footer_welcome'])) {
			$data['custom_footer_welcome'] = $this->request->post['custom_footer_welcome'];
		} else {
			$data['custom_footer_welcome'] = $this->config->get('custom_footer_welcome');
		}
		
		if (isset($this->request->post['custom_footer_address'])) {
			$data['custom_footer_address'] = $this->request->post['custom_footer_address'];
		} else {
			$data['custom_footer_address'] = $this->config->get('custom_footer_address');
		}

		if (isset($this->request->post['custom_footer_maps'])) {
			$data['custom_footer_maps'] = $this->request->post['custom_footer_maps'];
		} else {
			$data['custom_footer_maps'] = $this->config->get('custom_footer_maps');
		}
		
		if (isset($this->request->post['custom_footer_email'])) {
			$data['custom_footer_email'] = $this->request->post['custom_footer_email'];
		} else {
			$data['custom_footer_email'] = $this->config->get('custom_footer_email');
		}
		
		if (isset($this->request->post['custom_footer_telephone'])) {
			$data['custom_footer_telephone'] = $this->request->post['custom_footer_telephone'];
		} else {
			$data['custom_footer_telephone'] = $this->config->get('custom_footer_telephone');
		}
		
		if (isset($this->request->post['custom_footer_telephone2'])) {
			$data['custom_footer_telephone2'] = $this->request->post['custom_footer_telephone2'];
		} else {
			$data['custom_footer_telephone2'] = $this->config->get('custom_footer_telephone2');
		}
		
		if (isset($this->request->post['custom_footer_telephone3'])) {
			$data['custom_footer_telephone3'] = $this->request->post['custom_footer_telephone3'];
		} else {
			$data['custom_footer_telephone3'] = $this->config->get('custom_footer_telephone3');
		}
		
		if (isset($this->request->post['custom_footer_vk'])) {
			$data['custom_footer_vk'] = $this->request->post['custom_footer_vk'];
		} else {
			$data['custom_footer_vk'] = $this->config->get('custom_footer_vk');
		}
		
		if (isset($this->request->post['custom_footer_fb'])) {
			$data['custom_footer_fb'] = $this->request->post['custom_footer_fb'];
		} else {
			$data['custom_footer_fb'] = $this->config->get('custom_footer_fb');
		}
		
		if (isset($this->request->post['custom_footer_googleplus'])) {
			$data['custom_footer_googleplus'] = $this->request->post['custom_footer_googleplus'];
		} else {
			$data['custom_footer_googleplus'] = $this->config->get('custom_footer_googleplus');
		}
		
		if (isset($this->request->post['custom_footer_youtube'])) {
			$data['custom_footer_youtube'] = $this->request->post['custom_footer_youtube'];
		} else {
			$data['custom_footer_youtube'] = $this->config->get('custom_footer_youtube');
		}
		
		if (isset($this->request->post['custom_footer_twitter'])) {
			$data['custom_footer_twitter'] = $this->request->post['custom_footer_twitter'];
		} else {
			$data['custom_footer_twitter'] = $this->config->get('custom_footer_twitter');
		}
		
		if (isset($this->request->post['custom_footer_time'])) {
			$data['custom_footer_time'] = $this->request->post['custom_footer_time'];
		} else {
			$data['custom_footer_time'] = $this->config->get('custom_footer_time');
		}

		if (isset($this->request->post['custom_footer_status'])) {
			$data['custom_footer_status'] = $this->request->post['custom_footer_status'];
		} else {
			$data['custom_footer_status'] = $this->config->get('custom_footer_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_footer', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/custom_footer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}