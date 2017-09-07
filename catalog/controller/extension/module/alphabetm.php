<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleAlphabetm extends Controller {
	public function index() {
		$this->language->load('extension/module/alphabetm');
    	$data['heading_title'] = $this->language->get('heading_title');
		if (isset($this->request->get['path'])) {            $path = '';            $parts = explode('_', (string)$this->request->get['path']);            foreach ($parts as $path_id) {                if (!$path) {                    $path = $path_id;                } else {                    $path .= '_' . $path_id;                }            }            $category_id = array_pop($parts);        } else {            $category_id = null;        }					
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$data['alphabetm'] = array();		$results = $this->model_catalog_manufacturer->getManufacturers(0);				//print_r ($results);		foreach ($results as $result) {			if (is_numeric(utf8_substr($result['name'], 0, 1))) {				$key = '0 - 9';			} else {				$key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);			}			if (!isset($this->data['manufacturers'][$key])) {				$data['categories'][$key]['name'] = $key;			}			$data['categories'][$key]['manufacturer'][] = array(				'name' => $result['name'],				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])			);		}
		return $this->load->view('extension/module/alphabetm', $data);
  	}
}
?>