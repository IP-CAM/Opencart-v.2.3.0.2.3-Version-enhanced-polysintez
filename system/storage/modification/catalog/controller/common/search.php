<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonSearch extends Controller {

				public function ajaxLiveSearch() {
					$json = array();
					if(!empty($this->request->get['filter_name'])){
						$this->load->model('revolution/revolution');
						$this->load->model('tool/image');
						
						$setting = $this->config->get('revtheme_header_search');
						
						$filter_mpn = ($setting['ajax_search_mpn']) ? true : false;
						$filter_manufacturer = ($setting['ajax_search_manufacturer']) ? true : false;
						$filter_isbn = ($setting['ajax_search_isbn']) ? true : false;
						$filter_jan = ($setting['ajax_search_jan']) ? true : false;
						$filter_ean = ($setting['ajax_search_ean']) ? true : false;
						$filter_upc = ($setting['ajax_search_upc']) ? true : false;
						$filter_sku = ($setting['ajax_search_sku']) ? true : false;
						$filter_model = ($setting['ajax_search_model']) ? true : false;
						$filter_tag = ($setting['ajax_search_tag']) ? true : false;
						
						$filterdata=array(
							'filter_name' => $this->request->get['filter_name'],
							'filter_category_id' => $this->request->get['filter_category_id'],
							'filter_mpn' => $filter_mpn,
							'filter_manufacturer' => $filter_manufacturer,
							'filter_isbn' => $filter_isbn,
							'filter_jan' => $filter_jan,
							'filter_ean' => $filter_ean,
							'filter_upc' => $filter_upc,
							'filter_sku' => $filter_sku,
							'filter_model' => $filter_model,
							'filter_tag' => $filter_tag,
							'start' => 0,
							'limit' => ($setting['ajax_search_limit']!=0) ? $setting['ajax_search_limit'] : 5
						);
						
						$results = (array) $this->model_revolution_revolution->ajaxLiveSearch($filterdata);
						foreach($results as $result){
							if (!empty($result['image'])&&file_exists(DIR_IMAGE . $result['image'])) {
								$image = $this->model_tool_image->resize($result['image'], 50, 50);
							} else {
								$image = $this->model_tool_image->resize('no_image.jpg', 50, 50);
							}

							$product_settings = $this->config->get('revtheme_product_all');
							$zakaz = $product_settings['zakaz'];
							$zakaz_price_null = $product_settings['zakaz_price_null'];
							if (VERSION >= 2.2) {
								$currency = $this->session->data['currency'];
							} else {
								$currency = '';
							}
							if ($result['quantity'] < 1) {
								if ($zakaz) {
									$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
									$special = $result['special'] != 0.0000 ?  $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency) : 0;
								} else {
									$price= '<span style="color:#999">нет в наличии</span>';
									$special = '';
								}
							} else if ($result['price'] == 0) {
								if ($zakaz_price_null) {
									$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
									$special = $result['special'] != 0.0000 ?  $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency) : 0;
								} else {
									$price= '<span style="color:#999">нет в наличии</span>';
									$special = '';
								}
							} else {
								$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
								$special = $result['special'] != 0.0000 ?  $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency) : 0;
							}

							$json[] = array(
								'product_id' => $result['product_id'],
								'name' => $result['name'],
								'name1' => $result['name'],
								'image' => $image,
								'price' => $price,
								'special' => $special,
								'reviews' => $result['reviews']
							);
						}
					}
					$this->response->addHeader('Content-Type: application/json');
					$this->response->setOutput(json_encode($json));
				}
			
	public function index() {
		$this->load->language('common/search');

				$this->load->language('revolution/revolution');
				$setting = $this->config->get('revtheme_header_search');
				$data['in_category'] = $setting['in_category'];
				if ($setting['in_category']) {
					$this->load->model('catalog/category');
					$data['search_in_category'] = $this->language->get('search_in_category');
					$data['search_in_category_text_all'] = $this->language->get('search_in_category_text_all');
							
					if (isset($this->request->get['category_id'])) {
						$category_id = $this->request->get['category_id'];
					} else {
						$category_id = 0;
					}
					
					$data['category_id'] = $category_id;			
					$data['search_categories'] = array();
					$search_in_categories = $this->model_catalog_category->getCategories(0);
					foreach ($search_in_categories as $search_category) {
						$data['search_categories'][] = array(
							'category_id' => $search_category['category_id'],
							'name'        => $search_category['name']
						);
					}
				}
				if ($setting['ajax_search_status']) {
					$data['text_ajaxsearch_model'] = $this->language->get('text_ajaxsearch_model');
					$data['text_ajaxsearch_manufacturer'] = $this->language->get('text_ajaxsearch_manufacturer');
					$data['text_ajaxsearch_price'] = $this->language->get('text_ajaxsearch_price');
					$data['text_ajaxsearch_stock'] = $this->language->get('text_ajaxsearch_stock');
					$data['text_ajaxsearch_rating'] = $this->language->get('text_ajaxsearch_rating');
				}
			

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}