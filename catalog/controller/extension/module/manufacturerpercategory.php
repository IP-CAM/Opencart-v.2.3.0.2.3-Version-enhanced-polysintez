<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleManufacturerpercategory extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/manufacturerpercategory');
		
    	$data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {            $path = '';            $parts = explode('_', (string)$this->request->get['path']);            foreach ($parts as $path_id) {                if (!$path) {                    $path = $path_id;                } else {                    $path .= '_' . $path_id;                }            }            $category_id = array_pop($parts);        } else {            $category_id = null;        }		
		$this->load->model('extension/module/manufacturerpercategory');					
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$data['manufactureres'] = array();
					
		if (isset($category_id)) {				$results = $this->model_extension_module_manufacturerpercategory->getManufacturersByCategory($category_id);		} else {		   	$results = $this->model_catalog_manufacturer->getManufacturers(0);		}		foreach($results as $result)
		{
			
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 40, 40);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 40, 40);
				}
			
			$data['manufactureres'][] = array(
				'thumb'       => $image,
				'manufacturer_id' => $result['manufacturer_id'],
				'name'        => $result['name'] ,
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
		
			);
		}
		
		return $this->load->view('extension/module/manufacturerpercategory', $data);
		
  	}
}
?>