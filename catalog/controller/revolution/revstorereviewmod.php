<?php
class ControllerRevolutionRevstorereviewmod extends Controller
{
    public function index() {
        
		$setting = $this->config->get('revtheme_home_storereview');
		
		if (!$setting['status']) {
			return false;
		}
		
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
		
		$data['button_all'] = (int)$setting['button_all'];
        $data['button_all_text'] = html_entity_decode($setting[$this->config->get('config_language_id')]['button_all_text'], ENT_QUOTES, 'UTF-8');
        
        $data['keyword'] = $this->url->link('revolution/revstorereview');

        $this->load->model('revolution/revolution');

        $results = $this->model_revolution_revolution->getModuleReviews(0, $setting['limit'], $setting['order']);

        if ($results) {
            foreach ($results as $result) {
                $data['reviews'][] = array(
                    'review_id'  => $result['review_id'],
                    'text' 		 => utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, $setting['limit_text']) . '..',
                    'rating' 	 => (int)$result['rating'],
                    'author' 	 => $result['author'],
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
                );
            }

			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revstorereview_mod', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revstorereview_mod.tpl', $data);
			}
            
        }
    }
}