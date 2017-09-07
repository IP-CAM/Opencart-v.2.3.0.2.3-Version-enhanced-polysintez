<?php
class ControllerProductCompare extends Controller {
	public function index() {
		$this->load->language('revolution/revcompare');
		$this->load->language('revolution/revolution');
		
		$this->document->addScript('catalog/view/javascript/revolution/modernizr.js');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (!isset($this->session->data['compare'])) {
			$this->session->data['compare'] = array();
		}

		if (isset($this->request->get['remove'])) {
			$key = array_search($this->request->get['remove'], $this->session->data['compare']);

			if ($key !== false) {
				unset($this->session->data['compare'][$key]);
			}

			$this->response->redirect($this->url->link('product/compare'));
		}

		$this->document->setTitle("Сравнение товаров интернет-магазина компании Полисинтез");
		$this->document->setdescription("На данной странице вы можете сравнить по характеристикам выбранные вами продукты нашего интернет-магазина Полисинтез.");

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/compare')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_product'] = $this->language->get('text_product');
		$data['text_name'] = $this->language->get('text_name');
		$data['text_image'] = $this->language->get('text_image');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_sku'] = $this->language->get('text_sku');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_availability'] = $this->language->get('text_availability');
		$data['text_rating'] = $this->language->get('text_rating');
		$data['text_summary'] = $this->language->get('text_summary');
		$data['text_weight'] = $this->language->get('text_weight');
		$data['text_dimension'] = $this->language->get('text_dimension');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_compare_onlyrazn'] = $this->language->get('text_compare_onlyrazn');
		$data['text_compare_otmena'] = $this->language->get('text_compare_otmena');
		$data['text_compare_filter'] = $this->language->get('text_compare_filter');
		$data['text_compare_tovar'] = $this->language->get('text_compare_tovar');
		$data['text_catalog_stiker_last'] = $this->language->get('text_catalog_stiker_last');
		$data['text_catalog_stiker_best'] = $this->language->get('text_catalog_stiker_best');
		$data['text_compare_trash_tooltip'] = $this->language->get('text_compare_trash_tooltip');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['review_status'] = $this->config->get('config_review_status');
		$settings = $this->config->get('revtheme_cat_compare');
		
		$data['cat_sort'] = $settings['cat_sort'];
		$data['main_cat'] = $settings['main_cat'];
		$data['compare_price'] = $settings['compare_price'];
		$data['compare_model'] = $settings['compare_model'];
		$data['compare_sku'] = $settings['compare_sku'];
		$data['compare_manuf'] = $settings['compare_manuf'];
		$data['compare_stock'] = $settings['compare_stock'];
		$data['compare_rate'] = $settings['compare_rate'];
		$data['compare_srtdesc'] = $settings['compare_srtdesc'];
		$data['compare_weight'] = $settings['compare_weight'];
		$data['compare_razmer'] = $settings['compare_razmer'];
		$data['compare_atrib'] = $settings['compare_atrib'];
		$data['compare_atribgr'] = $settings['compare_atribgr'];
		$setting_catalog_all = $this->config->get('revtheme_catalog_all');
		$data['rev_srav_prod'] = $setting_catalog_all['rev_srav_prod'];
		$data['rev_wish_prod'] = $setting_catalog_all['rev_wish_prod'];

		$this->load->model('revolution/revolution');
		$settings_stikers = $this->config->get('revtheme_catalog_stiker');
		if ($settings_stikers['status']) {
			$data['stikers_status'] = true;

			if ($settings_stikers['new_status']) {
				$settings_last = $this->config->get('revtheme_catalog_last');
				$data_last = array(
					'sort'  => 'p.date_added',
					'order' => 'DESC',
					'start' => 0,
					'limit' => $settings_last['limit']
					);
				$date_added = $this->model_catalog_product->getProducts($data_last);
			}

			if ($settings_stikers['best_status']) {
				$settings_best = $this->config->get('revtheme_catalog_best');
				$data_best = array(
					'sort'  => 'p.sales',
					'order' => 'DESC',
					'start' => 0,
					'limit' => $settings_best['limit']
				);
				$best_seller = $this->model_revolution_revolution->getBestProducts($data_best);
			}
		} else {
			$data['stikers_status'] = false;
		}
		
		$product_settings = $this->config->get('revtheme_product_all');
		$data['zakaz'] = $product_settings['zakaz'];
		if (VERSION >= 2.2) {
			$config_image_compare_width = $this->config->get($this->config->get('config_theme') . '_image_compare_width');
			$config_image_compare_height = $this->config->get($this->config->get('config_theme') . '_image_compare_height');
			$currency = $this->session->data['currency'];
		} else {
			$config_image_compare_width = $this->config->get('config_image_compare_width');
			$config_image_compare_height = $this->config->get('config_image_compare_height');
			$currency = '';
		}
		
		$data['products'] = array();
		$data['attribute_groups'] = array();

		if ($settings['cat_sort']) {
			foreach ($this->session->data['compare'] as $key => $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $config_image_compare_width, $config_image_compare_height);
						$data['image_width'] = $config_image_compare_width . 'px';
						$data['image_height'] = $config_image_compare_height . 'px';
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $config_image_compare_width, $config_image_compare_height);
						$data['image_width'] = false;
						$data['image_height'] = false;
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
				
					if ($product_info['quantity'] <= 0) {
						$availability = $product_info['stock_status'];
					} elseif ($this->config->get('config_stock_display')) {
						$availability = $product_info['quantity'];
					} else {
						$availability = $product_info['stock_status'];
					}
					
					$attribute_data = array();
					
					$attribute_groups = $this->model_catalog_product->getProductAttributes($product_id);
					
					foreach ($attribute_groups as $attribute_group) {
						foreach ($attribute_group['attribute'] as $attribute) {
							$attribute_data[$attribute['attribute_id']] = $attribute['text'];
						}
					}					
					
					if (isset($this->session->data['compare'])) {
						if (in_array($product_id, $this->session->data['compare'])) {
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
						if (in_array($product_id, $this->session->data['wishlist'])) {
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
							if (in_array($product_id, $wishlist_register_id)) {
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
					
					$reviews_number = (int)$product_info['reviews'];
					$textcart_array = array('text_reviews_1', 'text_reviews_2', 'text_reviews_3');
					$textcart = $this->getcartword($reviews_number, $textcart_array);
					$reviews = sprintf($this->language->get($textcart), (int)$product_info['reviews']);
					
					$data['products'][$product_id] = array(
						'compare_class' => $compare_class,
						'wishlist_class' => $wishlist_class,
						'button_compare' => $button_compare,
						'button_wishlist' => $button_wishlist,
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
						'quantity' => $product_info['quantity'],
						'product_id'   => $product_info['product_id'],
						'name'         => $product_info['name'],
						'brand'    	   => $brand,
						'thumb'        => $image,
						'price'        => $price,
						'special'      => $special,
						'description'  => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
						'model'        => $product_info['model'],
						'sku'          => $product_info['sku'],
						'manufacturer' => $product_info['manufacturer'],
						'availability' => $availability,
						'minimum'      => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
						'rating'       => (int)$product_info['rating'],
						'reviews'      => $reviews,
						'weight'       => $this->weight->format($product_info['weight'], $product_info['weight_class_id']),
						'length'       => $this->length->format($product_info['length'], $product_info['length_class_id']),
						'width'        => $this->length->format($product_info['width'], $product_info['length_class_id']),
						'height'       => $this->length->format($product_info['height'], $product_info['length_class_id']),
						'attribute'    => $attribute_data,
						'href'         => $this->url->link('product/product', 'product_id=' . $product_id),
						'remove'       => $this->url->link('product/compare', 'remove=' . $product_id),
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu
					);
					
					foreach ($attribute_groups as $attribute_group) {
						$data['attribute_groups'][$attribute_group['attribute_group_id']]['name'] = $attribute_group['name'];
						
						foreach ($attribute_group['attribute'] as $attribute) {
							$data['attribute_groups'][$attribute_group['attribute_group_id']]['attribute'][$attribute['attribute_id']]['name'] = $attribute['name'];
						}
					}
				} else {
					unset($this->session->data['compare'][$key]);
				}
			}
			$brands = array();
				foreach( $data['products'] as $product ) {
					if($product['brand']) {
						$brands[$product['brand']]['products'][] = $product;
					} else {
						$brands['No name']['products'][] = $product;
					}
				}
			uksort($brands, 'strcasecmp');
			$data['products'] = $brands;
		} else {
			foreach ($this->session->data['compare'] as $key => $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $config_image_compare_width, $config_image_compare_height);
						$data['image_width'] = $config_image_compare_width . 'px';
						$data['image_height'] = $config_image_compare_height . 'px';
					} else {
						$image = false;
						$data['image_width'] = false;
						$data['image_height'] = false;
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
				
					if ($product_info['quantity'] <= 0) {
					$availability = $product_info['stock_status'];
					} elseif ($this->config->get('config_stock_display')) {
						$availability = $product_info['quantity'];
					} else {
						$availability = $product_info['stock_status'];
					}
					
					$attribute_data = array();
					
					$attribute_groups = $this->model_catalog_product->getProductAttributes($product_id);
					
					foreach ($attribute_groups as $attribute_group) {
						foreach ($attribute_group['attribute'] as $attribute) {
							$attribute_data[$attribute['attribute_id']] = $attribute['text'];
						}
					}					
					
					if (isset($this->session->data['compare'])) {
						if (in_array($product_id, $this->session->data['compare'])) {
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
						if (in_array($product_id, $this->session->data['wishlist'])) {
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
							if (in_array($product_id, $wishlist_register_id)) {
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
							$query_brand = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_info['product_id'] . "'");
							$brand = $query_brand->row['name'];
						}
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_info['product_id'] . "' AND main_category = 1");
					} else {
						$query_brand = $this->db->query("SELECT cd.name FROM " . DB_PREFIX . "product_to_category ptc LEFT JOIN " . DB_PREFIX . "category_description cd ON (cd.category_id = ptc.category_id) WHERE ptc.product_id = '" . (int)$product_info['product_id'] . "'");
						$brand = $query_brand->row['name'];
					}
					
					$reviews_number = (int)$product_info['reviews'];
					$textcart_array = array('text_reviews_1', 'text_reviews_2', 'text_reviews_3');
					$textcart = $this->getcartword($reviews_number, $textcart_array);
					$reviews = sprintf($this->language->get($textcart), (int)$product_info['reviews']);
					
					$data['products'][$product_id] = array(
						'compare_class' => $compare_class,
						'wishlist_class' => $wishlist_class,
						'button_compare' => $button_compare,
						'button_wishlist' => $button_wishlist,
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
						'quantity' => $product_info['quantity'],
						'product_id'   => $product_info['product_id'],
						'name'         => $product_info['name'],
						'brand'    	   => $brand,
						'thumb'        => $image,
						'price'        => $price,
						'special'      => $special,
						'description'  => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
						'model'        => $product_info['model'],
						'sku'          => $product_info['sku'],
						'manufacturer' => $product_info['manufacturer'],
						'availability' => $availability,
						'minimum'      => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
						'rating'       => (int)$product_info['rating'],
						'reviews'      => $reviews,
						'weight'       => $this->weight->format($product_info['weight'], $product_info['weight_class_id']),
						'length'       => $this->length->format($product_info['length'], $product_info['length_class_id']),
						'width'        => $this->length->format($product_info['width'], $product_info['length_class_id']),
						'height'       => $this->length->format($product_info['height'], $product_info['length_class_id']),
						'attribute'    => $attribute_data,
						'href'         => $this->url->link('product/product', 'product_id=' . $product_id),
						'remove'       => $this->url->link('product/compare', 'remove=' . $product_id),
						'text_catalog_stiker_netu' => $text_catalog_stiker_netu
					);
					
					foreach ($attribute_groups as $attribute_group) {
						$data['attribute_groups'][$attribute_group['attribute_group_id']]['name'] = $attribute_group['name'];
						
						foreach ($attribute_group['attribute'] as $attribute) {
							$data['attribute_groups'][$attribute_group['attribute_group_id']]['attribute'][$attribute['attribute_id']]['name'] = $attribute['name'];
						}
					}
				} else {
					unset($this->session->data['compare'][$key]);
				}
			}	
		}
		
		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		
		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('product/compare', $data));
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/compare.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/compare.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/compare.tpl', $data));
			}
		}
	}
	
	public function getcartword($number, $suffix) {
		$keys = array(2, 0, 1, 1, 1, 2);
		$mod = $number % 100;
		$suffix_key = ($mod > 7 && $mod < 20) ? 2: $keys[min($mod % 10, 5)];
		return $suffix[$suffix_key];
	}

	public function add() {
		$this->load->language('revolution/revcompare');

		$json = array();

		if (!isset($this->session->data['compare'])) {
			$this->session->data['compare'] = array();
		}

		if (!isset($this->session->data['compare_brand'])) {
			$this->session->data['compare_brand'] = array();
		}
		
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		if (isset($this->request->post['brand'])) {
			$brand = $this->request->post['brand'];
		} else {
			$brand = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			
			if (!in_array($product_id, $this->session->data['compare'])) {
				$this->session->data['compare'][$product_id] = $product_id;
				$this->session->data['compare_brand'][$product_id] = $brand;
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('product/compare'));
				$json['class_compare'] = 'in_compare';
				$json['button_compare'] = $this->language->get('button_compare_out');
			} else {
				unset($this->session->data['compare'][$product_id]);
				unset($this->session->data['compare_brand'][$brand]);
				$json['success'] = sprintf($this->language->get('text_unsuccess'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('product/compare'));
				$json['class_compare'] = '';
				$json['button_compare'] = $this->language->get('button_compare');
			}
		
			$json['total'] = sprintf($this->language->get('text_revcompare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function remove() {
		$this->load->language('revolution/revcompare');
		
		$json = array();

		if (!isset($this->session->data['compare'])) {
			$this->session->data['compare'] = array();
		}
		
		if (!isset($this->session->data['compare_brand'])) {
			$this->session->data['compare_brand'] = array();
		}
		
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		if (isset($this->request->post['brand'])) {
			$brand = $this->request->post['brand'];
		} else {
			$brand = 0;
		}	
		
		$this->load->model('catalog/product');
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
			
			unset($this->session->data['compare'][$product_id]);
			unset($this->session->data['compare_brand'][$product_id]);

			if (in_array($brand, $this->session->data['compare_brand'])) {
				$udbrand = false;
			} else {
				$udbrand = str_replace(' ','',$brand);
			}
			
			$json['success'] = sprintf($this->language->get('text_unsuccess'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('product/compare'));
			$json['total3'] = $udbrand;
			$json['total'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));		
			$json['total2'] = count($this->session->data['compare']);
		}		
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}