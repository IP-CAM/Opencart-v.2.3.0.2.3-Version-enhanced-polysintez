<?php
class ControllerRevolutionRevpopupcart extends Controller {
	public function index() {
		
		$data = array();

		$this->load->language('revolution/revolution');

		$data['button_shopping'] = $this->language->get('button_shopping');
		$data['button_checkout'] = $this->language->get('button_checkout');
		$data['heading_cartpopup_title_empty'] = $this->language->get('heading_cartpopup_title_empty');
		$data['text_cartpopup_empty'] = $this->language->get('text_cartpopup_empty');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
		} else {
			$currency = '';
		}

		if ( isset( $this->request->request['remove'] ) ) {
			$this->cart->remove( $this->request->request['remove'] );
			unset( $this->session->data['vouchers'][$this->request->request['remove']] );
		}

		if ( isset( $this->request->request['update'] ) ) {
			$this->cart->update( $this->request->request['update'], $this->request->request['quantity'] );
		}

		if ( isset( $this->request->request['add'] ) ) {
			$this->cart->add( $this->request->request['add'], $this->request->request['quantity'] );
		}

		if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
			$data['error_warning'] = $this->language->get('error_stock');
		} elseif (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
			$data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
		} else {
			$data['attention'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();

		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_in_cart) {
				if ($product_in_cart['product_id'] == $product['product_id']) {
					$product_total += $product_in_cart['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
			}

			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], 80, 80);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 80, 80);
			}
		
			//$option_points = 0;
			//$itog_points = $product['reward'];
			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name' => $option['name'],
					'model' => (isset($option['model']) ? $option['model'] : false),
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
				);
				
				if (isset($option['opt_image'])) {
					if ($option['opt_image']) {
						$image = $option['opt_image'] ? $this->model_tool_image->resize($option['opt_image'], 80, 80) : '';
					} else {
						$image = $image;
					}
				}
				
				/*
				if ($option['points_prefix'] == '+') {
					$option_points += $option['points'];
					$itog_points = $product['reward'] + ($option_points * $product['quantity']);
				} elseif ($option['points_prefix'] == '-') {
					$option_points -= $option['points'];
					$itog_points = $product['reward'] - ($option_points * $product['quantity']);
				} elseif ($option['points_prefix'] == '=') {
					$option_points = $option['points'];
					$itog_points = ($option_points * $product['quantity']);
				}
				*/
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $currency);
			} else {
				$price = false;
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
				$total = $this->currency->format($unit_price * $product['quantity'], $currency);
			} else {
				$total = false;
			}

			$data['products'][] = array(
				'key'         => $product['cart_id'],
				'product_id'  => $product['product_id'],
				'thumb'       => $image,
				'name'        => $product['name'],
				'model'       => $product['model'],
				'option'      => $option_data,
				'quantity'    => $product['quantity'],
				'stock'       => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
				'reward'      => ($product['reward'] ? sprintf($this->language->get('text_cartpopup_points'), $product['reward']) : ''),
				'price'       => $price,
				'total'       => $total,
				'href'        => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}

		$this->load->model('extension/extension');

		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		if (VERSION >= 2.2) {
			$totals = array();
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
		} else {
			$total_data = array();
		}

		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					if (VERSION >= 2.2) {
						$this->load->model('extension/total/' . $result['code']);
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					} else {
						$this->load->model('total/' . $result['code']);
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}
			}

			$sort_order = array();
			
			if (VERSION >= 2.2) {
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $totals);
				$data['totals'] = array();
				foreach ($totals as $total) {
					$data['totals'][] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'], $currency)
					);
				}
			} else {
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $total_data);
				$data['totals'] = array();
				foreach ($total_data as $total) {
					$data['totals'][] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'])
					);
				}
			}

		}

		$data['checkout_link'] = $this->url->link('checkout/checkout');
		
		$cart_number = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
		function getcartword($number, $suffix) {
			$keys = array(2, 0, 1, 1, 1, 2);
			$mod = $number % 100;
			$suffix_key = ($mod > 7 && $mod < 20) ? 2: $keys[min($mod % 10, 5)];
			return $suffix[$suffix_key];
		}
		$textcart_array = array('textcart_1', 'textcart_2', 'textcart_3');
		$textcart = getcartword($cart_number, $textcart_array);

		$data['heading_cartpopup_title'] = sprintf($this->language->get($textcart), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0));

		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revpopupcart', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/template/revolution/revpopupcart.tpl', $data));
		}

	}

	public function status_cart() {
		
		$json = array();

		$this->load->language('revolution/revolution');
		$this->load->model('extension/extension');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
		} else {
			$currency = '';
		}

		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		if (VERSION >= 2.2) {
			$totals = array();
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
		} else {
			$total_data = array();
		}
		
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();
			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}
			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					if (VERSION >= 2.2) {
						$this->load->model('extension/total/' . $result['code']);
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					} else {
						$this->load->model('total/' . $result['code']);
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}
			}
			
			$sort_order = array();
			if (VERSION >= 2.2) {
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $totals);
			} else {
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $total_data);
			}

		}

		$style = '';
		$this->load->model('tool/image');
		$data['setting_header_cart'] = $this->config->get('revtheme_header_cart');
		if ($data['setting_header_cart']['icontype']) {
			if ($data['setting_header_cart']['icon'] == 'fa none') {
				$style = ' hidden';
			}
			$image = '<i class="'.$data['setting_header_cart']['icon'].$style.'"></i>';
		} else {
			if (!$data['setting_header_cart']['image'] || $data['setting_header_cart']['image'] == 'no_image.png') {
				$style = ' hidden';
			}
			$image = '<span class="heading_ico_image'.$style.'"><img src="'.$this->model_tool_image->resize($data['setting_header_cart']['image'], 21, 21).'" alt=""/></span>';
		}
		$heading_title = ($image . $this->language->get('text_items'));
		
		$json['total'] = sprintf($heading_title, $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $currency));

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}