<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleCategoryWall extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/categorywall');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/categorywall.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/categorywall.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/categorywall.css');
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['cover_status'] = $setting['cover_status'];

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$parent_category = array_pop($parts);
		} else {
			$parent_category = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories($parent_category);


		foreach (array_slice($categories, 0, (int)$setting['category_limit']) as $category) {

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);	
	
			foreach (array_slice($children, 0, (int)$setting['sub_category_limit']) as $child) {
				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_categorywall' => true);
				
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
				);
			}


			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_categorywall' => true
			);
			
			if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
			}

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'image'    	  => $image,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}
		
		return $this->load->view('extension/module/categorywall', $data);
	}
}