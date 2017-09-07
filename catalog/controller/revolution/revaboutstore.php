<?php
class ControllerRevolutionRevaboutstore extends Controller {
	public function index() {
		
		$setting = $this->config->get('revtheme_aboutstore_home');
		
		if ($setting['status']) {
			
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
			
			$data['html'] = html_entity_decode($setting[$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revaboutstore', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revaboutstore.tpl', $data);
			}
		}
	}
}