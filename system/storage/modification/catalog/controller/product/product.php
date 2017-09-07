<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('product/product');

$this->load->language('revolution/revolution');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

				$this->document->addStyle('catalog/view/javascript/revolution/owl-carousel/owl.carousel.css');
				$this->document->addScript('catalog/view/javascript/revolution/owl-carousel/owl.carousel.min.js');
				$this->document->addScript('catalog/view/javascript/revolution/cloud-zoom/cloud-zoom.1.0.2.js');		
				$this->document->addStyle('catalog/view/javascript/revolution/cloud-zoom/cloud-zoom.css');
				$all_settings = $this->config->get('revtheme_product_all');
				$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
				$images_settings = $this->config->get('revtheme_product_images');
				$data['images_slider'] = $images_settings['slider'];
				$data['zoom'] = $images_settings['zoom'];
				$data['share_status'] = $all_settings['share_status'];
				$data['atributs'] = $all_settings['atributs'];
				$data['atributs_ssilka_all'] = $all_settings['atributs_ssilka_all'];
				$data['atributs_group_name'] = $all_settings['atributs_group_name'];
				$data['razmers'] = $all_settings['razmers'];
				$data['manufacturer_status'] = $all_settings['manufacturer_status'];
				$data['model_status'] = $all_settings['model_status'];
				$data['sku_status'] = $all_settings['sku_status'];
				$data['bonusbals_status'] = $all_settings['bonusbals_status'];
				$data['sklad_status'] = $all_settings['sklad_status'];
				$data['ostatok_status'] = $all_settings['ostatok_status'];
				$data['weight_status'] = $all_settings['weight_status'];
				$data['popup_purchase'] = $all_settings['popup_purchase'];
				$data['recalc_price'] = $all_settings['recalc_price'];
				$data['q_zavisimost'] = $all_settings['q_zavisimost'];
				$data['opt_price'] = $all_settings['opt_price'];
				$product_settings = $this->config->get('revtheme_product_all');
				$data['zakaz'] = $product_settings['zakaz'];
				$data['zakaz_price_null'] = $product_settings['zakaz_price_null'];
				$data['text_catalog_stiker_netu_2'] = $this->language->get('text_catalog_stiker_netu');
				$data['recalc_price'] = $product_settings['recalc_price'];
				$data['q_zavisimost'] = $product_settings['q_zavisimost'];
				$data['opt_price'] = $product_settings['opt_price'];
				$data['recpr_rightc'] = $all_settings['recpr_rightc'];
				$revpopuporder_settings = $this->config->get('revtheme_catalog_popuporder');
				$data['revpopuporder'] = $revpopuporder_settings['status'];
				$setting_catalog_all = $this->config->get('revtheme_catalog_all');
				$data['popup_view'] = $setting_catalog_all['popup_view'];
				$data['img_slider'] = $setting_catalog_all['img_slider'];
				$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
				$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];
				$data['ch_quantity'] = $setting_catalog_all['ch_quantity'];
				$data['text_catalog_stiker_netu'] = $this->language->get('text_catalog_stiker_netu');
				$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
				$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
				$data['text_catalog_revpopup_purchase'] = $this->language->get('text_catalog_revpopup_purchase');
				$data['text_catalog_revpopup_view'] = $this->language->get('text_catalog_revpopup_view');
				$data['text_catalog_price_na_zakaz'] = $this->language->get('text_catalog_price_na_zakaz');
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
				$data['text_model_option'] = $this->language->get('text_model_option');
				$data['text_price_option'] = $this->language->get('text_price_option');
				$data['text_option_option'] = $this->language->get('text_option_option');
				$data['text_dostupno_option'] = $this->language->get('text_dostupno_option');
				$data['text_quantity_option'] = $this->language->get('text_quantity_option');
				$data['chislo_ryad'] = $setting_catalog_all['chislo_ryad'];
				$description_options = $this->config->get('revtheme_cat_attributes');
				$data['description_options'] = $this->config->get('revtheme_cat_attributes');
				$data['setting_all_settings'] = $this->config->get('revtheme_all_settings');
				if (VERSION >= 2.2) {
					$currency = $this->session->data['currency'];
					$config_image_additional_width = $this->config->get($this->config->get('config_theme') . '_image_additional_width');
					$config_image_additional_height = $this->config->get($this->config->get('config_theme') . '_image_additional_height');
					$config_image_thumb_width = $this->config->get($this->config->get('config_theme') . '_image_thumb_width');
					$config_image_thumb_height = $this->config->get($this->config->get('config_theme') . '_image_thumb_height');
					$config_image_popup_width = $this->config->get($this->config->get('config_theme') . '_image_popup_width');
					$config_image_popup_height = $this->config->get($this->config->get('config_theme') . '_image_popup_height');
					$config_image_related_width = $this->config->get($this->config->get('config_theme') . '_image_related_width');
					$config_image_related_height = $this->config->get($this->config->get('config_theme') . '_image_related_height');
					$config_product_description_length = $this->config->get($this->config->get('config_theme') . '_product_description_length');
				} else {
					$currency = '';
					$config_image_additional_width = $this->config->get('config_image_additional_width');
					$config_image_additional_height = $this->config->get('config_image_additional_height');
					$config_image_thumb_width = $this->config->get('config_image_thumb_width');
					$config_image_thumb_height = $this->config->get('config_image_thumb_height');
					$config_image_popup_width = $this->config->get('config_image_popup_width');
					$config_image_popup_height = $this->config->get('config_image_popup_height');
					$config_image_related_width = $this->config->get('config_image_related_width');
					$config_image_related_height = $this->config->get('config_image_related_height');
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
			

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

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
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

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

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			if ($product_info['meta_title']) {
				$this->document->setTitle($product_info['meta_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}
			
			if ($product_info['noindex'] <= 0) {
				$this->document->setRobots('noindex,follow');
			}
			
			if ($product_info['meta_h1']) {	
				$data['heading_title'] = $product_info['meta_h1'];
			} else {
				$data['heading_title'] = $product_info['name'];
			}
			
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

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
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_benefits'] = $this->language->get('text_benefits');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			
				if (strlen($product_info['description']) > 20) {
					$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
				} else {
					$data['description'] = '';
				}
			
			$data['sticker'] = $this->getStickers($product_info['product_id']);


				$data['options_buy'] = $product_info['options_buy'];
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
					$data['stiker_stock'] = true;
				} else {
					$data['stiker_stock'] = false;
				}
				
				$data['weight'] = number_format($product_info['weight'], 2);
				$data['weight_value'] = $product_info['weight'];
				$data['weight_unit'] = $this->weight->getUnit($product_info['weight_class_id']);				
				$data['length'] = number_format($product_info['length'], 2);
				$data['width'] = number_format($product_info['width'], 2);
				$data['height'] = number_format($product_info['height'], 2);
				$data['length_format'] = $this->length->getUnit($product_info['length_class_id']);
				$data['weight_format'] = $this->weight->getUnit($product_info['weight_class_id']);
				
				$data['revtheme_product_all_attribute_group'] = $this->config->get('revtheme_product_all_attribute_group');
				
				if ($product_info['sku']) {
					$data['sku'] = $product_info['sku'];
				} else {
					$data['sku'] = '';
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
				
				$data['zakaz'] = $all_settings['zakaz'];
				$data['quantity'] = $product_info['quantity'];
				$data['text_relblogs'] = $this->language->get('text_relblogs');
				$data['shtuki'] = $this->language->get('text_shtuki');
				$data['config_image_additional_width'] = $config_image_additional_width;
				$data['config_image_additional_height'] = $config_image_additional_height;
			
			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'] . '<span class="hidden pr_quantity">' . $product_info['quantity'] . '</span>';
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = '<span class="pr_quantity">' . $product_info['quantity'] . '</span> ' . $data['shtuki'];
			} else {
				$data['stock'] = $product_info['stock_status'] . '<span class="hidden pr_quantity">' . $product_info['quantity'] . '</span>';
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = $this->model_tool_image->resize('no_image.png', $config_image_popup_width, $config_image_popup_height);
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = $this->model_tool_image->resize('no_image.png', $config_image_thumb_width, $config_image_thumb_height);
			}


				if ($product_info['image']) {
					$this->document->setOgImage($this->model_tool_image->resize($product_info['image'], $config_image_thumb_width, $config_image_thumb_height));
					$data['thumb_small'] = $this->model_tool_image->resize($product_info['image'], $config_image_additional_width, $config_image_additional_height);
				} else {
					$data['thumb_small'] = $this->model_tool_image->resize('no_image.png', $config_image_additional_width, $config_image_additional_height);
				}
			
			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(

				'thumb_big' => $this->model_tool_image->resize($result['image'], $config_image_thumb_width, $config_image_thumb_height),
				'video' => $result['video'],
			
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
$data['price_number'] = $product_info['price'];
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
$data['price_number'] = false;
				$data['price'] = false;
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
			
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {

				$data['special_number'] = false;
				$data['special_end'] = false;
			
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}
			
			$productbenefits = $this->model_catalog_product->getProductBenefitsbyProductId($product_info['product_id']);
			
			$data['benefits'] = array();
				
			foreach ($productbenefits as $benefit) {
				if ($benefit['image'] && file_exists(DIR_IMAGE . $benefit['image'])) {
					$bimage = $benefit['image'];
					if ($benefit['type']) {
						$bimage = $this->model_tool_image->resize($bimage, 25, 25);
					} else {
						$bimage = $this->model_tool_image->resize($bimage, 350, 140);
					}
				} else {
					$bimage = 'no_image.jpg';
				}
				$data['benefits'][] = array(
					'benefit_id'      	=> $benefit['benefit_id'],
					'name'      		=> $benefit['name'],
					'description'      	=> strip_tags(html_entity_decode($benefit['description'])),
					'thumb'      		=> $bimage,
					'link'      		=> $benefit['link'],
					'type'      		=> $benefit['type']
					//'sort_order' => $benefit['sort_order']
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
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
'quantity' => $option_value['quantity'], 'model' => $option_value['model'],
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

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
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

			
				$data['reviews_number'] = $reviews_number = (int)$product_info['reviews'];
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

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

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
			
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

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
			
				if ($result['image']) {

				$images = array();
				$this->load->model('catalog/product');
				$add_images = $this->model_catalog_product->getProductImages($result['product_id']);
				foreach ($add_images as $add_image) {
					$images[] = array(
						'thumb' => $this->model_tool_image->resize($add_image['image'], $config_image_related_width, $config_image_related_height)
					);
				}
			
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
$images = false;
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}


				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price_number = $result['price'];
				} else {
					$price_number = false;
				}
				if ((float)$result['special']) {
					$special_number = $result['special'];
				} else {
					$special_number = false;
				}
			
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
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
				'text_catalog_stiker_netu' => $text_catalog_stiker_netu,
				'quantity' => $result['quantity'],
				'compare_class' => $compare_class,
				'wishlist_class' => $wishlist_class,
				'button_compare' => $button_compare,
				'button_wishlist' => $button_wishlist,
				'brand' => $brand,
				'images' => $images,
				'reviews' => $reviews,
				'options_buy' => $result['options_buy'],
				'model' => $result['model'],
			
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
'description' => $description,
					'sticker'     => $stickers,
					'benefits'    => $benefits,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

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


				$this->load->model('revolution/revolution');
				$data['blogs'] = array();
				$results = $this->model_revolution_revolution->getBlogsRelated($this->request->get['product_id']);
				if ($results) {
					foreach ($results as $result) {							
						$data['blogs'][] = array(
							'title'    	 => $result['title'],
							'href'    	 => $this->url->link('revolution/revblog_blog', 'revblog_id=' . $result['revblog_id']),
						);
					}
				}

				$data['tab_info'] = $this->model_revolution_revolution->getproductTabs($this->request->get['product_id']);
				$data['product_tabs'] = array();	
				$tabresults = $this->model_revolution_revolution->getproducttab($this->request->get['product_id']);
				foreach($tabresults as $result){
					$data['product_tabs'][] = array(
						'product_tab_id' => $result['product_tab_id'],
						'title'   => $result['heading'],
						'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
					);
				}
			

				$setting_revtheme_product_mods = $this->config->get('revtheme_product_mods');
				$revtheme_home_viewed_products = $this->config->get('revtheme_home_viewed_products');
				$setting_revtheme_cat_mods = $this->config->get('revtheme_cat_mods');
				
				if ($setting_revtheme_product_mods['viewed_products'] || $revtheme_home_viewed_products['status'] || $setting_revtheme_cat_mods['viewed_products']) {
					$viewed_products = array();
					
					if (isset($this->request->cookie['viewed'])) {
						$viewed_products = explode(',', $this->request->cookie['viewed']);
					} else if (isset($this->session->data['viewed'])) {
						$viewed_products = $this->session->data['viewed'];
					}

					if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
						$product_id = $this->request->get['product_id'];
						$viewed_products = array_diff($viewed_products, array($product_id));
						array_unshift($viewed_products, $product_id);
						setcookie('viewed', implode(',',$viewed_products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
					}
				}
		
				if ($setting_revtheme_product_mods['viewed_products']) {
				
					$data['viewed_products_zagolovok'] = $setting_revtheme_product_mods[$this->config->get('config_language_id')]['viewed_products_zagolovok'];
					$data['viewed_products'] = array();

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
										'thumb' => $this->model_tool_image->resize($add_image['image'], $config_image_related_width, $config_image_related_height)
									);
								}
								$image = $this->model_tool_image->resize($product_info['image'], $config_image_related_width, $config_image_related_height);
							} else {
								$images = false;
								$image = $this->model_tool_image->resize('no_image.png', $config_image_related_width, $config_image_related_height);
							}

							if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
								$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
							} else {
								$price = false;
							}

							if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
								$price_number = $product_info['price'];
							} else {
								$price_number = false;
							}
							
							if ((float)$product_info['special']) {
								$special_number = $product_info['special'];
							} else {
								$special_number = false;
							}
						
							if ((float)$product_info['special']) {
								$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
							} else {
								$special = false;
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
				
			$setting_text_blocks = $setting_revtheme_product_mods['text_block'];
			if ($setting_text_blocks) {
				$data['text_block_zagolovok'] = $setting_revtheme_product_mods[$this->config->get('config_language_id')]['text_block_zagolovok'];
				$data['text_block_cols'] = $setting_revtheme_product_mods['text_block_cols'];
				$results_tb = $this->config->get('revtheme_blocks_product_item');
				if (!empty($results_tb)){
					foreach ($results_tb as $result) {
						
						$style = '';
						if ($result['icontype']) {
							if ($result['icon'] == 'fa none') {
								$style = ' hidden';
							}
							$image = '<i class="'.$result['icon'].$style.'"></i>';
						} else {
							if (!$result['image'] || $result['image'] == 'no_image.png') {
								$style = ' hidden';
							}
							$image = '<img src="'.$this->model_tool_image->resize($result['image'], 40, 40).'" alt=""/>';
						}
						
						$data['text_blocks'][] = array(
							'title' => $result['title'][$this->config->get('config_language_id')],
							'image' => $image,
							'description' => $result['description'][$this->config->get('config_language_id')],
							'link'  => $result['link'],
							'sort'  => $result['sort'],
							'style' => $style
						);
					}
				} else {			
					$data['text_blocks'] = false;
				}
				if (!empty($data['text_blocks'])){
					foreach ($data['text_blocks'] as $key => $value) {
						$sort[$key] = $value['sort'];
					}
					array_multisort($sort, SORT_ASC, $data['text_blocks']);
				}	
			} else {
				$data['text_blocks'] = false;
			}
			
			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$data['product_tabs']=array();
			
			$tabresults = $this->model_catalog_product->getproducttab($this->request->get['product_id']);
			
			foreach($tabresults as $result){
				$data['product_tabs'][]=array(
					'product_tab_id' => $result['product_tab_id'],
					'title'   => $result['heading'],
					'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
				);
			}

			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
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


				public function update_prices() {
					if (isset($this->request->request['product_id']) && isset($this->request->request['quantity'])) {
						$this->load->model('catalog/product');
						$this->load->model('tool/image');
						
						$product_id      = (int)$this->request->request['product_id'];
						$quantity        = (int)$this->request->request['quantity'];
						$product_info    = $this->model_catalog_product->getProduct($product_id);
						$product_options = $this->model_catalog_product->getProductOptions($product_id);
						$itog_weight     = $product_info['weight'];
						$option_weight	 = 0;
						$option_weight2	 = 0;
						$itog_reward     = $product_info['reward'];
						$option_points 	 = 0;
						$option_points2  = 0;
						$option_price_pl = false;
						$option_price    = 0;
						$option_price2 	 = 0;
						$option_quantity = $product_info['quantity'];
						$opt_image 		 = false;
						$opt_model 		 = $product_info['model'];

						if (!empty($this->request->request['option'])) {
						  $option = $this->request->request['option'];
						} else {
						  $option = array();
						}

						foreach ($product_options as $product_option) {

						 if (is_array($product_option['product_option_value'])) {
							foreach ($product_option['product_option_value'] as $option_value) {
							  if(isset($option[$product_option['product_option_id']])) {
								if(($option[$product_option['product_option_id']] == $option_value['product_option_value_id']) || ((is_array($option[$product_option['product_option_id']])) && (in_array($option_value['product_option_value_id'], $option[$product_option['product_option_id']])))) {
								 if ($option_value['price_prefix'] == '+') {
								    $option_price += $option_value['price'];
								 } elseif ($option_value['price_prefix'] == '-') {
									$option_price -= $option_value['price'];
								 } elseif ($option_value['price_prefix'] == '=') {
									$option_price_pl = true;
									$option_price2 = $option_value['price'];
								 }
								 if ($option_value['weight_prefix'] == '+') {
									$option_weight += $option_value['weight'];
								 } elseif ($option_value['weight_prefix'] == '-') {
									$option_weight -= $option_value['weight'];
								 } elseif ($option_value['weight_prefix'] == '=') {
									$option_weight2 = $option_value['weight'];
									$itog_weight = 0;
								 }
								 if ($option_value['points_prefix'] == '+') {
									$option_points += $option_value['points'];
								 } elseif ($option_value['points_prefix'] == '-') {
									$option_points -= $option_value['points'];
								 } elseif ($option_value['points_prefix'] == '=') {
									$option_points2 = $option_value['points'];
									$itog_reward = 0;
								 }
								 $option_quantity = $option_value['quantity'];
								 if($option_value['opt_image']) {
									$opt_image = $option_value['opt_image'];
								 }
								 if($option_value['model']) {
									$opt_model = $option_value['model'];
								 }
							   }
							 }
						   }
						 }
						}

						$json = array();
						
						if (VERSION >= 2.2) {
							$config_image_popup_width = $this->config->get($this->config->get('config_theme') . '_image_popup_width');
							$config_image_popup_height = $this->config->get($this->config->get('config_theme') . '_image_popup_height');
							$config_image_product_width = $this->config->get($this->config->get('config_theme') . '_image_product_width');
							$config_image_product_height = $this->config->get($this->config->get('config_theme') . '_image_product_height');
							$config_image_thumb_width = $this->config->get($this->config->get('config_theme') . '_image_thumb_width');
							$config_image_thumb_height = $this->config->get($this->config->get('config_theme') . '_image_thumb_height');
							$currency = $this->session->data['currency'];
						} else {
							$config_image_popup_width = $this->config->get('config_image_popup_width');
							$config_image_popup_height = $this->config->get('config_image_popup_height');
							$config_image_product_width = $this->config->get('config_image_product_width');
							$config_image_product_height = $this->config->get('config_image_product_height');
							$config_image_thumb_width = $this->config->get('config_image_thumb_width');
							$config_image_thumb_height = $this->config->get('config_image_thumb_height');
							$currency = '';
						}
						
						if ($opt_image) {
							$json['opt_image'] = $this->model_tool_image->resize($opt_image, $config_image_product_width, $config_image_product_height);
							$json['opt_image_2'] = $this->model_tool_image->resize($opt_image, $config_image_thumb_width, $config_image_thumb_height);
							$json['opt_image_2_big'] = $this->model_tool_image->resize($opt_image, $config_image_popup_width, $config_image_popup_height);
						} else {
							$json['opt_image'] = $this->model_tool_image->resize($product_info['image'], $config_image_product_width, $config_image_product_height);
							$json['opt_image_2'] = $this->model_tool_image->resize($product_info['image'], $config_image_thumb_width, $config_image_thumb_height);
							$json['opt_image_2_big'] = $this->model_tool_image->resize($product_info['image'], $config_image_popup_width, $config_image_popup_height);
						}
						
						if ($opt_model) {
							$json['opt_model'] = $opt_model;
						} else {
							$json['opt_model'] = $opt_model;
						}
						
						if ($option_weight2) {
							$option_weight = $itog_weight + $option_weight + $option_weight2;
							$json['weight'] = $option_weight * $quantity;
						} else {
							$json['weight'] = ($itog_weight + $option_weight) * $quantity;
						}
						
						if ($option_points2) {
							$option_points = $itog_reward + $option_points + $option_points2;
							$json['points'] = $option_points * $quantity;
						} else {
							$json['points'] = ($itog_reward + $option_points) * $quantity;
						}
						
						$json['option_quantity'] = $option_quantity;
						
						if ($option_price_pl) {
							$json['special_n'] = (float)($this->tax->calculate($option_price2 * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$json['special_n'] = (float)(($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
						}
						
						if ($option_price_pl) {
							$json['price_n'] = (float)($this->tax->calculate($option_price2 * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$json['price_n'] = (float)(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
						}
						
						$json['special'] = $this->currency->format(($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
						$json['price'] = $this->currency->format(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
						
						$this->response->addHeader('Content-Type: application/json');
						$this->response->setOutput(json_encode($json));
					}
				}

				public function update_discount($product_id, $quantity) {
					$this->load->model('catalog/product');
					$product_info = (array)$this->model_catalog_product->getProduct($product_id);
					$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
					$price = $product_info['price'];
					$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
					if ($product_discount_query->num_rows) {
					$price = $product_discount_query->row['price'];
					}
					$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
					if ($product_special_query->num_rows) {
						$price = $product_special_query->row['price'];
					}       
					return $price;
				}
			
	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}


				$this->load->language('revolution/revolution');
				$data['entry_answer'] = $this->language->get('entry_answer');
			
		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 10, 10);

		foreach ($results as $result) {
			$data['reviews'][] = array(

				'answer' => $result['answer'],
				'answer_from' => $result['answer_from'],
			
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($review_total - 10)) ? $review_total : ((($page - 1) * 10) + 10), $review_total, ceil($review_total / 10));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
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
