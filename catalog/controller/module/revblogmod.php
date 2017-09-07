<?php
class ControllerModuleRevblogmod extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->model('revolution/revolution');
		$this->load->model('tool/image');

		if (!$setting['status']) {
			return false;
		}

		if ($setting['title']) {
			$data['heading_title'] = ('<i class="'.$setting['icon'].'"></i>' . $setting['title']);
		} else {
			$data['heading_title'] = false;
		}
		$data['slider'] = $setting['slider'];
		$data['image_status'] = $setting['image_status'];
		$data['data_status'] = $setting['data_status'];
		
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

		$data['module'] = $module++;
		
		if ($data['blogs']) {
			if (VERSION >= 2.2) {
				return $this->load->view('module/revblog_mod', $data);
			} else {
				return $this->load->view('revolution/template/module/revblog_mod.tpl', $data);
			}
		}
	}
}