<?php
class ControllerRevolutionRevpopuplogin extends Controller {
	
	public function index() {

		$data = array();

		$settings = (array)$this->config->get('revtheme_header_standart_links');

		if (!$settings['popup_login']) {
			return false;
		}
		$this->load->language('revolution/revolution');
		$data['text_revpopuplogin_autoriz'] = $this->language->get('text_revpopuplogin_autoriz');
		$data['text_revpopuplogin_email'] = $this->language->get('text_revpopuplogin_email');
		$data['text_revpopuplogin_pass'] = $this->language->get('text_revpopuplogin_pass');
		$data['text_revpopuplogin_otmena'] = $this->language->get('text_revpopuplogin_otmena');
		$data['text_revpopuplogin_enter'] = $this->language->get('text_revpopuplogin_enter');
		$data['text_revpopuplogin_close'] = $this->language->get('text_revpopuplogin_close');
		$data['text_revpopuplogin_forgotten'] = $this->language->get('text_revpopuplogin_forgotten');
		$data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revpopuplogin', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/template/revolution/revpopuplogin.tpl', $data));
		}

	}
	
	public function login() {
		$json = array();
		
		$this->load->model('account/customer');
		$this->load->language('common/header');
		$this->load->language('revolution/revolution');
		
		$text_account = $this->language->get('text_account');
		$account = $this->url->link('account/account', '', 'SSL');
		
		if (isset($this->request->post['email'])) {
			$mail = $this->request->post['email'];
		} else {
			$mail = '';
		}
		
		if (isset($this->request->post['password'])) {
			$password = $this->request->post['password'];
		} else {
			$password = '';
		}

		if (!$this->customer->login($mail, $password)) {
			$json['error'] = $this->language->get('text_account_warning');
		} else {
			$json['output'] = $this->language->get('text_account_login_uspeh');
			$json['output_button1'] = $account;
			$json['output_button2'] = $text_account;
		}

		if (!$json) {
			$data['email'] = $this->request->post['email'];
			$data['password'] = $this->request->post['password'];		
		}

		if (!$json) {
			unset($this->session->data['guest']);
			unset($this->session->data['shipping_country_id']);	
			unset($this->session->data['shipping_zone_id']);	
			unset($this->session->data['shipping_postcode']);
			unset($this->session->data['payment_country_id']);	
			unset($this->session->data['payment_zone_id']);	
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}

}