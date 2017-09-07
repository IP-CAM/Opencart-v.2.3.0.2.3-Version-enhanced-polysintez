<?php
class ControllerRevolutionRevpmod extends Controller {
	
	public function ptabs() {
		
		$this->load->language('revolution/revp_mod');
		$this->load->language('revolution/revolution');
		
		$setting_home_tabs = $this->config->get('revtheme_home_tabs');
		if (!$setting_home_tabs) {
			return false;
		}

		$setting_last = $this->config->get('revtheme_home_last');
		$setting_spec = $this->config->get('revtheme_home_spec');
		$setting_best = $this->config->get('revtheme_home_best');
		
		$data['last_status'] = $setting_last['status'];
		$data['spec_status'] = $setting_spec['status'];
		$data['best_status'] = $setting_best['status'];
		
		$data['last_slider'] = $setting_last['slider'];
		$data['spec_slider'] = $setting_spec['slider'];
		$data['best_slider'] = $setting_best['slider'];
		
		$this->load->model('tool/image');
		
		if ($setting_last['icontype']) {
			$data['heading_last'] = ('<i class="'.$setting_last['icon'].'"></i>' . $setting_last[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting_last['image'], 21, 21);
			$data['heading_last'] = ('<span class="heading_ico_image"><span class="mask"></span><img src="'.$image.'" alt=""/></span>' . $setting_last[$this->config->get('config_language_id')]['title']);
		}
		if ($setting_spec['icontype']) {
			$data['heading_spec'] = ('<i class="'.$setting_spec['icon'].'"></i>' . $setting_spec[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting_spec['image'], 21, 21);
			$data['heading_spec'] = ('<span class="heading_ico_image"><span class="mask"></span><img src="'.$image.'" alt=""/></span>' . $setting_spec[$this->config->get('config_language_id')]['title']);
		}
		if ($setting_best['icontype']) {
			$data['heading_best'] = ('<i class="'.$setting_best['icon'].'"></i>' . $setting_best[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting_best['image'], 21, 21);
			$data['heading_best'] = ('<span class="heading_ico_image"><span class="mask"></span><img src="'.$image.'" alt=""/></span>' . $setting_best[$this->config->get('config_language_id')]['title']);
		}
		
		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
		$data['revpopuporder'] = $revpopuporder_settings['status'];
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['recalc_price'] = $product_settings['recalc_price'];
		$data['q_zavisimost'] = $product_settings['q_zavisimost'];
		$data['opt_price'] = $product_settings['opt_price'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');
		$data['popup_view'] = $setting_catalog_all['popup_view'];
		$data['img_slider'] = $setting_catalog_all['img_slider'];
		$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
		$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
		$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
		$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
		$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
		$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
		$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
		$data['text_catalog_revpopup_view'] = $this->language->get('text_catalog_revpopup_view');
		$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
		$description_options = $this->config->get('revtheme_cat_attributes');
		$data['description_options'] = $this->config->get('revtheme_cat_attributes');
		$data['text_select'] = $this->language->get('text_select');
		$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
		$data['text_option_option'] = $this->language->get('text_option_option');
		$revtheme_home_all = $this->config->get('revtheme_home_all');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
			$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
		} else {
			$currency = '';
			$config_product_description_length = $this->config->get('config_product_description_length');
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

		$this->load->model('revolution/revolution');
		$settings_stikers = $this->config->get('revtheme_catalog_stiker');
		if ($settings_stikers['status']) {
			$data['stikers_status'] = true;

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
			}
		} else {
			$data['stikers_status'] = false;
		}
		
		$products_best = false;
		$products_last = false;
		$products_spec = false;
		
		if ($setting_best['status']) {
			
			$data['autoscroll_best'] = $setting_best['autoscroll'];
			
			$data['products_best'] = array();

			$settings_best = $this->config->get('revtheme_catalog_best');
			$filter_data_best = array(
				'sort'  => 'pd.name',
				'order' => 'ASC',
				'start' => 0,
				'limit' => $setting_best['limit'],
				'filter_buy' => $settings_best['filter_buy']
			);

			if ($settings_best['best_products'] != '') {
				$products_best = explode(',', $settings_best['best_products']);
			} else {
				$products_best = $this->model_revolution_revolution->getBestProducts($filter_data_best);
			}
			
			if ($products_best) {
				foreach ($products_best as $result) {
					
					if ($settings_best['best_products'] != '') {
						$this->load->model('catalog/product');
						$result = $this->model_catalog_product->getProduct($result);
					}
					
					if (isset($this->session->data['compare'])) {
						if (in_array($result['product_id'], $this->session->data['compare'])) {
							$compare_class = 'in_compare';
							$button_compare = $this->language->get('button_compare_out');
						} else {
							$compare_class = '';
							$button_compare = $this->language->get('button_compare');
						}
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
					if (isset($this->session->data['wishlist'])) {
						if (in_array($result['product_id'], $this->session->data['wishlist'])) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
					if ($this->customer->isLogged()) {
						$this->load->model('account/wishlist');
						$wishlist_register = $this->model_account_wishlist->getWishlist();
						if ($wishlist_register) {
							$wishlist_register2 = array();
							foreach ($wishlist_register as $result_wishlist_register_id) {
								$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
							}
							if (in_array($result['product_id'], $wishlist_register_id)) {
								$wishlist_class = 'in_wishlist';
								$button_wishlist = $this->language->get('button_wishlist_out');
							} else {
								$wishlist_class = '';
								$button_wishlist = $this->language->get('button_wishlist');
							}
						}
					}
					
					if ($settings_stikers['new_status']) {
						if (isset($date_added[$result['product_id']])) {
							$stiker_last = true;
						} else {
							$stiker_last = false;
						}
					} else {
						$stiker_last = false;
					}
					
					if ($settings_stikers['best_status']) {
						if (isset($best_seller[$result['product_id']])) {
							$stiker_best = true;	
						} else {
							$stiker_best = false;
						}
					} else {
						$stiker_best = false;
					}
					
					if ($settings_stikers['spec_status']) {
						$stiker_spec = true;
					} else {
						$stiker_spec = false;
					}
					
					if ($settings_stikers['stock_status']) {
						$stiker_stock = true;
					} else {
						$stiker_stock = false;
					}
					
					if ($settings_stikers['upc']) {
						$stiker_upc = $result['upc'];
					} else {
						$stiker_upc = false;
					}
					if ($settings_stikers['ean']) {
						$stiker_ean = $result['ean'];
					} else {
						$stiker_ean = false;
					}
					if ($settings_stikers['jan']) {
						$stiker_jan = $result['jan'];
					} else {
						$stiker_jan = false;
					}
					if ($settings_stikers['isbn']) {
						$stiker_isbn = $result['isbn'];
					} else {
						$stiker_isbn = false;
					}
					if ($settings_stikers['mpn']) {
						$stiker_mpn = $result['mpn'];
					} else {
						$stiker_mpn = false;
					}
					if ($settings_stikers['stiker_netu_stock']) {
						$text_catalog_stiker_netu = $result['stock_status'];
					} else {
						$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
					}
					
					if ($result['image']) {
						$images = array();
						$this->load->model('catalog/product');
						$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
						foreach ($add_images as $add_image) {
							$images[] = array(
								'thumb' => $this->model_tool_image->resize($add_image['image'], $setting_best['image_width'], $setting_best['image_height'])
							);
						}
						$image = $this->model_tool_image->resize($result['image'], $setting_best['image_width'], $setting_best['image_height']);
					} else {
						$images = false;
						$image = $this->model_tool_image->resize('placeholder.png', $setting_best['image_width'], $setting_best['image_height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price_number = $result['price'];
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$price = false;
						$price_number = false;
					}

					if ((float)$result['special']) {
						$special_number = $result['special'];
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$special = false;
						$special_number = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$settings = $this->config->get('revtheme_cat_compare');
					if ($settings['main_cat']) {
						$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						if ($query_brand_main_cat_true->num_rows) {
							$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					} else {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
						if ($query_brand->num_rows) {
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					}
					
					$description = false;
					$options = false;
					if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
						if ($description_options['zamena_description']) {
							$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
						} else {
							$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
						}
						
						if ($description_options['options_in_grid']) {
							$options = array();
							$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
						
							foreach ($pr_options as $option) {
								$product_option_value_data = array();

								foreach ($option['product_option_value'] as $option_value) {
									if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
										if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
											$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
										} else {
											$option_price = false;
										}

										if ($option_value['price_prefix'] == '=') {
											$price_prefix = '';
										} else {
											$price_prefix = $option_value['price_prefix'];
										}
										
										$product_option_value_data[] = array(
											'product_option_value_id' => $option_value['product_option_value_id'],
											'quantity' 				  => $option_value['quantity'], 
											'model' 				  => $option_value['model'],
											'option_value_id'         => $option_value['option_value_id'],
											'name'                    => $option_value['name'],
											'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
											'price'                   => $option_price,
											'price_prefix'            => $price_prefix
										);
									}
								}

								$options[] = array(
									'product_option_id'    => $option['product_option_id'],
									'product_option_value' => $product_option_value_data,
									'option_id'            => $option['option_id'],
									'name'                 => $option['name'],
									'type'                 => $option['type'],
									'value'                => $option['value'],
									'required'             => $option['required']
								);
							}
						}
					}
					
					$data['products_best'][] = array(
						'price_number' => $price_number,
						'special_number' => $special_number,
						'compare_class' => $compare_class,
						'wishlist_class' => $wishlist_class,
						'button_compare' => $button_compare,
						'button_wishlist' => $button_wishlist,
						'stiker_last' => $stiker_last,
						'stiker_best' => $stiker_best,
						'stiker_spec' => $stiker_spec,
						'stiker_stock' => $stiker_stock,
						'stiker_upc' => $stiker_upc,
						'stiker_ean' => $stiker_ean,
						'stiker_jan' => $stiker_jan,
						'stiker_isbn' => $stiker_isbn,
						'stiker_mpn' => $stiker_mpn,
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
						'brand' => $brand,
						'images' => $images,
						'options' => $options,
						'quantity' => $result['quantity'],
						'options_buy' => $result['options_buy'],
						'model' => $result['model'],
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => $description,
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => $result['rating'],
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
			
		}
			
		if ($setting_last['status']) {
			
			$data['autoscroll_last'] = $setting_last['autoscroll'];
			
			$settings_last = $this->config->get('revtheme_catalog_last');
			if ($settings_last['filter_day']) {
				$filter_day = date('Y-m-d H:i:s', strtotime('now - ' . $settings_last['filter_day'] . ' days'));
			} else {
				$filter_day = false;
			}
			
			$data['products_last'] = array();
			$filter_data_last = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting_last['limit'],
				'filter_day' => $filter_day
			);

			if ($settings_last['last_products'] != '') {
				$products_last = explode(',', $settings_last['last_products']);
			} else {
				$products_last = $this->model_revolution_revolution->getLastProducts($filter_data_last);
			}

			if ($products_last) {
				foreach ($products_last as $result) {
					
					if ($settings_last['last_products'] != '') {
						$this->load->model('catalog/product');
						$result = $this->model_catalog_product->getProduct($result);
					}
					
					if (isset($this->session->data['compare'])) {
						if (in_array($result['product_id'], $this->session->data['compare'])) {
							$compare_class = 'in_compare';
							$button_compare = $this->language->get('button_compare_out');
						} else {
							$compare_class = '';
							$button_compare = $this->language->get('button_compare');
						}
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
					if (isset($this->session->data['wishlist'])) {
						if (in_array($result['product_id'], $this->session->data['wishlist'])) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
					if ($this->customer->isLogged()) {
						$this->load->model('account/wishlist');
						$wishlist_register = $this->model_account_wishlist->getWishlist();
						if ($wishlist_register) {
							$wishlist_register2 = array();
							foreach ($wishlist_register as $result_wishlist_register_id) {
								$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
							}
							if (in_array($result['product_id'], $wishlist_register_id)) {
								$wishlist_class = 'in_wishlist';
								$button_wishlist = $this->language->get('button_wishlist_out');
							} else {
								$wishlist_class = '';
								$button_wishlist = $this->language->get('button_wishlist');
							}
						}
					}
					
					if ($settings_stikers['new_status']) {
						if (isset($date_added[$result['product_id']])) {
							$stiker_last = true;
						} else {
							$stiker_last = false;
						}
					} else {
						$stiker_last = false;
					}
					
					if ($settings_stikers['best_status']) {
						if (isset($best_seller[$result['product_id']])) {
							$stiker_best = true;	
						} else {
							$stiker_best = false;
						}
					} else {
						$stiker_best = false;
					}
					
					if ($settings_stikers['spec_status']) {
						$stiker_spec = true;
					} else {
						$stiker_spec = false;
					}
					
					if ($settings_stikers['stock_status']) {
						$stiker_stock = true;
					} else {
						$stiker_stock = false;
					}
					
					if ($settings_stikers['upc']) {
						$stiker_upc = $result['upc'];
					} else {
						$stiker_upc = false;
					}
					if ($settings_stikers['ean']) {
						$stiker_ean = $result['ean'];
					} else {
						$stiker_ean = false;
					}
					if ($settings_stikers['jan']) {
						$stiker_jan = $result['jan'];
					} else {
						$stiker_jan = false;
					}
					if ($settings_stikers['isbn']) {
						$stiker_isbn = $result['isbn'];
					} else {
						$stiker_isbn = false;
					}
					if ($settings_stikers['mpn']) {
						$stiker_mpn = $result['mpn'];
					} else {
						$stiker_mpn = false;
					}
					if ($settings_stikers['stiker_netu_stock']) {
						$text_catalog_stiker_netu = $result['stock_status'];
					} else {
						$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
					}
					
					if ($result['image']) {
						$images = array();
						$this->load->model('catalog/product');
						$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
						foreach ($add_images as $add_image) {
							$images[] = array(
								'thumb' => $this->model_tool_image->resize($add_image['image'], $setting_last['image_width'], $setting_last['image_height'])
							);
						}
						$image = $this->model_tool_image->resize($result['image'], $setting_last['image_width'], $setting_last['image_height']);
					} else {
						$images = false;
						$image = $this->model_tool_image->resize('placeholder.png', $setting_last['image_width'], $setting_last['image_height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price_number = $result['price'];
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$price = false;
						$price_number = false;
					}

					if ((float)$result['special']) {
						$special_number = $result['special'];
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$special = false;
						$special_number = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$settings = $this->config->get('revtheme_cat_compare');
					if ($settings['main_cat']) {
						$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						if ($query_brand_main_cat_true->num_rows) {
							$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					} else {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
						if ($query_brand->num_rows) {
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					}
					
					$description = false;
					$options = false;
					if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
						if ($description_options['zamena_description']) {
							$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
						} else {
							$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
						}
						
						if ($description_options['options_in_grid']) {
							$options = array();
							$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
						
							foreach ($pr_options as $option) {
								$product_option_value_data = array();

								foreach ($option['product_option_value'] as $option_value) {
									if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
										if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
											$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
										} else {
											$option_price = false;
										}

										if ($option_value['price_prefix'] == '=') {
											$price_prefix = '';
										} else {
											$price_prefix = $option_value['price_prefix'];
										}
										
										$product_option_value_data[] = array(
											'product_option_value_id' => $option_value['product_option_value_id'],
											'quantity' 				  => $option_value['quantity'], 
											'model' 				  => $option_value['model'],
											'option_value_id'         => $option_value['option_value_id'],
											'name'                    => $option_value['name'],
											'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
											'price'                   => $option_price,
											'price_prefix'            => $price_prefix
										);
									}
								}

								$options[] = array(
									'product_option_id'    => $option['product_option_id'],
									'product_option_value' => $product_option_value_data,
									'option_id'            => $option['option_id'],
									'name'                 => $option['name'],
									'type'                 => $option['type'],
									'value'                => $option['value'],
									'required'             => $option['required']
								);
							}
						}
					}
					
					$data['products_last'][] = array(
						'price_number' => $price_number,
						'special_number' => $special_number,
						'compare_class' => $compare_class,
						'wishlist_class' => $wishlist_class,
						'button_compare' => $button_compare,
						'button_wishlist' => $button_wishlist,
						'stiker_last' => $stiker_last,
						'stiker_best' => $stiker_best,
						'stiker_spec' => $stiker_spec,
						'stiker_stock' => $stiker_stock,
						'stiker_upc' => $stiker_upc,
						'stiker_ean' => $stiker_ean,
						'stiker_jan' => $stiker_jan,
						'stiker_isbn' => $stiker_isbn,
						'stiker_mpn' => $stiker_mpn,
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
						'brand' => $brand,
						'images' => $images,
						'options' => $options,
						'quantity' => $result['quantity'],
						'options_buy' => $result['options_buy'],
						'model' => $result['model'],
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => $description,
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => $result['rating'],
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu
					);
				}
			}
			
		}
			
		if ($setting_spec['status']) {
			
			$data['autoscroll_spec'] = $setting_spec['autoscroll'];
				
			$data['products_spec'] = array();
			$filter_data_spec = array(
				'sort'  => 'ps.date_end',
				'order' => 'ASC',
				'start' => 0,
				'limit' => $setting_spec['limit']
			);

			$products_spec = $this->model_catalog_product->getProductSpecials($filter_data_spec);
			
			if ($products_spec) {
				foreach ($products_spec as $result) {
					if (isset($this->session->data['compare'])) {
						if (in_array($result['product_id'], $this->session->data['compare'])) {
							$compare_class = 'in_compare';
							$button_compare = $this->language->get('button_compare_out');
						} else {
							$compare_class = '';
							$button_compare = $this->language->get('button_compare');
						}
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
					if (isset($this->session->data['wishlist'])) {
						if (in_array($result['product_id'], $this->session->data['wishlist'])) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
					if ($this->customer->isLogged()) {
						$this->load->model('account/wishlist');
						$wishlist_register = $this->model_account_wishlist->getWishlist();
						if ($wishlist_register) {
							$wishlist_register2 = array();
							foreach ($wishlist_register as $result_wishlist_register_id) {
								$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
							}
							if (in_array($result['product_id'], $wishlist_register_id)) {
								$wishlist_class = 'in_wishlist';
								$button_wishlist = $this->language->get('button_wishlist_out');
							} else {
								$wishlist_class = '';
								$button_wishlist = $this->language->get('button_wishlist');
							}
						}
					}
					
					if ($settings_stikers['new_status']) {
						if (isset($date_added[$result['product_id']])) {
							$stiker_last = true;
						} else {
							$stiker_last = false;
						}
					} else {
						$stiker_last = false;
					}
					
					if ($settings_stikers['best_status']) {
						if (isset($best_seller[$result['product_id']])) {
							$stiker_best = true;	
						} else {
							$stiker_best = false;
						}
					} else {
						$stiker_best = false;
					}
					
					if ($settings_stikers['spec_status']) {
						$stiker_spec = true;
					} else {
						$stiker_spec = false;
					}
					
					if ($settings_stikers['stock_status']) {
						$stiker_stock = true;
					} else {
						$stiker_stock = false;
					}
					
					if ($settings_stikers['upc']) {
						$stiker_upc = $result['upc'];
					} else {
						$stiker_upc = false;
					}
					if ($settings_stikers['ean']) {
						$stiker_ean = $result['ean'];
					} else {
						$stiker_ean = false;
					}
					if ($settings_stikers['jan']) {
						$stiker_jan = $result['jan'];
					} else {
						$stiker_jan = false;
					}
					if ($settings_stikers['isbn']) {
						$stiker_isbn = $result['isbn'];
					} else {
						$stiker_isbn = false;
					}
					if ($settings_stikers['mpn']) {
						$stiker_mpn = $result['mpn'];
					} else {
						$stiker_mpn = false;
					}
					if ($settings_stikers['stiker_netu_stock']) {
						$text_catalog_stiker_netu = $result['stock_status'];
					} else {
						$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
					}
					
					if ($result['image']) {
						$images = array();
						$this->load->model('catalog/product');
						$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
						foreach ($add_images as $add_image) {
							$images[] = array(
								'thumb' => $this->model_tool_image->resize($add_image['image'], $setting_spec['image_width'], $setting_spec['image_height'])
							);
						}
						$image = $this->model_tool_image->resize($result['image'], $setting_spec['image_width'], $setting_spec['image_height']);
					} else {
						$images = false;
						$image = $this->model_tool_image->resize('placeholder.png', $setting_spec['image_width'], $setting_spec['image_height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price_number = (int)$result['price'];
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$price = false;
						$price_number = false;
					}

					if ((float)$result['special']) {
						$special_number = (int)$result['special'];
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$special = false;
						$special_number = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$settings = $this->config->get('revtheme_cat_compare');
					if ($settings['main_cat']) {
						$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						if ($query_brand_main_cat_true->num_rows) {
							$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					} else {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
						if ($query_brand->num_rows) {
							$brand = $query_brand->row['name'];
						} else {					
							$brand = 'Все товары';
						}
					}
					
					$description = false;
					$options = false;
					if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
						if ($description_options['zamena_description']) {
							$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
						} else {
							$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
						}
						
						if ($description_options['options_in_grid']) {
							$options = array();
							$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
						
							foreach ($pr_options as $option) {
								$product_option_value_data = array();

								foreach ($option['product_option_value'] as $option_value) {
									if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
										if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
											$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
										} else {
											$option_price = false;
										}

										if ($option_value['price_prefix'] == '=') {
											$price_prefix = '';
										} else {
											$price_prefix = $option_value['price_prefix'];
										}
										
										$product_option_value_data[] = array(
											'product_option_value_id' => $option_value['product_option_value_id'],
											'quantity' 				  => $option_value['quantity'], 
											'model' 				  => $option_value['model'],
											'option_value_id'         => $option_value['option_value_id'],
											'name'                    => $option_value['name'],
											'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
											'price'                   => $option_price,
											'price_prefix'            => $price_prefix
										);
									}
								}

								$options[] = array(
									'product_option_id'    => $option['product_option_id'],
									'product_option_value' => $product_option_value_data,
									'option_id'            => $option['option_id'],
									'name'                 => $option['name'],
									'type'                 => $option['type'],
									'value'                => $option['value'],
									'required'             => $option['required']
								);
							}
						}
					}
					
					$data['products_spec'][] = array(
						'price_number' => $price_number,
						'special_number' => $special_number,
						'compare_class' => $compare_class,
						'wishlist_class' => $wishlist_class,
						'button_compare' => $button_compare,
						'button_wishlist' => $button_wishlist,
						'stiker_last' => $stiker_last,
						'stiker_best' => $stiker_best,
						'stiker_spec' => $stiker_spec,
						'stiker_stock' => $stiker_stock,
						'stiker_upc' => $stiker_upc,
						'stiker_ean' => $stiker_ean,
						'stiker_jan' => $stiker_jan,
						'stiker_isbn' => $stiker_isbn,
						'stiker_mpn' => $stiker_mpn,
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
						'brand' => $brand,
						'images' => $images,
						'options' => $options,
						'quantity' => $result['quantity'],
						'options_buy' => $result['options_buy'],
						'model' => $result['model'],
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => $description,
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => $result['rating'],
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu
					);
				}
			}
			
		}
		if ($setting_best['not_view_null'] || $setting_last['not_view_null'] || $setting_spec['not_view_null']){
			$product_settings = $this->config->get('revtheme_product_all');
			$zakaz = $product_settings['zakaz'];
			$zakaz_price_null = $product_settings['zakaz_price_null'];
		}
		if ($setting_best['not_view_null'] && isset($data['products_best'])) {
			if (!$zakaz || !$zakaz_price_null) {
				foreach ($data['products_best'] as $key => $value) {
					if (!$zakaz) {
						$quantity[$key] = $value['quantity'];
					} else {
						$quantity[$key] = 2;
					}
					if (!$zakaz_price_null) {
						$price_number = $value['price_number'];
					} else {
						$price_number = 1;
					}
					if ($quantity[$key] < 1 || $price_number == 0) {
						unset($data['products_best'][$key]);
					}
				}
			}
		}
		if ($setting_last['not_view_null'] && isset($data['products_last'])) {
			if (!$zakaz || !$zakaz_price_null) {
				foreach ($data['products_last'] as $key => $value) {
					if (!$zakaz) {
						$quantity[$key] = $value['quantity'];
					} else {
						$quantity[$key] = 2;
					}
					if (!$zakaz_price_null) {
						$price_number = $value['price_number'];
					} else {
						$price_number = 1;
					}
					if ($quantity[$key] < 1 || $price_number == 0) {
						unset($data['products_last'][$key]);
					}
				}
			}
		}
		if ($setting_spec['not_view_null'] && isset($data['products_spec'])) {
			if (!$zakaz || !$zakaz_price_null) {
				foreach ($data['products_spec'] as $key => $value) {
					if (!$zakaz) {
						$quantity[$key] = $value['quantity'];
					} else {
						$quantity[$key] = 2;
					}
					if (!$zakaz_price_null) {
						$price_number = $value['price_number'];
					} else {
						$price_number = 1;
					}
					if ($quantity[$key] < 1 || $price_number == 0) {
						unset($data['products_spec'][$key]);
					}
				}
			}
		}
		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revp_modt', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revp_modt.tpl', $data);
		}

	}
	
	public function pbest($setting) {
		$this->load->language('revolution/revp_mod');
		$this->load->language('revolution/revolution');

		$setting = $this->config->get('revtheme_home_best');
		
		$setting_home_tabs = $this->config->get('revtheme_home_tabs');
		if ($setting_home_tabs) {
			return false;
		}
		
		if (!$setting['status']) {
			return false;
		}
		
		$data['autoscroll'] = $setting['autoscroll'];
		
		if ($setting['icontype']) {
			$data['heading_title'] = ('<i class="'.$setting['icon'].'"></i>' . $setting[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting['image'], 21, 21);
			$data['heading_title'] = ('<span class="heading_ico_image"><img src="'.$image.'" alt=""/></span>' . $setting[$this->config->get('config_language_id')]['title']);
		}

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
		$data['revpopuporder'] = $revpopuporder_settings['status'];
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['recalc_price'] = $product_settings['recalc_price'];
		$data['q_zavisimost'] = $product_settings['q_zavisimost'];
		$data['opt_price'] = $product_settings['opt_price'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');
		$data['popup_view'] = $setting_catalog_all['popup_view'];
		$data['img_slider'] = $setting_catalog_all['img_slider'];
		$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
		$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
		$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
		$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
		$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
		$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
		$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
		$data['text_catalog_revpopup_view'] = $this->language->get('text_catalog_revpopup_view');
		$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
		$description_options = $this->config->get('revtheme_cat_attributes');
		$data['description_options'] = $this->config->get('revtheme_cat_attributes');
		$data['text_select'] = $this->language->get('text_select');
		$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
		$data['text_option_option'] = $this->language->get('text_option_option');
		$revtheme_home_all = $this->config->get('revtheme_home_all');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
			$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
		} else {
			$currency = '';
			$config_product_description_length = $this->config->get('config_product_description_length');
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

		$this->load->model('revolution/revolution');

		$this->load->model('tool/image');

		$data['revp_id'] = 'pbest';
		$data['slider'] = $setting['slider'];
		
		$this->load->model('revolution/revolution');
		$settings_stikers = $this->config->get('revtheme_catalog_stiker');
		if ($settings_stikers['status']) {
			$data['stikers_status'] = true;

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
			}
		} else {
			$data['stikers_status'] = false;
		}
		
		$data['products'] = array();

		$settings_best = $this->config->get('revtheme_catalog_best');
		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit'],
			'filter_buy' => $settings_best['filter_buy']
		);

		if ($settings_best['best_products'] != '') {
			$results = explode(',', $settings_best['best_products']);
		} else {
			$results = $this->model_revolution_revolution->getBestProducts($filter_data);
		}

		if ($results) {
			foreach ($results as $result) {
				
				if ($settings_best['best_products'] != '') {
					$this->load->model('catalog/product');
					$result = $this->model_catalog_product->getProduct($result);
				}
				
				if (isset($this->session->data['compare'])) {
					if (in_array($result['product_id'], $this->session->data['compare'])) {
						$compare_class = 'in_compare';
						$button_compare = $this->language->get('button_compare_out');
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
				} else {
					$compare_class = '';
					$button_compare = $this->language->get('button_compare');
				}
				if (isset($this->session->data['wishlist'])) {
					if (in_array($result['product_id'], $this->session->data['wishlist'])) {
						$wishlist_class = 'in_wishlist';
						$button_wishlist = $this->language->get('button_wishlist_out');
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
				} else {
					$wishlist_class = '';
					$button_wishlist = $this->language->get('button_wishlist');
				}
				if ($this->customer->isLogged()) {
					$this->load->model('account/wishlist');
					$wishlist_register = $this->model_account_wishlist->getWishlist();
					if ($wishlist_register) {
						$wishlist_register2 = array();
						foreach ($wishlist_register as $result_wishlist_register_id) {
							$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
						}
						if (in_array($result['product_id'], $wishlist_register_id)) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					}
				}
				
				if ($settings_stikers['new_status']) {
					if (isset($date_added[$result['product_id']])) {
						$stiker_last = true;
					} else {
						$stiker_last = false;
					}
				} else {
					$stiker_last = false;
				}
				
				if ($settings_stikers['best_status']) {
					if (isset($best_seller[$result['product_id']])) {
						$stiker_best = true;	
					} else {
						$stiker_best = false;
					}
				} else {
					$stiker_best = false;
				}
				
				if ($settings_stikers['spec_status']) {
					$stiker_spec = true;
				} else {
					$stiker_spec = false;
				}
				
				if ($settings_stikers['stock_status']) {
					$stiker_stock = true;
				} else {
					$stiker_stock = false;
				}
				
				if ($settings_stikers['upc']) {
					$stiker_upc = $result['upc'];
				} else {
					$stiker_upc = false;
				}
				if ($settings_stikers['ean']) {
					$stiker_ean = $result['ean'];
				} else {
					$stiker_ean = false;
				}
				if ($settings_stikers['jan']) {
					$stiker_jan = $result['jan'];
				} else {
					$stiker_jan = false;
				}
				if ($settings_stikers['isbn']) {
					$stiker_isbn = $result['isbn'];
				} else {
					$stiker_isbn = false;
				}
				if ($settings_stikers['mpn']) {
					$stiker_mpn = $result['mpn'];
				} else {
					$stiker_mpn = false;
				}
				if ($settings_stikers['stiker_netu_stock']) {
					$text_catalog_stiker_netu = $result['stock_status'];
				} else {
					$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
				}
				
				if ($result['image']) {
					$images = array();
					$this->load->model('catalog/product');
					$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
					foreach ($add_images as $add_image) {
						$images[] = array(
							'thumb' => $this->model_tool_image->resize($add_image['image'], $setting['image_width'], $setting['image_height'])
						);
					}
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $setting['image_width'], $setting['image_height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price_number = $result['price'];
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$price = false;
					$price_number = false;
				}

				if ((float)$result['special']) {
					$special_number = $result['special'];
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$special = false;
					$special_number = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$settings = $this->config->get('revtheme_cat_compare');
				if ($settings['main_cat']) {
					$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
					if ($query_brand_main_cat_true->num_rows) {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				} else {
					$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
					if ($query_brand->num_rows) {
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				}
				
				$description = false;
				$options = false;
				if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
					if ($description_options['zamena_description']) {
						$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
					} else {
						$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
					}
					
					if ($description_options['options_in_grid']) {
						$options = array();
						$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
						foreach ($pr_options as $option) {
							$product_option_value_data = array();

							foreach ($option['product_option_value'] as $option_value) {
								if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
									if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
										$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
									} else {
										$option_price = false;
									}

									if ($option_value['price_prefix'] == '=') {
										$price_prefix = '';
									} else {
										$price_prefix = $option_value['price_prefix'];
									}
									
									$product_option_value_data[] = array(
										'product_option_value_id' => $option_value['product_option_value_id'],
										'quantity' 				  => $option_value['quantity'], 
										'model' 				  => $option_value['model'],
										'option_value_id'         => $option_value['option_value_id'],
										'name'                    => $option_value['name'],
										'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
										'price'                   => $option_price,
										'price_prefix'            => $price_prefix
									);
								}
							}

							$options[] = array(
								'product_option_id'    => $option['product_option_id'],
								'product_option_value' => $product_option_value_data,
								'option_id'            => $option['option_id'],
								'name'                 => $option['name'],
								'type'                 => $option['type'],
								'value'                => $option['value'],
								'required'             => $option['required']
							);
						}
					}
				}
				
				$data['products'][] = array(
					'price_number' => $price_number,
					'special_number' => $special_number,
					'compare_class' => $compare_class,
					'wishlist_class' => $wishlist_class,
					'button_compare' => $button_compare,
					'button_wishlist' => $button_wishlist,
					'stiker_last' => $stiker_last,
					'stiker_best' => $stiker_best,
					'stiker_spec' => $stiker_spec,
					'stiker_stock' => $stiker_stock,
					'stiker_upc' => $stiker_upc,
					'stiker_ean' => $stiker_ean,
					'stiker_jan' => $stiker_jan,
					'stiker_isbn' => $stiker_isbn,
					'stiker_mpn' => $stiker_mpn,
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
					'brand' => $brand,
					'images' => $images,
					'options' => $options,
					'quantity' => $result['quantity'],
					'options_buy' => $result['options_buy'],
					'model' => $result['model'],
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu
				);
			}
			if ($setting['not_view_null']) {
				$product_settings = $this->config->get('revtheme_product_all');
				$zakaz = $product_settings['zakaz'];
				$zakaz_price_null = $product_settings['zakaz_price_null'];
				if (!$zakaz || !$zakaz_price_null) {
					foreach ($data['products'] as $key => $value) {
						if (!$zakaz) {
							$quantity[$key] = $value['quantity'];
						} else {
							$quantity[$key] = 2;
						}
						if (!$zakaz_price_null) {
							$price_number[$key] = $value['price_number'];
						} else {
							$price_number[$key] = 1;
						}
						if ($quantity[$key] < 1 || $price_number[$key] == 0) {
							unset($data['products'][$key]);
						}
					}
				}
			}
			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revp_mod', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revp_mod.tpl', $data);
			}
		}
	}
	
	public function plast($setting) {
		$this->load->language('revolution/revp_mod');
		$this->load->language('revolution/revolution');
		
		$setting_home_tabs = $this->config->get('revtheme_home_tabs');
		if ($setting_home_tabs) {
			return false;
		}

		$setting = $this->config->get('revtheme_home_last');
		if (!$setting['status']) {
			return false;
		}
		
		$data['autoscroll'] = $setting['autoscroll'];
		
		if ($setting['icontype']) {
			$data['heading_title'] = ('<i class="'.$setting['icon'].'"></i>' . $setting[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting['image'], 21, 21);
			$data['heading_title'] = ('<span class="heading_ico_image"><img src="'.$image.'" alt=""/></span>' . $setting[$this->config->get('config_language_id')]['title']);
		}

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
		$data['revpopuporder'] = $revpopuporder_settings['status'];
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['recalc_price'] = $product_settings['recalc_price'];
		$data['q_zavisimost'] = $product_settings['q_zavisimost'];
		$data['opt_price'] = $product_settings['opt_price'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');
		$data['popup_view'] = $setting_catalog_all['popup_view'];
		$data['img_slider'] = $setting_catalog_all['img_slider'];
		$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
		$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
		$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
		$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
		$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
		$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
		$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
		$data['text_catalog_revpopup_view'] = $this->language->get('text_catalog_revpopup_view');
		$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
		$description_options = $this->config->get('revtheme_cat_attributes');
		$data['description_options'] = $this->config->get('revtheme_cat_attributes');
		$data['text_select'] = $this->language->get('text_select');
		$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
		$data['text_option_option'] = $this->language->get('text_option_option');
		$revtheme_home_all = $this->config->get('revtheme_home_all');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
			$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
		} else {
			$currency = '';
			$config_product_description_length = $this->config->get('config_product_description_length');
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
		
		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['status'] = $setting['status'];		
		$data['revp_id'] = 'plast';
		$data['slider'] = $setting['slider'];
		
		$this->load->model('revolution/revolution');
		$settings_stikers = $this->config->get('revtheme_catalog_stiker');
		if ($settings_stikers['status']) {
			$data['stikers_status'] = true;

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
			}
		} else {
			$data['stikers_status'] = false;
		}
		
		$data['products'] = array();

		$settings_last = $this->config->get('revtheme_catalog_last');
		if ($settings_last['filter_day']) {
			$filter_day = date('Y-m-d H:i:s', strtotime('now - ' . $settings_last['filter_day'] . ' days'));
		} else {
			$filter_day = false;
		}
		
		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit'],
			'filter_day' => $filter_day
		);

		if ($settings_last['last_products'] != '') {
			$results = explode(',', $settings_last['last_products']);
		} else {
			$results = $this->model_revolution_revolution->getLastProducts($filter_data);
		}

		if ($results) {
			foreach ($results as $result) {
				
				if ($settings_last['last_products'] != '') {
					$result = $this->model_catalog_product->getProduct($result);
				}
				
				if (isset($this->session->data['compare'])) {
					if (in_array($result['product_id'], $this->session->data['compare'])) {
						$compare_class = 'in_compare';
						$button_compare = $this->language->get('button_compare_out');
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
				} else {
					$compare_class = '';
					$button_compare = $this->language->get('button_compare');
				}
				if (isset($this->session->data['wishlist'])) {
					if (in_array($result['product_id'], $this->session->data['wishlist'])) {
						$wishlist_class = 'in_wishlist';
						$button_wishlist = $this->language->get('button_wishlist_out');
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
				} else {
					$wishlist_class = '';
					$button_wishlist = $this->language->get('button_wishlist');
				}
				if ($this->customer->isLogged()) {
					$this->load->model('account/wishlist');
					$wishlist_register = $this->model_account_wishlist->getWishlist();
					if ($wishlist_register) {
						$wishlist_register2 = array();
						foreach ($wishlist_register as $result_wishlist_register_id) {
							$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
						}
						if (in_array($result['product_id'], $wishlist_register_id)) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					}
				}
				
				if ($settings_stikers['new_status']) {
					if (isset($date_added[$result['product_id']])) {
						$stiker_last = true;
					} else {
						$stiker_last = false;
					}
				} else {
					$stiker_last = false;
				}
				
				if ($settings_stikers['best_status']) {
					if (isset($best_seller[$result['product_id']])) {
						$stiker_best = true;	
					} else {
						$stiker_best = false;
					}
				} else {
					$stiker_best = false;
				}
				
				if ($settings_stikers['spec_status']) {
					$stiker_spec = true;
				} else {
					$stiker_spec = false;
				}
				
				if ($settings_stikers['stock_status']) {
					$stiker_stock = true;
				} else {
					$stiker_stock = false;
				}
				
				if ($settings_stikers['upc']) {
					$stiker_upc = $result['upc'];
				} else {
					$stiker_upc = false;
				}
				if ($settings_stikers['ean']) {
					$stiker_ean = $result['ean'];
				} else {
					$stiker_ean = false;
				}
				if ($settings_stikers['jan']) {
					$stiker_jan = $result['jan'];
				} else {
					$stiker_jan = false;
				}
				if ($settings_stikers['isbn']) {
					$stiker_isbn = $result['isbn'];
				} else {
					$stiker_isbn = false;
				}
				if ($settings_stikers['mpn']) {
					$stiker_mpn = $result['mpn'];
				} else {
					$stiker_mpn = false;
				}
				if ($settings_stikers['stiker_netu_stock']) {
					$text_catalog_stiker_netu = $result['stock_status'];
				} else {
					$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
				}
				
				if ($result['image']) {
					$images = array();
					$this->load->model('catalog/product');
					$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
					foreach ($add_images as $add_image) {
						$images[] = array(
							'thumb' => $this->model_tool_image->resize($add_image['image'], $setting['image_width'], $setting['image_height'])
						);
					}
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $setting['image_width'], $setting['image_height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price_number = $result['price'];
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$price = false;
					$price_number = false;
				}

				if ((float)$result['special']) {
					$special_number = $result['special'];
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$special = false;
					$special_number = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$settings = $this->config->get('revtheme_cat_compare');
				if ($settings['main_cat']) {
					$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
					if ($query_brand_main_cat_true->num_rows) {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				} else {
					$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
					if ($query_brand->num_rows) {
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				}
				
				$description = false;
				$options = false;
				if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
					if ($description_options['zamena_description']) {
						$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
					} else {
						$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
					}
					
					if ($description_options['options_in_grid']) {
						$options = array();
						$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
						foreach ($pr_options as $option) {
							$product_option_value_data = array();

							foreach ($option['product_option_value'] as $option_value) {
								if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
									if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
										$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
									} else {
										$option_price = false;
									}

									if ($option_value['price_prefix'] == '=') {
										$price_prefix = '';
									} else {
										$price_prefix = $option_value['price_prefix'];
									}
									
									$product_option_value_data[] = array(
										'product_option_value_id' => $option_value['product_option_value_id'],
										'quantity' 				  => $option_value['quantity'], 
										'model' 				  => $option_value['model'],
										'option_value_id'         => $option_value['option_value_id'],
										'name'                    => $option_value['name'],
										'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
										'price'                   => $option_price,
										'price_prefix'            => $price_prefix
									);
								}
							}

							$options[] = array(
								'product_option_id'    => $option['product_option_id'],
								'product_option_value' => $product_option_value_data,
								'option_id'            => $option['option_id'],
								'name'                 => $option['name'],
								'type'                 => $option['type'],
								'value'                => $option['value'],
								'required'             => $option['required']
							);
						}
					}
				}
				
				$data['products'][] = array(
					'price_number' => $price_number,
					'special_number' => $special_number,
					'compare_class' => $compare_class,
					'wishlist_class' => $wishlist_class,
					'button_compare' => $button_compare,
					'button_wishlist' => $button_wishlist,
					'stiker_last' => $stiker_last,
					'stiker_best' => $stiker_best,
					'stiker_spec' => $stiker_spec,
					'stiker_stock' => $stiker_stock,
					'stiker_upc' => $stiker_upc,
					'stiker_ean' => $stiker_ean,
					'stiker_jan' => $stiker_jan,
					'stiker_isbn' => $stiker_isbn,
					'stiker_mpn' => $stiker_mpn,
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
					'brand' => $brand,
					'images' => $images,
					'options' => $options,
					'quantity' => $result['quantity'],
					'options_buy' => $result['options_buy'],
					'model' => $result['model'],
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu
				);
			}
			if ($setting['not_view_null']) {
				$product_settings = $this->config->get('revtheme_product_all');
				$zakaz = $product_settings['zakaz'];
				$zakaz_price_null = $product_settings['zakaz_price_null'];
				if (!$zakaz || !$zakaz_price_null) {
					foreach ($data['products'] as $key => $value) {
						if (!$zakaz) {
							$quantity[$key] = $value['quantity'];
						} else {
							$quantity[$key] = 2;
						}
						if (!$zakaz_price_null) {
							$price_number[$key] = $value['price_number'];
						} else {
							$price_number[$key] = 1;
						}
						if ($quantity[$key] < 1 || $price_number[$key] == 0) {
							unset($data['products'][$key]);
						}
					}
				}
			}
			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revp_mod', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revp_mod.tpl', $data);
			}
		}
	}
	
	public function pspec($setting) {
		$this->load->language('revolution/revp_mod');
		$this->load->language('revolution/revolution');

		$setting_home_tabs = $this->config->get('revtheme_home_tabs');
		if ($setting_home_tabs) {
			return false;
		}
		
		$setting = $this->config->get('revtheme_home_spec');
		if (!$setting['status']) {
			return false;
		}
		
		$data['autoscroll'] = $setting['autoscroll'];
		
		if ($setting['icontype']) {
			$data['heading_title'] = ('<i class="'.$setting['icon'].'"></i>' . $setting[$this->config->get('config_language_id')]['title']);
		} else {
			$image = $this->model_tool_image->resize($setting['image'], 21, 21);
			$data['heading_title'] = ('<span class="heading_ico_image"><img src="'.$image.'" alt=""/></span>' . $setting[$this->config->get('config_language_id')]['title']);
		}

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
		$data['revpopuporder'] = $revpopuporder_settings['status'];
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['recalc_price'] = $product_settings['recalc_price'];
		$data['q_zavisimost'] = $product_settings['q_zavisimost'];
		$data['opt_price'] = $product_settings['opt_price'];
		$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
		$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');
		$data['popup_view'] = $setting_catalog_all['popup_view'];
		$data['img_slider'] = $setting_catalog_all['img_slider'];
		$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
		$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
		$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
		$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
		$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
		$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
		$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
		$data['text_catalog_revpopup_view'] = $this->language->get('text_catalog_revpopup_view');
		$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
		$description_options = $this->config->get('revtheme_cat_attributes');
		$data['description_options'] = $this->config->get('revtheme_cat_attributes');
		$data['text_select'] = $this->language->get('text_select');
		$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
		$data['text_option_option'] = $this->language->get('text_option_option');
		$revtheme_home_all = $this->config->get('revtheme_home_all');
		
		if (VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
			$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
		} else {
			$currency = '';
			$config_product_description_length = $this->config->get('config_product_description_length');
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

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['status'] = $setting['status'];		
		$data['revp_id'] = 'pspec';
		$data['slider'] = $setting['slider'];
		
		$this->load->model('revolution/revolution');
		$settings_stikers = $this->config->get('revtheme_catalog_stiker');
		if ($settings_stikers['status']) {
			$data['stikers_status'] = true;

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
			}
		} else {
			$data['stikers_status'] = false;
		}
		
		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'ps.date_end',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if (isset($this->session->data['compare'])) {
					if (in_array($result['product_id'], $this->session->data['compare'])) {
						$compare_class = 'in_compare';
						$button_compare = $this->language->get('button_compare_out');
					} else {
						$compare_class = '';
						$button_compare = $this->language->get('button_compare');
					}
				} else {
					$compare_class = '';
					$button_compare = $this->language->get('button_compare');
				}
				if (isset($this->session->data['wishlist'])) {
					if (in_array($result['product_id'], $this->session->data['wishlist'])) {
						$wishlist_class = 'in_wishlist';
						$button_wishlist = $this->language->get('button_wishlist_out');
					} else {
						$wishlist_class = '';
						$button_wishlist = $this->language->get('button_wishlist');
					}
				} else {
					$wishlist_class = '';
					$button_wishlist = $this->language->get('button_wishlist');
				}
				if ($this->customer->isLogged()) {
					$this->load->model('account/wishlist');
					$wishlist_register = $this->model_account_wishlist->getWishlist();
					if ($wishlist_register) {
						$wishlist_register2 = array();
						foreach ($wishlist_register as $result_wishlist_register_id) {
							$wishlist_register_id[] = $result_wishlist_register_id['product_id'];
						}
						if (in_array($result['product_id'], $wishlist_register_id)) {
							$wishlist_class = 'in_wishlist';
							$button_wishlist = $this->language->get('button_wishlist_out');
						} else {
							$wishlist_class = '';
							$button_wishlist = $this->language->get('button_wishlist');
						}
					}
				}
				
				
				if ($settings_stikers['new_status']) {
					if (isset($date_added[$result['product_id']])) {
						$stiker_last = true;
					} else {
						$stiker_last = false;
					}
				} else {
					$stiker_last = false;
				}
				
				if ($settings_stikers['best_status']) {
					if (isset($best_seller[$result['product_id']])) {
						$stiker_best = true;	
					} else {
						$stiker_best = false;
					}
				} else {
					$stiker_best = false;
				}
				
				if ($settings_stikers['spec_status']) {
					$stiker_spec = true;
				} else {
					$stiker_spec = false;
				}
				
				if ($settings_stikers['stock_status']) {
					$stiker_stock = true;
				} else {
					$stiker_stock = false;
				}
				
				if ($settings_stikers['upc']) {
					$stiker_upc = $result['upc'];
				} else {
					$stiker_upc = false;
				}
				if ($settings_stikers['ean']) {
					$stiker_ean = $result['ean'];
				} else {
					$stiker_ean = false;
				}
				if ($settings_stikers['jan']) {
					$stiker_jan = $result['jan'];
				} else {
					$stiker_jan = false;
				}
				if ($settings_stikers['isbn']) {
					$stiker_isbn = $result['isbn'];
				} else {
					$stiker_isbn = false;
				}
				if ($settings_stikers['mpn']) {
					$stiker_mpn = $result['mpn'];
				} else {
					$stiker_mpn = false;
				}
				if ($settings_stikers['stiker_netu_stock']) {
					$text_catalog_stiker_netu = $result['stock_status'];
				} else {
					$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
				}
				
				if ($result['image']) {
					$images = array();
					$this->load->model('catalog/product');
					$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
					foreach ($add_images as $add_image) {
						$images[] = array(
							'thumb' => $this->model_tool_image->resize($add_image['image'], $setting['image_width'], $setting['image_height'])
						);
					}
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $setting['image_width'], $setting['image_height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price_number = $result['price'];
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$price = false;
					$price_number = false;
				}

				if ((float)$result['special']) {
					$special_number = $result['special'];
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$special = false;
					$special_number = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $currency);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$settings = $this->config->get('revtheme_cat_compare');
				if ($settings['main_cat']) {
					$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
					if ($query_brand_main_cat_true->num_rows) {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "' AND main_category = 1");
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				} else {
					$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$result['product_id'] . "'");
					if ($query_brand->num_rows) {
						$brand = $query_brand->row['name'];
					} else {					
						$brand = 'Все товары';
					}
				}
				
				$description = false;
				$options = false;
				if ($description_options['description_on'] && $revtheme_home_all['pr_opisanie']) {
					if ($description_options['zamena_description']) {
						$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
					} else {
						$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
					}
					
					if ($description_options['options_in_grid']) {
						$options = array();
						$pr_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
						foreach ($pr_options as $option) {
							$product_option_value_data = array();

							foreach ($option['product_option_value'] as $option_value) {
								if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
									if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
										$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
									} else {
										$option_price = false;
									}

									if ($option_value['price_prefix'] == '=') {
										$price_prefix = '';
									} else {
										$price_prefix = $option_value['price_prefix'];
									}
									
									$product_option_value_data[] = array(
										'product_option_value_id' => $option_value['product_option_value_id'],
										'quantity' 				  => $option_value['quantity'], 
										'model' 				  => $option_value['model'],
										'option_value_id'         => $option_value['option_value_id'],
										'name'                    => $option_value['name'],
										'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
										'price'                   => $option_price,
										'price_prefix'            => $price_prefix
									);
								}
							}

							$options[] = array(
								'product_option_id'    => $option['product_option_id'],
								'product_option_value' => $product_option_value_data,
								'option_id'            => $option['option_id'],
								'name'                 => $option['name'],
								'type'                 => $option['type'],
								'value'                => $option['value'],
								'required'             => $option['required']
							);
						}
					}
				}
				
				$data['products'][] = array(
					'price_number' => $price_number,
					'special_number' => $special_number,
					'compare_class' => $compare_class,
					'wishlist_class' => $wishlist_class,
					'button_compare' => $button_compare,
					'button_wishlist' => $button_wishlist,
					'stiker_last' => $stiker_last,
					'stiker_best' => $stiker_best,
					'stiker_spec' => $stiker_spec,
					'stiker_stock' => $stiker_stock,
					'stiker_upc' => $stiker_upc,
					'stiker_ean' => $stiker_ean,
					'stiker_jan' => $stiker_jan,
					'stiker_isbn' => $stiker_isbn,
					'stiker_mpn' => $stiker_mpn,
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
					'brand' => $brand,
					'images' => $images,
					'options' => $options,
					'quantity' => $result['quantity'],
					'options_buy' => $result['options_buy'],
					'model' => $result['model'],
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'text_catalog_stiker_netu' => $text_catalog_stiker_netu
				);
			}
			if ($setting['not_view_null']) {
				$product_settings = $this->config->get('revtheme_product_all');
				$zakaz = $product_settings['zakaz'];
				$zakaz_price_null = $product_settings['zakaz_price_null'];
				if (!$zakaz || !$zakaz_price_null) {
					foreach ($data['products'] as $key => $value) {
						if (!$zakaz) {
							$quantity[$key] = $value['quantity'];
						} else {
							$quantity[$key] = 2;
						}
						if (!$zakaz_price_null) {
							$price_number[$key] = $value['price_number'];
						} else {
							$price_number[$key] = 1;
						}
						if ($quantity[$key] < 1 || $price_number[$key] == 0) {
							unset($data['products'][$key]);
						}
					}
				}
			}
			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revp_mod', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revp_mod.tpl', $data);
			}
		}
	}

}