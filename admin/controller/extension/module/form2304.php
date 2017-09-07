<?php
class ControllerExtensionModuleForm2304 extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/form2304');

		$this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('extension/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
        $this->model_extension_module->addModule('form2304', $this->request->post);
        
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
        
        $this->load->model('design/layout');
    
        $results = $this->model_design_layout->getLayouts();
 
        foreach ($results as $result) {
          $layout_data = array();
          $layout_data['layout_route'] = $this->model_design_layout->getLayoutRoutes($result['layout_id']);
          $layout_data['name'] = $result['name'];
          $layout_data['layout_module'] = array();
          $form2304_module = array(
            'content_bottom' => array(),
            'content_top' => array(),
            'column_left' => array(),
            'column_right' => array()
          );
          $layout_modules = $this->model_design_layout->getLayoutModules($result['layout_id']);
          foreach ($layout_modules as $layout_module) {

            $part = explode('.', $layout_module['code']);
            if ( $part[0] != 'form2304') {
              $layout_data['layout_module'][] = array(
              'layout_id' => $layout_module['layout_id'],
              'code' => $layout_module['code'],
              'position' => $layout_module['position'],
              'sort_order' => $layout_module['sort_order']
              );
            }
            else if ($part[1] != $this->request->get['module_id']) {
              $layout_data['layout_module'][] = array(
              'layout_id' => $layout_module['layout_id'],
              'code' => $layout_module['code'],
              'position' => $layout_module['position'],
              'sort_order' => $layout_module['sort_order']
              );
            }
            else {  
              $form2304_module[$layout_module['position']][] = $layout_module['layout_id']; 
            }
            
          }
          $post_module = array(
                'content_bottom' => array(),
                'content_top' => array(),
                'column_left' => array(),
                'column_right' => array()
              );
          if (isset($this->request->post['layout'])) {
            
            foreach ($this->request->post['layout'] as $pos_key => $position) {
              
              foreach ($position as $layout) {
                if ($layout != $result['layout_id']) {
                  continue;
                }
                $layout_data['layout_module'][] = array(
                'layout_id' => $layout,
                'code' => 'form2304.' . $this->request->get['module_id'],
                'position' => $pos_key,
                'sort_order' => 0
                );
                $post_module[$pos_key][] = $layout;
              }
               
             
            }
          }
          
          foreach ($form2304_module as $pos_key => $position) {
              $res_diff = array_diff($post_module[$pos_key],$position);
              if (count($res_diff) == 0) {
                $res_diff = array_diff($position,$post_module[$pos_key]);
              }
              foreach ($res_diff as $layout_diff) {
                $this->model_design_layout->editLayout($layout_diff,$layout_data);
              }
          }

        }
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_title_button'] = $this->language->get('entry_title_button');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_fields'] = $this->language->get('entry_fields');
		$data['entry_field'] = $this->language->get('entry_field');
		$data['entry_recivers'] = $this->language->get('entry_recivers');
		$data['entry_message'] = $this->language->get('entry_message');
		$data['entry_timeout'] = $this->language->get('entry_timeout');
		$data['entry_redirect'] = $this->language->get('entry_redirect');
		$data['entry_settings'] = $this->language->get('entry_settings');
    $data['entry_layouts'] = $this->language->get('entry_layouts');
		$data['entry_add_field'] = $this->language->get('entry_add_field');
		$data['entry_openmodal'] = $this->language->get('entry_openmodal');
    $data['entry_columns'] = $this->language->get('entry_columns');
    $data['entry_titleview'] = $this->language->get('entry_titleview');
    $data['entry_inline'] = $this->language->get('entry_inline');
    $data['entry_robots'] = $this->language->get('entry_robots');
    $data['entry_captcha'] = $this->language->get('entry_captcha');
    $data['entry_window_size'] = $this->language->get('entry_window_size');
    $data['entry_placeholder'] = $this->language->get('entry_placeholder');
    $data['text_none'] = $this->language->get('text_none');
    
    $data['titleview_up'] = $this->language->get('titleview_up');
    $data['titleview_1'] = $this->language->get('titleview_1');
    $data['titleview_2'] = $this->language->get('titleview_2');
    $data['titleview_3'] = $this->language->get('titleview_3');
    $data['titleview_4'] = $this->language->get('titleview_4');
    $data['titleview_5'] = $this->language->get('titleview_5');
    $data['titleview_6'] = $this->language->get('titleview_6');
    $data['titleview_no'] = $this->language->get('titleview_no');
    
		$data['help_recivers'] = $this->language->get('help_recivers');
		
		$this->load->language('customer/custom_field');
		$data['text_choose'] = $this->language->get('text_choose');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_radio'] = $this->language->get('text_radio');
		$data['text_checkbox'] = $this->language->get('text_checkbox');
		$data['text_input'] = $this->language->get('text_input');
		$data['text_text'] = $this->language->get('text_text');
		$data['text_textarea'] = $this->language->get('text_textarea');
		$data['text_file'] = $this->language->get('text_file');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_datetime'] = $this->language->get('text_datetime');
		$data['text_time'] = $this->language->get('text_time');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_regex'] = $this->language->get('text_regex');
    $data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
    $data['text_normal'] = $this->language->get('text_normal');
    $data['text_large'] = $this->language->get('text_large');
    $data['text_small'] = $this->language->get('text_small');
    
		$data['entry_field_name'] = $this->language->get('entry_name');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_value'] = $this->language->get('entry_value');
		$data['entry_validation'] = $this->language->get('entry_validation');
		$data['entry_custom_value'] = $this->language->get('entry_custom_value');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
    $data['entry_buttons_code'] = $this->language->get('entry_buttons_code');
    $data['entry_a_code'] = $this->language->get('entry_a_code');
    if (!isset($this->request->get['module_id'])) {
      $data['buttons_code'] = $this->language->get('not_available');
      $data['a_code'] = $this->language->get('not_available');
    }
    else {
      $data['buttons_code'] = '&lt;button class="btn btn-primary btn-lg" type="button" data-toggle="modal" data-target="#form' . $this->request->get['module_id'] . 'Modal"&gt;Open modal&lt;/button&gt;';
      $data['a_code'] = '&lt;a href="#" data-toggle="modal" data-target="#form' . $this->request->get['module_id'] . 'Modal"&gt;Open modal&lt;/a&gt;';
    }
		$data['help_regex'] = $this->language->get('help_regex');
		$data['help_sort_order'] = $this->language->get('help_sort_order');
		$data['help_redirect'] = $this->language->get('help_redirect');
    
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_custom_field_value_add'] = $this->language->get('button_custom_field_value_add');
		$data['button_remove'] = $this->language->get('button_remove');
		
    $this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
    
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
				'href' => $this->url->link('extension/module/form2304', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/form2304', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/form2304', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/form2304', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
    
		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($module_info)) {
			$data['title'] = $module_info['title'];
		} else {
			$data['title'] = array();
		}
    
    if (isset($this->request->post['formfields'])) {
			$data['formfields'] = $this->request->post['formfields'];
		} elseif (!empty($module_info)) {
      if (isset($module_info['formfields'])) {
        $sorted = $this->array_orderby($module_info['formfields'], 'sort_order', SORT_ASC);
        $data['formfields'] = $sorted;
        
      }
      else {
        $data['formfields'] = array();
      }
		} else {
			$data['formfields'] = array();
		}
    
    if (isset($this->request->post['message'])) {
			$data['message'] = $this->request->post['message'];
		} elseif (!empty($module_info)) {
			$data['message'] = $module_info['message'];
		} else {
			$data['message'] = array();
		}
    
		if (isset($this->request->post['title_button'])) {
			$data['title_button'] = $this->request->post['title_button'];
		} elseif (!empty($module_info)) {
			$data['title_button'] = $module_info['title_button'];
		} else {
			$data['title_button'] = array();
		}
		
		if (isset($this->request->post['recivers'])) {
			$data['recivers'] = $this->request->post['recivers'];
		} elseif (!empty($module_info)) {
			$data['recivers'] = $module_info['recivers'];
		} else {
			$data['recivers'] = $this->config->get('config_email');
		}
    
		if (isset($this->request->post['redirect'])) {
			$data['redirect'] = $this->request->post['redirect'];
		} elseif (!empty($module_info)) {
			$data['redirect'] = $module_info['redirect'];
		} else {
			$data['redirect'] = '';
		}
		
		if (isset($this->request->post['openmodal'])) {
			$data['openmodal'] = $this->request->post['openmodal'];
		} elseif (!empty($module_info)) {
			if (isset($module_info['openmodal'])) {
				$data['openmodal'] = 1;
			}
			else {
				$data['openmodal'] = 0;
			}
		} else {
			$data['openmodal'] = 0;
		}
    
		if (isset($this->request->post['timeout'])) {
			$data['timeout'] = $this->request->post['timeout'];
		} elseif (!empty($module_info)) {
			$data['timeout'] = $module_info['timeout'];
		} else {
			$data['timeout'] = '3';
		}
    
    if (isset($this->request->post['columns'])) {
			$data['columns'] = $this->request->post['columns'];
		} elseif (!empty($module_info)) {
			$data['columns'] = $module_info['columns'];
		} else {
			$data['columns'] = '2';
		}
		
    if (isset($this->request->post['window_size'])) {
			$data['window_size'] = $this->request->post['window_size'];
		} elseif (!empty($module_info)) {
			$data['window_size'] = $module_info['window_size'];
		} else {
			$data['window_size'] = 0;
		}
    
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
    $this->load->model('extension/extension');
    
    $data['captchas'] = array();

		// Get a list of installed captchas
		$extensions = $this->model_extension_extension->getInstalled('captcha');

		foreach ($extensions as $code) {
			$this->load->language('extension/captcha/' . $code);

			if ($this->config->get($code . '_status')) {
				$data['captchas'][] = array(
					'text'  => $this->language->get('heading_title'),
					'value' => $code
				);
			}
		}
    
    $data['layouts'] = array();
    $data['layout_modules']['column_left'] = array();
    $data['layout_modules']['content_top'] = array();
    $data['layout_modules']['content_bottom'] = array();
    $data['layout_modules']['column_right'] = array();
    $this->load->model('design/layout');
    
    $results = $this->model_design_layout->getLayouts();
    
    $this->load->language('design/layout');
    
    $data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
    
		foreach ($results as $result) {
      $data['layouts']['column_left'][] = array(
				'layout_id' => $result['layout_id'],
				'name'      => $result['name']
			);
      $data['layouts']['content_top'][] = array(
				'layout_id' => $result['layout_id'],
				'name'      => $result['name']
			);
      $data['layouts']['content_bottom'][] = array(
				'layout_id' => $result['layout_id'],
				'name'      => $result['name']
			);
      $data['layouts']['column_right'][] = array(
				'layout_id' => $result['layout_id'],
				'name'      => $result['name']
			);
      $layout_modules = $this->model_design_layout->getLayoutModules($result['layout_id']);
      foreach ($layout_modules as $layout_module) {
        $part = explode('.', $layout_module['code']);
        if ( $part[0] != 'form2304') {
          continue;
        }
        if (isset($part[1]) && isset($this->request->get['module_id'])) {
          if ($part[1] == $this->request->get['module_id']) {
            $data['layout_modules'][$layout_module['position']][] = $result['layout_id'];
          }
        }
      }
    }
    if (isset($this->request->get['module_id'])) {
      $data['module_id'] = $this->request->get['module_id'];
    }
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/form2304', $data));
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
  
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/form2304')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
    
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}
