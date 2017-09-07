<?php
class ControllerExtensionFeedYandexYml extends Controller {
	protected $tdata = array();
	
	protected $error = array();
	
	protected $allowedCurrencies = array('RUR', 'RUB', 'USD', 'EUR', 'BYR', 'BYN', 'KZT', 'UAH');
	
	protected $CONFIG_PREFIX = 'yandex_yml_';
	
	protected function preparePostData() {
		if (isset($this->request->post['yandex_yml_in_stock'])) {
			$this->request->post['yandex_yml_in_stock'] = implode(',', $this->request->post['yandex_yml_in_stock']);
		}
		if (isset($this->request->post['yandex_yml_out_of_stock'])) {
			$this->request->post['yandex_yml_out_of_stock'] = implode(',', $this->request->post['yandex_yml_out_of_stock']);
		}
		
		if (isset($this->request->post['yandex_yml_categories'])) {
			$this->request->post['yandex_yml_categories'] = implode(',', $this->request->post['yandex_yml_categories']);
		}
		if (isset($this->request->post['yandex_yml_manufacturers'])) {
			$this->request->post['yandex_yml_manufacturers'] = implode(',', $this->request->post['yandex_yml_manufacturers']);
		}
		if (isset($this->request->post['yandex_yml_categ_mapping'])) {
			$this->request->post['yandex_yml_categ_mapping'] = serialize(array_filter($this->request->post['yandex_yml_categ_mapping'], 'strlen'));
		}
		if (isset($this->request->post['yandex_yml_categ_delivery_cost'])) {
			$this->request->post['yandex_yml_categ_delivery_cost'] = serialize(array_filter($this->request->post['yandex_yml_categ_delivery_cost'], 'strlen'));
		}
		if (isset($this->request->post['yandex_yml_categ_cpa'])) {
			$this->request->post['yandex_yml_categ_cpa'] = serialize($this->request->post['yandex_yml_categ_cpa']);
		}
		if (isset($this->request->post['yandex_yml_categ_fee'])) {
			$this->request->post['yandex_yml_categ_fee'] = serialize(array_filter($this->request->post['yandex_yml_categ_fee'], 'strlen'));
		}
		if (isset($this->request->post['yandex_yml_categ_sales_notes'])) {
			$this->request->post['yandex_yml_categ_sales_notes'] = serialize(array_filter($this->request->post['yandex_yml_categ_sales_notes'], 'strlen'));
		}
		if (isset($this->request->post['yandex_yml_blacklist'])) {
			$this->request->post['yandex_yml_blacklist'] = implode(',', $this->request->post['yandex_yml_blacklist']);
		}
		if (isset($this->request->post['yandex_yml_pricefrom'])) {
			$this->request->post['yandex_yml_pricefrom'] = floatval($this->request->post['yandex_yml_pricefrom']);
		}
		if (isset($this->request->post['yandex_yml_priceto'])) {
			$this->request->post['yandex_yml_priceto'] = $this->request->post['yandex_yml_priceto'];
		}
		if (isset($this->request->post['yandex_yml_attributes'])) {
			$this->request->post['yandex_yml_attributes'] = implode(',', $this->request->post['yandex_yml_attributes']);
		}
		if (isset($this->request->post['yandex_yml_color_options'])) {
			$this->request->post['yandex_yml_color_options'] = implode(',', $this->request->post['yandex_yml_color_options']);
		}
		if (isset($this->request->post['yandex_yml_size_options'])) {
			$this->request->post['yandex_yml_size_options'] = implode(',', $this->request->post['yandex_yml_size_options']);
		}
		if (isset($this->request->post['yandex_yml_size_units'])) {
			$this->request->post['yandex_yml_size_units'] = serialize($this->request->post['yandex_yml_size_units']);
		}
	}

	protected function setLanguageData() {
		$this->tdata['breadcrumbs'] = array();

		$this->tdata['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$this->tdata['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] .'&type=feed', 'SSL'),
			'text'      => $this->language->get('text_feed'),
			'separator' => ' :: '
		);

		$this->tdata['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/feed/yandex_yml', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);
	
		$this->tdata['CONFIG_PREFIX'] = $this->CONFIG_PREFIX;
		
		$this->tdata['heading_title'] = $this->language->get('heading_title');
		$this->tdata['text_edit'] = $this->language->get('text_edit');
		

		$this->tdata['tab_general'] = $this->language->get('tab_general');
		$this->tdata['tab_available'] = $this->language->get('tab_available');
		$this->tdata['tab_categories'] = $this->language->get('tab_categories');
		$this->tdata['tab_attributes'] = $this->language->get('tab_attributes');
		$this->tdata['tab_tailor'] = $this->language->get('tab_tailor');

		$this->tdata['text_enabled'] = $this->language->get('text_enabled');
		$this->tdata['text_disabled'] = $this->language->get('text_disabled');
		$this->tdata['text_select_all'] = $this->language->get('text_select_all');
		$this->tdata['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->tdata['text_blacklist'] = $this->language->get('text_blacklist');
		$this->tdata['text_whitelist'] = $this->language->get('text_whitelist');

		$this->tdata['entry_status'] = $this->language->get('entry_status');
		$this->tdata['entry_token'] = $this->language->get('entry_token');
		$this->tdata['entry_token_help'] = $this->language->get('entry_token_help');
		$this->tdata['entry_data_feed'] = $this->language->get('entry_data_feed');
		$this->tdata['entry_data_feed_help'] = $this->language->get('entry_data_feed_help');
		
		$this->tdata['entry_ocstore'] = $this->language->get('entry_ocstore');
		$this->tdata['entry_ocstore_help'] = $this->language->get('entry_ocstore_help');
		$this->tdata['entry_datamodel'] = $this->language->get('entry_datamodel');
		$this->tdata['entry_datamodel_help'] = $this->language->get('entry_datamodel_help');
		
		$this->tdata['entry_name_field'] = $this->language->get('entry_name_field');
		$this->tdata['entry_model_field'] = $this->language->get('entry_model_field');
		$this->tdata['entry_vendorcode_field'] = $this->language->get('entry_vendorcode_field');
		$this->tdata['entry_typeprefix_field'] = $this->language->get('entry_typeprefix_field');
		$this->tdata['entry_barcode_field'] = $this->language->get('entry_barcode_field');
		$this->tdata['entry_keywords_field'] = $this->language->get('entry_keywords_field');
		$this->tdata['entry_description_field'] = $this->language->get('entry_description_field');
		$this->tdata['entry_dont_export'] = $this->language->get('entry_dont_export');
		
		$this->tdata['entry_export_tags'] = $this->language->get('entry_export_tags');
		$this->tdata['entry_export_tags_help'] = $this->language->get('entry_export_tags_help');
		$this->tdata['entry_utm_label'] = $this->language->get('entry_utm_label');
		$this->tdata['entry_utm_label_help'] = $this->language->get('entry_utm_label_help');
		
		$this->tdata['datamodels'] = $this->language->get('datamodels');
		$this->tdata['entry_delivery_cost'] = $this->language->get('entry_delivery_cost');
		$this->tdata['entry_delivery_cost_help'] = $this->language->get('entry_delivery_cost_help');
		$this->tdata['entry_delivery_days'] = $this->language->get('entry_delivery_days');
		$this->tdata['entry_delivery_days_help'] = $this->language->get('entry_delivery_days_help');
		$this->tdata['entry_delivery_before'] = $this->language->get('entry_delivery_before');
		$this->tdata['entry_delivery_before_help'] = $this->language->get('entry_delivery_before_help');
		$this->tdata['entry_local_delivery'] = $this->language->get('entry_local_delivery');
		$this->tdata['entry_outlets'] = $this->language->get('entry_outlets');
		$this->tdata['entry_outlets_help'] = $this->language->get('entry_outlets_help');
		
		$this->tdata['entry_category'] = $this->language->get('entry_category');
		$this->tdata['entry_category_help'] = $this->language->get('entry_category_help');
		$this->tdata['entry_market_category'] = $this->language->get('entry_market_category');
		$this->tdata['entry_market_category_help'] = $this->language->get('entry_market_category_help');
		$this->tdata['entry_manufacturers'] = $this->language->get('entry_manufacturers');
		$this->tdata['entry_manufacturers_help'] = $this->language->get('entry_manufacturers_help');
		$this->tdata['entry_blacklist_type'] = $this->language->get('entry_blacklist_type');
		$this->tdata['entry_blacklist'] = $this->language->get('entry_blacklist');
		$this->tdata['entry_blacklist_help'] = $this->language->get('entry_blacklist_help');
		$this->tdata['entry_whitelist'] = $this->language->get('entry_whitelist');
		$this->tdata['entry_whitelist_help'] = $this->language->get('entry_whitelist_help');
		$this->tdata['entry_pricefrom'] = $this->language->get('entry_pricefrom');
		$this->tdata['entry_pricefrom_help'] = $this->language->get('entry_pricefrom_help');
		$this->tdata['entry_priceto'] = $this->language->get('entry_priceto');
		$this->tdata['entry_priceto_help'] = $this->language->get('entry_priceto_help');
		$this->tdata['entry_currency'] = $this->language->get('entry_currency');
		$this->tdata['entry_currency_help'] = $this->language->get('entry_currency_help');
		$this->tdata['entry_oldprice'] = $this->language->get('entry_oldprice');
		$this->tdata['entry_oldprice_help'] = $this->language->get('entry_oldprice_help');
		$this->tdata['entry_groupprice'] = $this->language->get('entry_groupprice');
		$this->tdata['entry_groupprice_help'] = $this->language->get('entry_groupprice_help');
		$this->tdata['entry_changeprice'] = $this->language->get('entry_changeprice');
		$this->tdata['entry_changeprice_help'] = $this->language->get('entry_changeprice_help');
		$this->tdata['entry_unavailable'] = $this->language->get('entry_unavailable');
		$this->tdata['entry_unavailable_help'] = $this->language->get('entry_unavailable_help');
		$this->tdata['entry_in_stock'] = $this->language->get('entry_in_stock');
		$this->tdata['entry_in_stock_help'] = $this->language->get('entry_in_stock_help');
		$this->tdata['entry_out_of_stock'] = $this->language->get('entry_out_of_stock');
		$this->tdata['entry_out_of_stock_help'] = $this->language->get('entry_out_of_stock_help');

		$this->tdata['entry_pickup'] = $this->language->get('entry_pickup');
		$this->tdata['entry_pickup_help'] = $this->language->get('entry_pickup_help');
		$this->tdata['entry_sales_notes'] = $this->language->get('entry_sales_notes');
		$this->tdata['entry_sales_notes_help'] = $this->language->get('entry_sales_notes_help');
		$this->tdata['entry_store'] = $this->language->get('entry_store');
		$this->tdata['entry_store_help'] = $this->language->get('entry_store_help');
		$this->tdata['entry_numpictures'] = $this->language->get('entry_numpictures');
		$this->tdata['entry_numpictures_help'] = $this->language->get('entry_numpictures_help');
		$this->tdata['entry_cpa'] = $this->language->get('entry_cpa');
		$this->tdata['entry_cpa_help'] = $this->language->get('entry_cpa_help');

		$this->tdata['button_save'] = $this->language->get('button_save');
		$this->tdata['button_cancel'] = $this->language->get('button_cancel');

		$this->tdata['text_yes'] = $this->language->get('text_yes');
		$this->tdata['text_no'] = $this->language->get('text_no');
		
		$this->tdata['entry_cron_run'] = $this->language->get('entry_cron_run');
		$this->tdata['entry_cron_run_help'] = $this->language->get('entry_cron_run_help');
		$this->tdata['entry_export_url'] = $this->language->get('entry_export_url');
		$this->tdata['entry_export_url_help'] = $this->language->get('entry_export_url_help');

		//++++ Для вкладки аттрибутов ++++
		$this->tdata['tab_attributes_description'] = str_replace('%attr_url%', $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'], 'SSL'), $this->language->get('tab_attributes_description'));
		$this->tdata['entry_attributes'] = $this->language->get('entry_attributes');
		$this->tdata['entry_attributes_help'] = $this->language->get('entry_attributes_help');
		$this->tdata['entry_adult'] = $this->language->get('entry_adult');
		$this->tdata['entry_adult_help'] = $this->language->get('entry_adult_help');
		$this->tdata['entry_all_adult'] = $this->language->get('entry_all_adult');
		$this->tdata['entry_all_adult_help'] = $this->language->get('entry_all_adult_help');
		$this->tdata['entry_manufacturer_warranty'] = $this->language->get('entry_manufacturer_warranty');
		$this->tdata['entry_manufacturer_warranty_help'] = $this->language->get('entry_manufacturer_warranty_help');
		$this->tdata['entry_all_manufacturer_warranty'] = $this->language->get('entry_all_manufacturer_warranty');
		$this->tdata['entry_all_manufacturer_warranty_help'] = $this->language->get('entry_all_manufacturer_warranty_help');
		$this->tdata['entry_country_of_origin'] = $this->language->get('entry_country_of_origin');
		$this->tdata['entry_country_of_origin_help'] = $this->language->get('entry_country_of_origin_help');
		$this->tdata['entry_product_rel'] = $this->language->get('entry_product_rel');
		$this->tdata['entry_product_rel_help'] = $this->language->get('entry_product_rel_help');
		$this->tdata['entry_product_accessory'] = $this->language->get('entry_product_accessory');
		$this->tdata['entry_product_accessory_help'] = $this->language->get('entry_product_accessory_help');

		//++++ Для магазинов одежды ++++
		$this->tdata['entry_color_option'] = $this->language->get('entry_color_option');
		$this->tdata['entry_color_option_help'] = $this->language->get('entry_color_option_help');
		$this->tdata['entry_size_option'] = $this->language->get('entry_size_option');
		$this->tdata['entry_size_option_help'] = $this->language->get('entry_size_option_help');
		$this->tdata['entry_size_unit'] = $this->language->get('entry_size_unit');
		$this->tdata['entry_size_unit_help'] = $this->language->get('entry_size_unit_help');
		$this->tdata['entry_optioned_name'] = $this->language->get('entry_optioned_name');
		$this->tdata['entry_optioned_name_help'] = $this->language->get('entry_optioned_name_help');
		$this->tdata['optioned_name_no'] = $this->language->get('optioned_name_no');
		$this->tdata['optioned_name_short'] = $this->language->get('optioned_name_short');
		$this->tdata['optioned_name_long'] = $this->language->get('optioned_name_long');
		
		$this->tdata['size_units_orig'] = array(
			'RU' => 'Россия (СНГ)',
			'EU' => 'Европа',
			'UK' => 'Великобритания',
			'US' => 'США',
			'INT' => 'Международная');
		$this->tdata['size_units_type'] = array(
			'INCH' => 'Дюймы',
			'Height' => 'Рост в сантиметрах',
			'Months' => 'Возраст в месяцах',
			'Years' => 'Возраст в годах',
			'Round' => 'Окружность в сантиметрах');
			
		$this->tdata['oc_fields'] = array(
			'name' => 'Название товара',
			'model' => 'Модель',
			'sku' => 'Артикул (SKU, код производителя)',
			'upc' => 'UPC',
		);
		$this->tdata['oc_desc_fields'] = array(
			'description' => 'Описание',
			'meta_description' => 'Мета-тег &quot;Описание&quot;',
			'attr_vs_description' => 'Брать из атрибутов'
		);	
		if (version_compare(VERSION, '1.5.3.1') >= 0) {
			$this->tdata['oc_fields']['meta_keyword'] = 'Мета-тег Keywords';
			$this->tdata['oc_fields']['seo_h1'] = 'HTML-тег H1';
			$this->tdata['oc_fields']['seo_title'] = 'HTML-тег Title';
		}
		if (version_compare(VERSION, '1.5.4.1') >= 0) {
			$this->tdata['oc_fields']['ean'] = 'EAN';
			$this->tdata['oc_fields']['jan'] = 'JAN';
			$this->tdata['oc_fields']['isbn'] = 'ISBN';
			$this->tdata['oc_fields']['mpn'] = 'MPN';
		}
	}

	protected function setFormData() {
		if (isset($this->request->post['yandex_yml_status'])) {
			$this->tdata['yandex_yml_status'] = $this->request->post['yandex_yml_status'];
		} else {
			$this->tdata['yandex_yml_status'] = $this->config->get($this->CONFIG_PREFIX.'status');
		}

		if (isset($this->request->post['yandex_yml_token'])) {
			$this->tdata['yandex_yml_token'] = $this->request->post['yandex_yml_token'];
		} else {
			$this->tdata['yandex_yml_token'] = $this->config->get($this->CONFIG_PREFIX.'token');
		}
		
		if (isset($this->request->post['yandex_yml_ocstore'])) {
			$this->tdata['yandex_yml_ocstore'] = $this->request->post['yandex_yml_ocstore'];
		} else {
			$this->tdata['yandex_yml_ocstore'] = $this->config->get($this->CONFIG_PREFIX.'ocstore');
		}

		if (isset($this->request->post['yandex_yml_datamodel'])) {
			$this->tdata['yandex_yml_datamodel'] = $this->request->post['yandex_yml_datamodel'];
		} else {
			$this->tdata['yandex_yml_datamodel'] = $this->config->get($this->CONFIG_PREFIX.'datamodel');
		}
		
		if (isset($this->request->post['yandex_yml_name_field'])) {
			$this->tdata['yandex_yml_name_field'] = $this->request->post['yandex_yml_name_field'];
		} else {
			$this->tdata['yandex_yml_name_field'] = $this->config->get($this->CONFIG_PREFIX.'name_field');
		}
		if (isset($this->request->post['yandex_yml_model_field'])) {
			$this->tdata['yandex_yml_model_field'] = $this->request->post['yandex_yml_model_field'];
		} else {
			$this->tdata['yandex_yml_model_field'] = $this->config->get($this->CONFIG_PREFIX.'model_field');
		}
		if (isset($this->request->post['yandex_yml_vendorcode_field'])) {
			$this->tdata['yandex_yml_vendorcode_field'] = $this->request->post['yandex_yml_vendorcode_field'];
		} else {
			$this->tdata['yandex_yml_vendorcode_field'] = $this->config->get($this->CONFIG_PREFIX.'vendorcode_field');
		}
		if (isset($this->request->post['yandex_yml_typeprefix_field'])) {
			$this->tdata['yandex_yml_typeprefix_field'] = $this->request->post['yandex_yml_typeprefix_field'];
		} else {
			$this->tdata['yandex_yml_typeprefix_field'] = $this->config->get($this->CONFIG_PREFIX.'typeprefix_field');
		}
		if (isset($this->request->post['yandex_yml_barcode_field'])) {
			$this->tdata['yandex_yml_barcode_field'] = $this->request->post['yandex_yml_barcode_field'];
		} else {
			$this->tdata['yandex_yml_barcode_field'] = $this->config->get($this->CONFIG_PREFIX.'barcode_field');
		}
		if (isset($this->request->post['yandex_yml_keywords_field'])) {
			$this->tdata['yandex_yml_keywords_field'] = $this->request->post['yandex_yml_keywords_field'];
		} else {
			$this->tdata['yandex_yml_keywords_field'] = $this->config->get($this->CONFIG_PREFIX.'keywords_field');
		}
		if (isset($this->request->post['yandex_yml_description_field'])) {
			$this->tdata['yandex_yml_description_field'] = $this->request->post['yandex_yml_description_field'];
		} else {
			$this->tdata['yandex_yml_description_field'] = $this->config->get($this->CONFIG_PREFIX.'description_field');
		}
		
		if (isset($this->request->post['yandex_yml_export_tags'])) {
			$this->tdata['yandex_yml_export_tags'] = $this->request->post['yandex_yml_export_tags'];
		} else {
			$this->tdata['yandex_yml_export_tags'] = $this->config->get($this->CONFIG_PREFIX.'export_tags');
		}
		if (isset($this->request->post['yandex_yml_utm_label'])) {
			$this->tdata['yandex_yml_utm_label'] = $this->request->post['yandex_yml_utm_label'];
		} else {
			$this->tdata['yandex_yml_utm_label'] = $this->config->get($this->CONFIG_PREFIX.'utm_label');
		}
		
		if (isset($this->request->post['yandex_yml_delivery_cost'])) {
			$this->tdata['yandex_yml_delivery_cost'] = $this->request->post['yandex_yml_delivery_cost'];
		} else {
			$this->tdata['yandex_yml_delivery_cost'] = $this->config->get($this->CONFIG_PREFIX.'delivery_cost');
		}
		if (isset($this->request->post['yandex_yml_delivery_days'])) {
			$this->tdata['yandex_yml_delivery_days'] = $this->request->post['yandex_yml_delivery_days'];
		} else {
			$this->tdata['yandex_yml_delivery_days'] = $this->config->get($this->CONFIG_PREFIX.'delivery_days');
		}
		if (isset($this->request->post['yandex_yml_delivery_before'])) {
			$this->tdata['yandex_yml_delivery_before'] = $this->request->post['yandex_yml_delivery_before'];
		} else {
			$this->tdata['yandex_yml_delivery_before'] = $this->config->get($this->CONFIG_PREFIX.'delivery_before');
		}
		if (isset($this->request->post['yandex_yml_local_delivery'])) {
			$this->tdata['yandex_yml_local_delivery'] = $this->request->post['yandex_yml_local_delivery'];
		} else {
			$this->tdata['yandex_yml_local_delivery'] = $this->config->get($this->CONFIG_PREFIX.'local_delivery');
		}
		if (isset($this->request->post['yandex_yml_outlets'])) {
			$this->tdata['yandex_yml_outlets'] = $this->request->post['yandex_yml_outlets'];
		} else {
			$this->tdata['yandex_yml_outlets'] = $this->config->get($this->CONFIG_PREFIX.'outlets');
		}

		if (isset($this->request->post['yandex_yml_pricefrom'])) {
			$this->tdata['yandex_yml_pricefrom'] = $this->request->post['yandex_yml_pricefrom'];
		} else {
			$this->tdata['yandex_yml_pricefrom'] = $this->config->get($this->CONFIG_PREFIX.'pricefrom');
		}

		if (isset($this->request->post['yandex_yml_priceto'])) {
			$this->tdata['yandex_yml_priceto'] = $this->request->post['yandex_yml_priceto'];
		} else {
			$this->tdata['yandex_yml_priceto'] = $this->config->get($this->CONFIG_PREFIX.'priceto');
		}
		
		if (isset($this->request->post['yandex_yml_currency'])) {
			$this->tdata['yandex_yml_currency'] = $this->request->post['yandex_yml_currency'];
		} else {
			$this->tdata['yandex_yml_currency'] = $this->config->get($this->CONFIG_PREFIX.'currency');
		}

		if (isset($this->request->post['yandex_yml_oldprice'])) {
			$this->tdata['yandex_yml_oldprice'] = $this->request->post['yandex_yml_oldprice'];
		} else {
			$this->tdata['yandex_yml_oldprice'] = $this->config->get($this->CONFIG_PREFIX.'oldprice');
		}
		
		$this->load->model('customer/customer_group');
		$this->tdata['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
		if (isset($this->request->post['yandex_yml_groupprice'])) {
			$this->tdata['yandex_yml_groupprice'] = $this->request->post['yandex_yml_groupprice'];
		} else {
			$this->tdata['yandex_yml_groupprice'] = $this->config->get($this->CONFIG_PREFIX.'groupprice');
		}
		
		if (isset($this->request->post['yandex_yml_changeprice'])) {
			$this->tdata['yandex_yml_changeprice'] = $this->request->post['yandex_yml_changeprice'];
		} else {
			$this->tdata['yandex_yml_changeprice'] = $this->config->get($this->CONFIG_PREFIX.'changeprice');
		}

		if (isset($this->request->post['yandex_yml_blacklist_type'])) {
			$this->tdata['blacklist_type'] = $this->request->post['yandex_yml_blacklist_type'];
		} else {
			$this->tdata['blacklist_type'] = $this->config->get($this->CONFIG_PREFIX.'blacklist_type');
		}

		if (isset($this->request->post['yandex_yml_blacklist'])) {
			$blacklist = $this->request->post['yandex_yml_blacklist'];
		} else {
			$blacklist = explode(',', $this->config->get($this->CONFIG_PREFIX.'blacklist'));
		}
		$this->load->model('catalog/product');
		
		$this->tdata['blacklist'] = array();
		
		foreach ($blacklist as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->tdata['blacklist'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}

		if (isset($this->request->post['yandex_yml_unavailable'])) {
			$this->tdata['yandex_yml_unavailable'] = $this->request->post['yandex_yml_unavailable'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'unavailable')) {
			$this->tdata['yandex_yml_unavailable'] = $this->config->get($this->CONFIG_PREFIX.'unavailable');
		} else {
			$this->tdata['yandex_yml_unavailable'] = '';
		}

		if (isset($this->request->post['yandex_yml_in_stock'])) {
			$this->tdata['yandex_yml_in_stock'] = explode(',', $this->request->post['yandex_yml_in_stock']);
		} elseif ($this->config->get($this->CONFIG_PREFIX.'in_stock')) {
			$this->tdata['yandex_yml_in_stock'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'in_stock'));
		} else {
			$this->tdata['yandex_yml_in_stock'] = array(7);
		}

		if (isset($this->request->post['yandex_yml_out_of_stock'])) {
			$this->tdata['yandex_yml_out_of_stock'] = explode(',', $this->request->post['yandex_yml_out_of_stock']);
		} elseif ($this->config->get($this->CONFIG_PREFIX.'in_stock')) {
			$this->tdata['yandex_yml_out_of_stock'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'out_of_stock'));
		} else {
			$this->tdata['yandex_yml_out_of_stock'] = array(5);
		}

		if (isset($this->request->post['yandex_yml_pickup'])) {
			$this->tdata['yandex_yml_pickup'] = $this->request->post['yandex_yml_pickup'];
		} else {
			$this->tdata['yandex_yml_pickup'] = $this->config->get($this->CONFIG_PREFIX.'pickup');
		}

		if (isset($this->request->post['yandex_yml_sales_notes'])) {
			$this->tdata['yandex_yml_sales_notes'] = $this->request->post['yandex_yml_sales_notes'];
		} else {
			$this->tdata['yandex_yml_sales_notes'] = $this->config->get($this->CONFIG_PREFIX.'sales_notes');
		}

		if (isset($this->request->post['yandex_yml_store'])) {
			$this->tdata['yandex_yml_store'] = $this->request->post['yandex_yml_store'];
		} else {
			$this->tdata['yandex_yml_store'] = $this->config->get($this->CONFIG_PREFIX.'store');
		}
		
		if (isset($this->request->post['yandex_yml_numpictures'])) {
			$this->tdata['yandex_yml_numpictures'] = $this->request->post['yandex_yml_numpictures'];
		} else {
			$this->tdata['yandex_yml_numpictures'] = $this->config->get($this->CONFIG_PREFIX.'numpictures');
		}
		
		if (isset($this->request->post['yandex_yml_cpa'])) {
			$this->tdata['yandex_yml_cpa'] = $this->request->post['yandex_yml_cpa'];
		} else {
			$this->tdata['yandex_yml_cpa'] = $this->config->get($this->CONFIG_PREFIX.'cpa');
		}

		//++++ Для вкладки аттрибутов ++++
		if (isset($this->request->post['yandex_yml_attributes'])) {
			$this->tdata['yandex_yml_attributes'] = $this->request->post['yandex_yml_attributes'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'attributes') != '') {
			$this->tdata['yandex_yml_attributes'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'attributes'));
		} else {
			$this->tdata['yandex_yml_attributes'] = array();
		}
		if (isset($this->request->post['yandex_yml_adult'])) {
			$this->tdata['yandex_yml_adult'] = $this->request->post['yandex_yml_adult'];
		} else {
			$this->tdata['yandex_yml_adult'] = $this->config->get($this->CONFIG_PREFIX.'adult');
		}
		if (isset($this->request->post['yandex_yml_all_adult'])) {
			$this->tdata['yandex_yml_all_adult'] = $this->request->post['yandex_yml_all_adult'];
		} else {
			$this->tdata['yandex_yml_all_adult'] = $this->config->get($this->CONFIG_PREFIX.'all_adult');
		}
		
		if (isset($this->request->post['yandex_yml_manufacturer_warranty'])) {
			$this->tdata['yandex_yml_manufacturer_warranty'] = $this->request->post['yandex_yml_manufacturer_warranty'];
		} else {
			$this->tdata['yandex_yml_manufacturer_warranty'] = $this->config->get($this->CONFIG_PREFIX.'manufacturer_warranty');
		}
		if (isset($this->request->post['yandex_yml_all_manufacturer_warranty'])) {
			$this->tdata['yandex_yml_all_manufacturer_warranty'] = $this->request->post['yandex_yml_all_manufacturer_warranty'];
		} else {
			$this->tdata['yandex_yml_all_manufacturer_warranty'] = $this->config->get($this->CONFIG_PREFIX.'all_manufacturer_warranty');
		}
		
		if (isset($this->request->post['yandex_yml_country_of_origin'])) {
			$this->tdata['yandex_yml_country_of_origin'] = $this->request->post['yandex_yml_country_of_origin'];
		} else {
			$this->tdata['yandex_yml_country_of_origin'] = $this->config->get($this->CONFIG_PREFIX.'country_of_origin');
		}

		if (isset($this->request->post['yandex_yml_product_rel'])) {
			$this->tdata['yandex_yml_product_rel'] = $this->request->post['yandex_yml_product_rel'];
		} else {
			$this->tdata['yandex_yml_product_rel'] = $this->config->get($this->CONFIG_PREFIX.'product_rel');
		}
		if (isset($this->request->post['yandex_yml_product_accessory'])) {
			$this->tdata['yandex_yml_product_accessory'] = $this->request->post['yandex_yml_product_accessory'];
		} else {
			$this->tdata['yandex_yml_product_accessory'] = $this->config->get($this->CONFIG_PREFIX.'product_accessory');
		}
		
		$this->load->model('catalog/attribute');
		$results = $this->model_catalog_attribute->getAttributes(array('sort'=>'attribute_group'));
		$this->tdata['attributes'] = $results;
		//---- Для вкладки аттрибутов ----

		//++++ Для магазинов одежды ++++
		$this->load->model('catalog/option');
		$results = $this->model_catalog_option->getOptions(array('sort' => 'name'));
		$this->tdata['options'] = $results;
		
		$this->tdata['tab_tailor_description'] = $this->language->get('tab_tailor_description');

		if (isset($this->request->post['yandex_yml_color_options'])) {
			$this->tdata['yandex_yml_color_options'] = $this->request->post['yandex_yml_color_options'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'color_options') != '') {
			$this->tdata['yandex_yml_color_options'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'color_options'));
		} else {
			$this->tdata['yandex_yml_color_options'] = array();
		}
		if (isset($this->request->post['yandex_yml_size_options'])) {
			$this->tdata['yandex_yml_size_options'] = $this->request->post['yandex_yml_size_options'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'size_options') != '') {
			$this->tdata['yandex_yml_size_options'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'size_options'));
		} else {
			$this->tdata['yandex_yml_size_options'] = array();
		}
		if (isset($this->request->post['yandex_yml_size_units'])) {
			$this->tdata['yandex_yml_size_units'] = $this->request->post['yandex_yml_size_units'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'size_units') != '') {
			$this->tdata['yandex_yml_size_units'] = unserialize($this->config->get($this->CONFIG_PREFIX.'size_units'));
		} else {
			$this->tdata['yandex_yml_size_units'] = array();
		}

		if (isset($this->request->post['yandex_yml_optioned_name'])) {
			$this->tdata['yandex_yml_optioned_name'] = $this->request->post['yandex_yml_optioned_name'];
		} else {
			$this->tdata['yandex_yml_optioned_name'] = $this->config->get($this->CONFIG_PREFIX.'optioned_name');
		}
		//---- Для магазинов одежды ----

		$this->load->model('localisation/stock_status');

		$this->tdata['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		$this->load->model('catalog/category');
		$this->tdata['categories'] = $this->model_catalog_category->getCategories(0);
		
		$this->load->model('catalog/manufacturer');
		$this->tdata['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers(0);

		if (isset($this->request->post['yandex_yml_categories'])) {
			$this->tdata['yandex_yml_categories'] = $this->request->post['yandex_yml_categories'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categories') != '') {
			$this->tdata['yandex_yml_categories'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'categories'));
		} else {
			$this->tdata['yandex_yml_categories'] = array();
		}
		if (isset($this->request->post['yandex_yml_manufacturers'])) {
			$this->tdata['yandex_yml_manufacturers'] = $this->request->post['yandex_yml_manufacturers'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'manufacturers') != '') {
			$this->tdata['yandex_yml_manufacturers'] = explode(',', $this->config->get($this->CONFIG_PREFIX.'manufacturers'));
		} else {
			$this->tdata['yandex_yml_manufacturers'] = array();
		}
		if (isset($this->request->post['yandex_yml_categ_mapping'])) {
			$this->tdata['yandex_yml_categ_mapping'] = $this->request->post['yandex_yml_categ_mapping'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categ_mapping') != '') {
			$this->tdata['yandex_yml_categ_mapping'] = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_mapping'));
		} else {
			$this->tdata['yandex_yml_categ_mapping'] = array();
		}
		if (isset($this->request->post['yandex_yml_categ_delivery_cost'])) {
			$this->tdata['yandex_yml_categ_delivery_cost'] = $this->request->post['yandex_yml_categ_delivery_cost'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categ_delivery_cost') != '') {
			$this->tdata['yandex_yml_categ_delivery_cost'] = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_delivery_cost'));
		} else {
			$this->tdata['yandex_yml_categ_delivery_cost'] = array();
		}
		if (isset($this->request->post['yandex_yml_categ_cpa'])) {
			$this->tdata['yandex_yml_categ_cpa'] = $this->request->post['yandex_yml_categ_cpa'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categ_cpa') != '') {
			$this->tdata['yandex_yml_categ_cpa'] = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_cpa'));
		} else {
			$this->tdata['yandex_yml_categ_cpa'] = array();
		}
		if (isset($this->request->post['yandex_yml_categ_fee'])) {
			$this->tdata['yandex_yml_categ_fee'] = $this->request->post['yandex_yml_categ_fee'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categ_fee') != '') {
			$this->tdata['yandex_yml_categ_fee'] = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_fee'));
		} else {
			$this->tdata['yandex_yml_categ_fee'] = array();
		}
		if (isset($this->request->post['yandex_yml_categ_sales_notes'])) {
			$this->tdata['yandex_yml_categ_sales_notes'] = $this->request->post['yandex_yml_categ_sales_notes'];
		} elseif ($this->config->get($this->CONFIG_PREFIX.'categ_sales_notes') != '') {
			$this->tdata['yandex_yml_categ_sales_notes'] = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_sales_notes'));
		} else {
			$this->tdata['yandex_yml_categ_sales_notes'] = array();
		}
		
		$this->load->model('localisation/currency');
		$currencies = $this->model_localisation_currency->getCurrencies();
		$allowed_currencies = array_flip($this->allowedCurrencies);
		$this->tdata['currencies'] = array_intersect_key($currencies, $allowed_currencies);
	}
	
	public function index() {
		$this->load->language('extension/feed/yandex_yml');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate($this->request->post))) {
			$this->preparePostData();

			$this->model_setting_setting->editSetting('yandex_yml', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', 'SSL'));
		}

		$this->setLanguageData();
		$this->tdata['token'] = $this->session->data['token'];
		$this->tdata['cron_path'] = 'php '.realpath(DIR_CATALOG.'../export/yandex_yml.php');

		$this->tdata['export_url'] = HTTP_CATALOG.'export/';

		if (isset($this->error['warning'])) {
			$this->tdata['error_warning'] = $this->error['warning'];
		} else {
			$this->tdata['error_warning'] = '';
		}

		$this->tdata['action'] = $this->url->link('extension/feed/yandex_yml', 'token=' . $this->session->data['token'], 'SSL');

		$this->tdata['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', 'SSL');

		$this->tdata['data_feed'] = HTTP_CATALOG . 'index.php?route=extension/feed/yandex_yml';
		
		$this->setFormData();
		
		$template = 'extension/feed/yandex_yml.tpl';
		
		$this->tdata['header'] = $this->load->controller('common/header');
		$this->tdata['column_left'] = $this->load->controller('common/column_left');
		$this->tdata['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view($template, $this->tdata));
	}

	public function autocomplete() {
		$text = $this->request->get['text'];
		$parts = explode('/', $text);
		foreach ($parts as $key=>$val) {
			$parts[$key] = trim($val);
		}
		if (count($parts) < 2) {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1) AS text FROM oc_yandex_category WHERE level1 LIKE '".$this->db->escape($parts[0])."%' AND level2='' AND level3=''");
		}
		elseif (count($parts) < 3) {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1,'/',level2) AS text FROM oc_yandex_category WHERE level1='".$this->db->escape($parts[0])."' AND level2 LIKE '".$this->db->escape($parts[1])."%' AND level3=''");
		}
		elseif (count($parts) < 4) {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1,'/',level2,'/',level3) AS text FROM oc_yandex_category WHERE level1='".$this->db->escape($parts[0])."' AND level2='".$this->db->escape($parts[1])."' AND level3 LIKE '".$this->db->escape($parts[2])."%'");
		}
		elseif (count($parts) < 5) {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1,'/',level2,'/',level3,'/',level4) AS text FROM oc_yandex_category WHERE level1='".$this->db->escape($parts[0])."' AND level2='".$this->db->escape($parts[1])."' AND level3='".$this->db->escape($parts[2])."' AND level4 LIKE '".$this->db->escape($parts[3])."%'");
		}
		elseif (count($parts) < 6) {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1,'/',level2,'/',level3,'/',level4,'/',level5) AS text FROM oc_yandex_category WHERE level1='".$this->db->escape($parts[0])."' AND level2='".$this->db->escape($parts[1])."' AND level3='".$this->db->escape($parts[2])."' AND level4='".$this->db->escape($parts[3])."' AND level5 LIKE '".$this->db->escape($parts[4])."%'");
		}
		else {
			$q = $this->db->query("SELECT DISTINCT CONCAT(level1,'/',level2,'/',level3,'/',level4,'/',level5,'/',level6) AS text FROM oc_yandex_category WHERE level1='".$this->db->escape($parts[0])."' AND level2='".$this->db->escape($parts[1])."' AND level3='".$this->db->escape($parts[2])."' AND level4='".$this->db->escape($parts[3])."' AND level5='".$this->db->escape($parts[4])."' AND level6 LIKE '".$this->db->escape($parts[5])."%'");
		}
		$ret = array();
		foreach ($q->rows as $row) {
			$ret[] = array('label'=>$row['text']);
		}
		$this->response->addHeader('Content-Type: application/json; charset=utf-8');
		$this->response->setOutput(json_encode($ret));
	}
	
	public function install() {
		$sql_content = file_get_contents(DIR_APPLICATION.'oc_yandex_category.sql');
		foreach (explode("----", $sql_content) as $sql) {
			if ($sql) {
      			$this->db->query($sql);
    		}
  		}
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_yandex_category`;");
	}

	protected function validate($data) {
		if (!$this->user->hasPermission('modify', 'extension/feed/yandex_yml')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		/*
		elseif (!empty(array_intersect($data['yandex_yml_size_options'], $data['yandex_yml_color_options']))) {
			$this->error['warning'] = $this->language->get('error_intersects_options');
		}
		*/

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
