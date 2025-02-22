<?php
class ControllerEditorsProduct extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('editors/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->document->addStyle('view/stylesheet/admin_quick_edit/checkbox.css');
		$this->document->addStyle('view/stylesheet/admin_quick_edit/admin_quick_edit.css');
		$this->document->addScript('view/javascript/admin_quick_edit/admin_quick_edit.js');
		$this->document->addScript('view/javascript/admin_quick_edit/product.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-popover-maxy.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-popover-maxy.min.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-select.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-select.min.js');

		$this->load->model('editors/product');

		$this->getList();
	}

	public function add() {
		$this->load->language('editors/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->document->addStyle('view/stylesheet/admin_quick_edit/checkbox.css');
		$this->document->addStyle('view/stylesheet/admin_quick_edit/admin_quick_edit.css');
		$this->document->addScript('view/javascript/admin_quick_edit/product.js');

		$this->load->model('editors/product');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$product_id = $this->model_editors_product->addProduct($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_category_id'])) {
                $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
            }
			
			if (isset($this->request->get['filter_manufacturer_id'])) {
				$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_sku'])) {
				$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_attribute_id'])) {
				$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_filter_id'])) {
				$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_location'])) {
				$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if (isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$this->session->data['success'] = $this->language->get('text_success_data');
				
				$this->response->redirect($this->url->link('editors/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $product_id . $url, true));
            }

			$this->response->redirect($this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('editors/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->document->addStyle('view/stylesheet/admin_quick_edit/checkbox.css');
		$this->document->addStyle('view/stylesheet/admin_quick_edit/admin_quick_edit.css');
		$this->document->addScript('view/javascript/admin_quick_edit/product.js');

		$this->load->model('editors/product');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_editors_product->editProduct($this->request->get['product_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_category_id'])) {
                $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
            }
			
			if (isset($this->request->get['filter_manufacturer_id'])) {
				$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_sku'])) {
				$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_location'])) {
				$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_attribute_id'])) {
				$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_filter_id'])) {
				$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if (isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$this->session->data['success'] = $this->language->get('text_success_data');
				
				$this->response->redirect($this->url->link('editors/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, true));
            }

			$this->response->redirect($this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('editors/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->document->addStyle('view/stylesheet/admin_quick_edit/checkbox.css');
		$this->document->addStyle('view/stylesheet/admin_quick_edit/admin_quick_edit.css');
		$this->document->addScript('view/javascript/admin_quick_edit/admin_quick_edit.js');
		$this->document->addScript('view/javascript/admin_quick_edit/product.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-popover-maxy.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-popover-maxy.min.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-select.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-select.min.js');

		$this->load->model('editors/product');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_editors_product->deleteProduct($product_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_category_id'])) {
                $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
            }
			
			if (isset($this->request->get['filter_manufacturer_id'])) {
				$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_sku'])) {
				$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_attribute_id'])) {
				$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_filter_id'])) {
				$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_location'])) {
				$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function copy() {
		$this->load->language('editors/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->document->addStyle('view/stylesheet/admin_quick_edit/checkbox.css');
		$this->document->addStyle('view/stylesheet/admin_quick_edit/admin_quick_edit.css');
		$this->document->addScript('view/javascript/admin_quick_edit/admin_quick_edit.js');
		$this->document->addScript('view/javascript/admin_quick_edit/product.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-popover-maxy.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-popover-maxy.min.js');
		$this->document->addStyle('view/javascript/bootstrap/css/bootstrap-select.css');
		$this->document->addScript('view/javascript/bootstrap/js/bootstrap-select.min.js');

		$this->load->model('editors/product');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_editors_product->copyProduct($product_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_category_id'])) {
                $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
            }
			
			if (isset($this->request->get['filter_manufacturer_id'])) {
				$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_sku'])) {
				$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_attribute_id'])) {
				$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_filter_id'])) {
				$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_location'])) {
				$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_category_id'])) {
			$filter_category_id = $this->request->get['filter_category_id'];
		} else {
			$filter_category_id = null;
		}
		
		if (isset($this->request->get['filter_manufacturer_id'])) {
			$filter_manufacturer_id = $this->request->get['filter_manufacturer_id'];
		} else {
			$filter_manufacturer_id = null;
		}

		if (isset($this->request->get['filter_model'])) {
			$filter_model = $this->request->get['filter_model'];
		} else {
			$filter_model = null;
		}
		
		if (isset($this->request->get['filter_sku'])) {
			$filter_sku = $this->request->get['filter_sku'];
		} else {
			$filter_sku = null;
		}
		
		if (isset($this->request->get['filter_location'])) {
			$filter_location = $this->request->get['filter_location'];
		} else {
			$filter_location = null;
		}
		
		if (isset($this->request->get['filter_attribute_id'])) {
			$filter_attribute_id = $this->request->get['filter_attribute_id'];
		} else {
			$filter_attribute_id = null;
		}
		
		if (isset($this->request->get['filter_filter_id'])) {
			$filter_filter_id = $this->request->get['filter_filter_id'];
		} else {
			$filter_filter_id = null;
		}

		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'];
		} else {
			$filter_price = null;
		}

		if (isset($this->request->get['filter_quantity'])) {
			$filter_quantity = $this->request->get['filter_quantity'];
		} else {
			$filter_quantity = null;
		}
		
		if (isset($this->request->get['filter_sort_order'])) {
			$filter_sort_order = $this->request->get['filter_sort_order'];
		} else {
			$filter_sort_order = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_image'])) {
			$filter_image = $this->request->get['filter_image'];
		} else {
			$filter_image = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if ($this->config->get('admin_quick_edit_product_default_limit')) {
			$limit = $this->config->get('admin_quick_edit_product_default_limit');
		} else {
			$limit = 20;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }
		
		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_sku'])) {
			$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_filter_id'])) {
			$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_location'])) {
			$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
		
		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('editors/product/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['copy'] = $this->url->link('editors/product/copy', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('editors/product/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['products'] = array();

		$filter_data = array(
			'filter_name'	  		 => $filter_name,
			'filter_category_id' 	 => $filter_category_id,
			'filter_manufacturer_id' => $filter_manufacturer_id,
			'filter_model'	  		 => $filter_model,
			'filter_sku'	  		 => $filter_sku,
			'filter_location'	  	 => $filter_location,
			'filter_attribute_id'	 => $filter_attribute_id,
			'filter_price'	  		 => $filter_price,
			'filter_quantity' 		 => $filter_quantity,
			'filter_sort_order' 	 => $filter_sort_order,
			'filter_status'   		 => $filter_status,
			'filter_image'   		 => $filter_image,
			'filter_filter_id'   	 => $filter_filter_id,
			'sort'           		 => $sort,
			'order'          		 => $order,
			'start'          		 => ($page - 1) * $limit,
			'limit'          		 => $limit
		);

		$this->load->model('tool/image');
		
		$this->load->model('editors/category');

		$product_total = $this->model_editors_product->getTotalProducts($filter_data);

		$results = $this->model_editors_product->getProducts($filter_data);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}
			
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$thumb = $this->model_tool_image->resize($result['image'], 100, 100);
			} else {
				$thumb = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			$placeholder = $this->model_tool_image->resize('no_image.png', 100, 100);

			$special = false;

			$product_specials = $this->model_editors_product->getProductSpecials($result['product_id']);

			foreach ($product_specials  as $product_special) {
				if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
					$special = $product_special['price'];

					break;
				}
			}
			
			$categories = $this->model_editors_product->getProductCategories($result['product_id']);
			
			$product_categories = array();

			foreach ($categories as $category_id) {
				$category_info = $this->model_editors_category->getCategory($category_id);

				if ($category_info) {
					$product_categories[] = array(
						'category_id' => $category_info['category_id'],
						'name' 		  => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
					);
				}
			}
			
			if ($product_specials) { 
				$price = '<del>' . $result['price'] . '</del>';
			} else {
				$price = $result['price'];
			}

			$data['products'][] = array(
				'product_id' 			=> $result['product_id'],
				'image'      			=> $image,
				'thumb'           		=> $thumb,
				'name'       			=> $result['name'],
				'categories' 			=> $product_categories,
				'manufacturer' 			=> $result['manufacturer'],
				'manufacturer_id' 		=> $result['manufacturer_id'],
				'model'      			=> $result['model'],
				'price'      			=> $price,
				'price_not_formated'	=> $result['price'],
				'special'    			=> $special,
				'quantity'   			=> $result['quantity'],
				'sort_order'  			=> $result['sort_order'],
				'status'  	  			=> ($result['status']) ? $this->language->get('text_on') : $this->language->get('text_off'),
				'no_status'   			=> ($result['status']) ? '<span class="text-success">' . $this->language->get('text_enabled') . '</span>' : '<span class="text-danger">' . $this->language->get('text_disabled') . '</span>',
				'edit'       			=> $this->url->link('editors/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, true)
			);
		}

		$this->language_info = array(
			'heading_title',
			// Text
			'text_list',
			'text_enabled',
			'text_disabled',
			'text_no_results',
			'text_confirm',
			'text_all_categories',
			'text_all_brands',
			'text_all_attributes',
			'text_all_filters',
			'text_no_category',
			'text_no_brand',
			'text_no_attribute',
			'text_no_filter',
			'text_without',
			'text_none',
			'text_general',
			'text_product_general',
			'text_code',
			'text_tax',
			'text_stock',
			'text_seo',
			'text_size',
			'text_setting_mass_edit',
			'text_mass_edit',
			'text_setting_mass_delete',
			'text_mass_delete',
			'text_product_data',
			'text_product_links',
			'text_product_sale',
			'text_add_discount',
			'text_edit_discount',
			'text_add_special',
			'text_edit_special',
			'text_attr_option',
			'text_other_data',
			'text_images',
			'text_model',
			'text_date_available',
			'text_shipping',
			'text_yes',
			'text_no',
			'text_edit_items',
			'text_add_filter',
			// Column
			'column_image',
			'column_name',
			'column_category',
			'column_manufacturer',
			'column_model',
			'column_price',
			'column_quantity',
			'column_sort_order',
			'column_status',
			'column_action',
			// Entry
			'entry_name',
			'entry_image',
			'entry_description',
			'entry_meta_title',
			'entry_meta_h1',
			'entry_meta_description',
			'entry_meta_keyword',
			'entry_tag',
			'entry_model',
			'entry_sku',
			'entry_sku',
			'entry_upc',
			'entry_ean',
			'entry_jan',
			'entry_isbn',
			'entry_mpn',
			'entry_tax_class',
			'entry_size',
			'entry_weight',
			'entry_sort_order',
			'entry_minimum',
			'entry_location',
			'entry_categories',
			'entry_manufacturer',
			'entry_attribute',
			'entry_filter',
			'entry_price',
			'entry_quantity',
			'entry_status',
			'entry_date_available',
			'entry_store',
			'entry_download',
			'entry_related',
			'entry_reward',
			'entry_quantity',
			'entry_minimum',
			// Tabs
			'tab_attribute',
			'tab_option',
			'tab_discount',
			'tab_special',
			'tab_image',
			'tab_design',
			// Button
			'button_copy',
			'button_add',
			'button_edit',
			'button_view',
			'button_delete',
			'button_filter',
			// Error
			'error_permission',
			'error_select_product'
		);
		
		foreach ($this->language_info as $language) {
			$data[$language] = $this->language->get($language);
		}
		
		// Setting Items Edit
		$data['product_add_filter'] = $this->config->get('admin_quick_edit_product_add_filter');
		$data['product_image'] = $this->config->get('admin_quick_edit_product_image');
		$data['product_name'] = $this->config->get('admin_quick_edit_product_name');
		$data['product_categories'] = $this->config->get('admin_quick_edit_product_category');
		$data['product_manufacturer'] = $this->config->get('admin_quick_edit_product_manufacturer');
		$data['product_model'] = $this->config->get('admin_quick_edit_product_model');
		$data['product_price'] = $this->config->get('admin_quick_edit_product_price');
		$data['product_quantity'] = $this->config->get('admin_quick_edit_product_quantity');
		$data['product_sort_order'] = $this->config->get('admin_quick_edit_product_sort_order');
		$data['product_status'] = $this->config->get('admin_quick_edit_product_status');
		$data['product_general'] = $this->config->get('admin_quick_edit_product_general');
		$data['product_code'] = $this->config->get('admin_quick_edit_product_code');
		$data['product_tax'] = $this->config->get('admin_quick_edit_product_tax');
		$data['product_stock'] = $this->config->get('admin_quick_edit_product_stock');
		$data['product_seo'] = $this->config->get('admin_quick_edit_product_seo');
		$data['product_date'] = $this->config->get('admin_quick_edit_product_date');
		$data['product_size'] = $this->config->get('admin_quick_edit_product_weight');
		$data['product_filter'] = $this->config->get('admin_quick_edit_product_filter');
		$data['product_store'] = $this->config->get('admin_quick_edit_product_store');
		$data['product_download'] = $this->config->get('admin_quick_edit_product_download');
		$data['product_related'] = $this->config->get('admin_quick_edit_product_related');
		$data['product_attribute'] = $this->config->get('admin_quick_edit_product_attribute');
		$data['product_option'] = $this->config->get('admin_quick_edit_product_option');
		$data['product_discount'] = $this->config->get('admin_quick_edit_product_discount');
		$data['product_special'] = $this->config->get('admin_quick_edit_product_special');
		$data['product_images'] = $this->config->get('admin_quick_edit_product_images');
		$data['product_reward'] = $this->config->get('admin_quick_edit_product_reward');
		$data['product_design'] = $this->config->get('admin_quick_edit_product_design');
		$data['product_view'] = $this->config->get('admin_quick_edit_product_view');
		
		if ($data['product_general'] || $data['product_code'] || $data['product_tax'] || $data['product_stock'] || $data['product_seo'] || $data['product_date'] || $data['product_size'] || $data['product_filter'] || $data['product_store'] || $data['product_download'] || $data['product_related'] || $data['product_attribute'] || $data['product_option'] || $data['product_discount'] || $data['product_special'] || $data['product_images'] || $data['product_reward'] || $data['product_design'] || $data['product_view']) {
			$data['product_more'] = true;
		} else {
			$data['product_more'] = false;
		}
		
		// Setting Mass Edit
		$data['mass_hide_name'] = $this->config->get('admin_quick_edit_product_mass_name') ? 1 : 0;
		$data['mass_hide_description'] = $this->config->get('admin_quick_edit_product_mass_description') ? 1 : 0;
		$data['mass_hide_meta_title'] = $this->config->get('admin_quick_edit_product_mass_meta_title') ? 1 : 0;
		$data['mass_hide_meta_h1'] = $this->config->get('admin_quick_edit_product_mass_meta_h1') ? 1 : 0;
		$data['mass_hide_meta_description'] = $this->config->get('admin_quick_edit_product_mass_meta_description') ? 1 : 0;
		$data['mass_hide_meta_keyword'] = $this->config->get('admin_quick_edit_product_mass_meta_keyword') ? 1 : 0;
		$data['mass_hide_tag'] = $this->config->get('admin_quick_edit_product_mass_tag') ? 1 : 0;
		$data['mass_hide_image'] = $this->config->get('admin_quick_edit_product_mass_image') ? 1 : 0;
		$data['mass_hide_price'] = $this->config->get('admin_quick_edit_product_mass_price') ? 1 : 0;
		$data['mass_hide_quantity'] = $this->config->get('admin_quick_edit_product_mass_quantity') ? 1 : 0;
		$data['mass_hide_minimum'] = $this->config->get('admin_quick_edit_product_mass_minimum') ? 1 : 0;
		$data['mass_hide_model'] = $this->config->get('admin_quick_edit_product_mass_model') ? 1 : 0;
		$data['mass_hide_seo_url'] = $this->config->get('admin_quick_edit_product_mass_seo_url') ? 1 : 0;
		$data['mass_hide_code'] = $this->config->get('admin_quick_edit_product_mass_code') ? 1 : 0;
		$data['mass_hide_date_available'] = $this->config->get('admin_quick_edit_product_mass_date_available') ? 1 : 0;
		$data['mass_hide_shipping'] = $this->config->get('admin_quick_edit_product_mass_shipping') ? 1 : 0;
		$data['mass_hide_size'] = $this->config->get('admin_quick_edit_product_mass_size') ? 1 : 0;
		$data['mass_hide_sort_order'] = $this->config->get('admin_quick_edit_product_mass_sort_order') ? 1 : 0;
		$data['mass_hide_manufacturer'] = $this->config->get('admin_quick_edit_product_mass_manufacturer') ? 1 : 0;
		$data['mass_hide_category'] = $this->config->get('admin_quick_edit_product_mass_category') ? 1 : 0;
		$data['mass_hide_filter'] = $this->config->get('admin_quick_edit_product_mass_filter') ? 1 : 0;
		$data['mass_hide_store'] = $this->config->get('admin_quick_edit_product_mass_store') ? 1 : 0;
		$data['mass_hide_download'] = $this->config->get('admin_quick_edit_product_mass_download') ? 1 : 0;
		$data['mass_hide_related'] = $this->config->get('admin_quick_edit_product_mass_related') ? 1 : 0;
		$data['mass_hide_add_discount'] = $this->config->get('admin_quick_edit_product_mass_add_discount') ? 1 : 0;
		$data['mass_hide_edit_discount'] = $this->config->get('admin_quick_edit_product_mass_edit_discount') ? 1 : 0;
		$data['mass_hide_add_special'] = $this->config->get('admin_quick_edit_product_mass_add_special') ? 1 : 0;
		$data['mass_hide_edit_special'] = $this->config->get('admin_quick_edit_product_mass_edit_special') ? 1 : 0;
		$data['mass_hide_attribute'] = $this->config->get('admin_quick_edit_product_mass_attribute') ? 1 : 0;
		$data['mass_hide_option'] = $this->config->get('admin_quick_edit_product_mass_option') ? 1 : 0;
		$data['mass_hide_images'] = $this->config->get('admin_quick_edit_product_mass_images') ? 1 : 0;
		$data['mass_hide_reward'] = $this->config->get('admin_quick_edit_product_mass_reward') ? 1 : 0;
		$data['mass_hide_design'] = $this->config->get('admin_quick_edit_product_mass_design') ? 1 : 0;
		
		// Setting Mass Delete
		$data['mass_delete_name'] = $this->config->get('admin_quick_edit_product_mass_delete_name') ? 1 : 0;
		$data['mass_delete_description'] = $this->config->get('admin_quick_edit_product_mass_delete_description') ? 1 : 0;
		$data['mass_delete_meta_title'] = $this->config->get('admin_quick_edit_product_mass_delete_meta_title') ? 1 : 0;
		$data['mass_delete_meta_h1'] = $this->config->get('admin_quick_edit_product_mass_delete_meta_h1') ? 1 : 0;
		$data['mass_delete_meta_description'] = $this->config->get('admin_quick_edit_product_mass_delete_meta_description') ? 1 : 0;
		$data['mass_delete_meta_keyword'] = $this->config->get('admin_quick_edit_product_mass_delete_meta_keyword') ? 1 : 0;
		$data['mass_delete_tag'] = $this->config->get('admin_quick_edit_product_mass_delete_tag') ? 1 : 0;
		$data['mass_delete_image'] = $this->config->get('admin_quick_edit_product_mass_delete_image') ? 1 : 0;
		$data['mass_delete_model'] = $this->config->get('admin_quick_edit_product_mass_delete_model') ? 1 : 0;
		$data['mass_delete_sku'] = $this->config->get('admin_quick_edit_product_mass_delete_sku') ? 1 : 0;
		$data['mass_delete_upc'] = $this->config->get('admin_quick_edit_product_mass_delete_upc') ? 1 : 0;
		$data['mass_delete_ean'] = $this->config->get('admin_quick_edit_product_mass_delete_ean') ? 1 : 0;
		$data['mass_delete_jan'] = $this->config->get('admin_quick_edit_product_mass_delete_jan') ? 1 : 0;
		$data['mass_delete_isbn'] = $this->config->get('admin_quick_edit_product_mass_delete_isbn') ? 1 : 0;
		$data['mass_delete_mpn'] = $this->config->get('admin_quick_edit_product_mass_delete_mpn') ? 1 : 0;
		$data['mass_delete_location'] = $this->config->get('admin_quick_edit_product_mass_delete_location') ? 1 : 0;
		$data['mass_delete_price'] = $this->config->get('admin_quick_edit_product_mass_delete_price') ? 1 : 0;
		$data['mass_delete_tax_class'] = $this->config->get('admin_quick_edit_product_mass_delete_tax_class') ? 1 : 0;
		$data['mass_delete_quantity'] = $this->config->get('admin_quick_edit_product_mass_delete_quantity') ? 1 : 0;
		$data['mass_delete_minimum'] = $this->config->get('admin_quick_edit_product_mass_delete_minimum') ? 1 : 0;
		$data['mass_delete_seo_url'] = $this->config->get('admin_quick_edit_product_mass_delete_seo_url') ? 1 : 0;
		$data['mass_delete_date_available'] = $this->config->get('admin_quick_edit_product_mass_delete_date_available') ? 1 : 0;
		$data['mass_delete_size'] = $this->config->get('admin_quick_edit_product_mass_delete_size') ? 1 : 0;
		$data['mass_delete_weight'] = $this->config->get('admin_quick_edit_product_mass_delete_weight') ? 1 : 0;
		$data['mass_delete_sort_order'] = $this->config->get('admin_quick_edit_product_mass_delete_sort_order') ? 1 : 0;
		$data['mass_delete_manufacturer'] = $this->config->get('admin_quick_edit_product_mass_delete_manufacturer') ? 1 : 0;
		$data['mass_delete_category'] = $this->config->get('admin_quick_edit_product_mass_delete_category') ? 1 : 0;
		$data['mass_delete_filter'] = $this->config->get('admin_quick_edit_product_mass_delete_filter') ? 1 : 0;
		$data['mass_delete_store'] = $this->config->get('admin_quick_edit_product_mass_delete_store') ? 1 : 0;
		$data['mass_delete_download'] = $this->config->get('admin_quick_edit_product_mass_delete_download') ? 1 : 0;
		$data['mass_delete_related'] = $this->config->get('admin_quick_edit_product_mass_delete_related') ? 1 : 0;
		$data['mass_delete_attribute'] = $this->config->get('admin_quick_edit_product_mass_delete_attribute') ? 1 : 0;
		$data['mass_delete_option'] = $this->config->get('admin_quick_edit_product_mass_delete_option') ? 1 : 0;
		$data['mass_delete_discount'] = $this->config->get('admin_quick_edit_product_mass_delete_discount') ? 1 : 0;
		$data['mass_delete_special'] = $this->config->get('admin_quick_edit_product_mass_delete_special') ? 1 : 0;
		$data['mass_delete_images'] = $this->config->get('admin_quick_edit_product_mass_delete_images') ? 1 : 0;
		$data['mass_delete_reward'] = $this->config->get('admin_quick_edit_product_mass_delete_reward') ? 1 : 0;
		$data['mass_delete_design'] = $this->config->get('admin_quick_edit_product_mass_delete_design') ? 1 : 0;

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }
		
		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_sku'])) {
			$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_filter_id'])) {
			$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_location'])) {
			$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
		
		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
		$data['sort_category'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p2c.category_id' . $url, true);
		$data['sort_manufacturer'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=m.name' . $url, true);
		$data['sort_model'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, true);
		$data['sort_price'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, true);
		$data['sort_quantity'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, true);
		$data['sort_status'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
		$data['sort_order'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }
		
		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_sku'])) {
			$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_filter_id'])) {
			$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_location'])) {
			$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
		
		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		$data['filter_name'] 			= $filter_name;
		$data['filter_category_id'] 	= $filter_category_id;
		$data['filter_manufacturer_id'] = $filter_manufacturer_id;
		$data['filter_model'] 			= $filter_model;
		$data['filter_sku'] 			= $filter_sku;
		$data['filter_attribute_id'] 	= $filter_attribute_id;
		$data['filter_filter_id'] 		= $filter_filter_id;
		$data['filter_location'] 		= $filter_location;
		$data['filter_price'] 			= $filter_price;
		$data['filter_quantity'] 		= $filter_quantity;
		$data['filter_sort_order'] 		= $filter_sort_order;
		$data['filter_status'] 			= $filter_status;
		$data['filter_image'] 			= $filter_image;

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$this->load->model('editors/category');
		
		if (!empty($this->request->get['filter_category_id']) && $this->request->get['filter_category_id'] != '*') {		
			$category_info = $this->model_editors_category->getCategory($filter_category_id);
			$data['filter_category'] = $category_info['name'];
		} elseif (!empty($this->request->get['filter_category_id']) == '*') {
			$data['filter_category'] = $this->language->get('text_no_category');
		} else {
			$data['filter_category'] = null;
		}
		
		$this->load->model('editors/manufacturer');
		
		if (!empty($this->request->get['filter_manufacturer_id']) && $this->request->get['filter_manufacturer_id'] != '*') {	
			$manufacturer_info = $this->model_editors_manufacturer->getManufacturer($filter_manufacturer_id);			
			$data['filter_manufacturer'] = $manufacturer_info['name'];
		} elseif (!empty($this->request->get['filter_manufacturer_id']) == '*') {
			$data['filter_manufacturer'] = $this->language->get('text_no_brand');
		} else {
			$data['filter_manufacturer'] = null;
		}
		
		$this->load->model('catalog/attribute');
		
		if (!empty($this->request->get['filter_attribute_id']) && $this->request->get['filter_attribute_id'] != '*') {	
			$attribute_info = $this->model_catalog_attribute->getAttribute($filter_attribute_id);			
			$data['filter_attribute'] = $attribute_info['name'];
		} elseif (!empty($this->request->get['filter_attribute_id']) == '*') {
			$data['filter_attribute'] = $this->language->get('text_no_attribute');
		} else {
			$data['filter_attribute'] = null;
		}
		
		$this->load->model('catalog/filter');
		
		if (!empty($this->request->get['filter_filter_id']) && $this->request->get['filter_filter_id'] != '*') {	
			$attribute_info = $this->model_catalog_filter->getFilter($filter_filter_id);			
			$data['filter_filter'] = $attribute_info['name'];
		} elseif (!empty($this->request->get['filter_filter_id']) == '*') {
			$data['filter_filter'] = $this->language->get('text_no_filter');
		} else {
			$data['filter_filter'] = null;
		}
		
		$data['permission'] = $this->user->hasPermission('modify', 'editors/product');
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('editors/product/product_list', $data));
	}

	protected function getForm() {
		$this->language_info = array(
			'heading_title',
			// Text
			'text_enabled',
			'text_disabled',
			'text_none',
			'text_yes',
			'text_no',
			'text_plus',
			'text_minus',
			'text_default',
			'text_option',
			'text_option_value',
			'text_select',
			'text_percent',
			'text_amount',
			'text_show',
			'text_hide',
			// Entry
			'entry_name',
			'entry_description',
			'entry_meta_title',
			'entry_meta_h1',
			'entry_meta_description',
			'entry_meta_keyword',
			'entry_auto_keyword',
			'entry_keyword',
			'entry_model',
			'entry_sku',
			'entry_upc',
			'entry_ean',
			'entry_jan',
			'entry_isbn',
			'entry_mpn',
			'entry_location',
			'entry_minimum',
			'entry_shipping',
			'entry_date_available',
			'entry_quantity',
			'entry_stock_status',
			'entry_price',
			'entry_tax_class',
			'entry_points',
			'entry_option_points',
			'entry_subtract',
			'entry_weight_class',
			'entry_weight',
			'entry_dimension',
			'entry_length_class',
			'entry_length',
			'entry_width',
			'entry_height',
			'entry_image',
			'entry_additional_image',
			'entry_store',
			'entry_manufacturer',
			'entry_download',
			'entry_main_category',
			'entry_category',
			'entry_filter',
			'entry_related',
			'entry_attribute',
			'entry_text',
			'entry_option',
			'entry_option_value',
			'entry_required',
			'entry_sort_order',
			'entry_status',
			'entry_date_start',
			'entry_date_end',
			'entry_priority',
			'entry_tag',
			'entry_customer_group',
			'entry_reward',
			'entry_layout',
			'entry_recurring',
			'entry_codes',
			// Help
			'help_auto_keyword',
			'help_keyword',
			'help_sku',
			'help_upc',
			'help_ean',
			'help_jan',
			'help_isbn',
			'help_mpn',
			'help_minimum',
			'help_manufacturer',
			'help_stock_status',
			'help_points',
			'help_category',
			'help_filter',
			'help_download',
			'help_related',
			'help_tag',
			// Button
			'button_apply',
			'button_save',
			'button_cancel',
			'button_attribute_add',
			'button_option_add',
			'button_option_value_add',
			'button_discount_add',
			'button_special_add',
			'button_image_add',
			'button_remove',
			'button_recurring_add',
			// Tab
			'tab_general',
			'tab_data',
			'tab_attribute',
			'tab_option',
			'tab_recurring',
			'tab_discount',
			'tab_special',
			'tab_image',
			'tab_links',
			'tab_reward',
			'tab_design',
			'tab_openbay',
			// Other
			'locale'
		);
		
		foreach ($this->language_info as $language) {
			$data[$language] = $this->language->get($language);
		}

		$data['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		
		$data['config_admin_language'] = $this->config->get('config_admin_language');		
		$data['config_language_id'] = $this->config->get('config_language_id');
		$data['model_required'] = $this->config->get('admin_quick_edit_product_model_required');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['model'])) {
			$data['error_model'] = $this->error['model'];
		} else {
			$data['error_model'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}


		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }
		
		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_sku'])) {
			$url .= '&filter_sku=' . urlencode(html_entity_decode($this->request->get['filter_sku'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_filter_id'])) {
			$url .= '&filter_filter_id=' . urlencode(html_entity_decode($this->request->get['filter_filter_id'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_location'])) {
			$url .= '&filter_location=' . urlencode(html_entity_decode($this->request->get['filter_location'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['product_id'])) {
			$data['action'] = $this->url->link('editors/product/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('editors/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('editors/product', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$product_info = $this->model_editors_product->getProduct($this->request->get['product_id']);
		}

		$data['token'] = $this->session->data['token'];
		
		$data['hide_codes'] = $this->config->get('admin_quick_edit_product_hide_codes') ? ' hidden' : '';
		
		if (!$this->config->get('admin_quick_edit_product_model_required')) {
			$data['hide_model'] = $this->config->get('admin_quick_edit_product_hide_model') ? ' hidden' : '';
		} else {
			$data['hide_model'] = '';
		}
		
		$data['hide_price'] = $this->config->get('admin_quick_edit_product_hide_price') ? ' hidden' : '';
		$data['hide_tax'] = $this->config->get('admin_quick_edit_product_hide_tax') ? ' hidden' : '';
		$data['hide_quantity'] = $this->config->get('admin_quick_edit_product_hide_quantity') ? ' hidden' : '';
		$data['hide_minimum'] = $this->config->get('admin_quick_edit_product_hide_minimum') ? ' hidden' : '';
		$data['hide_subtract'] = $this->config->get('admin_quick_edit_product_hide_subtract') ? ' hidden' : '';
		$data['hide_stock_status'] = $this->config->get('admin_quick_edit_product_hide_stock_status') ? ' hidden' : '';
		$data['hide_shipping'] = $this->config->get('admin_quick_edit_product_hide_shipping') ? ' hidden' : '';
		$data['hide_seo_keyword'] = $this->config->get('admin_quick_edit_product_hide_seo_keyword') ? ' hidden' : '';
		$data['hide_date_available'] = $this->config->get('admin_quick_edit_product_hide_date_available') ? ' hidden' : '';
		$data['hide_dimension'] = $this->config->get('admin_quick_edit_product_hide_dimension') ? ' hidden' : '';
		$data['hide_length_class'] = $this->config->get('admin_quick_edit_product_hide_length_class') ? ' hidden' : '';
		$data['hide_weight'] = $this->config->get('admin_quick_edit_product_hide_weight') ? ' hidden' : '';
		$data['hide_weight_class'] = $this->config->get('admin_quick_edit_product_hide_weight_class') ? ' hidden' : '';
		$data['hide_status'] = $this->config->get('admin_quick_edit_product_hide_status') ? ' hidden' : '';
		$data['hide_sort_order'] = $this->config->get('admin_quick_edit_product_hide_sort_order') ? ' hidden' : '';
		$data['hide_manufacturer'] = $this->config->get('admin_quick_edit_product_hide_manufacturer') ? ' hidden' : '';
		$data['hide_filter'] = $this->config->get('admin_quick_edit_product_hide_filter') ? ' hidden' : '';
		$data['hide_store'] = $this->config->get('admin_quick_edit_product_hide_store') ? ' hidden' : '';
		$data['hide_download'] = $this->config->get('admin_quick_edit_product_hide_download') ? ' hidden' : '';
		$data['hide_related'] = $this->config->get('admin_quick_edit_product_hide_related') ? ' hidden' : '';
		$data['hide_attribute'] = $this->config->get('admin_quick_edit_product_hide_attribute') ? ' class="hidden"' : '';
		$data['hide_option'] = $this->config->get('admin_quick_edit_product_hide_option') ? ' class="hidden"' : '';
		$data['hide_recurring'] = $this->config->get('admin_quick_edit_product_hide_recurring') ? ' class="hidden"' : '';
		$data['hide_discount'] = $this->config->get('admin_quick_edit_product_hide_discount') ? ' class="hidden"' : '';
		$data['hide_special'] = $this->config->get('admin_quick_edit_product_hide_special') ? ' class="hidden"' : '';
		$data['hide_images'] = $this->config->get('admin_quick_edit_product_hide_image') ? ' class="hidden"' : '';
		$data['hide_reward'] = $this->config->get('admin_quick_edit_product_hide_reward') ? ' class="hidden"' : '';
		$data['hide_design'] = $this->config->get('admin_quick_edit_product_hide_design') ? ' class="hidden"' : '';

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['product_description'])) {
			$data['product_description'] = $this->request->post['product_description'];
		} elseif (isset($this->request->get['product_id'])) {
			$data['product_description'] = $this->model_editors_product->getProductDescriptions($this->request->get['product_id']);
		} else {
			$data['product_description'] = array();
		}

		if (isset($this->request->post['model'])) {
			$data['model'] = $this->request->post['model'];
		} elseif (!empty($product_info)) {
			$data['model'] = $product_info['model'];
		} else {
			$data['model'] = '';
		}

		if (isset($this->request->post['sku'])) {
			$data['sku'] = $this->request->post['sku'];
		} elseif (!empty($product_info)) {
			$data['sku'] = $product_info['sku'];
		} else {
			$data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$data['upc'] = $this->request->post['upc'];
		} elseif (!empty($product_info)) {
			$data['upc'] = $product_info['upc'];
		} else {
			$data['upc'] = '';
		}

		if (isset($this->request->post['ean'])) {
			$data['ean'] = $this->request->post['ean'];
		} elseif (!empty($product_info)) {
			$data['ean'] = $product_info['ean'];
		} else {
			$data['ean'] = '';
		}

		if (isset($this->request->post['jan'])) {
			$data['jan'] = $this->request->post['jan'];
		} elseif (!empty($product_info)) {
			$data['jan'] = $product_info['jan'];
		} else {
			$data['jan'] = '';
		}

		if (isset($this->request->post['isbn'])) {
			$data['isbn'] = $this->request->post['isbn'];
		} elseif (!empty($product_info)) {
			$data['isbn'] = $product_info['isbn'];
		} else {
			$data['isbn'] = '';
		}

		if (isset($this->request->post['mpn'])) {
			$data['mpn'] = $this->request->post['mpn'];
		} elseif (!empty($product_info)) {
			$data['mpn'] = $product_info['mpn'];
		} else {
			$data['mpn'] = '';
		}

		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} elseif (!empty($product_info)) {
			$data['location'] = $product_info['location'];
		} else {
			$data['location'] = '';
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['product_store'])) {
			$data['product_store'] = $this->request->post['product_store'];
		} elseif (isset($this->request->get['product_id'])) {
			$data['product_store'] = $this->model_editors_product->getProductStores($this->request->get['product_id']);
		} else {
			$data['product_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($product_info)) {
			$data['keyword'] = $product_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['shipping'])) {
			$data['shipping'] = $this->request->post['shipping'];
		} elseif (!empty($product_info)) {
			$data['shipping'] = $product_info['shipping'];
		} else {
			$data['shipping'] = $this->config->get('admin_quick_edit_product_default_shipping') ? $this->config->get('admin_quick_edit_product_default_shipping') : 0;
		}

		if (isset($this->request->post['price'])) {
			$data['price'] = $this->request->post['price'];
		} elseif (!empty($product_info)) {
			$data['price'] = $product_info['price'];
		} else {
			$data['price'] = '';
		}

		$this->load->model('catalog/recurring');

		$data['recurrings'] = $this->model_catalog_recurring->getRecurrings();

		if (isset($this->request->post['product_recurrings'])) {
			$data['product_recurrings'] = $this->request->post['product_recurrings'];
		} elseif (!empty($product_info)) {
			$data['product_recurrings'] = $this->model_editors_product->getRecurrings($product_info['product_id']);
		} else {
			$data['product_recurrings'] = array();
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['tax_class_id'])) {
			$data['tax_class_id'] = $this->request->post['tax_class_id'];
		} elseif (!empty($product_info)) {
			$data['tax_class_id'] = $product_info['tax_class_id'];
		} else {
			$data['tax_class_id'] = 0;
		}

		if (isset($this->request->post['date_available'])) {
			$data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($product_info)) {
			$data['date_available'] = ($product_info['date_available'] != '0000-00-00') ? $product_info['date_available'] : '';
		} else {
			$data['date_available'] = date('Y-m-d');
		}

		if (isset($this->request->post['quantity'])) {
			$data['quantity'] = $this->request->post['quantity'];
		} elseif (!empty($product_info)) {
			$data['quantity'] = $product_info['quantity'];
		} else {
			$data['quantity'] = $this->config->get('admin_quick_edit_product_default_quantity') ? $this->config->get('admin_quick_edit_product_default_quantity') : 1;
		}

		if (isset($this->request->post['minimum'])) {
			$data['minimum'] = $this->request->post['minimum'];
		} elseif (!empty($product_info)) {
			$data['minimum'] = $product_info['minimum'];
		} else {
			$data['minimum'] = $this->config->get('admin_quick_edit_product_default_min_quantity') ? $this->config->get('admin_quick_edit_product_default_min_quantity') : 1;
		}

		if (isset($this->request->post['subtract'])) {
			$data['subtract'] = $this->request->post['subtract'];
		} elseif (!empty($product_info)) {
			$data['subtract'] = $product_info['subtract'];
		} else {
			$data['subtract'] = $this->config->get('admin_quick_edit_product_default_stock') ? $this->config->get('admin_quick_edit_product_default_stock') : 0;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($product_info)) {
			$data['sort_order'] = $product_info['sort_order'];
		} else {
			$data['sort_order'] = 1;
		}

		$this->load->model('localisation/stock_status');

		$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['stock_status_id'])) {
			$data['stock_status_id'] = $this->request->post['stock_status_id'];
		} elseif (!empty($product_info)) {
			$data['stock_status_id'] = $product_info['stock_status_id'];
		} else {
			$data['stock_status_id'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($product_info)) {
			$data['status'] = $product_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['weight'])) {
			$data['weight'] = $this->request->post['weight'];
		} elseif (!empty($product_info)) {
			$data['weight'] = $product_info['weight'];
		} else {
			$data['weight'] = '';
		}

		$this->load->model('localisation/weight_class');

		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['weight_class_id'])) {
			$data['weight_class_id'] = $this->request->post['weight_class_id'];
		} elseif (!empty($product_info)) {
			$data['weight_class_id'] = $product_info['weight_class_id'];
		} else {
			$data['weight_class_id'] = $this->config->get('config_weight_class_id');
		}

		if (isset($this->request->post['length'])) {
			$data['length'] = $this->request->post['length'];
		} elseif (!empty($product_info)) {
			$data['length'] = $product_info['length'];
		} else {
			$data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($product_info)) {
			$data['width'] = $product_info['width'];
		} else {
			$data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($product_info)) {
			$data['height'] = $product_info['height'];
		} else {
			$data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['length_class_id'])) {
			$data['length_class_id'] = $this->request->post['length_class_id'];
		} elseif (!empty($product_info)) {
			$data['length_class_id'] = $product_info['length_class_id'];
		} else {
			$data['length_class_id'] = $this->config->get('config_length_class_id');
		}

		$this->load->model('editors/manufacturer');

		if (isset($this->request->post['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		} elseif (!empty($product_info)) {
			$data['manufacturer_id'] = $product_info['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}

		if (isset($this->request->post['manufacturer'])) {
			$data['manufacturer'] = $this->request->post['manufacturer'];
		} elseif (!empty($product_info)) {
			$manufacturer_info = $this->model_editors_manufacturer->getManufacturer($product_info['manufacturer_id']);

			if ($manufacturer_info) {
				$data['manufacturer'] = $manufacturer_info['name'];
			} else {
				$data['manufacturer'] = '';
			}
		} else {
			$data['manufacturer'] = '';
		}

		// Categories
		$this->load->model('editors/category');
		
		if (isset($this->request->post['main_category_id'])) {
			$data['main_category_id'] = $this->request->post['main_category_id'];
		} elseif (isset($product_info)) {
			$data['main_category_id'] = $this->model_editors_product->getProductMainCategoryId($this->request->get['product_id']);
		} else {
			$data['main_category_id'] = 0;
		}
		
		$data['main_category'] = $this->getMainCategoryName($data['main_category_id']);

		if (isset($this->request->post['product_category'])) {
			$categories = $this->request->post['product_category'];
		} elseif (isset($this->request->get['product_id'])) {
			$categories = $this->model_editors_product->getProductCategories($this->request->get['product_id']);
		} else {
			$categories = array();
		}

		$data['product_categories'] = array();

		foreach ($categories as $category_id) {
			$category_info = $this->model_editors_category->getCategory($category_id);

			if ($category_info) {
				$data['product_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}

		// Filters
		$this->load->model('catalog/filter');

		if (isset($this->request->post['product_filter'])) {
			$filters = $this->request->post['product_filter'];
		} elseif (isset($this->request->get['product_id'])) {
			$filters = $this->model_editors_product->getProductFilters($this->request->get['product_id']);
		} else {
			$filters = array();
		}

		$data['product_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['product_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		// Attributes
		$this->load->model('catalog/attribute');

		if (isset($this->request->post['product_attribute'])) {
			$product_attributes = $this->request->post['product_attribute'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_attributes = $this->model_editors_product->getProductAttributes($this->request->get['product_id']);
		} else {
			$product_attributes = array();
		}

		$data['product_attributes'] = array();

		foreach ($product_attributes as $product_attribute) {
			$attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);

			if ($attribute_info) {
				$data['product_attributes'][] = array(
					'attribute_id'                  => $product_attribute['attribute_id'],
					'name'                          => $attribute_info['name'],
					'product_attribute_description' => $product_attribute['product_attribute_description']
				);
			}
		}

		// Options
		$this->load->model('catalog/option');

		if (isset($this->request->post['product_option'])) {
			$product_options = $this->request->post['product_option'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_options = $this->model_editors_product->getProductOptions($this->request->get['product_id']);
		} else {
			$product_options = array();
		}

		$data['product_options'] = array();

		foreach ($product_options as $product_option) {
			$product_option_value_data = array();

			if (isset($product_option['product_option_value'])) {
				foreach ($product_option['product_option_value'] as $product_option_value) {
					$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'points'                  => $product_option_value['points'],
						'points_prefix'           => $product_option_value['points_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
					);
				}
			}

			$data['product_options'][] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => isset($product_option['value']) ? $product_option['value'] : '',
				'required'             => $product_option['required']
			);
		}

		$data['option_values'] = array();

		foreach ($data['product_options'] as $product_option) {
			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
				if (!isset($data['option_values'][$product_option['option_id']])) {
					$data['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
				}
			}
		}

		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		if (isset($this->request->post['product_discount'])) {
			$product_discounts = $this->request->post['product_discount'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_discounts = $this->model_editors_product->getProductDiscounts($this->request->get['product_id']);
		} else {
			$product_discounts = array();
		}

		$data['product_discounts'] = array();

		foreach ($product_discounts as $product_discount) {
			$data['product_discounts'][] = array(
				'customer_group_id' => $product_discount['customer_group_id'],
				'quantity'          => $product_discount['quantity'],
				'priority'          => $product_discount['priority'],
				'price'             => $product_discount['price'],
				'date_start'        => ($product_discount['date_start'] != '0000-00-00') ? $product_discount['date_start'] : '',
				'date_end'          => ($product_discount['date_end'] != '0000-00-00') ? $product_discount['date_end'] : ''
			);
		}

		if (isset($this->request->post['product_special'])) {
			$product_specials = $this->request->post['product_special'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_specials = $this->model_editors_product->getProductSpecials($this->request->get['product_id']);
		} else {
			$product_specials = array();
		}

		$data['product_specials'] = array();

		foreach ($product_specials as $product_special) {
			$data['product_specials'][] = array(
				'customer_group_id' => $product_special['customer_group_id'],
				'priority'          => $product_special['priority'],
				'price'             => $product_special['price'],
				'date_start'        => ($product_special['date_start'] != '0000-00-00') ? $product_special['date_start'] : '',
				'date_end'          => ($product_special['date_end'] != '0000-00-00') ? $product_special['date_end'] :  ''
			);
		}
		
		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($product_info)) {
			$data['image'] = $product_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($product_info) && is_file(DIR_IMAGE . $product_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		// Images
		if (isset($this->request->post['product_image'])) {
			$product_images = $this->request->post['product_image'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_images = $this->model_editors_product->getProductImages($this->request->get['product_id']);
		} else {
			$product_images = array();
		}

		$data['product_images'] = array();

		foreach ($product_images as $product_image) {
			if (is_file(DIR_IMAGE . $product_image['image'])) {
				$image = $product_image['image'];
				$thumb = $product_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['product_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $product_image['sort_order']
			);
		}

		// Downloads
		$this->load->model('catalog/download');

		if (isset($this->request->post['product_download'])) {
			$product_downloads = $this->request->post['product_download'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_downloads = $this->model_editors_product->getProductDownloads($this->request->get['product_id']);
		} else {
			$product_downloads = array();
		}

		$data['product_downloads'] = array();

		foreach ($product_downloads as $download_id) {
			$download_info = $this->model_catalog_download->getDownload($download_id);

			if ($download_info) {
				$data['product_downloads'][] = array(
					'download_id' => $download_info['download_id'],
					'name'        => $download_info['name']
				);
			}
		}

		if (isset($this->request->post['product_related'])) {
			$products = $this->request->post['product_related'];
		} elseif (isset($this->request->get['product_id'])) {
			$products = $this->model_editors_product->getProductRelated($this->request->get['product_id']);
		} else {
			$products = array();
		}

		$data['product_relateds'] = array();

		foreach ($products as $product_id) {
			$related_info = $this->model_editors_product->getProduct($product_id);

			if ($related_info) {
				$data['product_relateds'][] = array(
					'product_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}

		if (isset($this->request->post['points'])) {
			$data['points'] = $this->request->post['points'];
		} elseif (!empty($product_info)) {
			$data['points'] = $product_info['points'];
		} else {
			$data['points'] = '';
		}

		if (isset($this->request->post['product_reward'])) {
			$data['product_reward'] = $this->request->post['product_reward'];
		} elseif (isset($this->request->get['product_id'])) {
			$data['product_reward'] = $this->model_editors_product->getProductRewards($this->request->get['product_id']);
		} else {
			$data['product_reward'] = array();
		}

		if (isset($this->request->post['product_layout'])) {
			$data['product_layout'] = $this->request->post['product_layout'];
		} elseif (isset($this->request->get['product_id'])) {
			$data['product_layout'] = $this->model_editors_product->getProductLayouts($this->request->get['product_id']);
		} else {
			$data['product_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('editors/product/product_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'editors/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['product_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if ($this->config->get('admin_quick_edit_product_model_required')) {
			if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
				$this->error['model'] = $this->language->get('error_model');
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['product_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'editors/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'editors/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	// Product Main Category
	public function getMainCategoryName($category_id) {
		$row = $this->db->query("SELECT name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int) $category_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		if(isset($row->row['name'])){
			return $row->row['name'];
		}
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model']) || isset($this->request->get['filter_sku'])) {
			$this->load->model('editors/product');
			$this->load->model('catalog/option');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}
			
			if (isset($this->request->get['filter_sku'])) {
				$filter_sku = $this->request->get['filter_sku'];
			} else {
				$filter_sku = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 20;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'filter_sku'   => $filter_sku,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_editors_product->getProducts($filter_data);

			foreach ($results as $result) {
				$option_data = array();

				$product_options = $this->model_editors_product->getProductOptions($result['product_id']);

				foreach ($product_options as $product_option) {
					$option_info = $this->model_catalog_option->getOption($product_option['option_id']);

					if ($option_info) {
						$product_option_value_data = array();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);

							if ($option_value_info) {
								$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
								);
							}
						}

						$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
						);
					}
				}

				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete_model() {
		$json = array();

		if (isset($this->request->get['filter_model'])) {
			$this->load->model('editors/product');

			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}

			$filter_data = array(
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => 20
			);

			$results = $this->model_editors_product->getTotalModelProducts($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'model'      => $result['model']
				);
			}
		}


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete_sku() {
		$json = array();

		if (isset($this->request->get['filter_sku'])) {
			$this->load->model('editors/product');
			
			if (isset($this->request->get['filter_sku'])) {
				$filter_sku = $this->request->get['filter_sku'];
			} else {
				$filter_sku = '';
			}

			$filter_data = array(
				'filter_sku'   => $filter_sku,
				'start'        => 0,
				'limit'        => 20
			);

			$results = $this->model_editors_product->getTotalSkuProducts($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'sku'        => $result['sku']
				);
			}
		}


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete_location() {
		$json = array();

		if (isset($this->request->get['filter_location'])) {
			$this->load->model('editors/product');
			
			if (isset($this->request->get['filter_location'])) {
				$filter_location = $this->request->get['filter_location'];
			} else {
				$filter_location = '';
			}

			$filter_data = array(
				'filter_location'   => $filter_location,
				'start'        		=> 0,
				'limit'        		=> 20
			);

			$results = $this->model_editors_product->getTotalLocationProducts($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'location'   => $result['location']
				);
			}
		}


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}