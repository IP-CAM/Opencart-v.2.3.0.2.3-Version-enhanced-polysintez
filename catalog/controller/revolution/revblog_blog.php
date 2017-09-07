<?php
class ControllerRevolutionRevblogBlog extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('revolution/revolution');
		$this->load->model('revolution/revolution');
		$this->load->model('tool/image');
		$this->load->model('catalog/product');
		$this->document->addStyle('catalog/view/javascript/revolution/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/revolution/owl-carousel/owl.carousel.min.js');
		
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['text_data_added'] = $this->language->get('text_data_added_blog');
		$data['text_tax'] = $this->language->get('text_tax');
		
		$setting = $this->config->get('revtheme_home_blog');
		$setting2 = $this->config->get('revblog_settings');
		$data['share_status'] = $setting2['share_status'];

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$category_info = false;

		if (isset($this->request->get['revblog_category_id'])) {
			$revblog_category_id = '';

			$parts = explode('_', (string)$this->request->get['revblog_category_id']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $blog_category) {

				if (!$revblog_category_id) {
					$revblog_category_id = $blog_category;
				} else {
					$revblog_category_id .= '_' . $blog_category;
				}

				$category_info = $this->model_revolution_revolution->getBlogCategory($blog_category);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['title'],
						'href' => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $revblog_category_id)
					);
				}
			}

			$category_info = $this->model_revolution_revolution->getBlogCategory($category_id);

			if ($category_info) {
				$data['breadcrumbs'][] = array(
					'text' => $category_info['title'],
					'href' => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'])
				);
			}
		}

		if (isset($this->request->get['revblog_id'])) {
			$revblog_id = (int)$this->request->get['revblog_id'];
		} else {
			$revblog_id = 0;
		}

		$blog_info = $this->model_revolution_revolution->getBlog($revblog_id);

		if ($blog_info) {
			$url = '';

			if (isset($this->request->get['revblog_category_id'])) {
				$url .= '&revblog_category_id=' . $this->request->get['revblog_category_id'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $blog_info['title'],
				'href' => $this->url->link('revolution/revblog_blog', $url . '&revblog_id=' . $revblog_id)
			);

			if ($blog_info['title_pr'] != '') {
				$data['heading_products_title'] = $blog_info['title_pr'];
			} else {
				$data['heading_products_title'] = $this->language->get('heading_products_title_blog');
			}
			
			$this->document->setTitle($blog_info['meta_title']);
			$this->document->setDescription($blog_info['meta_description']);
			$this->document->setKeywords($blog_info['meta_keyword']);
			$this->document->addLink($this->url->link('revolution/revblog_blog', 'revblog_id=' . $revblog_id), 'canonical');

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			
			$data['description'] = html_entity_decode($blog_info['description'], ENT_QUOTES, 'UTF-8');
			$data['data_added'] = date($this->language->get('date_format_short'), strtotime($blog_info['date_available']));
			$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
			$data['revpopuporder'] = $revpopuporder_settings['status'];

			$data['heading_title'] = $blog_info['title'];
			if (VERSION >= 2.2) {
				$config_image_popup_width = $this->config->get($this->config->get('config_theme') . '_image_popup_width');
				$config_image_popup_height = $this->config->get($this->config->get('config_theme') . '_image_popup_height');
				$config_image_product_width = $this->config->get($this->config->get('config_theme') . '_image_product_width');
				$config_image_product_height = $this->config->get($this->config->get('config_theme') . '_image_product_height');
				$currency = $this->session->data['currency'];
				$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
			} else {
				$config_image_popup_width = $this->config->get('config_image_popup_width');
				$config_image_popup_height = $this->config->get('config_image_popup_height');
				$config_image_product_width = $this->config->get('config_image_product_width');
				$config_image_product_height = $this->config->get('config_image_product_height');
				$currency = '';
				$config_product_description_length = $this->config->get('config_product_description_length');
			}

			$img_w = $setting2['form_image_width'];
			$img_h = $setting2['form_image_height'];
			
			$img_w2 = $setting2['images_image_width'];
			$img_h2 = $setting2['images_image_height'];

			if (!empty($img_w)) {
				$image_width = $img_w;
			} else {
				$image_width = 228;
			}
			
			if (!empty($img_h)) {
				$image_height = $img_h;
			} else {
				$image_height = 228;
			}

			if ($blog_info['image']) {
				$data['image'] = $this->model_tool_image->resize($blog_info['image'], $image_width, $image_height);
				//$this->document->setOgImage($blog_info['image']);
			} else {
				$data['image'] = false;
			}
			
			$data['images'] = array();
			$results = $this->model_revolution_revolution->getBlogImages($revblog_id);
			if ($results) {
				$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
				$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
				foreach ($results as $result) {
					$data['images'][] = array(
						'original'	=> HTTP_SERVER.'image/'.$result['image'],
						'popup' 	=> $this->model_tool_image->resize($result['image'], $config_image_popup_width, $config_image_popup_height),
						'thumb' 	=> $this->model_tool_image->resize($result['image'], $img_w2, $img_h2)
					);
				}
			}

			$data['continue'] = $this->url->link('common/home');
			
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
			$data['currency_code'] = $this->session->data['currency'];
			$var_currency = array();
			$var_currency['value'] = $this->currency->getValue($currency);
			$var_currency['symbol_left'] = $this->currency->getSymbolLeft($currency);
			$var_currency['symbol_right'] = $this->currency->getSymbolRight($currency);
			$var_currency['decimals'] = $this->currency->getDecimalPlace($currency);
			$var_currency['decimal_point'] = $this->language->get('decimal_point');
			$var_currency['thousand_point'] = $this->language->get('thousand_point');
			$data['currency'] = $var_currency;

			if ($this->request->server['HTTPS']) {
				$server = $this->config->get('config_ssl');
			} else {
				$server = $this->config->get('config_url');
			}
			if ($blog_info['image']) {
				$data['logo'] = $server . 'image/' . $blog_info['image'];
			} else {
				if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
					$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
				} else {
					$data['logo'] = '';
				}
			}
			$data['logo_width'] = '200';
			$data['logo_height'] = '200';
			$data['microdata_author'] = $data['microdata_name'] = $this->config->get('config_name');
			$data['microdata_date_info'] = date($this->language->get('date_format_short'), strtotime($blog_info['date_available']));
			$data['microdata_url_info'] = $this->url->link('revolution/revblog_blog', 'revblog_id=' . $revblog_id);
			
			$data['products'] = array();

			$results = $this->model_revolution_revolution->getBlogProducts($revblog_id);

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
				
				if ($result['image']) {
					$images = array();
					$this->load->model('catalog/product');
					$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
					foreach ($add_images as $add_image) {
						$images[] = array(
							'thumb' => $this->model_tool_image->resize($add_image['image'], $config_image_product_width, $config_image_product_height)
						);
					}
					$image = $this->model_tool_image->resize($result['image'], $config_image_product_width, $config_image_product_height);
				} else {
					$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $config_image_product_width, $config_image_product_height);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					$price_number = $result['price'];
				} else {
					$price = false;
					$price_number = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
					$special_number = $result['special'];
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
					'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'])
				);
			}
			
			if ($setting2['not_view_null'] && isset($data['products'])) {
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

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('revolution/revblog_blog', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/revolution/revblog_blog.tpl', $data));
			}
			
		} else {
			$this->load->language('error/not_found');
			
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('revolution/revblog_blog', '&revblog_id=' . $revblog_id)
			);

			$this->document->setTitle($this->language->get('text_error'));
			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('error/not_found', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/error/not_found.tpl', $data));
			}

		}
	}
}