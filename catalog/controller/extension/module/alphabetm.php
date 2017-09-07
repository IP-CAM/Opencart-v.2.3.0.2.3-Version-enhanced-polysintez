<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleAlphabetm extends Controller {
	public function index() {
		$this->language->load('extension/module/alphabetm');
    	$data['heading_title'] = $this->language->get('heading_title');
		if (isset($this->request->get['path'])) {
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$data['alphabetm'] = array();
		return $this->load->view('extension/module/alphabetm', $data);
  	}
}
?>