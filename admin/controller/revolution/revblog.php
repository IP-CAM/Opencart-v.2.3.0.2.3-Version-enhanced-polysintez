<?php
class ControllerRevolutionRevblog extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('revolution/revblog');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revblog');

		$this->getList();
	}

	public function add() {
		
		$this->load->language('revolution/revblog');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revblog');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_revolution_revblog->addBlog($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		
		$this->load->language('revolution/revblog');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revblog');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_revolution_revblog->editBlog($this->request->get['revblog_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('revolution/revblog');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revblog');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $revblog_id) {
				$this->model_revolution_revblog->deleteBlog($revblog_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'bd.title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_list'),
			'href' => $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('revolution/revblog/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('revolution/revblog/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['blogs'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$blog_total = $this->model_revolution_revblog->getTotalBlogs();

		$results = $this->model_revolution_revblog->getBlogs($filter_data);

		foreach ($results as $result) {
			$data['blogs'][] = array(
				'revblog_id'     => $result['revblog_id'],
				'title'       => $result['title'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('revolution/revblog/edit', 'token=' . $this->session->data['token'] . '&revblog_id=' . $result['revblog_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_title'] = $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . '&sort=bd.title' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . '&sort=b.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $blog_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($blog_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($blog_total - $this->config->get('config_limit_admin'))) ? $blog_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $blog_total, ceil($blog_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revblog_list', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/revblog_list.tpl', $data));
		}
		
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['revblog_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_not'] = $this->language->get('text_not');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_date_available'] = $this->language->get('entry_date_available');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_main_category'] = $this->language->get('entry_main_category');
		$data['entry_category'] = $this->language->get('entry_category');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_product'] = $this->language->get('help_product');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_images'] = $this->language->get('tab_image');
		$data['tab_design'] = $this->language->get('tab_design');
		
		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		} else {
			$this->document->addScript('view/javascript/summernote/summernote.js');
			$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
			$this->document->addScript('view/javascript/summernote/opencart.js');
			$this->document->addStyle('view/javascript/summernote/summernote.css');
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		if (isset($this->error['date_available'])) {
			$data['error_date_available'] = $this->error['date_available'];
		} else {
			$data['error_date_available'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_list'),
			'href' => $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['revblog_id'])) {
			$data['action'] = $this->url->link('revolution/revblog/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('revolution/revblog/edit', 'token=' . $this->session->data['token'] . '&revblog_id=' . $this->request->get['revblog_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('revolution/revblog', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['revblog_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$blog_info = $this->model_revolution_revblog->getBlog($this->request->get['revblog_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['revblog_description'])) {
			$data['revblog_description'] = $this->request->post['revblog_description'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$data['revblog_description'] = $this->model_revolution_revblog->getBlogDescriptions($this->request->get['revblog_id']);
		} else {
			$data['revblog_description'] = array();
		}
		
		$filter_data = array(
			'sort'        => 'title',
			'order'       => 'ASC'
		);

		$data['categories'] = $this->model_revolution_revblog->getBlogCategories($filter_data);

		if (isset($this->request->post['main_category_id'])) {
			$data['main_category_id'] = $this->request->post['main_category_id'];
		} elseif (isset($blog_info)) {
			$data['main_category_id'] = $this->model_revolution_revblog->getBlogMainCategoryId($this->request->get['revblog_id']);
		} elseif (isset($this->request->get['filter_category'])) {
			$data['main_category_id'] = $this->request->get['filter_category'];
		} else {
			$data['main_category_id'] = 0;
		}

		if (isset($this->request->post['blog_category'])) {
			$data['blog_category'] = $this->request->post['blog_category'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$data['blog_category'] = $this->model_revolution_revblog->getBlogtoCategories($this->request->get['revblog_id']);
		} elseif (isset($this->request->get['filter_category'])) {
			$data['blog_category'] = array($this->request->get['filter_category']);
		} else {
			$data['blog_category'] = array();
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['blog_store'])) {
			$data['blog_store'] = $this->request->post['blog_store'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$data['blog_store'] = $this->model_revolution_revblog->getBlogStores($this->request->get['revblog_id']);
		} else {
			$data['blog_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($blog_info)) {
			$data['keyword'] = $blog_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($blog_info)) {
			$data['status'] = $blog_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($blog_info)) {
			$data['image'] = $blog_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($blog_info) && is_file(DIR_IMAGE . $blog_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($blog_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['date_available'])) {
			$data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($blog_info)) {
			$data['date_available'] = ($blog_info['date_available'] != '0000-00-00') ? $blog_info['date_available'] : '';
		} else {
			$data['date_available'] = date('Y-m-d');
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($blog_info)) {
			$data['sort_order'] = $blog_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['blog_product'])) {
			$products = $this->request->post['blog_product'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$products = $this->model_revolution_revblog->getBlogProduct($this->request->get['revblog_id']);
		} else {
			$products = array();
		}

		$this->load->model('catalog/product');

		$data['blog_products'] = array();

		foreach ($products as $revblog_id) {
			$product_info = $this->model_catalog_product->getProduct($revblog_id);

			if ($product_info) {
				$data['blog_products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'    => $product_info['name']
				);
			}
		}
		
		if (isset($this->request->post['blog_image'])) {
			$blog_images = $this->request->post['blog_image'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$blog_images = $this->model_revolution_revblog->getBlogImages($this->request->get['revblog_id']);
		} else {
			$blog_images = array();
		}

		$data['blog_images'] = array();

		foreach ($blog_images as $blog_image) {
			if (is_file(DIR_IMAGE . $blog_image['image'])) {
				$image = $blog_image['image'];
				$thumb = $blog_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['blog_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $blog_image['sort_order']
			);
		}

		if (isset($this->request->post['blog_layout'])) {
			$data['blog_layout'] = $this->request->post['blog_layout'];
		} elseif (isset($this->request->get['revblog_id'])) {
			$data['blog_layout'] = $this->model_revolution_revblog->getBlogLayouts($this->request->get['revblog_id']);
		} else {
			$data['blog_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revblog_form', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/revblog_form.tpl', $data));
		}
		
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'revolution/revblog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['revblog_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['revblog_id']) && $url_alias_info['query'] != 'revblog_id=' . $this->request->get['revblog_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['revblog_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'revolution/revblog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}