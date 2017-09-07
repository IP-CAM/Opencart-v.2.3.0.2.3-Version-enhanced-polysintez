<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonHeader extends Controller {
	public function index() {

		if ($this->registry->get('config')->get('progroman_cm_status')) {
            $this->document->addScript('catalog/view/javascript/jquery/progroman/jquery.progroman.autocomplete.js');
            $this->document->addScript('catalog/view/javascript/jquery/progroman/jquery.progroman.city-manager.js');
            $this->document->addStyle('catalog/view/javascript/jquery/progroman/progroman.city-manager.css');
        }
            
$this->document->addStyle('catalog/view/theme/revolution/stylesheet/opencart_pro.css');
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();


				$data['og_image'] = $this->document->getOgImage();
				$setting_home_slideshow = $this->config->get('revtheme_home_slideshow');
				$data['b_color_home_slideshow'] = $setting_home_slideshow['b_color'];
				$data['mobile_home_slideshow'] = $setting_home_slideshow['mobile'];
				$setting_home_blog = $this->config->get('revtheme_home_blog');
				$data['b_color_home_blog'] = $setting_home_blog['b_color'];
				$data['stikers_settings'] = $this->config->get('revtheme_catalog_stiker');
				$setting_header_search = $this->config->get('revtheme_header_search');
				$setting_footer_user_set = $this->config->get('revtheme_footer_user_set');
				$data['user_styles'] = html_entity_decode($setting_footer_user_set['styles'], ENT_QUOTES, 'UTF-8');
				$setting_all_settings = $this->config->get('revtheme_all_settings');
				$data['setting_all_settings'] = $this->config->get('revtheme_all_settings');
				$data['color_selecta'] = $setting_all_settings['color_selecta'];
				$data['razmiv_cont'] = $setting_all_settings['razmiv_cont'];
				$data['revtheme_cat_attributes'] = $this->config->get('revtheme_cat_attributes');
				$data['revtheme_product_all'] = $this->config->get('revtheme_product_all');
				if ($setting_header_search['ajax_search_status']) {
					$this->document->addScript('catalog/view/javascript/revolution/ajax_search.js');
				}
				$setting_header_menu = $this->config->get('revtheme_header_menu');
				$data['cats_status'] = $setting_header_menu['cats_status'];
				if ($setting_header_menu['type']) {
					$data['amazon'] = true;
				} else {
					$data['amazon'] = false;
				}
				if ($setting_header_menu['image_in_ico']) {
					$data['image_in_ico'] = true;
				} else {
					$data['image_in_ico'] = false;
				}
				if ($setting_header_menu['tri_level']) {
					$data['tri_level'] = true;
				} else {
					$data['tri_level'] = false;
				}
				if ($setting_header_menu['image_in_ico_m']) {
					$data['image_in_ico_m'] = true;
				} else {
					$data['image_in_ico_m'] = false;
				}
				$this->load->language('revolution/revolution');
				$data['text_oppro_blog'] = $this->language->get('text_oppro_blog');
				$data['text_header_back'] = $this->language->get('text_header_back');
				$data['text_header_information'] = $this->language->get('text_header_information');
				$data['text_header_revpopup_phone'] = $this->language->get('text_header_revpopup_phone');
				$data['text_header_menu2_heading'] = $this->language->get('text_header_menu2_heading');
				$data['revmenu'] = $this->load->controller('revolution/revmenu');
				$settings_popupphone = $this->config->get('revtheme_header_popupphone');
				$data['revtheme_header_popupphone'] = $settings_popupphone;
				$settings_header_standart_links = $this->config->get('revtheme_header_standart_links');
				$data['popup_login'] = $settings_header_standart_links['popup_login'];
				$data['rev_lang'] = $settings_header_standart_links['rev_lang'];
				$data['rev_curr'] = $settings_header_standart_links['rev_curr'];
				$data['rev_srav'] = $settings_header_standart_links['rev_srav'];
				$data['rev_wish'] = $settings_header_standart_links['rev_wish'];
				$data['rev_acc'] = $settings_header_standart_links['rev_acc'];
				
				$data['microdata_status'] = $setting_all_settings['microdata_status'];
				$data['microdata_postcode'] = $setting_all_settings['microdata_postcode'];
				$data['microdata_city'] = $setting_all_settings['microdata_city'];
				$data['microdata_adress'] = $setting_all_settings['microdata_adress'];
				$data['microdata_email'] = $setting_all_settings['microdata_email'];
				if ($setting_all_settings['microdata_phones']) {
					$microdata_phones = explode(",", $setting_all_settings['microdata_phones']);
					$microdata_phones = array_map('trim',$microdata_phones);
					$data['microdata_phones'] = array_diff($microdata_phones, array(''));
				} else {
					$data['microdata_phones'] = false;
				}		
				if ($setting_all_settings['microdata_social']) {
					$microdata_social = explode(",", $setting_all_settings['microdata_social']);
					$microdata_social = array_map('trim',$microdata_social);
					$data['microdata_social'] = array_diff($microdata_social, array(''));
				} else {
					$data['microdata_social'] = false;
				}
				$data['setting_catalog_all'] = $this->config->get('revtheme_catalog_all');

				$dop_contact_status = $this->config->get('revtheme_header_dop_contacts_status');
				if ($dop_contact_status){
					$dop_contact = $this->config->get('revtheme_header_dop_contact');
					if (!empty($dop_contact)){
						foreach ($dop_contact as $result) {
							$data['dop_contacts'][] = array(
								'icon' 		=> $result['icon'],
								'number' 	=> $result['number'],
								'href' 		=> $result['href']
							);
						}
					} else {			
						$data['dop_contacts'] = false;
					}
				} else {			
						$data['dop_contacts'] = false;
				}
	
				$header_phone = $this->config->get('revtheme_header_phone');
				$data['header_phone_text'] = $header_phone[$this->config->get('config_language_id')]['text'];
				$data['header_phone_text2'] = $header_phone[$this->config->get('config_language_id')]['text2'];
				$data['header_phone_cod'] = $header_phone[$this->config->get('config_language_id')]['cod'];
				$data['header_phone_number'] = $header_phone[$this->config->get('config_language_id')]['number'];
				$data['header_phone_cod2'] = $header_phone[$this->config->get('config_language_id')]['cod2'];
				$data['header_phone_number2'] = $header_phone[$this->config->get('config_language_id')]['number2'];
				if ($header_phone['icontype']) {
					if ($header_phone['icon'] == 'fa none') {
						$data['header_phone_image'] = '';
					}
					$data['header_phone_image'] = '<i class="'.$header_phone['icon'].'"></i>';
				} else {
					if (!$header_phone['image'] || $header_phone['image'] == 'no_image.png') {
						$data['header_phone_image'] = '';
					}
					$this->load->model('tool/image');
					$data['header_phone_image'] = '<img src="'.$this->model_tool_image->resize($header_phone['image'], 32, 32).'" alt=""/>';
				}
				
				$this->load->model('catalog/information');

				$data['informations'] = array();
				$data['informations2'] = array();

				foreach ($this->model_catalog_information->getInformations() as $result) {
					if ($result['top']) {
						$data['informations'][] = array(
							'title' => $result['title'],
							'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
						);
					}
					if ($result['top2']) {
						$data['informations2'][] = array(
							'title' => $result['title'],
							'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
						);
					}
				}

				$results_h_links = $this->config->get('revtheme_header_link');
				if (!empty($results_h_links)){
					foreach ($results_h_links as $result) {
						$data['revtheme_header_links'][] = array(
							'link'  => $result['link'],
							'title' => $result['title'][$this->config->get('config_language_id')],
							'sort'  => $result['sort']
						);
					}
				} else {
					$data['revtheme_header_links'] = false;
				}
				if (!empty($data['revtheme_header_links'])){
					foreach ($data['revtheme_header_links'] as $key => $value) {
						$sort[$key] = $value['sort'];
					}
					if (count($data['revtheme_header_links']) > 1) {
					array_multisort($sort, SORT_ASC, $data['revtheme_header_links']);
					}
				}
				
				$results_h_links2 = $this->config->get('revtheme_header_link2');
				if (!empty($results_h_links2)){
					foreach ($results_h_links2 as $result) {
						
						$style = '';
						$this->load->model('tool/image');
						if ($result['icontype']) {
							if ($result['icon'] == 'fa none') {
								$style = ' hidden';
							}
							$image = '<i class="hidden-md '.$result['icon'].$style.'"></i>';
						} else {
							if (!$result['image'] || $result['image'] == 'no_image.png') {
								$style = ' hidden';
							}
							$image = '<span class="hidden-md '.$style.'"><img src="'.$this->model_tool_image->resize($result['image'], 15, 15).'" alt=""/></span>';
						}
						$result_title = ($image . $result['title'][$this->config->get('config_language_id')]);
						
						$data['revtheme_header_links2'][] = array(
							'link'  => $result['link'],
							'title' => $result_title,
							'sort'  => $result['sort']
						);
					}
				} else {
					$data['revtheme_header_links2'] = false;
				}
				if (!empty($data['revtheme_header_links2'])){
					foreach ($data['revtheme_header_links2'] as $key => $value) {
						$sort2[$key] = $value['sort'];
					}
					if (count($data['revtheme_header_links2']) > 1) {
					array_multisort($sort2, SORT_ASC, $data['revtheme_header_links2']);
					}
				}

				$data['text_compare'] = sprintf($this->language->get('text_revcompare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
				$data['compare'] = $this->url->link('product/compare');
				$data['manuf_status'] = $setting_header_menu['manuf'];
				if (VERSION >= 2.2) {
					$config_image_category_width = $this->config->get($this->config->get('config_theme') . '_image_category_width');
					$config_image_category_height = $this->config->get($this->config->get('config_theme') . '_image_category_height');
				} else {
					$config_image_category_width = $this->config->get('config_image_category_width');
					$config_image_category_height = $this->config->get('config_image_category_height');
				}
				if ($setting_header_menu['manuf']) {
					$data['text_revmenu_manufs'] = $this->language->get('text_revmenu_manufs');
					$data['url_revmenu_manufs'] = $this->url->link('product/manufacturer');
					$data['n_column'] = $setting_header_menu['n_column'];
					$this->load->model('catalog/manufacturer');
					$data['categories_m'] = array();
					$results = $this->model_catalog_manufacturer->getManufacturers();
					foreach ($results as $result) {
						$name = $result['name'];
						if (is_numeric(utf8_substr($name, 0, 1))) {
							$key = '0 - 9';
						} else {
							$key = utf8_substr(utf8_strtoupper($name), 0, 1);
						}
						if (!isset($data['categories_m'][$key])) {
							$data['categories_m'][$key]['name'] = $key;
						}
						if ($result['image']) {
							$thumb = $this->model_tool_image->resize($result['image'], $config_image_category_width, $config_image_category_height);
						} else {
							$thumb = $this->model_tool_image->resize('no_image.png', $config_image_category_width, $config_image_category_height);
						}
						$data['categories_m'][$key]['manufacturer'][] = array(
							'thumb' => $thumb,
							'name' => $name,
							'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
						);
					}
				}
			
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['robots'] = $this->document->getRobots();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');


				$data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
				$data['text_page'] = 'страница';
			
		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('design/custommenu');

				$cache_data = $this->cache->get('revmenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
				if ($cache_data) {
					$data['categories'] = $cache_data;
				} else {
			
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

	//opencart turbo start
	
	$cache_data = null;
	
	if ($this->config->get('turbo_topmenu') && $this->config->get('turbo_status')) {
		$cache = 'turbo.menu.' . $this->language->get('code') . '.' . $this->config->get('config_store_id');
		$cache_data = $this->cache->get($cache);
	}
	
	if (!empty($cache_data) && is_array($cache_data)) {		
		$data['categories'] = $cache_data;	
	} else {
	//opencart turbo end 
	
		
		if ($this->config->get('configcustommenu_custommenu')) {
		$custommenus = $this->model_design_custommenu->getcustommenus();
        $custommenu_child = $this->model_design_custommenu->getChildcustommenus();

        foreach($custommenus as $id => $custommenu) {
			$children_data = array();
        
			foreach($custommenu_child as $child_id => $child_custommenu) {
                if (($custommenu['custommenu_id'] != $child_custommenu['custommenu_id']) or !is_numeric($child_id)) {
                    continue;
                }

                $child_name = '';

                if (($custommenu['custommenu_type'] == 'category') and ($child_custommenu['custommenu_type'] == 'category')){
                    $filter_data = array(
                        'filter_category_id'  => $child_custommenu['link'],
                        'filter_sub_category' => true
                    );

                    $child_name = ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '');
                }

                $children_data[] = array(
                    'name' => $child_custommenu['name'] . $child_name,
'thumb' => '','category_image' => '','category_id' => '','children' => '',
                    'href' => $this->getcustommenuLink($custommenu, $child_custommenu)
                );
            }

			$data['categories'][] = array(
				'name'     => $custommenu['name'] ,
				'children' => $children_data,
				'column'   => $custommenu['columns'] ? $custommenu['columns'] : 1,
'category_id' => '','thumb2' => '','category_image' => '',
				'href'     => $this->getcustommenuLink($custommenu)
			);
        }
		
		} else {

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				
				foreach ($children as $child) {
					$children_data_level2 = array();
					if (!$setting_header_menu['image_in_ico'] || $setting_header_menu['tri_level']) {
						$children_level2 = $this->model_catalog_category->getCategories($child['category_id']);
						foreach ($children_level2 as $child_level2) {
							$data_level2 = array(
								'filter_category_id'  => $child_level2['category_id'],
								'filter_sub_category' => true
							);
							
							$filter_data_2 = array(
								'filter_category_id'  => $child_level2['category_id'],
								'filter_sub_category' => true
							);

							$children_data_level2[] = array(
								'name'  =>  $child_level2['name'] . ($this->config->get('config_product_count') ? ' <sup>' . $this->model_catalog_product->getTotalProducts($filter_data_2) . '</sup>' : ''),
								'category_id' => $child_level2['category_id'],
								'href'  => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child_level2['category_id']),
								
							);
						}
					}
					
					$filter_data_1 = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$this->load->model('tool/image');
					$child_info = $this->model_catalog_category->getCategory($child['category_id']);
					if ($child_info) {
						if ($child_info['image']) {
							$this->load->model('tool/image');	
							$thumb = $this->model_tool_image->resize($child_info['image'], $config_image_category_width, $config_image_category_height);
						} else {
							$thumb = $this->model_tool_image->resize('no_image.png', $config_image_category_width, $config_image_category_height);
						}
						if ($setting_header_menu['image_in_ico']) {
							$style = ' hidden';
						} else {
							$style = '';
						}
						if ($child_info['category_icontype']) {
							if ($child_info['category_icon'] == 'fa none') {
								$style = ' hidden';
							}
							$category_image = '<i class="am_category_icon '.$child_info['category_icon'].$style.'"></i>';
						} else {
							if (!$child_info['category_image'] || $child_info['category_image'] == 'no_image.png') {
								$style = 'hidden';
							}
							$category_image = '<span class="'.$style.'"><img src="'.$this->model_tool_image->resize($child_info['category_image'], 15, 15).'" alt=""/></span>';
						}
					}
					
					$children_data[] = array(
						'name'        	 => $child['name'] . ($this->config->get('config_product_count') ? ' <sup>' . $this->model_catalog_product->getTotalProducts($filter_data_1) . '</sup>' : ''),
						'thumb' 		 => $thumb,
						'category_image' => $category_image,
						'category_id' 	 => $child['category_id'],
						'children'   	 => $children_data_level2,
						'href'        	 => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				
				$this->load->model('tool/image');
				$category_info = $this->model_catalog_category->getCategory($category['category_id']);
				if ($category_info) {
					if ($category_info['image2']) {
						$thumb2 = $this->model_tool_image->resize($category_info['image2'], 300, 300);
					} else {
						$thumb2 = '';
					}
					$style = '';
					if ($category_info['category_icontype']) {
						if ($category_info['category_icon'] == 'fa none') {
							$style = ' hidden';
						}
						$category_image = '<i class="am_category_icon hidden-md '.$category_info['category_icon'].$style.'"></i>';
					} else {
						if (!$category_info['category_image'] || $category_info['category_image'] == 'no_image.png') {
							$style = ' hidden';
						}
						$category_image = '<span class="hidden-md'.$style.'"><img src="'.$this->model_tool_image->resize($category_info['category_image'], 15, 15).'" alt=""/></span>';
					}
				}
				
				$data['categories'][] = array(
					'category_id' 	 => $category['category_id'],
					'name'     		 => $category['name'],
					'thumb2'   		 => $thumb2,
					'category_image' => $category_image,
					'children' 		 => $children_data,
					'column'   		 => $category['column'] ? $category['column'] : 1,
					'href'    		 => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			
			}
		}
		
		}


					if ($setting_all_settings['cache_on']) {
						$this->cache->set('revmenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $data['categories']);
					}
				}
			

		//opencart turbo start
			if ($this->config->get('turbo_topmenu') && $this->config->get('turbo_status')) {
				$this->cache->set($cache, $data['categories']);
			}
		}
		//opencart turbo end 
	
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		if ($this->config->get('configblog_blog_menu')) {
$data['blog_link'] = $this->url->link('blog/latest');
			$data['menu'] = $this->load->controller('blog/menu');
		} else {
$data['blog_link'] = '';
			$data['menu'] = '';
		}
		$data['search'] = $this->load->controller('common/search');

			if ($this->config->get('alphabetm_status')) {
			$data['alphabetm'] = $this->load->controller('extension/module/alphabetm');
		} else {
			$data['alphabetm'] = '';
		}
			
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
	
	public function getcustommenuLink($parent, $child = null) {
		 if ($this->config->get('configcustommenu_custommenu')) {
        $item = empty($child) ? $parent : $child;

        switch ($item['custommenu_type']) {
            case 'category':
                $route = 'product/category';

                if (!empty($child)) {
                    $args = 'path=' . $parent['link'] . '_' . $item['link'];
                } else {
                    $args = 'path='.$item['link'];
                }
                break;
            case 'product':
                $route = 'product/product';
                $args = 'product_id='.$item['link'];
                break;
            case 'manufacturer':
                $route = 'product/manufacturer/info';
                $args = 'manufacturer_id='.$item['link'];
                break;
            case 'information':
                $route = 'information/information';
                $args = 'information_id='.$item['link'];
                break;
            default:
                $tmp = explode('&', str_replace('index.php?route=', '', $item['link']));

                if (!empty($tmp)) {
                    $route = $tmp[0];
                    unset($tmp[0]);
                    $args = (!empty($tmp)) ? implode('&', $tmp) : '';
                }
                else {
                    $route = $item['link'];
                    $args = '';
                }

                break;
        }

        $check = stripos($item['link'], 'http');
        $checkbase = strpos($item['link'], '/');
        if ( $check === 0 || $checkbase === 0 ) {
			$link = $item['link'];
        } else {
            $link = $this->url->link($route, $args);
        }
        return $link;
    }
	}
}
