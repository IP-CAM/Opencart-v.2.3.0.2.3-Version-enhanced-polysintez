<?php
class ControllerRevolutionRevsubscribe extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('revolution/revsubscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revsubscribe');

		$this->getList();
	}

	public function add() {
		$this->load->language('revolution/revsubscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revsubscribe');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_revolution_revsubscribe->addPhone($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}

			if (isset($this->request->get['filter_date_created'])) {
				$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
	
	public function edit() {
		$this->load->language('revolution/revsubscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revsubscribe');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_revolution_revsubscribe->editPhone($this->request->get['subscribe_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}

			if (isset($this->request->get['filter_date_created'])) {
				$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('revolution/revsubscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('revolution/revsubscribe');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $subscribe_id) {
				$this->model_revolution_revsubscribe->deletePhone($subscribe_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}

			if (isset($this->request->get['filter_date_created'])) {
				$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_date_created'])) {
			$filter_date_created = $this->request->get['filter_date_created'];
		} else {
			$filter_date_created = null;
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

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_created'])) {
			$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
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
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('revolution/revsubscribe/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('revolution/revsubscribe/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['reviews'] = array();

		$filter_data = array(
			'filter_email'      	=> $filter_email,
			'filter_date_created' 	=> $filter_date_created,
			'order'             	=> $order,
			'start'             	=> ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             	=> $this->config->get('config_limit_admin')
		);

		$pphone_total = $this->model_revolution_revsubscribe->getTotalPhones($filter_data);

		$results = $this->model_revolution_revsubscribe->getPhones($filter_data);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'subscribe_id'  => $result['subscribe_id'],
				'email'      => $result['email'],
				'date_created' => date($this->language->get('date_format_short'), strtotime($result['date_created'])),
				'edit'       => $this->url->link('revolution/revsubscribe/edit', 'token=' . $this->session->data['token'] . '&subscribe_id=' . $result['subscribe_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_telephone'] = $this->language->get('column_telephone');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_comment'] = $this->language->get('column_comment');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

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

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_created'])) {
			$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $pphone_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($pphone_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($pphone_total - $this->config->get('config_limit_admin'))) ? $pphone_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $pphone_total, ceil($pphone_total / $this->config->get('config_limit_admin')));

		$data['filter_email'] = $filter_email;
		$data['filter_date_created'] = $filter_date_created;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revsubscribe', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/revsubscribe.tpl', $data));
		}
		
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['subscribe_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_created'])) {
			$url .= '&filter_date_created=' . $this->request->get['filter_date_created'];
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
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['subscribe_id'])) {
			$data['action'] = $this->url->link('revolution/revsubscribe/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('revolution/revsubscribe/edit', 'token=' . $this->session->data['token'] . '&subscribe_id=' . $this->request->get['subscribe_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('revolution/revsubscribe', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['subscribe_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$pphone_info = $this->model_revolution_revsubscribe->getPhone($this->request->get['subscribe_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($pphone_info)) {
			$data['email'] = $pphone_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['date_created'])) {
			$data['date_created'] = $this->request->post['date_created'];
		} elseif (!empty($pphone_info)) {
			$data['date_created'] = ($pphone_info['date_created'] != '0000-00-00') ? $pphone_info['date_created'] : '';
		} else {
			$data['date_created'] = date('Y-m-d');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revsubscribe_form', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/revsubscribe_form.tpl', $data));
		}
		
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'revolution/revsubscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'revolution/revsubscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}