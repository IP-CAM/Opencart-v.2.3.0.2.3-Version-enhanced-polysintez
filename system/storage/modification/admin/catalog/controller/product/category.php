<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

				$this->load->model('account/wishlist');
				$this->load->language('revolution/revolution');
				$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
				$data['revpopuporder'] = $revpopuporder_settings['status'];
				$setting_sort_default = $this->config->get('revtheme_catalog_sorts_category');
				$setting_catalog_all = $this->config->get('revtheme_catalog_all');
				$data['podcategory_status'] = $setting_catalog_all['podcategory_status'];
				$data['podcategory_imgs'] = $setting_catalog_all['podcategory_imgs'];
				$data['popup_view'] = $setting_catalog_all['popup_view'];
				$data['img_slider'] = $setting_catalog_all['img_slider'];
				$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
				$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
				$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
				if (isset($setting_catalog_all['vid_grid'])) { $data['vid_grid'] = true; } else { $data['vid_grid'] = false; }
				if (isset($setting_catalog_all['vid_list'])) { $data['vid_list'] = true; } else { $data['vid_list'] = false; }
				if (isset($setting_catalog_all['vid_price'])) { $data['vid_price'] = true; } else { $data['vid_price'] = false; }
				$product_settings = $this->config->get('revtheme_product_all');
				$data['zakaz'] = $product_settings['zakaz'];
				$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
				$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
				$data['recalc_price'] = $product_settings['recalc_price'];
				$data['q_zavisimost'] = $product_settings['q_zavisimost'];
				$data['opt_price'] = $product_settings['opt_price'];
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
				
				if (VERSION >= 2.2) {
					$config_image_product_width = $data['catalog_img_width'] = $this->config->get($this->config->get('config_theme') . '_image_product_width');
					$config_image_product_height = $this->config->get($this->config->get('config_theme') . '_image_product_height');
					$currency = $this->session->data['currency'];
					$config_product_description_length = $this->config->get('config_product_description_length');
					$config_product_limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
				} else {
					$config_image_product_width = $data['catalog_img_width'] = $this->config->get('config_image_product_width');
					$config_image_product_height = $this->config->get('config_image_product_height');
					$currency = '';
					$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
					$config_product_limit = $this->config->get('config_product_limit');
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
			

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
			$this->document->setRobots('noindex,follow');
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
			$this->document->setRobots('noindex,follow');
		} else {
			$sort = $setting_sort_default['sort_default'];
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = $setting_sort_default['sort_default_adesc'];
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
			$this->document->setRobots('noindex,follow');
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
			$this->document->setRobots('noindex,follow');
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			if ($category_info['meta_title']) {
				$this->document->setTitle($category_info['meta_title']);
			} else {
				$this->document->setTitle($category_info['name']);
			}
			
			if ($category_info['noindex'] <= 0) {
				$this->document->setRobots('noindex,follow');
			}
			
			if ($category_info['meta_h1']) {
				$data['heading_title'] = $category_info['meta_h1'];
			} else {
				$data['heading_title'] = $category_info['name'];
			}
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');
			$data['text_benefits'] = $this->language->get('text_benefits');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['description_bottom'] = html_entity_decode($category_info['description_bottom'], ENT_QUOTES, 'UTF-8');
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

		//opencart turbo start
		
		$cache_data = null;
		
		if ($this->config->get('turbo_subcategory') && $this->config->get('turbo_status')) {
			$cache = 'turbo.subcategory.' . $this->language->get('code') . '.' . $this->config->get('config_store_id') . '.' . $category_id;
			$cache_data = $this->cache->get($cache);
		}
		
		if (!empty($cache_data) && is_array($cache_data)) {	
			$data['categories'] = $cache_data;	
		} else {		
		///opencart turbo end 
	

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);


				if (VERSION >= 2.2) {
					$config_image_category_width = $this->config->get($this->config->get('config_theme') . '_image_category_width');
					$config_image_category_height = $this->config->get($this->config->get('config_theme') . '_image_category_height');
				} else {
					$config_image_category_width = $this->config->get('config_image_category_width');
					$config_image_category_height = $this->config->get('config_image_category_height');
				}
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $config_image_category_width, $config_image_category_height);
				} else {
					$image = $this->model_tool_image->resize('no_image.png', $config_image_category_width, $config_image_category_height);
				}
				$data['revpath'] = $this->request->get['path'];
			
				$data['categories'][] = array(

				'thumb' => $image,
			
					'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}


		//opencart turbo start
			if ($this->config->get('turbo_subcategory') && $this->config->get('turbo_status')) {
				$this->cache->set($cache, $data['categories']);
			}
		}
		//opencart turbo end 
	
			$data['products'] = array();

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
			

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

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
						'thumb' => $this->model_tool_image->resize($add_image['image'], $config_image_product_width, $config_image_product_height)
					);
				}
			
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
$price_number = $result['price'];
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
$price_number = false;
				}

				if ((float)$result['special']) {
$special_number = $result['special'];
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
$special_number = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				
				if ($result['description_mini']) {
					$description = utf8_substr(strip_tags(html_entity_decode($result['description_mini'], ENT_QUOTES, 'UTF-8')), 0);
				} else {
					$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..';
				}
				
				$productbenefits = $this->model_catalog_product->getProductBenefitsbyProductId($result['product_id']);
				
				$benefits = array();
				
				foreach ($productbenefits as $benefit) {
					if ($benefit['image'] && file_exists(DIR_IMAGE . $benefit['image'])) {
						$bimage = $benefit['image'];
						if ($benefit['type']) {
							$bimage = $this->model_tool_image->resize($bimage, 25, 25);
						} else {
							$bimage = $this->model_tool_image->resize($bimage, 120, 60);
						}
					} else {
						$bimage = 'no_image.jpg';
					}
					$benefits[] = array(
						'benefit_id'      	=> $benefit['benefit_id'],
						'name'      		=> $benefit['name'],
						'description'      	=> strip_tags(html_entity_decode($benefit['description'])),
						'thumb'      		=> $bimage,
						'link'      		=> $benefit['link'],
						'type'      		=> $benefit['type']
					);
				}
				
				$stickers = $this->getStickers($result['product_id']) ;
				



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
				
				if ($this->config->get('config_review_status')) {
					$reviews = (int)$result['reviews'];
				} else {
					$reviews = false;
				}
				
				$description = '';
				$options = false;
				if ($description_options['description_on']) {
					if ($description_options['zamena_description']) {
						$description = $this->model_revolution_revolution->getAttrText($result['product_id']);
					} else {
						$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
					}

					if ($description_options['options_in_cat']) {
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
										'quantity'            	  => $option_value['quantity'],
										'model'            	  	  => $option_value['model'],
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

				'options' => $options,
				'price_number' => $price_number,
				'special_number' => $special_number,
				'stiker_last' => $stiker_last,
				'stiker_best' => $stiker_best,
				'stiker_spec' => $stiker_spec,
				'stiker_stock' => $stiker_stock,
				'stiker_upc' => $stiker_upc,
				'stiker_ean' => $stiker_ean,
				'stiker_jan' => $stiker_jan,
				'stiker_isbn' => $stiker_isbn,
				'stiker_mpn' => $stiker_mpn,
				'quantity' => $result['quantity'],
				'compare_class' => $compare_class,
				'wishlist_class' => $wishlist_class,
				'button_compare' => $button_compare,
				'button_wishlist' => $button_wishlist,
				'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
				'brand' => $brand,
				'images' => $images,
				'reviews' => $reviews,
				'options_buy' => $result['options_buy'],
				'model' => $result['model'],
			
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
'description' => $description,
					'sticker'     => $stickers,
					'benefits'    => $benefits,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


				$setting_revtheme_product_mods = $this->config->get('revtheme_cat_mods');
		
				if ($setting_revtheme_product_mods['viewed_products']) {
				
					$this->document->addStyle('catalog/view/javascript/revolution/owl-carousel/owl.carousel.css');
					$this->document->addScript('catalog/view/javascript/revolution/owl-carousel/owl.carousel.min.js');
				
					$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
					$data['viewed_products_zagolovok'] = $setting_revtheme_product_mods[$this->config->get('config_language_id')]['viewed_products_zagolovok'];
					$data['viewed_products'] = array();
					$viewed_products = array();

					if (isset($this->request->cookie['viewed'])) {
						$viewed_products = explode(',', $this->request->cookie['viewed']);
					} else if (isset($this->session->data['viewed'])) {
						$viewed_products = $this->session->data['viewed'];
					}

					if (empty($setting_revtheme_product_mods['viewed_products_limit'])) {
						$setting_revtheme_product_mods['viewed_products_limit'] = 8;
					}

					$viewed_products = array_slice($viewed_products, 0, (int)$setting_revtheme_product_mods['viewed_products_limit']);
					
					foreach ($viewed_products as $product_id) {
						$product_info = $this->model_catalog_product->getProduct($product_id);
						
						$product_id2 = isset($this->request->get['product_id']) ? $this->request->get['product_id'] : 0;
						
						if ($product_info and $product_id != $product_id2) {
							if (isset($this->session->data['compare'])) {
								if (in_array($product_info['product_id'], $this->session->data['compare'])) {
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
								if (in_array($product_info['product_id'], $this->session->data['wishlist'])) {
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
									if (in_array($product_info['product_id'], $wishlist_register_id)) {
										$wishlist_class = 'in_wishlist';
										$button_wishlist = $this->language->get('button_wishlist_out');
									} else {
										$wishlist_class = '';
										$button_wishlist = $this->language->get('button_wishlist');
									}
								}
							}
							
							if ($settings_stikers['new_status']) {
								if (isset($date_added[$product_info['product_id']])) {
									$stiker_last = true;
								} else {
									$stiker_last = false;
								}
							} else {
								$stiker_last = false;
							}
							
							if ($settings_stikers['best_status']) {
								if (isset($best_seller[$product_info['product_id']])) {
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
								$stiker_upc = $product_info['upc'];
							} else {
								$stiker_upc = false;
							}
							if ($settings_stikers['ean']) {
								$stiker_ean = $product_info['ean'];
							} else {
								$stiker_ean = false;
							}
							if ($settings_stikers['jan']) {
								$stiker_jan = $product_info['jan'];
							} else {
								$stiker_jan = false;
							}
							if ($settings_stikers['isbn']) {
								$stiker_isbn = $product_info['isbn'];
							} else {
								$stiker_isbn = false;
							}
							if ($settings_stikers['mpn']) {
								$stiker_mpn = $product_info['mpn'];
							} else {
								$stiker_mpn = false;
							}
							if ($settings_stikers['stiker_netu_stock']) {
								$text_catalog_stiker_netu = $product_info['stock_status'];
							} else {
								$text_catalog_stiker_netu = $this->language->get('text_catalog_stiker_netu');
							}
							
							$settings = $this->config->get('revtheme_cat_compare');
							if ($settings['main_cat']) {
								$query_brand_main_cat_true = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_info['product_id'] . "' AND main_category = 1");
								if ($query_brand_main_cat_true->num_rows) {
									$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_info['product_id'] . "' AND main_category = 1");
									$brand = $query_brand->row['name'];
								} else {					
									$brand = 'Все товары';
								}
							} else {
								$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_info['product_id'] . "'");
								if ($query_brand->num_rows) {
									$brand = $query_brand->row['name'];
								} else {					
									$brand = 'Все товары';
								}
							}
						
							if ($product_info['image']) {
								$images = array();
								$this->load->model('catalog/product');
								$add_images = $this->model_catalog_product->getProductImages($product_info['product_id']);
								foreach ($add_images as $add_image) {
									$images[] = array(
										'thumb' => $this->model_tool_image->resize($add_image['image'], $config_image_product_width, $config_image_product_height)
									);
								}
								$image = $this->model_tool_image->resize($product_info['image'], $config_image_product_width, $config_image_product_height);
							} else {
								$images = false;
								$image = $this->model_tool_image->resize('no_image.png', $config_image_product_width, $config_image_product_height);
							}

							if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
								$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
								$price_number = $product_info['price'];
							} else {
								$price = false;
								$price_number = false;
							}
						
							if ((float)$product_info['special']) {
								$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
								$special_number = $product_info['special'];
							} else {
								$special = false;
								$special_number = false;
							}

							if ($this->config->get('config_tax')) {
								$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $currency);
							} else {
								$tax = false;
							}

							if ($this->config->get('config_review_status')) {
								$rating = (int)$product_info['rating'];
							} else {
								$rating = false;
							}
							
							if ($this->config->get('config_review_status')) {
								$reviews = (int)$product_info['reviews'];
							} else {
								$reviews = false;
							}
							
							$description = '';
							$options = false;
							if ($description_options['description_on']) {
								if ($description_options['zamena_description']) {
									$description = $this->model_revolution_revolution->getAttrText($product_info['product_id']);
								} else {
									$description = utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $config_product_description_length) . '...';
								}

								if ($description_options['options_in_cat']) {
									$options = array();
									$pr_options = $this->model_catalog_product->getProductOptions($product_info['product_id']);
								
									foreach ($pr_options as $option) {
										$product_option_value_data = array();

										foreach ($option['product_option_value'] as $option_value) {
											if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
												if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
													$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
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

							$data['viewed_products'][] = array(
								'options' => $options,
								'price_number' => $price_number,
								'special_number' => $special_number,
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
								'quantity' => $product_info['quantity'],
								'compare_class' => $compare_class,
								'wishlist_class' => $wishlist_class,
								'button_compare' => $button_compare,
								'button_wishlist' => $button_wishlist,
								'brand' => $brand,
								'images' => $images,
								'reviews' => $reviews,
								'options_buy' => $product_info['options_buy'],
								'model' => $product_info['model'],
								'product_id'  => $product_info['product_id'],
								'thumb'       => $image,
								'name'        => $product_info['name'],
								'description' => $description,
								'price'       => $price,
								'special'     => $special,
								'tax'         => $tax,
								'minimum'     => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
								'rating'      => $rating,
								'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
							);
						}
					}
				
				} else {
					$data['viewed_products'] = false;
				}
			
			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);


				require(DIR_APPLICATION.'controller/product/sorts_category.php');
			
			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), $config_product_limit*2, $config_product_limit*3, $config_product_limit*5, $config_product_limit*10));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/category', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
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

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
	
	private function getStickers($product_id) {
	
 	$stickers = $this->model_catalog_product->getProductStickerbyProductId($product_id) ;	

		
		if (!$stickers) {
			return;
		}
		
		$data['stickers'] = array();
		
		foreach ($stickers as $sticker) {
			$data['stickers'][] = array(
				'position' => $sticker['position'],
				'image'    => HTTP_SERVER . 'image/' . $sticker['image']
			);		
		}
				
		return $this->load->view('product/stickers', $data);
	
	}
}
