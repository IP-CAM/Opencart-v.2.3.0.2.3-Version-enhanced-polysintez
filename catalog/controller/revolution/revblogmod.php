<?php
class ControllerRevolutionRevblogmod extends Controller {
	public function index() {
		
		$this->load->language('revolution/revblog');

		$data['text_data_added'] = $this->language->get('text_data_added');
		$data['text_all_news'] = $this->language->get('text_all_news');
		
		$data['all_news'] = $this->url->link('revolution/revblog');

		$this->load->model('revolution/revolution');
		$this->load->model('tool/image');

		$setting = $this->config->get('revtheme_home_blog');
		
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
		
		$data['b_color'] = $setting['b_color'];
		
		$data['blogs'] = array();

		if (!$setting['news_limit']) {
			$setting['news_limit'] = 5;
		}

		if ($setting['blog_category_id']) {
			$filter_category_id = $setting['blog_category_id'];
		} else {
			$filter_category_id = false;
		}
		
		$data_sort = array(
			'start' => 0,
			'limit' => (int)$setting['news_limit'],
			'order' => 'DESC',
			'filter_category_id' => $filter_category_id
		);

		$blogs = $this->model_revolution_revolution->getBlogs($data_sort);

		foreach ($blogs as $blog) {
			
			if ($blog['image']) {
				$image = $this->model_tool_image->resize($blog['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $setting['image_width'], $setting['image_height']);
			}

			$data['blogs'][] = array(
				'title'       => $blog['title'],
				'thumb'       => $image,
				'data_added'  => date($this->language->get('date_format_short'), strtotime($blog['date_available'])),
				'description' => utf8_substr(strip_tags(html_entity_decode($blog['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['desc_limit']) . '..',
				'href'        => $this->url->link('revolution/revblog_blog', 'revblog_id=' . $blog['revblog_id'])
			);
		}

		if ($data['blogs']) {
			if (VERSION >= 2.2) {
				return $this->load->view('revolution/revblog_mod', $data);
			} else {
				return $this->load->view('revolution/template/revolution/revblog_mod.tpl', $data);
			}
		}
	}
}