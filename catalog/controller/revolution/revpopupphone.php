<?php
class ControllerRevolutionRevpopupphone extends Controller {
	public function index() {

		$data = array();

		$this->load->model('catalog/product');
		$this->load->language('revolution/revolution');
		
		$data['popupphone_heading_title'] = $this->language->get('popupphone_heading_title');
		
		$settings = (array)$this->config->get('revtheme_header_popupphone');
		$data['revtheme_header_popupphone'] = $settings;

		$data['enter_firstname'] = $this->language->get('enter_firstname');
		$data['enter_telephone'] = $this->language->get('enter_telephone');
		$data['enter_email'] = $this->language->get('enter_email');
		$data['enter_comment'] = $this->language->get('enter_comment');
		$data['button_shopping'] = $this->language->get('button_shopping');
		$data['button_checkout'] = $this->language->get('button_checkout_popupphone');
		
		$data['firstname'] = ($this->customer->isLogged()) ? $this->customer->getFirstName() : '';
		$data['email'] = ($this->customer->isLogged()) ? $this->customer->getEmail() : '';
		$data['telephone'] = ($this->customer->isLogged()) ? $this->customer->getTelephone() : '';
		$data['telephone_mask'] = $settings['telephone_mask'];
		$data['comment'] = '';

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revpopupphone', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/template/revolution/revpopupphone.tpl', $data));
		}

	}

	public function make_order_phone() {
		$json = array();

		$this->language->load('revolution/revolution');
		$this->load->model('revolution/revolution');
		
		$settings = $this->config->get('revtheme_header_popupphone');

		if (isset($this->request->post['firstname'])) {
			if ((isset($settings['firstname']) && $settings['firstname'] == 2) && (utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
				$json['error']['field']['firstname'] = $this->language->get('error_firstname');
			}
		}

		if (isset($this->request->post['email'])) {
			if (isset($settings['email']) && $settings['email'] == 2) {
				if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
					$json['error']['field']['email'] = $this->language->get('error_email');
				}
			}
		}

		if (isset($this->request->post['telephone'])) {
			if ((isset($settings['telephone']) && $settings['telephone'] == 2) && (utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32) || (preg_match("[_]",$this->request->post['telephone']))) {
				$json['error']['field']['telephone'] = $this->language->get('error_telephone');
			}
		}

		if (isset($this->request->post['comment'])) {
			if ((isset($settings['comment']) && $settings['comment'] == 2) && (utf8_strlen($this->request->post['comment']) < 3) || (utf8_strlen($this->request->post['comment']) > 500)) {
				$json['error']['field']['comment'] = $this->language->get('error_comment');
			}
		}

		if (!isset($json['error'])) {

			$firstname = (isset($this->request->post['firstname'])) ? $this->request->post['firstname'] : '';
			$telephone = (isset($this->request->post['telephone'])) ? $this->request->post['telephone'] : '';
			$email = (isset($this->request->post['email'])) ? $this->request->post['email'] : '';
			$comment = (isset($this->request->post['comment'])) ? $this->request->post['comment'] : '';

			$phone_data = array(
				'firstname'          => $firstname,
				'telephone'          => $telephone,
				'email'          	 => $email,
				'comment'            => $comment
			);	
			
			$this->model_revolution_revolution->SendMail($phone_data);
			
			$json['output'] = $this->language->get('text_success_order_popupphone');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}

}