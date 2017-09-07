<?php
class ControllerRevolutionRevsocv extends Controller {
	public function index() {

		$setting = $this->config->get('revtheme_home_socv');

		if (!$setting['status_vk']) {
			return false;
		}
		
		$this->document->addScript('//vk.com/js/api/openapi.js?121');

		$data['width'] = $setting['width_vk'];
		$data['height'] = $setting['height_vk'];
		$data['id'] = $setting['id_vk'];

		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revsocv', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revsocv.tpl', $data);
		}

	}
}