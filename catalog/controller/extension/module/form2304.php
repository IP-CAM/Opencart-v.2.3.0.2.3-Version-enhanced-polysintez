<?php
class ControllerExtensionModuleForm2304 extends Controller {
	private $error = array();
	static $custom_field_id = 0;
	
	public function index($setting) {
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
		$data = array();
		$data['code'] = $setting['code'];
    $data['columns'] = $setting['columns'];
    
    if (isset($setting['openmodal'])){
      $data['openmodal'] = 1;
    }
    else {
      $data['openmodal'] = 0;
    }
		$data['title'] = $setting['title'][(int)$this->config->get('config_language_id')]['name'];
		$data['title_button'] = $setting['title_button'][(int)$this->config->get('config_language_id')]['name'];
		$this->load->model('account/custom_field');
		$data['custom_fields'] = $this->getCustomFields($setting);
		$data['text_select'] = $this->language->get('text_select');
		$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_upload'] = $this->language->get('button_upload');
		
		$this->load->language('extension/module/form2304');
		$data['form_close'] = $this->language->get('form_close');
    $data['window_size'] = $setting['window_size'];
		$data['sec'] = $this->language->get('sec');
		$data['language_code'] = $this->config->get('config_language_id');
		$data['timeout'] = $setting['timeout'];
    $data['site_key'] = $this->config->get('google_captcha_key');
    return $this->load->view('extension/module/form2304', $data);
	}
	public function mail(){
		$this->load->language('extension/module/form2304');
		$this->load->model('extension/module');
		$settings = $this->model_extension_module->getModule($this->request->post['code']);
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate($settings)) {
			$recivers = explode(',',$settings['recivers']);
      
			$this->load->model('account/custom_field');
		  
			$custom_fields = $this->getCustomFields($settings);
			$text = '';
			$attachments = array();
			foreach ($custom_fields as $custom_field) {
			if (!empty($this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']])) {
				$text .= $custom_field['name'] . ": ";
				if ($custom_field['type'] == 'select') {
				  foreach ($custom_field['custom_field_value'] as $custom_field_value) {
					if ($custom_field_value['custom_field_value_id'] == $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']]) {
					  $text .= $custom_field_value['name'] . "\n";
					}
				  }
				}
				if ($custom_field['type'] == 'radio') {
					foreach ($custom_field['custom_field_value'] as $custom_field_value) {
					if ($custom_field_value['custom_field_value_id'] == $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']]) {
					  $text .= $custom_field_value['name'] . "\n";
					}
				  }
				}
				$cb_text = '';
				if ($custom_field['type'] == 'checkbox') {
					foreach ($custom_field['custom_field_value'] as $custom_field_value) {
					if (in_array($custom_field_value['custom_field_value_id'],$this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']])) {
					  $cb_text .= ($cb_text=='' ? '' : '; ') . $custom_field_value['name'];
					}
				  }
				}
				$text .= ($cb_text=='' ? '' : $cb_text . "\n");
				if ($custom_field['type'] == 'text') {
				  $text .= $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']] . "\n";
				}
				if ($custom_field['type'] == 'textarea') {
					$text .= $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']] . "\n";
				}
				if ($custom_field['type'] == 'file') {
					$this->load->model('tool/upload');
					$upload_info = $this->model_tool_upload->getUploadByCode($this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']]);
					rename(DIR_UPLOAD . $upload_info['filename'],DIR_UPLOAD . $upload_info['name']);
					$attachments[] = DIR_UPLOAD . $upload_info['name'];
					$text .= $upload_info['name'] . "\n";
				}
				if ($custom_field['type'] == 'date') {
					$text .= $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']] . "\n";
				}
				if ($custom_field['type'] == 'time') {
					$text .= $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']] . "\n";
				}
				if ($custom_field['type'] == 'datetime') {
					$text .= $this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']] . "\n";
				}
				$text .= "\n";
			  }
			}
      $text .= $this->language->get('post_page') . ": " . htmlspecialchars_decode($this->request->post['post_page']);
			foreach ($recivers as $reciver) {
				if ($reciver == '') {
					continue;
				}
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				$mail->setTo($reciver);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($settings['name'], ENT_QUOTES, 'UTF-8'));
				$mail->setText($text);
				foreach($attachments as $attach) {
					$mail->addAttachment($attach);
				}
				$mail->send();
				
			}
      foreach($attachments as $attach) {
          if (file_exists($attach)) {
            unlink($attach);
          }
				}
			$json['success']['message'] = $settings['message'];
			if ($settings['redirect']) {
				$json['success']['redirect'] = $settings['redirect'];
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		else {
			$json['error'] = $this->error;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	private function getCustomFields($setting) {
		$custom_field_data = array();
    $sorted = array();
		if (isset($setting['formfields'])) {
			foreach($setting['formfields'] as $key=>$custom_field) {
        $custom_field_value_data = array();
        $sorted_cfv = array();
				if (isset($custom_field['custom_field_value']) && ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio' || $custom_field['type'] == 'checkbox')) {
					
					foreach ($custom_field['custom_field_value'] as $cfv_key=>$custom_field_value) {
						$custom_field_value_data[] = array(
							'custom_field_value_id' => $cfv_key+1,
              'sort_order'            => $custom_field_value['sort_order'],
							'name'                  => $custom_field_value['custom_field_value_description'][$this->config->get('config_language_id')]['name']
						);
					}
          $sorted_cfv = $this->array_orderby($custom_field_value_data, 'sort_order', SORT_ASC);
				}
        $custom_field_data[] = array(
					'custom_field_id'    => $setting['code'] . '-' . $key,
					'custom_field_value' => $sorted_cfv,
          'titleview'          => $custom_field['titleview'],
					'name'               => $custom_field['custom_field_description'][$this->config->get('config_language_id')]['name'],
					'type'               => $custom_field['type'],
					'value'              => isset($custom_field['value']) ? $custom_field['value'] : '',
          'placeholder'        => isset($custom_field['placeholder'][$this->config->get('config_language_id')]['name']) ? $custom_field['placeholder'][$this->config->get('config_language_id')]['name'] : '',
					'validation'         => $custom_field['validation'],
					'required'           => isset($custom_field['required']) ? true : false,
          'inline'           => isset($custom_field['inline']) ? true : false,
					'sort_order'         => $custom_field['sort_order']
				);
			}
		}
    $sorted = $this->array_orderby($custom_field_data, 'sort_order', SORT_ASC);

		return $sorted;
	}
  
  private function array_orderby(){
      $args = func_get_args();
      $data = array_shift($args);
      foreach ($args as $n => $field) {
          if (is_string($field)) {
              $tmp = array();
              foreach ($data as $key => $row)
                  $tmp[$key] = $row[$field]=='' ? 0 : $row[$field];
              $args[$n] = $tmp;
              }
      }
      $args[] = &$data;
      call_user_func_array('array_multisort', $args);
      return array_pop($args);
  }

	private function validate($settings) {
		
		$this->load->language('extension/module/form2304');
		
		// Custom field validation
		$this->load->model('account/custom_field');

		
		$custom_fields = $this->getCustomFields($settings);
    
		foreach ($custom_fields as $custom_field) {
      if ($custom_field['type'] == 'google_captcha') {
        if (empty($this->session->data['gcapcha'])) {
          $recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('google_captcha_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);
      
          $recaptcha = json_decode($recaptcha, true);
      
          if ($recaptcha['success']) {
            $this->session->data['gcapcha']	= true;
          } else {
            $this->error['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_not_correct'), $custom_field['name']);
          }
        }
      }
      else {
        if ($custom_field['required'] && empty($this->request->post['custom_field'][$settings['code']][$custom_field['custom_field_id']])) {
          $this->error['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
        } elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$this->request->post['code']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
          $this->error['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_not_correct'), $custom_field['name']);
        }
      }
	}
		return !$this->error;

}
}