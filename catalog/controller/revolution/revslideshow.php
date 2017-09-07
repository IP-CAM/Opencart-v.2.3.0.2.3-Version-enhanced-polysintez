<?php
class ControllerRevolutionRevslideshow extends Controller {
	public function index() {

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$setting = $this->config->get('revtheme_home_slideshow');
		
		$data['status'] = $setting['status'];
		$data['slides'] = $setting['slides'];

		if (!$setting['status'] || $setting['banner_id'] == '') {
			return false;
		}
		
		$data['autoscroll'] = $setting['autoscroll'];
		
		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revslideshow', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revslideshow.tpl', $data);
		}
		
	}
}