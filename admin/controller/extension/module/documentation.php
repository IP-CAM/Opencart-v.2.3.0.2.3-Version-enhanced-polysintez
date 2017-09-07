<?php
class ControllerExtensionModuleDocumentation extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/documentation');

		$this->document->setTitle($this->language->get('meta_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/module/documentation');
		$this->load->model('catalog/product');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_product_search'] = $this->language->get('text_product_search');
		$data['text_file_filter'] = $this->language->get('text_file_filter');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_file_exists'] = $this->language->get('text_file_exists');
		$data['text_no_file'] = $this->language->get('text_no_file');
		$data['text_new_doc'] = $this->language->get('text_new_doc');
		$data['text_edit_doc'] = $this->language->get('text_edit_doc');
		$data['text_not_logged'] = $this->language->get('text_not_logged');
		$data['text_on_top'] = $this->language->get('text_on_top');
		$data['text_on_bot'] = $this->language->get('text_on_bot');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_check_mime'] = $this->language->get('entry_check_mime');
		$data['entry_delete_files'] = $this->language->get('entry_delete_files');
		$data['entry_product_search'] = $this->language->get('entry_product_search');
		$data['entry_file_filter'] = $this->language->get('entry_file_filter');
		$data['entry_filter_linked'] = $this->language->get('entry_filter_linked');
		$data['entry_service_action'] = $this->language->get('entry_service_action');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_filename'] = $this->language->get('entry_filename');
		$data['entry_mask'] = $this->language->get('entry_mask');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_storage_dir'] = $this->language->get('entry_storage_dir');
		$data['entry_tmp_dir'] = $this->language->get('entry_tmp_dir');
		$data['entry_show_tab'] = $this->language->get('entry_show_tab');
		$data['entry_restricts'] = $this->language->get('entry_restricts');
		$data['entry_tab_name'] = $this->language->get('entry_tab_name');
		$data['entry_folders'] = $this->language->get('entry_folders');
		$data['entry_default_folder'] = $this->language->get('entry_default_folder');
		$data['entry_default_fclass'] = $this->language->get('entry_default_fclass');
		$data['entry_default_ficon'] = $this->language->get('entry_default_ficon');
		$data['entry_folder_title'] = $this->language->get('entry_folder_title');
		$data['entry_folder_class'] = $this->language->get('entry_folder_class');
		$data['entry_folder_icon'] = $this->language->get('entry_folder_icon');
		$data['entry_folder_order'] = $this->language->get('entry_folder_order');
		$data['entry_link_folders'] = $this->language->get('entry_link_folders');
		$data['entry_public_link'] = $this->language->get('entry_public_link');
		$data['entry_show_tab_icon'] = $this->language->get('entry_show_tab_icon');
		$data['entry_tab_fa_icon'] = $this->language->get('entry_tab_fa_icon');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_mask'] = $this->language->get('column_mask');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_folders'] = $this->language->get('column_folders');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_folder_name'] = $this->language->get('column_folder_name');
		$data['column_folder_class'] = $this->language->get('column_folder_class');
		$data['column_folder_icon'] = $this->language->get('column_folder_icon');
		$data['column_folder_order'] = $this->language->get('column_folder_order');
		$data['column_folder_status'] = $this->language->get('column_folder_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_return'] = $this->language->get('button_return');
		$data['button_upload'] = $this->language->get('button_upload');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_link'] = $this->language->get('button_link');
		$data['button_unlink'] = $this->language->get('button_unlink');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_clear_filter'] = $this->language->get('button_clear_filter');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_upload_local'] = $this->language->get('button_upload_local');
		$data['button_remove_links'] = $this->language->get('button_remove_links');
		$data['button_remove_files'] = $this->language->get('button_remove_files');
		$data['button_download_link'] = $this->language->get('button_download_link');
		$data['button_folder_remove'] = $this->language->get('button_folder_remove');
		$data['button_folder_add'] = $this->language->get('button_folder_add');

		$data['tab_list'] = $this->language->get('tab_list');
		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_service'] = $this->language->get('tab_service');

		$data['error_permission'] = $this->language->get('error_permission');
		$data['error_link'] = $this->language->get('error_link');
		$data['error_delete'] = $this->language->get('error_delete');
		$data['error_name'] = $this->language->get('error_name');
		$data['error_upload'] = $this->language->get('error_upload');
		$data['error_upload_size'] = $this->language->get('error_upload_size');
		$data['error_local_upload'] = $this->language->get('error_local_upload');
		$data['error_filename'] = $this->language->get('error_filename');
		$data['error_exists'] = $this->language->get('error_exists');
		$data['error_mask'] = $this->language->get('error_mask');
		$data['error_filetype'] = $this->language->get('error_filetype');

		$data['help_product_filter'] = $this->language->get('help_product_filter');
		$data['help_name'] = $this->language->get('help_name');
		$data['help_filename'] = $this->language->get('help_filename');
		$data['help_mask'] = $this->language->get('help_mask');
		$data['help_products'] = $this->language->get('help_products');
		$data['help_customer_group'] = $this->language->get('help_customer_group');
		$data['help_storage_folder'] = $this->language->get('help_storage_folder');
		$data['help_manuad_upload'] = $this->language->get('help_manuad_upload');
		$data['help_folder_icon'] = $this->language->get('help_folder_icon');
		$data['help_link_folders'] = $this->language->get('help_link_folders');

		$data['confirm_folder_del'] = $this->language->get('confirm_folder_del');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $data['heading_title'],
			'href' => $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];

		$data['customer_groups'] = $this->model_extension_module_documentation->getCustomerGroups(array('sort'=>'cg.sort_order'));

		$data['customer_groups_names'] = array();
		foreach ($data['customer_groups'] as $customer_group) {
			$data['customer_groups_names'][$customer_group['customer_group_id']] = $customer_group['name'];
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['config_language_id'] = (int)$this->config->get('config_language_id');

		if (isset($this->request->post['rows_selected'])) {
			$data['selected'] = (array)$this->request->post['rows_selected'];
		} else {
			$data['selected'] = array();
		}

		$product_name = '';
		if (isset($this->request->get['product_search']) && (int)$this->request->get['product_search']>0) {
			$product = $this->model_catalog_product->getProduct((int)$this->request->get['product_search']);
			if ($product) {
				$product_name = $product['name'];
			} else {
				unset($this->request->get['product_search']);
			}
		}

		$data['documentation'] = array();

		$getDataParams = array(
			 'sort'				=> (isset($this->request->get['sort']))?$this->request->get['sort']:'dd.name'
			,'order'			=> (isset($this->request->get['order']))?$this->request->get['order']:'ASC'
			,'page'				=> (isset($this->request->get['page']))?$this->request->get['page']:1
			,'product_search'	=> (isset($this->request->get['product_search']) && (int)$this->request->get['product_search']>0)?(int)$this->request->get['product_search']:0
			,'product_name'		=> $product_name
			,'file_filter'		=> (isset($this->request->get['file_filter']))?trim($this->request->get['file_filter']):''
			,'filter_linked'	=> (isset($this->request->get['filter_linked']) && $this->request->get['filter_linked']>=0)?(int)$this->request->get['filter_linked']:false
			,'folder_id'		=> (isset($this->request->get['folder_id']) && $this->request->get['folder_id']>=0)?(int)$this->request->get['folder_id']:false
			,'customer_group'	=> (isset($this->request->get['customer_group']) && $this->request->get['customer_group']>=0)?(int)$this->request->get['customer_group']:false
			);

		$data['getDataParams'] = $getDataParams;

		$paramsForUrl = $getDataParams;
		unset($paramsForUrl['product_name']);
		if ($paramsForUrl['product_search']==0) {
			unset($paramsForUrl['product_search']);
		}
		if (empty($paramsForUrl['file_filter'])) {
			unset($paramsForUrl['file_filter']);
		}
		if ($paramsForUrl['filter_linked']===false) {
			unset($paramsForUrl['filter_linked']);
		}
		if ($paramsForUrl['folder_id']===false) {
			unset($paramsForUrl['folder_id']);
		}
		if ($paramsForUrl['customer_group']===false) {
			unset($paramsForUrl['customer_group']);
		}
		$url = http_build_query($paramsForUrl);

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if (!$this->validate()) {
				if (isset($this->error['warning'])) {
					$this->session->data['warning'] = $this->error['warning'];
				}
				$this->response->redirect($this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'].'&'.$url, true));
			} else if (isset($this->request->post['act'])) {
				switch ($this->request->post['act']) {
					case 'link':
						if (isset($this->request->post['rows_selected']) && !empty($this->request->post['rows_selected']) && isset($this->request->post['product_search']) && (int)$this->request->post['product_search']>0) {
							$this->model_extension_module_documentation->linkFilesToProduct($this->request->post['product_search'],$this->request->post['rows_selected']);
							$this->session->data['success'] = $this->language->get('text_success_link');
						} else {
							$this->session->data['warning'] = $this->language->get('error_link');
						}
						break;
					case 'unlink':
						if (isset($this->request->post['rows_selected']) && !empty($this->request->post['rows_selected']) && isset($this->request->post['product_search']) && (int)$this->request->post['product_search']>0) {
							$this->model_extension_module_documentation->unlinkFilesToProduct($this->request->post['product_search'],$this->request->post['rows_selected']);
							$this->session->data['success'] = $this->language->get('text_success_unlink');
						} else {
							$this->session->data['warning'] = $this->language->get('error_link');
						}
						break;
					case 'delete':
						if (isset($this->request->post['rows_selected']) && !empty($this->request->post['rows_selected'])) {
							$this->model_extension_module_documentation->deleteDocumentation($this->request->post['rows_selected']);
							$this->session->data['success'] = $this->language->get('text_success_delete');
						} else {
							$this->session->data['warning'] = $this->language->get('error_delete');
						}
						break;
					default:
						break;
				}
				$this->response->redirect($this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'].'&'.$url, true));
			} else if (!$this->validatePost()) {
				$this->session->data['warning'] = $this->error['warning'];
			} else {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->model_setting_setting->editSetting('documentation', $this->request->post);
				$postfolders = isset($this->request->post['folders'])?$this->request->post['folders']:array();
				$this->model_extension_module_documentation->updateFolders($postfolders);
				$this->response->redirect($this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'].'&'.$url, true));
			}
		}

		if (isset($this->session->data['success'])) {
			$data['success_message'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success_message'] = '';
		}

		if (isset($this->session->data['warning'])) {
			$data['error_warning'] = $this->session->data['warning'];
			unset($this->session->data['warning']);
		} else {
			$data['error_warning'] = '';
		}

		$limit = $this->config->get('config_limit_admin');

		$filter_data = array(
			'sort'				=> $getDataParams['sort'],
			'order'				=> $getDataParams['order'],
			'start'				=> ($getDataParams['page'] - 1) * $limit,
			'limit'				=> $limit,
			'filter_name'		=> $getDataParams['file_filter'],
			'product'			=> $getDataParams['product_search'],
			'filter_linked'		=> $getDataParams['filter_linked'],
			'folder_id'			=> $getDataParams['folder_id'],
			'customer_group'	=> $getDataParams['customer_group']
		);

		$documentation_total = $this->model_extension_module_documentation->getTotalDocumentation($filter_data);

		$pageMin = 1;
		if ($getDataParams['page'] < $pageMin) {
			$this->request->get['page'] = $pageMin;
			$getDataParams['page'] = $pageMin;
			$paramsForUrl['page'] = $pageMin;
			$filter_data['start'] = ($pageMin - 1) * $limit;
		}
		$pageMax = ceil($documentation_total/$limit);
		if ($getDataParams['page'] > $pageMax) {
			$this->request->get['page'] = $pageMax;
			$getDataParams['page'] = $pageMax;
			$paramsForUrl['page'] = $pageMax;
			$filter_data['start'] = ($pageMax - 1) * $limit;
		}

		$dirs = $this->model_extension_module_documentation->getDirs();
		$storage = DIR_SYSTEM . $dirs['storage'] . '/';
		if (!is_dir($storage)) {
			$data['storage_error'] = $this->language->get('error_storage_exists');
		} elseif (!is_readable($storage)) {
			$data['storage_error'] = $this->language->get('error_storage_read');
		} elseif (!is_writeable($storage)) {
			$data['storage_error'] = $this->language->get('error_storage_write');
		} else {
			$data['storage_error'] = false;
		}
		$data['storage'] = '/' . $dirs['storage'] . '/';
		$tmpdir = DIR_SYSTEM . $dirs['tmpdir'] . '/';
		if (!is_dir($tmpdir)) {
			$data['tmpdir_error'] = $this->language->get('error_tmpdir_exists');
		} elseif (!is_readable($tmpdir)) {
			$data['tmpdir_error'] = $this->language->get('error_tmpdir_read');
		} elseif (!is_writeable($tmpdir)) {
			$data['tmpdir_error'] = $this->language->get('error_tmpdir_write');
		} else {
			$data['tmpdir_error'] = false;
		}
		$data['tmpdir'] = '/' . $dirs['tmpdir'] . '/';

		$results = $this->model_extension_module_documentation->getAllDocumentation($filter_data);

		foreach ($results as $result) {
			$filestatus = 1;
			if (!file_exists($storage . $result['filename'])) {
				$filestatus = 0;
			}
			$link_folders = isset($result['link_folders'])?explode(',',$result['link_folders']):array();
			$document_customer_groups = isset($result['customer_groups'])?explode(',',$result['customer_groups']):array();
			$data['documentation'][] = array(
				'documentation_id'	=> $result['documentation_id'],
				'name'				=> $result['name'],
				'mask'				=> $result['mask'],
				'filename'			=> $result['filename'],
				'filestatus'		=> $filestatus,
				'filesize'			=> ($filestatus)?$this->convertSize($this->model_extension_module_documentation->getFileSize($storage . $result['filename'])):0,
				'date_modified'		=> date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'edit'				=> $this->url->link('extension/module/documentation/edit', 'token=' . $this->session->data['token'] . '&documentation_id=' . $result['documentation_id'] . $url, true),
				'linked'			=> isset($result['linked'])?$result['linked']:(bool)$result['links'],
				'links'				=> sprintf($this->language->get('text_document_links'),$result['links']),
				'link_folders'		=> array_unique($link_folders),
				'customer_groups'	=> array_unique($document_customer_groups),
				'store_doc_link'	=> ($this->config->get('config_secure')?HTTPS_CATALOG:HTTP_CATALOG) . 'index.php?route=extension/module/documentation/download&documentation_id=' . ($result['documentation_id'])
			);
		}

		$temp_Params = $paramsForUrl;
		$temp_Params['sort'] = 'dd.name';
		$temp_Params['order'] = ($paramsForUrl['sort']=='dd.name' && $paramsForUrl['order']=='ASC')?'DESC':'ASC';
		$data['sort_name'] = $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'] . '&' . http_build_query($temp_Params), true);

		$temp_Params = $paramsForUrl;
		$temp_Params['sort'] = 'd.mask';
		$temp_Params['order'] = ($paramsForUrl['sort']=='d.mask' && $paramsForUrl['order']=='ASC')?'DESC':'ASC';
		$data['sort_mask'] = $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'] . '&' . http_build_query($temp_Params), true);

		$temp_Params = $paramsForUrl;
		$temp_Params['sort'] = 'd.date_modified';
		$temp_Params['order'] = ($paramsForUrl['sort']=='d.date_modified' && $paramsForUrl['order']=='ASC')?'DESC':'ASC';
		$data['sort_date_modified'] = $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'] . '&' . http_build_query($temp_Params), true);

		$temp_Params = $paramsForUrl;
		unset($temp_Params['page']);
		$pagination = new Pagination();
		$pagination->total = $documentation_total;
		$pagination->page = $paramsForUrl['page'];
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('extension/module/documentation', 'token=' . $this->session->data['token'] . '&' . http_build_query($temp_Params) . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($documentation_total) ? (($paramsForUrl['page'] - 1) * $limit) + 1 : 0, ((($paramsForUrl['page'] - 1) * $limit) > ($documentation_total - $limit)) ? $documentation_total : ((($paramsForUrl['page'] - 1) * $limit) + $limit), $documentation_total, ceil($documentation_total / $limit));

		$data['folders'] = array();
		if (isset($this->request->post['folders'])) {
			$data['folders'] = $this->request->post['folders'];
		} else {
			$folders = $this->model_extension_module_documentation->getFolders();
			if ($folders) {
				foreach ($folders as $folder) {
					$data['folders'][] = array(
						 'folder_id'	=> $folder['documentation_folder_id']
						,'titles'		=> $this->model_extension_module_documentation->getFolderTitles($folder['documentation_folder_id'])
						,'class'		=> strip_tags(html_entity_decode($folder['class'], ENT_QUOTES, 'UTF-8'))
						,'icon'			=> strip_tags(html_entity_decode($folder['icon'], ENT_QUOTES, 'UTF-8'))
						,'sort_order'	=> $folder['sort_order']
						,'status'		=> $folder['status']
					);
				}
			}
		}

		if (isset($this->request->post['documentation_status'])) {
			$data['documentation_status'] = $this->request->post['documentation_status'];
		} else {
			$data['documentation_status'] = $this->config->get('documentation_status');
		}

		if (isset($this->request->post['documentation_check_mime_type'])) {
			$data['documentation_check_mime_type'] = $this->request->post['documentation_check_mime_type'];
		} else {
			$data['documentation_check_mime_type'] = $this->config->get('documentation_check_mime_type');
		}

		if (isset($this->request->post['documentation_auto_delete_files'])) {
			$data['documentation_auto_delete_files'] = $this->request->post['documentation_auto_delete_files'];
		} else {
			$data['documentation_auto_delete_files'] = $this->config->get('documentation_auto_delete_files');
		}

		if (isset($this->request->post['documentation_show_tab_always'])) {
			$data['documentation_show_tab_always'] = $this->request->post['documentation_show_tab_always'];
		} else {
			$data['documentation_show_tab_always'] = $this->config->get('documentation_show_tab_always');
		}

		if (isset($this->request->post['documentation_customer_group_restrict'])) {
			$data['documentation_customer_group_restrict'] = $this->request->post['documentation_customer_group_restrict'];
		} else {
			$data['documentation_customer_group_restrict'] = $this->config->get('documentation_customer_group_restrict');
		}

		if (isset($this->request->post['documentation_tab_name'])) {
			$data['documentation_tab_name'] = $this->request->post['documentation_tab_name'];
		} elseif ($this->config->get('documentation_tab_name')) {
			$data['documentation_tab_name'] = $this->config->get('documentation_tab_name');
		} else {
			$data['documentation_tab_name'] = array();
			foreach ($data['languages'] as $language) {
				$data['documentation_tab_name'][$language['language_id']] = '';
			}
		}

		if (isset($this->request->post['documentation_default_folder_titles'])) {
			$data['documentation_default_folder_titles'] = $this->request->post['documentation_default_folder_titles'];
		} elseif ($this->config->get('documentation_default_folder_titles')) {
			$data['documentation_default_folder_titles'] = $this->config->get('documentation_default_folder_titles');
		} else {
			$data['documentation_default_folder_titles'] = array();
			foreach ($data['languages'] as $language) {
				$data['documentation_default_folder_titles'][$language['language_id']] = '';
			}
		}

		if (isset($this->request->post['documentation_default_folder_class'])) {
			$data['documentation_default_folder_class'] = $this->request->post['documentation_default_folder_class'];
		} else {
			$data['documentation_default_folder_class'] = $this->config->get('documentation_default_folder_class');
		}

		if (isset($this->request->post['documentation_default_folder_icon'])) {
			$data['documentation_default_folder_icon'] = $this->request->post['documentation_default_folder_icon'];
		} else {
			$data['documentation_default_folder_icon'] = $this->config->get('documentation_default_folder_icon');
		}

		if (isset($this->request->post['documentation_default_folder_order'])) {
			$data['documentation_default_folder_order'] = $this->request->post['documentation_default_folder_order'];
		} else {
			$data['documentation_default_folder_order'] = $this->config->get('documentation_default_folder_order');
		}

		if (isset($this->request->post['documentation_default_folder_status'])) {
			$data['documentation_default_folder_status'] = $this->request->post['documentation_default_folder_status'];
		} else {
			$data['documentation_default_folder_status'] = $this->config->get('documentation_default_folder_status');
		}

		if (isset($this->request->post['documentation_public_link'])) {
			$data['documentation_public_link'] = $this->request->post['documentation_public_link'];
		} else {
			$data['documentation_public_link'] = $this->config->get('documentation_public_link');
		}

		if (isset($this->request->post['documentation_show_tab_icon'])) {
			$data['documentation_show_tab_icon'] = $this->request->post['documentation_show_tab_icon'];
		} else {
			$data['documentation_show_tab_icon'] = $this->config->get('documentation_show_tab_icon');
		}

		if (isset($this->request->post['documentation_tab_fa_icon'])) {
			$data['documentation_tab_fa_icon'] = $this->request->post['documentation_tab_fa_icon'];
		} else {
			$data['documentation_tab_fa_icon'] = $this->config->get('documentation_tab_fa_icon');
		}

		$data['download_url'] = $this->url->link('extension/module/documentation/download', 'token=' . $this->session->data['token'], true);

		$this->response->setOutput($this->load->view('extension/module/documentation.tpl', $data));
	}

	protected function validate() {
		$this->load->language('extension/module/documentation');
		$this->load->model('extension/module/documentation');
		if (!$this->user->hasPermission('modify', 'extension/module/documentation')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validate_read() {
		$this->load->language('extension/module/documentation');
		$this->load->model('extension/module/documentation');
		if (!$this->user->hasPermission('access', 'extension/module/documentation')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validatePost() {
		$this->load->language('extension/module/documentation');
		$this->load->model('extension/module/documentation');
		if (!$this->user->hasPermission('modify', 'extension/module/documentation')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function getDocumentationData() {
		$json = array();
		$documentation_id = 0;
		if (isset($this->request->get['documentation_id'])) {
			$documentation_id = (int)$this->request->get['documentation_id'];
		}

		if (!$this->validate_read() || $documentation_id<=0) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json && $documentation_id>0) {
			$json['description'] = $this->model_extension_module_documentation->getDocumentationDescription($documentation_id);
			$json['filedata'] = $this->model_extension_module_documentation->getDocumentationFileData($documentation_id);
			$json['products'] = $this->model_extension_module_documentation->getDocumentationLinks($documentation_id);
			$json['link_folders'] = $this->model_extension_module_documentation->getDocumentationFolders($documentation_id);
			$json['customer_groups'] = $this->model_extension_module_documentation->getDocumentationCustomerGroups($documentation_id);
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function reloadDocumentationData() {
		$json = array();
		$documentation_id = 0;
		if (isset($this->request->get['documentation_id'])) {
			$documentation_id = (int)$this->request->get['documentation_id'];
		}

		if (!$this->validate() || $documentation_id<=0) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json && $documentation_id>0) {
			$dirs = $this->model_extension_module_documentation->getDirs();
			$storage = DIR_SYSTEM . $dirs['storage'] . '/';
			$json['data'] = $this->model_extension_module_documentation->getDocumentation($documentation_id);
			$json['data']['filestatus'] = 1;
			$json['data']['filestatus_text'] = $this->language->get('text_file_exists');
			if (!file_exists($storage . $json['data']['filename'])) {
				$json['data']['filestatus'] = 0;
				$json['data']['filestatus_text'] = $this->language->get('text_no_file');
				$json['data']['filesize'] = false;
			} else {
				$json['data']['filesize'] = $this->convertSize($this->model_extension_module_documentation->getFileSize($storage . $json['data']['filename']));
			}
			$json['data']['date'] = date($this->language->get('date_format_short'), strtotime($json['data']['date_modified']));
			$json['data']['links'] = $this->model_extension_module_documentation->getDocumentationLinks($documentation_id);
			$json['data']['links_count'] = count($json['data']['links']);
			$json['data']['links_text'] = sprintf($this->language->get('text_document_links'),$json['data']['links_count']);
			$json['data']['folders'] = $this->model_extension_module_documentation->getDocumentationFolders($documentation_id);
			$json['data']['cgroup'] = $this->model_extension_module_documentation->getDocumentationCustomerGroups($documentation_id);
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getProducts() {
		if (!$this->validate_read()) {
			return false;
		}
		$filter_name = '';
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		}
		if (utf8_strlen(trim($filter_name))>2) {
			$json = array();
			$results = $this->model_extension_module_documentation->getProducts($filter_name);
			foreach($results as $result){
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
				);
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function getFilesList() {
		if (!$this->validate_read()) {
			return false;
		}
		$filter_name = '';
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		}
		if (utf8_strlen(trim($filter_name))>2) {
			$json = array();
			$results = $this->model_extension_module_documentation->getFilesList($filter_name);
			foreach($results as $result){
				$json[] = array(
					'name'       => strip_tags(html_entity_decode($result, ENT_QUOTES, 'UTF-8'))
				);
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function deleteLink($product_id) {
		if (!$this->validate()) {
			return false;
		}
		$this->model_extension_module_documentation->deleteLink($product_id);
	}

	public function linksActualization() {
		$json = array();

		if (!$this->validate()) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json) {
			$json['success'] = sprintf($this->language->get('text_links_deleted'), $this->model_extension_module_documentation->linksActualization());
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeOldDocumentationFiles() {
		$json = array();

		if (!$this->validate()) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json) {
			$result = $this->model_extension_module_documentation->removeOldDocumentationFiles();
			if (is_int($result)) {
				$json['success'] = sprintf($this->language->get('text_files_deleted'), $result);
			} else {
				$json['error'] = $result;
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeTemporaryFiles() {
		$json = array();

		if (!$this->validate()) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json) {
			$dirs = $this->model_extension_module_documentation->getDirs();
			$handle = fopen(DIR_SYSTEM . $dirs['workdir'] . '/index.html', 'w');
			if (!flock($handle, LOCK_EX | LOCK_NB)) {
				$json['error'] = $this->language->get('error_run_locked');
			} else {
				$result = $this->model_extension_module_documentation->removeTemporaryFiles();
				if (is_int($result)) {
					$json['success'] = sprintf($this->language->get('text_temp_deleted'), $result);
				} else {
					$json['error'] = $result;
				}
				flock($handle, LOCK_UN);
				fclose($handle);
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function upload($localData = false) {
		$json = array();

		// Check user has permission
		if (!$this->validate()) {
			$json['error'] = $this->language->get('error_permission');
		}

		$dirs = $this->model_extension_module_documentation->getDirs();
		$storage = DIR_SYSTEM . $dirs['storage'] . '/';

		if (!is_dir($storage)) {
			$json['error'] = $this->language->get('error_storage_exists');
		} elseif (!is_writeable($storage)) {
			$json['error'] = $this->language->get('error_storage_write');
		}

		if ($localData) {
			$fileData = $localData;
		} elseif (isset($this->request->files['file'])) {
			$fileData = $this->request->files['file'];
		} else {
			$json['error'] = $this->language->get('error_upload_size');
		}

		if (!$json) {
			if (!empty($fileData['name']) && is_file($fileData['tmp_name'])) {
				// Sanitize the filename
				$filename = trim(basename(' '.str_replace(' .','.',preg_replace('/\s+/',' ',preg_replace('#[^\w\d\-_~,;\+\.\«\»\[\]\(\)\:]#iu', ' ', $fileData['name'])))),'.-+ ');
				// Validate the filename length
				if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
					$json['error'] = $this->language->get('error_filename');
				}

				// Allowed file extension types
				$allowed = array();

				$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));

				$filetypes = explode("\n", $extension_allowed);

				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}

				if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				if ($this->config->get('documentation_check_mime_type')) {
					$finfo = finfo_open(FILEINFO_MIME_TYPE);
					// Allowed file mime types
					$allowed = array();

					$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));

					$filetypes = explode("\n", $mime_allowed);

					foreach ($filetypes as $filetype) {
						$allowed[] = trim($filetype);
					}

					if (!in_array(finfo_file($finfo, $fileData['tmp_name']), $allowed)) {
						$json['error'] = $this->language->get('error_filetype');
					}
				}

				// Check to see if any PHP files are trying to be uploaded
				$content = file_get_contents($fileData['tmp_name'],false,NULL,-1,100);

				if (preg_match('/[(\/\/),(\/\*)]?.*\<\?php/i', $content)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				// Return any upload error
				if ($fileData['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $fileData['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
		}

		if (!$json) {
			$file = $filename . '.' . $this->token(32);

			if ($localData) {
				rename($fileData['tmp_name'], $storage . $file);
			} else {
				move_uploaded_file($fileData['tmp_name'], $storage . $file);
			}

			$json['filename'] = $file;
			$json['mask'] = $filename;

			$this->load->model('localisation/language');
			$languages = $this->model_localisation_language->getLanguages();
			$extLength = utf8_strlen(strrchr($filename, '.'));
			$name = utf8_substr($filename,0,-$extLength);
			foreach ($languages as $language) {
				$json['documentation_description'][$language['language_id']] = array('name' => $name);
			}

			$json['success'] = $this->language->get('text_upload');
		}

		if ($localData) {
			return $json;
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function uploadLocal() {
		$json = array();

		if (!$this->validate()) {
			$json['error'] = $this->language->get('error_permission');
		}
		if (!$json) {
			$skipped = array();
			$processed = 0;

			$dirs = $this->model_extension_module_documentation->getDirs();
			$handle = fopen(DIR_SYSTEM . $dirs['workdir'] . '/index.html', 'w');
			if (!flock($handle, LOCK_EX | LOCK_NB)) {
				$json['error'] = $this->language->get('error_run_locked');
			} else {
				$tmpdir = DIR_SYSTEM . $dirs['tmpdir'] . '/';

				if (!is_dir($tmpdir)) {
					$json['error'] = $this->language->get('error_tmpdir_exists');
				} elseif (!is_readable($tmpdir)) {
					$json['error'] = $this->language->get('error_tmpdir_read');
				}
				if (!$json) {
					$newFiles = opendir($tmpdir);
					if (!empty($newFiles)) {
						while(($fname = readdir($newFiles)) !== false){
							if ($fname == '.' || $fname == '..') {
								continue;
							}
							$tmpSize = $this->model_extension_module_documentation->getFileSize($tmpdir.$fname);
							usleep(50000);
							clearstatcache();
							if ($tmpSize != $this->model_extension_module_documentation->getFileSize($tmpdir.$fname)) {
								continue;
							}
							$fileData = array(
								'name'		=> $fname,
								'tmp_name'	=> $tmpdir.$fname,
								'error'		=> UPLOAD_ERR_OK
							);
							$result = $this->upload($fileData);
							if (isset($result['success'])) {
								$processed++;
								$this->model_extension_module_documentation->addDocumentation($result);
							} else {
								$skipped[] = $fname.' — '.$result['error'];
							}
						}
					}
					if (!empty($skipped)) {
						$json['error'] = $this->language->get('error_local_upload').'<br/>'.implode('<br/>', $skipped);
					}
					closedir($newFiles);
					$json['success'] = sprintf($this->language->get('text_files_processed'), $processed);
				}
				flock($handle, LOCK_UN);
				fclose($handle);
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download() {
		if (!$this->validate_read()) {
			exit($this->language->get('error_permission'));
		}
		$documentation_id = (int)$this->request->post['documentation_id'];
		$documentation_info = $this->model_extension_module_documentation->getDocumentationFileData($documentation_id);
		if (isset($documentation_info['documentation_id']) && $documentation_info['documentation_id']>0) {
			$dirs = $this->model_extension_module_documentation->getDirs();
			$file = DIR_SYSTEM . $dirs['storage'] . '/' . $documentation_info['filename'];
			$mask = trim(basename(' '.$documentation_info['mask']));
			if (!headers_sent()) {
				if (file_exists($file) && !empty($mask)) {
					header_remove();
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename*=UTF-8\'\''.rawurlencode($mask ? $mask : basename($file)) . '');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Encoding: none');
					header('Vary: User-Agent');
					header('Content-Length: ' . $this->model_extension_module_documentation->getFileSize($file));
					if (ob_get_level()) {
						ob_end_clean();
					}
					readfile($file);
					exit();
				} else {
					exit('Error: Could not find file "' . $file . '"!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			exit('Error: No such document!');
		}
	}

	public function saveDocumentation() {
		$json = array();
		$data = array();
		$documentation_id = 0;
		if (isset($this->request->get['documentation_id'])) {
			$documentation_id = (int)$this->request->get['documentation_id'];
		}

		if (!$this->validate() || $documentation_id<0) {
			$json['error']['permission'] = $this->language->get('error_permission');
		}
		if (!$json) {
			if (isset($this->request->post['description']) && !empty($this->request->post['description'])) {
				foreach ($this->request->post['description'] as $language_id => $title) {
					$title = trim($title);
					if (utf8_strlen($title)<3 || utf8_strlen($title)>128) {
						$json['error']['description'][$language_id] = $this->language->get('error_name');
					} else {
						$data['documentation_description'][$language_id] = array('name'=>$title);
					}
				}
			} else {
				$this->load->model('localisation/language');
				$languages = $this->model_localisation_language->getLanguages();
				foreach ($languages as $language) {
					$json['error']['description'][$language['language_id']] = $this->language->get('error_name');
				}
			}

			$dirs = $this->model_extension_module_documentation->getDirs();
			$storage = DIR_SYSTEM . $dirs['storage'] . '/';

			if (!is_dir($storage)) {
				$json['error']['filename'] = $this->language->get('error_storage_exists');
			} elseif (!is_readable($storage)) {
				$json['error']['filename'] = $this->language->get('error_storage_read');
			}

			if (!isset($json['error']['filename'])) {
				if (!isset($this->request->post['filename']) || empty($this->request->post['filename']) || !file_exists($storage.trim($this->request->post['filename'])) || !is_file($storage.trim($this->request->post['filename']))) {
					$json['error']['filename'] = $this->language->get('error_exists');
				} else {
					$data['filename'] = trim($this->request->post['filename']);
				}
			}

			if (!isset($this->request->post['mask']) || utf8_strlen(trim($this->request->post['mask']))<3 || utf8_strlen(trim($this->request->post['mask']))>128) {
				$json['error']['mask'] = $this->language->get('error_mask');
			} else {
				$data['mask'] = trim($this->request->post['mask']);
			}

			if (isset($this->request->post['link_product']) && !empty($this->request->post['link_product'])) {
				foreach ($this->request->post['link_product'] as $product_id) {
					if ((int)$product_id>0) {
						$data['documentation_links'][] = (int)$product_id;
					}
				}
			}

			if (isset($this->request->post['link_folders']) && !empty($this->request->post['link_folders'])) {
				foreach ($this->request->post['link_folders'] as $folder_id => $dummy) {
					if ((int)$folder_id>0) {
						$data['documentation_link_folders'][] = (int)$folder_id;
					}
				}
			}

			if (isset($this->request->post['document_customer_group']) && !empty($this->request->post['document_customer_group'])) {
				foreach ($this->request->post['document_customer_group'] as $customer_group_id => $dummy) {
					if ((int)$customer_group_id>0) {
						$data['documentation_customer_group'][] = (int)$customer_group_id;
					}
				}
			}
		}

		if (!$json && !empty($data)) {
			if ($documentation_id == 0) {
				if ($this->model_extension_module_documentation->addDocumentation($data)>0) {
					$this->session->data['success'] = $this->language->get('text_success');
				}
			} else {
				$this->model_extension_module_documentation->editDocumentation($documentation_id, $data);
				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}


	private function convertSize($bytes) {
		$bytes = (float)$bytes;
		if (!$bytes) {
			return number_format(0,2,$this->language->get('decimal_point'),$this->language->get('thousand_point'))." B";
		}
			$units = array(
			array(
				'unit' => 'Tb',
				'val' => pow(1024, 4)
			),
			array(
				'unit' => 'Gb',
				'val' => pow(1024, 3)
			),
			array(
				'unit' => 'Mb',
				'val' => pow(1024, 2)
			),
			array(
				'unit' => 'Kb',
				'val' => 1024
			),
			array(
				'unit' => 'B',
				'val' => 1
			),
		);
		$bytes = (float)$bytes;
		foreach ($units as $unitData) {
			if ($bytes >= $unitData['val']) {
				$result = number_format($bytes/$unitData['val'],2,$this->language->get('decimal_point'),$this->language->get('thousand_point'))." ".$unitData["unit"];
				break;
			}
		}
		return $result;
	}

	private function token($length = 32) {
		$string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		$token = '';
		for ($i = 0; $i < $length; $i++) {
			$token .= $string[mt_rand(0, strlen($string) - 1)];
		}
		return $token;
	}

	public function install() {
		$installed = $this->config->get('documentation_status');
		if (isset($installed)) {
			return false;
		}
		$this->load->model('setting/setting');
		$this->load->model('extension/module/documentation');
		$this->load->model('extension/event');
		$this->load->model('localisation/language');
		$this->load->language('extension/module/documentation');
		$data = array(
			'documentation_status'					=> 0,
			'documentation_check_mime_type'			=> 0,
			'documentation_auto_delete_files'		=> 1,
			'documentation_show_tab_always'			=> 1,
			'documentation_tab_name'				=> array(),
			'documentation_default_folder_titles'	=> array(),
			'documentation_default_folder_class'	=> 'default',
			'documentation_default_folder_icon'		=> 'bars',
			'documentation_default_folder_order'	=> 0,
			'documentation_default_folder_status'	=> 1,
			'documentation_public_link'				=> 0,
			'documentation_show_tab_icon'			=> 0,
			'documentation_tab_fa_icon'				=> 'download'
			);
		foreach ($this->model_localisation_language->getLanguages() as $language) {
			$data['documentation_tab_name'][$language['language_id']] = $this->language->get('text_tab_name');
			$data['documentation_default_folder_titles'][$language['language_id']] = $this->language->get('text_default_folder');
		}
		$this->model_setting_setting->editSetting('documentation', $data);
		$this->model_extension_module_documentation->install();
		$this->model_extension_event->addEvent('documentation', 'admin/model/product/delete/after', 'extension/module/documentation/deleteLink');
	}

	public function uninstall() {
		if (!$this->validate()) {
			return false;
		}
		$this->model_extension_module_documentation->uninstall();
		$this->load->model('extension/event');
		$this->model_extension_event->deleteEvent('documentation');
	}
}