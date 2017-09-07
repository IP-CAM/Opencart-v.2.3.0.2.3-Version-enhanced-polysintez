<?php
class ControllerRevolutionRevblocks extends Controller {

    public function index() {
		$setting = $this->config->get('revtheme_blocks_home');
		
		if (!$setting['status']) {
			return false;
		}

		$results = $this->config->get('revtheme_blocks_home_item');
		if (!empty($results)){
			foreach ($results as $result) {
				
				$style = '';
				if ($result['icontype']) {
					$image = '<i class="'.$result['icon'].'"></i>';
					if ($result['icon'] == 'fa none') {
						$style = 'hidden';
					}
				} else {
					if (!$result['image'] || $result['image'] == 'no_image.png') {
						$style = 'hidden';
					}
					$image = '<img src="'.$this->model_tool_image->resize($result['image'], 40, 40).'" alt=""/>';
				}
				
				if (!empty($result['checkbox'])) {
					$checkbox = 1;
				} else {
					$checkbox = 0;
				}
				
				$data['blocks'][] = array(
					'title' => $result['title'][$this->config->get('config_language_id')],
					'image' => $image,
					'description' => $result['description'][$this->config->get('config_language_id')],
					'link'  => $result['link'],
					'sort'  => $result['sort'],
					'style' => $style,
					'checkbox' => $checkbox
				);
			}
		} else {			
			$data['blocks'] = false;
		}
		if (!empty($data['blocks'])){
			foreach ($data['blocks'] as $key => $value) {
				$sort[$key] = $value['sort'];
			}
			array_multisort($sort, SORT_ASC, $data['blocks']);
		}
		
		$setting_header_menu = $this->config->get('revtheme_header_menu');
		if ($setting_header_menu['type']) {
			$data['amazon'] = true;
		} else {
			$data['amazon'] = false;
		}
		if ($setting_header_menu['inhome']) {
			$data['module_class'] = true;
		} else {
			$data['module_class'] = false;
		}

		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revblocks', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revblocks.tpl', $data);
		}
        
    }

}
?>