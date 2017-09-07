<?php
class ControllerRevolutionRevcategorywall extends Controller {
    public function index() {

		$setting = $this->config->get('revtheme_home_categorywall');
		
		if (!$setting['status']) {
			return false;
		}
		
		$setting_all_settings = $this->config->get('revtheme_all_settings');
		if ($setting[$this->config->get('config_language_id')]['title']) {
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
			$data['heading_title'] = ($image . $setting[$this->config->get('config_language_id')]['title']);
		} else {
			$data['heading_title'] = '';
		}

        $this->load->model('catalog/category');
		$this->load->model('catalog/manufacturer');
		
		if (VERSION >= 2.2) {
			$config_image_product_width = $this->config->get($this->config->get('config_theme') . '_image_product_width');
			$config_image_product_height = $this->config->get($this->config->get('config_theme') . '_image_product_height');
		} else {
			$config_image_product_width = $this->config->get('config_image_product_width');
			$config_image_product_height = $this->config->get('config_image_product_height');
		}

        $data['categories'] = array();

		$cache_data = $this->cache->get('revcategorywall.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if ($cache_data) {
			$data['categories'] = $cache_data;
		} else {
			$revtheme_home_categorywall_categories = $this->config->get('revtheme_home_categorywall_categories');
			$revtheme_home_categorywall_manufacturers = $this->config->get('revtheme_home_categorywall_manufacturers');
			
			$this->load->model('tool/image');

			if ($setting['categories'] && count($revtheme_home_categorywall_categories)>0) {
				foreach ($revtheme_home_categorywall_categories as $category_id) {
					$category_info = $this->model_catalog_category->getCategory($category_id);
					if ($category_info) {
						if ($category_info['image']) {
							$image = $this->model_tool_image->resize($category_info['image'], $config_image_product_width, $config_image_product_height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $config_image_product_width, $config_image_product_height);
						}
						$data['categories'][] = array(
							'description' => $category_info['description'],
							'name' => $category_info['name'],
							'image' => $image,
							'href' => $this->url->link('product/category', 'path=' . $category_info['category_id'])
						);
					} else {return false;}
				}
			} else if ($setting['categories'] && count($revtheme_home_categorywall_manufacturers)>0) {
				foreach ($revtheme_home_categorywall_manufacturers as $manufacturer_id) {
					$category_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);
					if ($category_info) {
						if ($category_info['image']) {
							$image = $this->model_tool_image->resize($category_info['image'], $config_image_product_width, $config_image_product_height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $config_image_product_width, $config_image_product_height);
						}
						$data['categories'][] = array(
							'description' => $category_info['description'],
							'name' => $category_info['name'],
							'image' => $image,
							'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $category_info['manufacturer_id'])
						);
					} else {return false;}
				}
			} else {
				$categories = $this->model_catalog_category->getCategories(0);
				foreach ($categories as $category) {
					if ($category['top']) {
						if ($category['image']) {
							$image = $this->model_tool_image->resize($category['image'], $config_image_product_width, $config_image_product_height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $config_image_product_width, $config_image_product_height);
						}
						$data['categories'][] = array(
							'description' => $category['description'],
							'name' => $category['name'],
							'image' => $image,
							'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
						);
					} else {return false;}
				}
			}
			if ($setting_all_settings['cache_on']) {
				$this->cache->set('revcategorywall.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $data['categories']);
			}
		}
		
		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revcategorywall', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revcategorywall.tpl', $data);
		}
    }
}