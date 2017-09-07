<?php
class ControllerRevolutionRevblogCategory extends Controller {
	public function index() {
		$this->load->language('revolution/revolution');
		$this->load->model('revolution/revolution');
		$this->load->model('tool/image');

		$setting2 = $this->config->get('revblog_settings');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'b.date_available';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			if (VERSION >= 2.2) {
				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			} else {
				$limit = $this->config->get('config_product_limit');
			}
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['revblog_category_id'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['revblog_category_id']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_revolution_revolution->getBlogCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['title'],
						'href' => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $path)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_revolution_revolution->getBlogCategory($category_id);

		if ($category_info) {

			if ($category_info['meta_title']) {
				$this->document->setTitle($category_info['meta_title']);
			} else {
				$this->document->setTitle($category_info['title']);
			}

			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['title'];

			$data['text_blog'] = $this->language->get('text_blog');
			$data['text_sort'] = $this->language->get('text_sort_blog');
			$data['text_limit'] = $this->language->get('text_limit_blog');
			$data['text_data_added'] = $this->language->get('text_data_added_blog');
			$data['text_empty'] = $this->language->get('text_empty_blog');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['text_refine'] = $this->language->get('text_refine');

			$data['continue'] = $this->url->link('common/home');


			$data['breadcrumbs'][] = array(
				'text' => $category_info['title'],
				'href' => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'])
			);
			
			$img_cat_w = $setting2['category_image_width'];
			$img_cat_h = $setting2['category_image_height'];
			if (!empty($img_cat_w)) {
				$image_category_width = $img_cat_w;
			} else {
				$image_category_width = 228;
			}		
			if (!empty($img_cat_h)) {
				$image_category_height = $img_cat_h;
			} else {
				$image_category_height = 228;
			}

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $image_category_width, $image_category_height);
			} else {
				$data['thumb'] = false;
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

			$data['categories'] = array();

			$categories = $this->model_revolution_revolution->getBlogCategories($category_id);

			foreach ($categories as $category) {
				$data['categories'][] = array(
					'title' 		=> $category['title'],
					'href' 			=> $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '_' . $category['category_id'])
				);
			}


			$data['blogs'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
	
			$img_w = $setting2['list_image_width'];
			$img_h = $setting2['list_image_height'];
			$desc_l = $setting2['list_desc_limit'];
			if (!empty($img_w)) {
				$image_width = $img_w;
			} else {
				$image_width = 228;
			}		
			if (!empty($img_h)) {
				$image_height = $img_h;
			} else {
				$image_height = 228;
			}
			if (!empty($desc_l)) {
				$description_limit = $desc_l;
			} else {
				$description_limit = 400;
			}

			$blog_total = $this->model_revolution_revolution->getTotalBlogs($filter_data);
			$results = $this->model_revolution_revolution->getBlogs($filter_data);
			
			foreach ($results as $result) {

				if ($result['image']) {
					$thumb = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
				} else {
					$thumb = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
				}

				$data['blogs'][] = array(
					'revblog_id'  			=> $result['revblog_id'],
					'thumb'       		=> $thumb,
					'title'        		=> $result['title'],
					'description' 		=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_limit) . '..',
					'href'        		=> $this->url->link('revolution/revblog_blog', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&revblog_id=' . $result['revblog_id']),
					'data_added'  		=> date($this->language->get('date_format_short'), strtotime($result['date_available']))
				);
			}
			
			$url = '';

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_date_desc_blog'),
				'value' => 'b.date_available-DESC',
				'href'  => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&sort=b.date_available&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_date_asc_blog'),
				'value' => 'b.date_available-ASC',
				'href'  => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&sort=b.date_available&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc_blog'),
				'value' => 'bd.title-ASC',
				'href'  => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&sort=bd.title&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc_blog'),
				'value' => 'bd.title-DESC',
				'href'  => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&sort=bd.title&order=DESC' . $url)
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), $this->config->get('config_product_limit')*2, $this->config->get('config_product_limit')*3, $this->config->get('config_product_limit')*5, $this->config->get('config_product_limit')*10));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] .  $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $blog_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('revolution/revblog_category', 'revblog_category_id=' . $this->request->get['revblog_category_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($blog_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($blog_total - $limit)) ? $blog_total : ((($page - 1) * $limit) + $limit), $blog_total, ceil($blog_total / $limit));

			if ($page == 1) {
				$this->document->addLink($this->url->link('revolution/revblog_category', 'revblog_category_id=' . $category_info['category_id'], 'SSL'), 'canonical');
			} elseif ($page == 2) {
				$this->document->addLink($this->url->link('revolution/revblog_category', 'revblog_category_id=' . $category_info['category_id'], 'SSL'), 'prev');
			} else {
				$this->document->addLink($this->url->link('revolution/revblog_category', 'revblog_category_id=' . $category_info['category_id'] . '&page='. ($page - 1), 'SSL'), 'prev');
			}
			if ($limit && ceil($blog_total / $limit) > $page) {
				$this->document->addLink($this->url->link('revolution/revblog_category', 'revblog_category_id=' . $category_info['category_id'] . '&page='. ($page + 1), 'SSL'), 'next');
			}
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('revolution/revblog_category', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/revolution/revblog_category.tpl', $data));
			}
			
		} else {
			
			$this->load->language('error/not_found');
			
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('revolution/revblog_category')
			);

			$this->document->setTitle($this->language->get('text_error'));
			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (VERSION >= 2.2) {
				$this->response->setOutput($this->load->view('error/not_found', $data));
			} else {
				$this->response->setOutput($this->load->view('revolution/template/error/not_found.tpl', $data));
			}
			
		}
	}
}