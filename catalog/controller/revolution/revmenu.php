<?php
class ControllerRevolutionRevmenu extends Controller {
	public function index() {
		
		$this->load->language('revolution/revolution');
		$setting = $this->config->get('revtheme_header_menu');
		
		if (!$setting['type']) {
			return false;
		}
		
		$setting_all_settings = $this->config->get('revtheme_all_settings');
		$data['text_revmenu_manufs'] = $this->language->get('text_revmenu_manufs');
		$this->document->addScript('catalog/view/javascript/revolution/aim.js');
		if ($setting['on_line_cat']) {
			$this->document->addScript('catalog/view/javascript/revolution/amazoncategory_2.js');
		} else {
			$this->document->addScript('catalog/view/javascript/revolution/amazoncategory.js');
		}
		$this->load->model('tool/image');
		
		$data['cats_status'] = $setting['cats_status'];
		if ($setting['image_in_ico']) {
			$data['image_in_ico'] = true;
		} else {
			$data['image_in_ico'] = false;
		}
		if ($setting['tri_level']) {
			$data['tri_level'] = true;
		} else {
			$data['tri_level'] = false;
		}
		if ($setting['image_in_ico_m']) {
			$data['image_in_ico_m'] = true;
		} else {
			$data['image_in_ico_m'] = false;
		}
		
		$style = '';
		if ($setting['icontype']) {
			if ($setting['icon'] == 'fa none') {
				$style = ' hidden';
			}
			$image = '<i class="'.$setting['icon'].$style.'"></i>';
		} else {
			if (!$setting['image'] || $setting['image'] == 'no_image.png') {
				$style = ' hidden';
			}
			$image = '<span class="heading_ico_image'.$style.'"><img src="'.$this->model_tool_image->resize($setting['image'], 21, 21).'" alt=""/></span>';
		}
		$data['heading_title'] = ($image . $this->language->get('text_header_menu2_heading'));
		
		if ($setting['inhome']) {
			$data['module_class'] = 'inhome';
		} else {
			$data['module_class'] = false;
		}
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}
		
		if (isset($parts[2])) {
            $data['child2_id'] = $parts[2];
        } else {
            $data['child2_id'] = 0;
        }
			
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$data['categories'] = array();

		if (VERSION >= 2.2) {
			$config_image_category_width = $this->config->get($this->config->get('config_theme') . '_image_category_width');
			$config_image_category_height = $this->config->get($this->config->get('config_theme') . '_image_category_height');
		} else {
			$config_image_category_width = $this->config->get('config_image_category_width');
			$config_image_category_height = $this->config->get('config_image_category_height');
		}
		$cache_data = $this->cache->get('revmenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if ($cache_data) {
			$data['categories'] = $cache_data;
		} else {
			$categories = $this->model_catalog_category->getCategories(0);
			foreach ($categories as $category) {
				if ($category['top']) {
					$children_data = array();

					$children = $this->model_catalog_category->getCategories($category['category_id']);

					foreach ($children as $child) {
						$children_data_level2 = array();
						if (!$setting['image_in_ico'] || $setting['tri_level']) {
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
								$thumb = $this->model_tool_image->resize('placeholder.png', $config_image_category_width, $config_image_category_height);
							}
							if ($setting['image_in_ico']) {
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
							$category_image = '<i class="am_category_icon '.$category_info['category_icon'].$style.'"></i>';
						} else {
							if (!$category_info['category_image'] || $category_info['category_image'] == 'no_image.png') {
								$style = ' hidden';
							}
							$category_image = '<span class="am_category_image'.$style.'"><img src="'.$this->model_tool_image->resize($category_info['category_image'], 21, 21).'" alt=""/><span class="mask"></span></span>';
						}
					}

					$filter_data = array(
						'filter_category_id'  => $category['category_id'],
						'filter_sub_category' => true
					);
					
					$data['categories'][] = array(
						'category_id' 	 => $category['category_id'],
						'name'        	 => $category['name'] . ($this->config->get('config_product_count') ? ' <sup>' . $this->model_catalog_product->getTotalProducts($filter_data) . '</sup>' : ''),
						'thumb2'      	 => $thumb2,
						'category_image' => $category_image,
						'children'    	 => $children_data,
						'href'        	 => $this->url->link('product/category', 'path=' . $category['category_id']),
						'column'      	 => $category['column'] ? $category['column'] : 1,
					);
				}
			}
			if ($setting_all_settings['cache_on']) {
				$this->cache->set('revmenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $data['categories']);
			}
		}
		
		$results_amazon_links = $this->config->get('revtheme_header_menu_link');
		if (!empty($results_amazon_links)){
			foreach ($results_amazon_links as $result) {
				$style = '';
				if ($result['icontype']) {
					if ($result['icon'] == 'fa none') {
						$style = ' hidden';
					}
					$image = '<i class="am_category_icon '.$result['icon'].$style.'"></i>';
				} else {
					if (!$result['image'] || $result['image'] == 'no_image.png') {
						$style = ' hidden';
					}
					$image = '<span class="am_category_image'.$style.'"><img src="'.$this->model_tool_image->resize($result['image'], 21, 21).'" alt=""/><span class="mask"></span></span>';
				}
				$data['revtheme_header_menu_links'][] = array(
					'image' => $image,
					'link'  => $result['link'],
					'title' => $result['title'][$this->config->get('config_language_id')],
					'sort'  => $result['sort']
				);
			}
		} else {
			$data['revtheme_header_menu_links'] = false;
		}
		if (!empty($data['revtheme_header_menu_links'])){
			foreach ($data['revtheme_header_menu_links'] as $key => $value) {
				$sort[$key] = $value['sort'];
			}
			if (count($data['revtheme_header_menu_links']) > 1) {
			array_multisort($sort, SORT_ASC, $data['revtheme_header_menu_links']);
			}
		}
		
		$data['manuf_status'] = $setting['manuf'];
		if ($setting['manuf']){
			$data['text_revmenu_manufs'] = $this->language->get('text_revmenu_manufs');
			$data['url_revmenu_manufs'] = $this->url->link('product/manufacturer');
			$data['n_column'] = $setting['n_column'];
			$style = '';
			if ($setting['manuf_icontype']) {
				if ($setting['manuf_icon'] == 'fa none') {
					$style = ' hidden';
				}
				$data['manuf_image'] = '<i class="am_category_icon '.$setting['manuf_icon'].$style.'"></i>';
			} else {
				if (!$setting['manuf_image'] || $setting['manuf_image'] == 'no_image.png') {
					$style = ' hidden';
				}
				$data['manuf_image'] = '<span class="am_category_image'.$style.'"><img src="'.$this->model_tool_image->resize($setting['manuf_image'], 21, 21).'" alt=""/><span class="mask"></span></span>';
			}	
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
					$thumb = $this->model_tool_image->resize('placeholder.png', $config_image_category_width, $config_image_category_height);
				}
				$data['categories_m'][$key]['manufacturer'][] = array(
					'thumb' => $thumb,
					'name' => $name,
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
				);
			}
		}

		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revmenu', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revmenu.tpl', $data);
		}
		
  	}
}