<?php
class ControllerModuleRevblogmod extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/revblogmod');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('revblogmod', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/revblogmod', 'token=' . $this->session->data['token'], 'SSL'));
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
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		if (isset($this->error['news_limit'])) {
			$data['error_news_limit'] = $this->error['news_limit'];
		} else {
			$data['error_news_limit'] = '';
		}
		if (isset($this->error['desc_limit'])) {
			$data['error_desc_limit'] = $this->error['desc_limit'];
		} else {
			$data['error_desc_limit'] = '';
		}
		if (isset($this->error['image_width'])) {
			$data['error_image_width'] = $this->error['image_width'];
		} else {
			$data['error_image_width'] = '';
		}		
		if (isset($this->error['image_height'])) {
			$data['error_image_height'] = $this->error['image_height'];
		} else {
			$data['error_image_height'] = '';
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/revblogmod', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/revblogmod', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/revblogmod', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/revblogmod', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		if(VERSION >= 2.2) {
			$data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type=module', true);
		} else {
			$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		$this->load->model('revolution/revblog');
		$filter_data_blog = array(
			'sort'        => 'title',
			'order'       => 'ASC'
		);
		$data['blog_categories'] = $this->model_revolution_revblog->getBlogCategories($filter_data_blog);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['blog_category_id'])) {
			$data['blog_category_id'] = $this->request->post['blog_category_id'];
		} elseif (!empty($module_info)) {
			$data['blog_category_id'] = $module_info['blog_category_id'];
		} else {
			$data['blog_category_id'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = false;
		}
		
		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($module_info)) {
			$data['title'] = $module_info['title'];
		} else {
			$data['title'] = 'Новости';
		}
		
		if (isset($this->request->post['icon'])) {
			$data['icon'] = $this->request->post['icon'];
		} elseif (!empty($module_info)) {
			$data['icon'] = $module_info['icon'];
		} else {
			$data['icon'] = 'fa none';
		}
		
		if (isset($this->request->post['news_limit'])) {
			$data['news_limit'] = $this->request->post['news_limit'];
		} elseif (!empty($module_info)) {
			$data['news_limit'] = $module_info['news_limit'];
		} else {
			$data['news_limit'] = 5;
		}
		
		if (isset($this->request->post['desc_limit'])) {
			$data['desc_limit'] = $this->request->post['desc_limit'];
		} elseif (!empty($module_info)) {
			$data['desc_limit'] = $module_info['desc_limit'];
		} else {
			$data['desc_limit'] = 180;
		}
		
		if (isset($this->request->post['image_status'])) {
			$data['image_status'] = $this->request->post['image_status'];
		} elseif (!empty($module_info)) {
			$data['image_status'] = $module_info['image_status'];
		} else {
			$data['image_status'] = true;
		}
		
		if (isset($this->request->post['image_width'])) {
			$data['image_width'] = $this->request->post['image_width'];
		} elseif (!empty($module_info)) {
			$data['image_width'] = $module_info['image_width'];
		} else {
			$data['image_width'] = 60;
		}
		
		if (isset($this->request->post['image_height'])) {
			$data['image_height'] = $this->request->post['image_height'];
		} elseif (!empty($module_info)) {
			$data['image_height'] = $module_info['image_height'];
		} else {
			$data['image_height'] = 60;
		}
		
		if (isset($this->request->post['data_status'])) {
			$data['data_status'] = $this->request->post['data_status'];
		} elseif (!empty($module_info)) {
			$data['data_status'] = $module_info['data_status'];
		} else {
			$data['data_status'] = true;
		}
		
		if (isset($this->request->post['slider'])) {
			$data['slider'] = $this->request->post['slider'];
		} elseif (!empty($module_info)) {
			$data['slider'] = $module_info['slider'];
		} else {
			$data['slider'] = false;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('module/revblogmod', $data));
		} else {
			$this->response->setOutput($this->load->view('module/revblogmod.tpl', $data));
		}
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/revblogmod')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if (!($this->request->post['news_limit'])) {
			$this->error['news_limit'] = $this->language->get('error_news_limit');
		}
		if (!($this->request->post['desc_limit'])) {
			$this->error['desc_limit'] = $this->language->get('error_desc_limit');
		}
		if (!($this->request->post['image_width'])) {
			$this->error['image_width'] = $this->language->get('error_image_width');
		}
		if (!($this->request->post['image_height'])) {
			$this->error['image_height'] = $this->language->get('error_image_height');
		}

		return !$this->error;
	}
}