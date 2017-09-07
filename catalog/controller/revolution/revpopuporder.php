<?php
class ControllerRevolutionRevpopuporder extends Controller {
	public function index() {

		$data = array();

		$this->load->model('catalog/product');
		$this->load->language('revolution/revolution');
		
		$settings = (array)$this->config->get('revtheme_catalog_popuporder');
		$data['revtheme_catalog_popuporder'] = $settings;
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		$data['opt_price'] = $product_settings['opt_price'];
		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);

		$data['product_id'] = $product_id;

		if ($product_info) {

			$data['popuporder_heading_title'] = $this->language->get('popuporder_heading_title');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_itogo'] = $this->language->get('text_itogo');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['enter_firstname'] = $this->language->get('enter_firstname');
			$data['enter_telephone'] = $this->language->get('enter_telephone');
			$data['enter_email'] = $this->language->get('enter_email');
			$data['enter_comment'] = $this->language->get('enter_comment');
			$data['entry_quantity'] = $this->language->get('entry_quantity');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_select'] = $this->language->get('text_select');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['quantity'] = $product_info['quantity'];
			
			if (VERSION >= 2.2) {
				$currency = $this->session->data['currency'];
			} else {
				$currency = '';
			}
			$data['currency_code'] = $currency;
			$var_currency = array();
			$var_currency['value'] = $this->currency->getValue($currency);
			$var_currency['symbol_left'] = $this->currency->getSymbolLeft($currency);
			$var_currency['symbol_right'] = $this->currency->getSymbolRight($currency);
			$var_currency['decimals'] = $this->currency->getDecimalPlace($currency);
			$var_currency['decimal_point'] = $this->language->get('decimal_point');
			$var_currency['thousand_point'] = $this->language->get('thousand_point');
			$data['currency'] = $var_currency;

			if ($product_info['quantity'] <= 0) {
				$data['stock_warning'] = $this->language->get('text_zakaz_not') . $product_info['stock_status'] . '.';
			} else {
				$data['stock_warning'] = '';
			}

			$data['product_name'] = $product_info['name'];

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 80, 80);
			} else {
				$data['thumb'] = $this->model_tool_image->resize("placeholder.png", 80, 80);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
				$data['price_number'] = $product_info['price'];
			} else {
				$data['price'] = false;
				$data['price_number'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $currency);
			} else {
				$data['tax'] = false;
			}

			$data['points'] = $product_info['points'];

			$discounts = $this->model_catalog_product->getProductDiscounts($product_id);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency)
				);
			}

			$data['firstname'] = ($this->customer->isLogged()) ? $this->customer->getFirstName() : '';
			$data['email'] = ($this->customer->isLogged()) ? $this->customer->getEmail() : '';
			$data['telephone'] = ($this->customer->isLogged()) ? $this->customer->getTelephone() : '';
			$data['telephone_mask'] = $settings['telephone_mask'];
			$data['comment'] = '';

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
						} else {
							$price = false;
						}
						
						if ($option_value['price_prefix'] == '=') {
							$price_prefix = '';
						} else {
							$price_prefix = $option_value['price_prefix'];
						}
						
						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
							'price'                   => $price,
							'price_prefix'            => $price_prefix
						);
					}
				}
				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($product_id);

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('revolution/revpopuporder', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/revolution/revpopuporder.tpl', $data));
			}
			
		} else {

			$this->response->redirect($this->url->link('checkout/checkout'));

		}
	}

	public function make_order() {
		$json = array();

		$this->language->load('revolution/revolution');
		$this->load->model('catalog/product');
		$this->load->model('extension/extension');
		$this->load->model('account/customer');
		$this->load->model('affiliate/affiliate');
		$this->load->model('checkout/order');
		$this->load->model('checkout/marketing');

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['option'])) {
			$option = $this->request->post['option'];
		} else {
			$option = array();
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = (int)$this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$settings = $this->config->get('revtheme_catalog_popuporder');

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$product_options = $this->model_catalog_product->getProductOptions($product_id);

		$order_status_id = (!empty($settings['order_status'])) ? (int)$settings['order_status'] : (int)$this->config->get('config_order_status_id');
		$customer_info = ($this->customer->isLogged()) ? $this->model_account_customer->getCustomer($this->customer->getId()) : FALSE;

		foreach ($product_options as $product_option) {
			if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
				$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_option'), $product_option['name']);
			}
		}

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

			$order_data = array();

			if (version_compare(VERSION, '2.1.0.1') < 0) {
				$cart_product_key = ($option) ? (int)$product_id . ':' . base64_encode(serialize($option)) : (int)$product_id;
			} else {
				$cart_product_key = (int)$product_id;
			}

			$old_cart_product_id = $this->cart->getProducts();

			if (isset($old_cart_product_id[$cart_product_key])) {
				$this->cart->remove($cart_product_key);
			}

			if (version_compare(VERSION, '2.1.0.1') < 0) {
				$cart = $this->session->data['cart'];
				unset($this->session->data['cart']);
			} else {
				$cart = $this->cart->getProducts();
				$this->cart->clear();
			}
			
			$this->cart->add($product_id, $quantity, $option);

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$forwarded_ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
			} elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$forwarded_ip = $this->request->server['HTTP_CLIENT_IP'];
			} else {
				$forwarded_ip = '';
			}
		 
			$user_agent = isset($this->request->server['HTTP_USER_AGENT']) ? $this->request->server['HTTP_USER_AGENT'] : '';
			$accept_language = isset($this->request->server['HTTP_ACCEPT_LANGUAGE']) ? $this->request->server['HTTP_ACCEPT_LANGUAGE'] : '';

			if (isset($this->request->cookie['tracking'])) {
				
				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
				$tracking = $this->request->cookie['tracking'];
				$subtotal = $this->cart->getSubTotal();

				if ($affiliate_info) {
					$affiliate_id = $affiliate_info['affiliate_id'];
					$commission = ($subtotal / 100) * $affiliate_info['commission'];
				} else {
					$affiliate_id = 0;
					$commission = 0;
				}

				$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

				if ($marketing_info) {
					$marketing_id = $marketing_info['marketing_id'];
				} else {
					$marketing_id = 0;
				}
				
			} else {
				$affiliate_id = 0;
				$commission = 0;
				$marketing_id = 0;
				$tracking = '';
			}

			$order_products = array();

			foreach ($this->cart->getProducts() as $product) {
			  $option_data = array();

			  foreach ($product['option'] as $option) {
				$option_data[] = array(
				  'product_option_id'       => $option['product_option_id'],
				  'product_option_value_id' => $option['product_option_value_id'],
				  'option_id'               => $option['option_id'],
				  'option_value_id'         => $option['option_value_id'],
				  'name'                    => $option['name'],
				  'value'                   => $option['value'],
				  'type'                    => $option['type']
				);
			  }

			  $order_products[] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'download'   => $product['download'],
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $product['price'],
				'total'      => $product['total'],
				'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
				'reward'     => $product['reward']
				);
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
				
			$order_data = array(
				'invoice_prefix'          => $this->config->get('config_invoice_prefix'),
				'store_id'                => $store_id = (int)$this->config->get('config_store_id'),
				'store_name'              => $this->config->get('config_name'),
				'store_url'               => $store_id ? $this->config->get('config_url') : HTTP_SERVER,
				'customer_id'             => $this->customer->isLogged() ? $this->customer->getId() : 0,
				'customer_group_id'       => $this->customer->isLogged() ? $this->customer->getGroupId() : $this->config->get('config_customer_group_id'),
				'firstname'               => (isset($this->request->request['firstname'])) ? $this->request->request['firstname'] : $this->language->get('heading_title'),
				'lastname'                => '',
				'email'                   => (isset($this->request->request['email']) && !empty($this->request->request['email'])) ? $this->request->request['email'] : 'localhost@localhost.com',
				'telephone'               => (isset($this->request->request['telephone'])) ? $this->request->request['telephone'] : '',
				'fax'                     => '',
				'shipping_city'           => '',
				'shipping_postcode'       => '',
				'shipping_country'        => '',
				'shipping_country_id'     => '',
				'shipping_zone_id'        => '',
				'shipping_zone'           => '',
				'shipping_address_format' => '',
				'shipping_firstname'      => (isset($this->request->request['firstname'])) ? $this->request->request['firstname'] : $this->language->get('heading_title'),
				'shipping_lastname'       => '',
				'shipping_company'        => '',
				'shipping_address_1'      => '',
				'shipping_address_2'      => '',
				'shipping_code'           => '',
				'shipping_method'         => '',
				'payment_city'            => '',
				'payment_postcode'        => '',
				'payment_country'         => '',
				'payment_country_id'      => '',
				'payment_zone'            => '',
				'payment_zone_id'         => '',
				'payment_address_format'  => '',
				'payment_firstname'       => (isset($this->request->request['firstname'])) ? $this->request->request['firstname'] : $this->language->get('heading_title'),
				'payment_lastname'        => '',
				'payment_company'         => '',
				'payment_address_1'       => '',
				'payment_address_2'       => '',
				'payment_company_id'      => '',
				'payment_tax_id'          => '',
				'payment_code'            => (version_compare(VERSION, '2.1.0.1') < 0) ? '' : 'free_checkout',
				'payment_method'          => (version_compare(VERSION, '2.1.0.1') < 0) ? '' : '--',
				'forwarded_ip'            => $forwarded_ip,
				'user_agent'              => $user_agent,
				'accept_language'         => $accept_language,
				'vouchers'                => array(),
				'comment'                 => (isset($this->request->post['comment'])) ? $this->request->post['comment'] : '',
				'total'                   => $total,
				'reward'                  => '',
				'affiliate_id'            => $affiliate_id,
				'tracking'                => $tracking,
				'commission'              => $commission,
				'marketing_id'            => $marketing_id,
				'language_id'             => $this->config->get('config_language_id'),
				'currency_id'             => (VERSION >= 2.2) ? $this->currency->getId($this->session->data['currency']) : $this->currency->getId(),
				'currency_code'           => (VERSION >= 2.2) ? $this->session->data['currency'] : $this->currency->getCode(),
				'currency_value'          => (VERSION >= 2.2) ? $this->currency->getValue($this->session->data['currency']) : $this->currency->getValue($this->currency->getCode()),
				'ip'                      => $this->request->server['REMOTE_ADDR'],
				'products'                => $order_products,
				'totals'                  => (VERSION >= 2.2) ? $totals : $total_data
			);

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);

			$order_id = (int)$this->session->data['order_id'];

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $order_status_id);

			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', date_modified = NOW() WHERE order_id = '" . $order_id . "'");

			if (version_compare(VERSION, '2.1.0.1') < 0) {
				$this->session->data['cart'] = $cart;
			} else {
				$this->cart->clear();
				if ($cart) {
					foreach ($cart as $value) {
						$this->cart->add($value['product_id'], $value['quantity'], $value['option']);
					}
				}
			}
			
			$json['output'] = $this->language->get('text_success_order');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}
}