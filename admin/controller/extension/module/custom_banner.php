<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleCustomBanner extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/custom_banner');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('custom_banner', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_ico'] = $this->language->get('text_ico');
		$data['text_block'] = $this->language->get('text_block');
		$data['text_link'] = $this->language->get('text_link');
		$data['text_target_blank'] = $this->language->get('text_target_blank');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_block_1'] = $this->language->get('entry_block_1');
		$data['entry_block_2'] = $this->language->get('entry_block_2');
		$data['entry_block_3'] = $this->language->get('entry_block_3');
		$data['entry_block_4'] = $this->language->get('entry_block_4');
		
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_target_blank'] = $this->language->get('help_target_blank');
		$data['help_fontawesome'] = $this->language->get('help_fontawesome');

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
				'href' => $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['custom_banner_text_block_1'])) {
			$data['custom_banner_text_block_1'] = $this->request->post['custom_banner_text_block_1'];
		} else {
			$data['custom_banner_text_block_1'] = $this->config->get('custom_banner_text_block_1');
		}
		
		if (isset($this->request->post['custom_banner_text_block_2'])) {
			$data['custom_banner_text_block_2'] = $this->request->post['custom_banner_text_block_2'];
		} else {
			$data['custom_banner_text_block_2'] = $this->config->get('custom_banner_text_block_2');
		}
		
		if (isset($this->request->post['custom_banner_text_block_3'])) {
			$data['custom_banner_text_block_3'] = $this->request->post['custom_banner_text_block_3'];
		} else {
			$data['custom_banner_text_block_3'] = $this->config->get('custom_banner_text_block_3');
		}
		
		if (isset($this->request->post['custom_banner_text_block_4'])) {
			$data['custom_banner_text_block_4'] = $this->request->post['custom_banner_text_block_4'];
		} else {
			$data['custom_banner_text_block_4'] = $this->config->get('custom_banner_text_block_4');
		}
		
		if (isset($this->request->post['custom_banner_link_block_1'])) {
			$data['custom_banner_link_block_1'] = $this->request->post['custom_banner_link_block_1'];
		} else {
			$data['custom_banner_link_block_1'] = $this->config->get('custom_banner_link_block_1');
		}
		
		if (isset($this->request->post['custom_banner_link_block_2'])) {
			$data['custom_banner_link_block_2'] = $this->request->post['custom_banner_link_block_2'];
		} else {
			$data['custom_banner_link_block_2'] = $this->config->get('custom_banner_link_block_2');
		}
		
		if (isset($this->request->post['custom_banner_link_block_3'])) {
			$data['custom_banner_link_block_3'] = $this->request->post['custom_banner_link_block_3'];
		} else {
			$data['custom_banner_link_block_3'] = $this->config->get('custom_banner_link_block_3');
		}
		
		if (isset($this->request->post['custom_banner_link_block_4'])) {
			$data['custom_banner_link_block_4'] = $this->request->post['custom_banner_link_block_4'];
		} else {
			$data['custom_banner_link_block_4'] = $this->config->get('custom_banner_link_block_4');
		}
		
		if (isset($this->request->post['custom_banner_ico_block_1'])) {
			$data['custom_banner_ico_block_1'] = $this->request->post['custom_banner_ico_block_1'];
		} else {
			$data['custom_banner_ico_block_1'] = $this->config->get('custom_banner_ico_block_1');
		}
		
		if (isset($this->request->post['custom_banner_ico_block_2'])) {
			$data['custom_banner_ico_block_2'] = $this->request->post['custom_banner_ico_block_2'];
		} else {
			$data['custom_banner_ico_block_2'] = $this->config->get('custom_banner_ico_block_2');
		}
		
		if (isset($this->request->post['custom_banner_ico_block_3'])) {
			$data['custom_banner_ico_block_3'] = $this->request->post['custom_banner_ico_block_3'];
		} else {
			$data['custom_banner_ico_block_3'] = $this->config->get('custom_banner_ico_block_3');
		}
		
		if (isset($this->request->post['custom_banner_ico_block_4'])) {
			$data['custom_banner_ico_block_4'] = $this->request->post['custom_banner_ico_block_4'];
		} else {
			$data['custom_banner_ico_block_4'] = $this->config->get('custom_banner_ico_block_4');
		}
		
		if (isset($this->request->post['custom_banner_target_block_1'])) {
			$data['custom_banner_target_block_1'] = $this->request->post['custom_banner_target_block_1'];
		} else {
			$data['custom_banner_target_block_1'] = $this->config->get('custom_banner_target_block_1');
		}
		
		if (isset($this->request->post['custom_banner_target_block_2'])) {
			$data['custom_banner_target_block_2'] = $this->request->post['custom_banner_target_block_2'];
		} else {
			$data['custom_banner_target_block_2'] = $this->config->get('custom_banner_target_block_2');
		}
		
		if (isset($this->request->post['custom_banner_target_block_3'])) {
			$data['custom_banner_target_block_3'] = $this->request->post['custom_banner_target_block_3'];
		} else {
			$data['custom_banner_target_block_3'] = $this->config->get('custom_banner_target_block_3');
		}
		
		if (isset($this->request->post['custom_banner_target_block_4'])) {
			$data['custom_banner_target_block_4'] = $this->request->post['custom_banner_target_block_4'];
		} else {
			$data['custom_banner_target_block_4'] = $this->config->get('custom_banner_target_block_4');
		}

		if (isset($this->request->post['custom_banner_status'])) {
			$data['custom_banner_status'] = $this->request->post['custom_banner_status'];
		} else {
			$data['custom_banner_status'] = $this->config->get('custom_banner_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_banner', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/custom_banner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}