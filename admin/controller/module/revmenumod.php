<?php
class ControllerModuleRevmenumod extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/revmenumod');
		$this->load->model('tool/image');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('revmenumod', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/revmenumod', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		if(VERSION >= 2.2) {
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type=module', true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL')
			);
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/revmenumod', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/revmenumod', 'token=' . $this->session->data['token'], 'SSL');

		if(VERSION >= 2.2) {
			$data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type=module', true);
		} else {
			$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		}

		if (isset($this->request->post['revmenumod_status'])) {
			$data['revmenumod_status'] = $this->request->post['revmenumod_status'];
		} else {
			$data['revmenumod_status'] = $this->config->get('revmenumod_status');
		}
		
		if (isset($this->request->post['revmenumod'])) {
			$data['revmenumod'] = $this->request->post['revmenumod'];
		} elseif ($this->config->get('revmenumod')) {
			$data['revmenumod'] = $this->config->get('revmenumod');
		} else {
			$data['revmenumod'] = array(
				'tri_level'            => true,
				'icontype'			   => true,
				'icon' 			       => 'fa fa-bars',
				'image' 		       => 'no_image.png',
				'manuf_icontype'	   => true,
				'manuf_icon' 		   => 'fa none',
				'manuf_image' 		   => 'no_image.png',
				'image_in_ico'         => false,
				'on_line_cat'          => false,
				'manuf'       		   => false,
				'n_column'			   => '2'
			);
		}
		$data['revmenumod_thumb'] = $this->model_tool_image->resize($data['revmenumod']['image'], 25, 25);
		$data['revmenumod_manuf_thumb'] = $this->model_tool_image->resize($data['revmenumod']['manuf_image'], 25, 25);
		
		if (isset($this->request->post['revmenumod_link'])) {
			$results = $this->request->post['revmenumod_link'];
		} elseif ($this->config->get('revmenumod_link')) {
			$results = $this->config->get('revmenumod_link');
		} else {
			$results = array();
		}
		
		$data['revmenumod_links'] = array();
		foreach ($results as $result) {
			if ($result['icon']) {
				$icon = $result['icon'];
			} else {
				$icon = 'fa fa-opencart';
			}
			if ($result['image']) {
				$image = $result['image'];
			} else {
				$image = 'no_image.png';
			}
			$data['revmenumod_links'][] = array(
				'icontype'		=> $result['icontype'],
				'icon' 			=> $icon,
				'image' 		=> $image,
				'thumb' 		=> $this->model_tool_image->resize($image, 21, 21),
				'link'          => $result['link'],
				'title'         => $result['title'],
				'sort'  		=> $result['sort']
			);
		}
		$data['revmenumod_links_thumb'] = $this->model_tool_image->resize('no_image.png', 21, 21);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('module/revmenumod', $data));
		} else {
			$this->response->setOutput($this->load->view('module/revmenumod.tpl', $data));
		}
	
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/revmenumod')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}