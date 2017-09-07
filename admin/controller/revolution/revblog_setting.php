<?php
class ControllerRevolutionRevblogsetting extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('revolution/revblog_setting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('revolution/revblog');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('revblog', $this->request->post, 0 );

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('revolution/revblog_setting', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['tab_mod'] = $this->language->get('tab_mod');
		$data['tab_list'] = $this->language->get('tab_list');
		$data['tab_form'] = $this->language->get('tab_form');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enable'] = $this->language->get('text_enable');
		$data['text_disable'] = $this->language->get('text_disable');
		
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_title2'] = $this->language->get('entry_title2');
		$data['entry_desc_limit'] = $this->language->get('entry_desc_limit');
		$data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_image_thumb'] = $this->language->get('entry_image_thumb');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
		$data['entry_home_vidget'] = $this->language->get('entry_home_vidget');
		$data['entry_share_status'] = $this->language->get('entry_share_status');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');		
				
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['mod_desc_limit'])) {
			$data['error_mod_desc_limit'] = $this->error['mod_desc_limit'];
		} else {
			$data['error_mod_desc_limit'] = '';
		}
		if (isset($this->error['mod_image_width'])) {
			$data['error_mod_image_width'] = $this->error['mod_image_width'];
		} else {
			$data['error_mod_image_width'] = '';
		}		
		if (isset($this->error['mod_image_height'])) {
			$data['error_mod_image_height'] = $this->error['mod_image_height'];
		} else {
			$data['error_mod_image_height'] = '';
		}
		
		if (isset($this->error['list_desc_limit'])) {
			$data['error_list_desc_limit'] = $this->error['list_desc_limit'];
		} else {
			$data['error_list_desc_limit'] = '';
		}
		if (isset($this->error['list_image_width'])) {
			$data['error_list_image_width'] = $this->error['list_image_width'];
		} else {
			$data['error_list_image_width'] = '';
		}		
		if (isset($this->error['list_image_height'])) {
			$data['error_list_image_height'] = $this->error['list_image_height'];
		} else {
			$data['error_list_image_height'] = '';
		}
		
		if (isset($this->error['form_image_width'])) {
			$data['error_form_image_width'] = $this->error['form_image_width'];
		} else {
			$data['error_form_image_width'] = '';
		}		
		if (isset($this->error['form_image_height'])) {
			$data['error_form_image_height'] = $this->error['form_image_height'];
		} else {
			$data['error_form_image_height'] = '';
		}
		
		if (isset($this->error['images_image_width'])) {
			$data['error_images_image_width'] = $this->error['images_image_width'];
		} else {
			$data['error_images_image_width'] = '';
		}		
		if (isset($this->error['images_image_height'])) {
			$data['error_images_image_height'] = $this->error['images_image_height'];
		} else {
			$data['error_images_image_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_blog'),
			'href' => $this->url->link('revolution/revblog_setting', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('revolution/revblog_setting', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['revblog_settings'])) {
			$data['revblog'] = $this->request->post['revblog_settings'];
		} elseif ($this->config->get('revblog_settings')) {
			$data['revblog'] = $this->config->get('revblog_settings');
		} else {
			$data['revblog'] = array(
				'category_image_width'      => '228',
				'category_image_height'     => '228',
				'list_desc_limit'           => '400',
				'list_image_width'          => '80',
				'list_image_height'         => '80',
				'form_image_width'	   		=> '400',
				'form_image_height'			=> '400',
				'images_image_width'	   	=> '213',
				'images_image_height'		=> '213',
				'share_status'				=> true,
				'not_view_null'				=> true
			);
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revblog_setting', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/revblog_setting.tpl', $data));
		}
		
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'revolution/revblog_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!($this->request->post['revblog_settings']['list_desc_limit'])) {
			$this->error['list_desc_limit'] = $this->language->get('error_desc_limit');
		}
		if (!($this->request->post['revblog_settings']['list_image_width'])) {
			$this->error['list_image_width'] = $this->language->get('error_image_width');
		}
		if (!($this->request->post['revblog_settings']['list_image_height'])) {
			$this->error['list_image_height'] = $this->language->get('error_image_height');
		}
		
		if (!($this->request->post['revblog_settings']['form_image_width'])) {
			$this->error['form_image_width'] = $this->language->get('error_image_width');
		}
		if (!($this->request->post['revblog_settings']['form_image_height'])) {
			$this->error['form_image_height'] = $this->language->get('error_image_height');
		}
		
		if (!($this->request->post['revblog_settings']['images_image_width'])) {
			$this->error['images_image_width'] = $this->language->get('error_image_width');
		}
		if (!($this->request->post['revblog_settings']['images_image_height'])) {
			$this->error['images_image_height'] = $this->language->get('error_image_height');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) ) {
			
			$this->load->model('revolution/revblog');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_revolution_revblog->getBlogs($filter_data);

			foreach ($results as $result) {

				$json[] = array(
					'blog_id' => $result['blog_id'],
					'title'   => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		
		$this->response->setOutput(json_encode($json));
	}
}