<?php
class ControllerRevolutionRevpopupview extends Controller {

	public function index() {
		
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');

		if (!$setting_catalog_all['popup_view']) {
			return false;
		}
		
		$data = array();

		$this->load->model('catalog/product');
		$this->load->language('revolution/revolution');

		if (isset($this->request->get['product_id'])) {
		  $product_id = (int)$this->request->get['product_id'];
		} else {
		  $product_id = 0;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);

		$data['product_id'] = $product_id;

		if ($product_info) {

			$data['heading_title'] = $this->language->get('popupview_heading_title');

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['text_catalog_stiker_netu'] = $this->language->get('text_catalog_stiker_netu');
			$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
			$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
			$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
			$data['text_product_rating'] = $this->language->get('text_product_rating');
			$data['text_product_artikul'] = $this->language->get('text_product_artikul');
			$data['text_product_dostupno'] = $this->language->get('text_product_dostupno');
			$data['text_product_ves'] = $this->language->get('text_product_ves');
			$data['text_product_razmers'] = $this->language->get('text_product_razmers');
			$data['text_product_all_attribs'] = $this->language->get('text_product_all_attribs');
			$data['text_product_all_stoimost'] = $this->language->get('text_product_all_stoimost');
			$data['text_product_bonus_tooltip'] = $this->language->get('text_product_bonus_tooltip');
			$data['text_product_bonusov'] = $this->language->get('text_product_bonusov');
			$data['text_product_instock'] = $this->language->get('text_product_instock');
			$data['text_product_outstock'] = $this->language->get('text_product_outstock');
			$data['text_product_kolichvo'] = $this->language->get('text_product_kolichvo');
			$data['text_product_wr_review'] = $this->language->get('text_product_wr_review');
			$data['text_product_otmena'] = $this->language->get('text_product_otmena');
			$data['text_product_oshibka'] = $this->language->get('text_product_oshibka');
			$data['text_product_spasibo_otz'] = $this->language->get('text_product_spasibo_otz');
			$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
			$product_settings = $this->config->get('revtheme_product_all');
			$data['recalc_price'] = $product_settings['recalc_price'];
			$data['q_zavisimost'] = $product_settings['q_zavisimost'];
			$data['text_model_option'] = $this->language->get('text_model_option');
			$data['text_price_option'] = $this->language->get('text_price_option');
			$data['text_option_option'] = $this->language->get('text_option_option');
			$data['text_dostupno_option'] = $this->language->get('text_dostupno_option');
			$data['text_quantity_option'] = $this->language->get('text_quantity_option');
			$data['shtuki'] = $this->language->get('text_shtuki');

			$data['entry_qty'] = $this->language->get('entry_qty');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_view'] = $this->language->get('button_view');
			$data['button_popup_view'] = $this->language->get('button_popup_view');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_wishlist'] = $this->language->get('button_wishlist');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];

			$data['view_product_link'] = $this->url->link('product/product', 'product_id=' . $product_info['product_id']);

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'] . '<span class="hidden pr_quantity">' . $product_info['quantity'] . '</span>';
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = '<span class="pr_quantity">' . $product_info['quantity'] . '</span> ' . $data['shtuki'];
			} else {
				$data['stock'] = $product_info['stock_status'] . '<span class="hidden pr_quantity">' . $product_info['quantity'] . '</span>';
			}

			$this->document->addStyle('catalog/view/javascript/revolution/owl-carousel/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/revolution/owl-carousel/owl.carousel.min.js');
			$data['product_name'] = $product_info['name'];
			$data['quantity'] = $product_info['quantity'];
			$all_settings = $this->config->get('revtheme_product_all');
			$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
			$images_settings = $this->config->get('revtheme_product_images');
			$data['images_slider'] = $images_settings['slider'];
			$data['zoom'] = $images_settings['zoom'];
			$data['share_status'] = $all_settings['share_status'];
			$data['atributs'] = $all_settings['atributs'];
			$data['atributs_group_name'] = $all_settings['atributs_group_name'];
			$data['razmers'] = $all_settings['razmers'];
			$data['manufacturer_status'] = $all_settings['manufacturer_status'];
			$data['model_status'] = $all_settings['model_status'];
			$data['sku_status'] = $all_settings['sku_status'];
			$data['bonusbals_status'] = $all_settings['bonusbals_status'];
			$data['sklad_status'] = $all_settings['sklad_status'];
			$data['ostatok_status'] = $all_settings['ostatok_status'];
			$data['weight_status'] = $all_settings['weight_status'];
			$data['zakaz'] = $all_settings['zakaz'];
			$data['zakaz_price_null'] = $all_settings['zakaz_price_null'];
			$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
			$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
			$data['options_buy'] = $product_info['options_buy'];
			$data['revtheme_header_cart'] = $this->config->get('revtheme_header_cart');
			$data['opt_price'] = $all_settings['opt_price'];
			
			if (VERSION >= 2.2) {
				$currency = $this->session->data['currency'];
				$config_product_description_length = $this->config->get('config_product_description_length');
				$config_image_additional_width = $data['config_image_additional_width'] = $this->config->get($this->config->get('config_theme') . '_image_additional_width');
				$config_image_additional_height = $data['config_image_additional_height'] = $this->config->get($this->config->get('config_theme') . '_image_additional_height');
				$config_image_thumb_width = $this->config->get($this->config->get('config_theme') . '_image_thumb_width');
				$config_image_thumb_height = $this->config->get($this->config->get('config_theme') . '_image_thumb_height');
			} else {
				$currency = '';
				$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
				$config_image_additional_width = $data['config_image_additional_width'] = $this->config->get('config_image_additional_width');
				$config_image_additional_height = $data['config_image_additional_height'] = $this->config->get('config_image_additional_height');
				$config_image_thumb_width = $this->config->get('config_image_thumb_width');
				$config_image_thumb_height = $this->config->get('config_image_thumb_height');
			}
			$data['currency_code'] = $this->session->data['currency'];
			$var_currency = array();
			$var_currency['value'] = $this->currency->getValue($currency);
			$var_currency['symbol_left'] = $this->currency->getSymbolLeft($currency);
			$var_currency['symbol_right'] = $this->currency->getSymbolRight($currency);
			$var_currency['decimals'] = $this->currency->getDecimalPlace($currency);
			$var_currency['decimal_point'] = $this->language->get('decimal_point');
			$var_currency['thousand_point'] = $this->language->get('thousand_point');
			$data['currency'] = $var_currency;
			
			if ($product_info['weight'] > 0) {
				$data['weight'] = number_format($product_info['weight'], 2);
			} else {
				$data['weight'] = '';
			}
			$data['weight_value'] = $product_info['weight'];
			$data['weight_unit'] = $this->weight->getUnit($product_info['weight_class_id']);
			
			if ($product_info['length'] > 0) {
				$data['length'] = number_format($product_info['length'], 2);
			} else {
				$data['length'] = '';
			}
			if ($product_info['width'] > 0) {
				$data['width'] = number_format($product_info['width'], 2);
			} else {
				$data['width'] = '';
			}
			if ($product_info['height'] > 0) {
				$data['height'] = number_format($product_info['height'], 2);
			} else {
				$data['height'] = '';
			}
			$data['length_format'] = $this->length->getUnit($product_info['length_class_id']);
			$data['weight_format'] = $this->weight->getUnit($product_info['weight_class_id']);
			
			$data['revtheme_product_all_attribute_group'] = $this->config->get('revtheme_product_all_attribute_group');
			
			if ($product_info['sku']) {
				$data['sku'] = $product_info['sku'];
			} else {
				$data['sku'] = '';
			}
			
			if (isset($this->session->data['compare'])) {
				if (in_array($product_id, $this->session->data['compare'])) {
					$data['compare_class'] = 'in_compare';
					$data['button_compare'] = $this->language->get('button_compare_out');
				} else {
					$data['compare_class'] = '';
					$data['button_compare'] = $this->language->get('button_compare');
				}
			} else {
				$data['compare_class'] = '';
				$data['button_compare'] = $this->language->get('button_compare');
			}
			
			if (isset($this->session->data['wishlist'])) {
				if (in_array($product_id, $this->session->data['wishlist'])) {
					$data['wishlist_class'] = 'in_wishlist';
					$data['button_wishlist'] = $this->language->get('button_wishlist_out');
				} else {
					$data['wishlist_class'] = '';
					$data['button_wishlist'] = $this->language->get('button_wishlist');
				}
			} else {
				$data['wishlist_class'] = '';
				$data['button_wishlist'] = $this->language->get('button_wishlist');
			}
			
			if ($this->customer->isLogged()) {
				$this->load->model('account/wishlist');
				$wishlist_register = $this->model_account_wishlist->getWishlist();
				if ($wishlist_register) {
					$wishlist_register2 = array();
					foreach ($wishlist_register as $result_wishlist_register_id) {
						$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
					}
					if (in_array($product_id, $wishlist_register_id)) {
						$data['wishlist_class'] = 'in_wishlist';
						$data['button_wishlist'] = $this->language->get('button_wishlist_out');
					} else {
						$data['wishlist_class'] = '';
						$data['button_wishlist'] = $this->language->get('button_wishlist');
					}
				}
			}
			
			$settings = $this->config->get('revtheme_cat_compare');
			if ($settings['main_cat']) {
				$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' AND main_category = 1");
				if ($query_brand_main_cat_true->num_rows) {
					$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_id . "' AND main_category = 1");
					$data['brand'] = $query_brand->row['name'];
				} else {					
					$data['brand'] = 'Все товары';
				}
			} else {
				$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_id . "'");
				if ($query_brand->num_rows) {
					$data['brand'] = $query_brand->row['name'];
				} else {					
					$data['brand'] = 'Все товары';
				}
			}
			
			$this->load->model('revolution/revolution');
			$settings_stikers = $this->config->get('revtheme_catalog_stiker');
			if ($settings_stikers['status']) {
				$data['stikers_status'] = true;
			} else {
				$data['stikers_status'] = false;
			}
			if ($settings_stikers['new_status']) {
				$settings_last = $this->config->get('revtheme_catalog_last');
				if ($settings_last['last_products'] != '') {
					$date_added = array_flip(explode(',', $settings_last['last_products']));
				} else {
					if ($settings_last['filter_day']) {
						$filter_day = date('Y-m-d H:i:s', strtotime('now - ' . $settings_last['filter_day'] . ' days'));
					} else {
						$filter_day = false;
					}
					$data_last = array(
						'sort'  => 'p.date_added',
						'order' => 'DESC',
						'start' => 0,
						'limit' => $settings_last['limit'],
						'filter_day' => $filter_day
						);
					$date_added = $this->model_revolution_revolution->getLastProducts($data_last);
				}
				if (isset($date_added[$product_id])) {
					$data['stiker_last'] = true;
				} else {
					$data['stiker_last'] = false;
				}
			} else {
				$data['stiker_last'] = false;
			}
			if ($settings_stikers['best_status']) {
				$settings_best = $this->config->get('revtheme_catalog_best');
				if ($settings_best['best_products'] != '') {
					$best_seller = array_flip(explode(',', $settings_best['best_products']));
				} else {
					$data_best = array(
						'sort'  => 'p.sales',
						'order' => 'DESC',
						'start' => 0,
						'limit' => $settings_best['limit'],
						'filter_buy' => $settings_best['filter_buy']
					);
					$best_seller = $this->model_revolution_revolution->getBestProducts($data_best);
				}
				if (isset($best_seller[$product_id])) {
					$data['stiker_best'] = true;
				} else {
					$data['stiker_best'] = false;
				}
			} else {
				$data['stiker_best'] = false;
			}
			if ($settings_stikers['spec_status']) {
				$data['stiker_spec'] = true;
			} else {
				$data['stiker_spec'] = false;
			}
			if ($settings_stikers['stock_status']) {
				$stiker_stock = true;
			} else {
				$stiker_stock = false;
			}

			  $this->load->model('tool/image');

			  if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $config_image_thumb_width, $config_image_thumb_height);
				$data['thumb_small'] = $this->model_tool_image->resize($product_info['image'], $config_image_additional_width, $config_image_additional_height);
				$data['div_img_width'] = $config_image_thumb_width . 'px';
			  } else {
				$data['thumb'] = $this->model_tool_image->resize("placeholder.png", $config_image_thumb_width, $config_image_thumb_height);
				$data['thumb_small'] = $this->model_tool_image->resize("placeholder.png", $config_image_additional_width, $config_image_additional_height);
				$data['div_img_width'] = $config_image_thumb_width . 'px';
			  }

			  $data['images'] = array();

			  $results = $this->model_catalog_product->getProductImages($product_id);

			  foreach ($results as $result) {
				$data['images'][] = array(
				  'popup' => $this->model_tool_image->resize($result['image'], $config_image_thumb_width, $config_image_thumb_height),
				  'thumb' => $this->model_tool_image->resize($result['image'], $config_image_additional_width, $config_image_additional_height)
				);
			  }

			  if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
				$data['price_number'] = $product_info['price'];
			  } else {
				$data['price'] = false;
				$data['price_number'] = false;
			  }

				if ((float)$product_info['special']) {
					$data['special_number'] = $product_info['special'];
					$this->load->model('revolution/revolution');
					$special = $this->model_revolution_revolution->getProductSpecialData($this->request->get['product_id']);
					if ($special['date_end'] && $all_settings['countdown'] && time() < strtotime($special['date_end'])) {
						$this->load->language('revolution/revolution');
						$data['special_end'] = $special['date_end'];
						$data['text_countdown'] = $this->language->get('text_countdown');
					} else {
						$data['special_end'] = false;
					}
					$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$data['special_number'] = false;
					$data['special_end'] = false;
					$data['special'] = false;
				}

			  if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $currency);
			  } else {
				$data['tax'] = false;
			  }

			if ($settings_stikers['stock_status']) {
				$data['stiker_stock'] = true;
			} else {
				$data['stiker_stock'] = false;
			}
			  
			if ($settings_stikers['upc']) {
				$data['stiker_upc'] = $product_info['upc'];
			} else {
				$data['stiker_upc'] = false;
			}
			if ($settings_stikers['ean']) {
				$data['stiker_ean'] = $product_info['ean'];
			} else {
				$data['stiker_ean'] = false;
			}
			if ($settings_stikers['jan']) {
				$data['stiker_jan'] = $product_info['jan'];
			} else {
				$data['stiker_jan'] = false;
			}
			if ($settings_stikers['isbn']) {
				$data['stiker_isbn'] = $product_info['isbn'];
			} else {
				$data['stiker_isbn'] = false;
			}
			if ($settings_stikers['mpn']) {
				$data['stiker_mpn'] = $product_info['mpn'];
			} else {
				$data['stiker_mpn'] = false;
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


			if ($product_info['description']) {
				$data['description'] = utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 500) ;
			} else {
				$data['description'] = '';
			}

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
					  'quantity' 				=> $option_value['quantity'],
					  'model' 					=> $option_value['model'],
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

			  $data['review_status'] = $this->config->get('config_review_status');

			  if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			  } else {
				$data['review_guest'] = false;
			  }

			  if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			  } else {
				$data['customer_name'] = '';
			  }

			$this->load->language('revolution/revolution');
			$reviews_number = (int)$product_info['reviews'];
			function getcartword($number, $suffix) {
				$keys = array(2, 0, 1, 1, 1, 2);
				$mod = $number % 100;
				$suffix_key = ($mod > 7 && $mod < 20) ? 2: $keys[min($mod % 10, 5)];
				return $suffix[$suffix_key];
			}
			$textcart_array = array('text_reviews_1', 'text_reviews_2', 'text_reviews_3');
			$textcart = getcartword($reviews_number, $textcart_array);
			$data['reviews'] = sprintf($this->language->get($textcart), (int)$product_info['reviews']);
				
			$data['rating'] = (int)$product_info['rating'];
			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['recurrings'] = $this->model_catalog_product->getProfiles($product_id);
			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
				  $data['tags'][] = array(
					'tag'  => trim($tag),
					'href' => $this->url->link('product/search', 'tag=' . trim($tag))
				  );
				}
			}

			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('revolution/revpopupview', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/revolution/revpopupview.tpl', $data));
			}
		  
		} else {
			exit();
		}
	}
}