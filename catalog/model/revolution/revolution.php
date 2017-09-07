<?php
class ModelRevolutionRevolution extends Model {

	// Revpbest START //

	public function getBestProducts($data) {
		
		if ($this->customer->isLogged()) {
          $customer_group_id = $this->customer->getGroupId();
        } else {
          $customer_group_id = $this->config->get('config_customer_group_id');
        }
		
		$cache = md5(http_build_query($data));
        $product_data = $this->cache->get('revpbest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache);
		if (!$product_data) {
			$settings = $this->config->get('revtheme_catalog_best');
			$product_total = $settings['limit'];
			
			$product_data = array();

			$sql = "SELECT DISTINCT p.product_id FROM (SELECT p.product_id, p.sort_order, p.price, p.model, p.date_added, p.quantity > 0 as nalichie, p.price > 0 as nalichie2, 
			(SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW() ) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW() )) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, 
			(SELECT ps.price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW() ) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW() )) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special,  
			(SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, 
			COUNT(op.product_id) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT 0, " . (int)$product_total . ") p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id AND pd.language_id = '".  (int)$this->config->get('config_language_id') ."')";

			if (!empty($data['filter_buy'])) {
				$sql .= " WHERE total > '" . (int)$data['filter_buy'] . "'";
			}
			
			$sort_data = array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			);
			  
			  
			$product_settings = $this->config->get('revtheme_product_all');
			$zakaz = $product_settings['zakaz'];
			$zakaz_price_null = $product_settings['zakaz_price_null'];
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, LCASE(" . $data['sort'] . ")";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, LCASE(" . $data['sort'] . ")";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, LCASE(" . $data['sort'] . ")";
					}
				} elseif ($data['sort'] == 'p.price') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					}
				} else {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY " . $data['sort'];
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, " . $data['sort'];
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, " . $data['sort'];
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, " . $data['sort'];
					}
				}
			} else {
				if ($zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY p.sort_order";
				} else if ($zakaz && !$zakaz_price_null) {
					$sql .= " ORDER BY nalichie2 DESC, p.sort_order";
				} else if (!$zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY nalichie DESC, p.sort_order";	
				} else {
					$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, p.sort_order";
				}
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
			  $sql .= " DESC, LCASE(name) DESC";
			} else {
			  $sql .= " ASC, LCASE(name) ASC";
			}

				
			if (isset($data['start']) || isset($data['limit'])) {
			  if ($data['start'] < 0) {
				$data['start'] = 0;
			  }       

			  if ($data['limit'] < 1) {
				$data['limit'] = 20;
			  }
			
			  $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			
			$query = $this->db->query($sql);
			
			if ($query->rows) {
				$this->load->model('catalog/product');
			}
			
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}
			$setting_all_settings = $this->config->get('revtheme_all_settings');
			if ($setting_all_settings['cache_on']) {
				$this->cache->set('revpbest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $product_data);
			}
		}
		return $product_data;
	}
	
	// Revplast START //
	
	public function getLastProducts($data) {
		if ($this->customer->isLogged()) {
          $customer_group_id = $this->customer->getGroupId();
        } else {
          $customer_group_id = $this->config->get('config_customer_group_id');
        }
		
		$cache = md5(http_build_query($data));
        $product_data = $this->cache->get('revplast.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache);
		if (!$product_data) {
			$settings = $this->config->get('revtheme_catalog_last');
			$product_total = $settings['limit'];
			
			$product_data = array();

			$sql = "SELECT * FROM (SELECT p.product_id, p.sort_order, p.model, pd.name, p.quantity, p.price, p.date_added, p.quantity > 0 as nalichie, p.price > 0 as nalichie2, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW() ) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW() )) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW() ) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW() )) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') .  "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			
			if (!empty($data['filter_day'])) {
				$sql .= " AND p.date_added BETWEEN '" . $data['filter_day'] . "' AND NOW()";
			}

			$sql .= " ORDER BY p.date_added DESC LIMIT  0, " . (int)$product_total . ") p";
			

			$sort_data = array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			);

			$product_settings = $this->config->get('revtheme_product_all');
			$zakaz = $product_settings['zakaz'];
			$zakaz_price_null = $product_settings['zakaz_price_null'];
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, LCASE(" . $data['sort'] . ")";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, LCASE(" . $data['sort'] . ")";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, LCASE(" . $data['sort'] . ")";
					}
				} elseif ($data['sort'] == 'p.price') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					}
				} else {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY " . $data['sort'];
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, " . $data['sort'];
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, " . $data['sort'];
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, " . $data['sort'];
					}
				}
			} else {
				if ($zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY p.sort_order";
				} else if ($zakaz && !$zakaz_price_null) {
					$sql .= " ORDER BY nalichie2 DESC, p.sort_order";
				} else if (!$zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY nalichie DESC, p.sort_order";	
				} else {
					$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, p.sort_order";
				}
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC, LCASE(p.name) DESC";
			} else {
				$sql .= " ASC, LCASE(p.name) ASC";
			}
			
			if (isset($data['start']) || isset($data['limit'])) {
			  if ($data['start'] < 0) {
				$data['start'] = 0;
			  }       

			  if ($data['limit'] < 1) {
				$data['limit'] = 20;
			  } 
			
			  $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			  
			$query = $this->db->query($sql);
			
			if ($query->rows) {
				$this->load->model('catalog/product');
			}
			   
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}
			$setting_all_settings = $this->config->get('revtheme_all_settings');
			if ($setting_all_settings['cache_on']) {
				$this->cache->set('revplast.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $product_data);
			}
		}
		return $product_data;
	}
	
	public function updateWishlistRegister($product_id, $customer_id) {
		$this->db->query("INSERT IGNORE INTO `" . DB_PREFIX . "customer_wishlist` SET `product_id` = " . (int)$product_id . ", `customer_id` = " . (int)$customer_id . ", `date_added` = NOW()");
	}
	
	// Revpopupphone START //
	
	public function SendMail($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "revpopupphones SET name = '" . $this->db->escape($data['firstname']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', email = '" . $this->db->escape($data['email']) . "', comment = '" . $this->db->escape($data['comment']) . "', date_added = NOW()");
     	
		$this->language->load('revolution/revolution');

		$zagolovok = $this->language->get('text_mail_new_popupphone');		
		$message = $this->language->get('text_mail_firstname') . ' '  .  $this->db->escape($data['firstname']) . "\n";
		$message .= $this->language->get('text_mail_telephone') . ' '  .  $this->db->escape($data['telephone']) . "\n";
		$message .= $this->language->get('text_mail_email') . ' '  .  $this->db->escape($data['email']) . "\n";
		$message .= $this->language->get('text_mail_comment') . ' '  .  $this->db->escape($data['comment']) . "\n";
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		$mail->setTo($this->config->get('config_email'));
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($zagolovok, ENT_QUOTES, 'UTF-8'));
		$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
		$mail->send();

		if (VERSION >= 2.2) {
			$emails = explode(',', $this->config->get('config_alert_email'));
		} else {
			$emails = explode(',', $this->config->get('config_mail_alert'));
		}

		foreach ($emails as $email) {
			if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
				$mail->setTo($email);
				$mail->send();
			}
		}
		
		// Send Admins SMS if configure
		/*
		if ($this->config->get('config_sms_alert')) {
			$options = array(
				'to'       => $this->config->get('config_sms_to'),
				'copy'     => $this->config->get('config_sms_copy'),
				'from'     => $this->config->get('config_sms_from'),
				'username' => $this->config->get('config_sms_gate_username'),
				'password' => $this->config->get('config_sms_gate_password'),
				'message'  => $data['firstname'], $data['telephone']
			);

			$this->load->library('sms');

			$sms = new Sms($this->config->get('config_sms_gatename'), $options);
			$sms->send();
		}
		*/

	}
	
	// Revadditionaltabs START //
	
	public function getproducttab($product_id){
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_tab pt LEFT JOIN ".DB_PREFIX. "product_tab_desc ptd ON(pt.product_tab_id = ptd.product_tab_id) WHERE pt.product_id = '".(int)$product_id."' AND ptd.language_id = '".(int)$this->config->get('config_language_id')."' AND pt.status = 1 ORDER BY sort_order ASC");
		
		return $query->rows;
	}

	public function getproductTabs($product_id){
		$tabs_data = array();
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."tabs t LEFT JOIN ".DB_PREFIX."tabs_description td ON(t.tab_id = td.tab_id) WHERE t.status = 1 AND td.language_id = '".(int)$this->config->get('config_language_id')."' AND t.stores LIKE '%".(int)$this->config->get('config_store')."%' ORDER BY t.sort_order ASC");

		$this->load->model('catalog/product');
		$productcategorys = $this->model_catalog_product->getCategories($product_id);
		$manufacturer_info = $this->getmanufacturertabs($product_id);

		if($query->rows){
			foreach($query->rows as $row){
				$status = false;

				$ingore_products = ($row['ingore_products'] ? json_decode($row['ingore_products']) : array());
				$categories = ($row['categories'] ? json_decode($row['categories']) : array());
				$manufactures = ($row['manufactures'] ? json_decode($row['manufactures']) : array());
				$products = ($row['products'] ? json_decode($row['products']) : array());

				if($categories){
					$cquery = $this->db->query("SELECT * FROM ".DB_PREFIX."product_to_category WHERE category_id IN( ". implode(',',$categories) ." ) AND product_id = '".(int)$product_id."'");
					if($cquery->row){
					  $status = true;
					}
				}

				if(!empty($manufacturer_info['manufacturer_id'])){
					if(in_array($manufacturer_info['manufacturer_id'], $manufactures)){
					  $status = true;
					}
				}

				if(in_array($product_id, $products)){
					$status = true;
				}
				
				if($row['allproducts']){
					$status = true;
				}

				if(in_array($product_id, $ingore_products)){
					$status = false;
				}
				
				if($status){
					$tabs_data[] = array(
					  'tab_id' 		=> $row['tab_id'],
					  'title'  		=> $row['title'],
					  'description' => html_entity_decode($row['description'], ENT_QUOTES, 'UTF-8'),
					);
				}
			}
		}
		
		return $tabs_data;
	}
	
	public function getmanufacturertabs($product_id){
		return $this->db->query("SELECT manufacturer_id FROM ".DB_PREFIX."product WHERE product_id = '".(int)$product_id."'")->row;
	}
	
	// Revajaxlivesearch START //
	
	public function ajaxLiveSearch($data=array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	

		$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special"; 

		if (!empty($data['filter_category_id'])) {
				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";			

			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_category_id'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";	

			if (!empty($data['filter_filter'])) {
				$implode = array();

				$filters = explode(',', $data['filter_filter']);

				foreach ($filters as $filter_id) {
					$implode[] = (int)$filter_id;
				}

				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";				
			}
		}	

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "LCASE(pd.name) LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}

			if (!empty($data['filter_tag'])) {
				$sql .= "pd.tag LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			}

			if (!empty($data['filter_model'])) {
				$sql .= " OR LCASE(p.model) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}

			if (!empty($data['filter_sku'])) {
				$sql .= " OR LCASE(p.sku) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}	

			if (!empty($data['filter_upc'])) {
				$sql .= " OR LCASE(p.upc) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}		

			if (!empty($data['filter_ean'])) {
				$sql .= " OR LCASE(p.ean) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}

			if (!empty($data['filter_jan'])) {
				$sql .= " OR LCASE(p.jan) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}

			if (!empty($data['filter_isbn'])) {
				$sql .= " OR LCASE(p.isbn) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}		

			if (!empty($data['filter_mpn'])) {
				$sql .= " OR LCASE(p.mpn) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}
			
			if (!empty($data['filter_manufacturer'])) {
				$sql .= " OR p.manufacturer_id IN (SELECT manufacturer_id from ".DB_PREFIX."manufacturer WHERE `name` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%')";
			}
			
			$sql .= ")";
		}

		if (!empty($data['filter_manufacturer_id'])) {
			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} elseif ($data['sort'] == 'p.price') {
				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 10;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$product_data = array();

		$query = $this->db->query($sql);

		if ($query->rows) {
			$this->load->model('catalog/product');
		}
		
		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}
		
		return $product_data;
	}
	
	// Revblog START //
	
	public function getBlogCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "revblog_category c LEFT JOIN " . DB_PREFIX . "revblog_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "revblog_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}
	
	public function getBlogCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_category c LEFT JOIN " . DB_PREFIX . "revblog_category_description cd ON (c.category_id = cd.category_id)	LEFT JOIN " . DB_PREFIX . "revblog_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "'	AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.title)");
		return $query->rows;
	}
	
	public function getTotalBlogs($data = array()) {
		$sql = "SELECT COUNT(DISTINCT b.revblog_id) AS total";
		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "revblog_category_path bcp LEFT JOIN " . DB_PREFIX . "revblog_to_category b2c ON (bcp.category_id = b2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "revblog_to_category b2c";
			}
			$sql .= " LEFT JOIN " . DB_PREFIX . "revblog b ON (b2c.revblog_id = b.revblog_id)";
		} else {
			$sql .= " FROM " . DB_PREFIX . "revblog b";
		}
		$sql .= " LEFT JOIN " . DB_PREFIX . "revblog_description bd ON (b.revblog_id = bd.revblog_id) LEFT JOIN " . DB_PREFIX . "revblog_to_store b2s ON (b.revblog_id = b2s.revblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' AND b.date_available <= NOW() AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND bcp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				$sql .= " AND b2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}
		}
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	
	public function getBlog($revblog_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "revblog b LEFT JOIN " . DB_PREFIX . "revblog_description bd ON (b.revblog_id = bd.revblog_id) LEFT JOIN " . DB_PREFIX . "revblog_to_store b2s ON (b.revblog_id = b2s.revblog_id) WHERE b.revblog_id = '" . (int)$revblog_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND b.date_available <= NOW()");
		return $query->row;
	}
	
	public function getBlogs($data = array()) {	
		$sql = "SELECT b.revblog_id";
		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "revblog_category_path cp LEFT JOIN " . DB_PREFIX . "revblog_to_category b2c ON (cp.category_id = b2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "revblog_to_category b2c";
			}
				$sql .= " LEFT JOIN " . DB_PREFIX . "revblog b ON (b2c.revblog_id = b.revblog_id)";
		} else {
			$sql .= " FROM " . DB_PREFIX . "revblog b";
		}
		$sql .= " LEFT JOIN " . DB_PREFIX . "revblog_description bd ON (b.revblog_id = bd.revblog_id)	LEFT JOIN " . DB_PREFIX . "revblog_to_store b2s ON (b.revblog_id = b2s.revblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND	b.status = '1' AND b.date_available <= NOW() AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				$sql .= " AND b2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}
		}
		$sql .= " GROUP BY b.revblog_id";		
		$sort_data = array(
			'bd.title',
			'b.sort_order',
			'b.date_available',
			'b.date_added'
		);
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'bd.title' || $data['sort'] == 'b.date_added' || $data['sort'] == 'b.date_available') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY b.date_available";	
		}
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(bd.title) DESC";
		} else {
			$sql .= " ASC, LCASE(bd.title) ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
		$blog_data = array();
		foreach ($query->rows as $result) {
			$blog_data[$result['revblog_id']] = $this->getBlog($result['revblog_id']);
		}
		return $blog_data;
	}

	public function getBlogProducts($revblog_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_product bp LEFT JOIN " . DB_PREFIX . "product p ON (bp.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE bp.revblog_id = '" . (int)$revblog_id . "' AND p.date_available <= NOW() AND p.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		if ($query->rows) {
			$this->load->model('catalog/product');
		}
		$product_data = array();
		foreach ($query->rows as $result) { 
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}
		return $product_data;
	}

	public function getBlogsRelated($product_id) {
		$blog_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_product bp LEFT JOIN " . DB_PREFIX . "revblog b ON (bp.revblog_id = b.revblog_id) WHERE bp.product_id = '" . (int)$product_id . "'");
		foreach ($query->rows as $result) { 
			$blog_data[$result['revblog_id']] = $this->getInfo($result['revblog_id']);
		}
		return $blog_data;
	}
	
	public function getInfo($id) {	
		$sql = "SELECT bd.revblog_id, bd.title FROM " . DB_PREFIX . "revblog_description bd WHERE bd.language_id = " . (int)$this->config->get('config_language_id') . " AND bd.revblog_id = " .(int)$id;
		$query = $this->db->query($sql);
		$blog = $query->row;
		return $blog;
	}
	
	public function getBlogImages($revblog_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_images WHERE revblog_id = '" . (int)$revblog_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	// Revreview START //
	
	public function addReview($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '0', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");

        $review_id = $this->db->getLastId();

        if ($this->config->get('config_review_mail')) {
            $this->load->language('revolution/revreview_mail');

            $subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

            $message = $this->language->get('text_waiting') . "\n";
            $message .= sprintf($this->language->get('text_reviewer'), $this->db->escape(strip_tags($data['name']))) . "\n";
            if ($data['rating']) {
                $message .= sprintf($this->language->get('text_rating'), $this->db->escape(strip_tags($data['rating']))) . "\n";
            }
            $message .= $this->language->get('text_review') . "\n";
            $message .= $this->db->escape(strip_tags($data['text'])) . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->config->get('config_name'));
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send();

			if (VERSION >= 2.2) {
				$emails = explode(',', $this->config->get('config_alert_email'));
			} else {
				$emails = explode(',', $this->config->get('config_mail_alert'));
			}

			foreach ($emails as $email) {
				if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
        }
    }

    public function getReviews($start = 0, $limit = 20) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 20;
        }

        $query = $this->db->query("SELECT r.review_id, r.customer_id, r.author, r.rating, r.text, r.answer, r.answer_from, r.date_added FROM " . DB_PREFIX . "review r WHERE r.product_id = '0'  AND r.status = '1'  ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getModuleReviews($start = 0, $limit = 20, $order = 0) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 20;
        }
        switch ($order) {
            case 0: {
                $sql = "ORDER BY date_added  DESC LIMIT " . (int)$start . "," . (int)$limit;
                break;
            }
            case 1: {
                $sql = "ORDER BY RAND() DESC LIMIT " . (int)$start . "," . (int)$limit;
                break;
            }
            default: {
                $sql = "ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit;
            }
        }

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review WHERE product_id = '0'  AND status = '1'  " . $sql);

        return $query->rows;
    }

    public function getTotalReviews() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r WHERE r.product_id = '0' AND r.status = '1'");

        return $query->row['total'];
    }
	
	// Revslider START //
	
	public function getProducts($data = array()) {
        $customer_group_id = $this->config->get('config_customer_group_id');
        $cache = md5(http_build_query($data));

        $product_data = $this->cache->get('revslider_catproducts.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache);

        if (!$product_data) {
            $sql = "SELECT p.product_id, p.quantity > 0 as nalichie, p.price > 0 as nalichie2, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) WHERE o.order_status_id > '0' AND op.product_id = p.product_id GROUP BY op.product_id) as topsellers FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";

            if (!empty($data['filter_category_id'])) {
                $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
            }
            
            $sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";     
            
            if (!empty($data['filter_category_id'])) {
                if (!empty($data['filter_sub_category'])) {
                    $implode_data = array();
                    $implode_data[] = "p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
                    
                    $this->load->model('catalog/category');
                    
                    $categories = $this->getCategoriesByParentId($data['filter_category_id']);            
                    foreach ($categories as $category_id) {
                        $implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
                    }
                                
                    $sql .= " AND (" . implode(' OR ', $implode_data) . ")";            
                } else {
                    $sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
                }
            }
            
            if (!empty($data['filter_manufacturer_id'])) {
                $sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
            }
            
            $sql .= " GROUP BY p.product_id";
            
            if ($data['sort'] == 'special') {
                $sql .= " HAVING special IS NOT NULL";
            }

            if ($data['sort'] == 'topsellers') {
                $sql .= " HAVING topsellers IS NOT NULL";
            }

            $sort_data = array(
                'p.date_added',
                'special',
                'topsellers',
                'rating',
                'p.price',
                'p.viewed',
                'p.sort_order'
            );
            
            $product_settings = $this->config->get('revtheme_product_all');
			$zakaz = $product_settings['zakaz'];
			$zakaz_price_null = $product_settings['zakaz_price_null'];
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, LCASE(" . $data['sort'] . ")";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, LCASE(" . $data['sort'] . ")";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, LCASE(" . $data['sort'] . ")";
					}
				} elseif ($data['sort'] == 'p.price') {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
					}
				} else {
					if ($zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY " . $data['sort'];
					} else if ($zakaz && !$zakaz_price_null) {
						$sql .= " ORDER BY nalichie2 DESC, " . $data['sort'];
					} else if (!$zakaz && $zakaz_price_null) {
						$sql .= " ORDER BY nalichie DESC, " . $data['sort'];
					} else {
						$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, " . $data['sort'];
					}
				}
			} else {
				if ($zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY p.sort_order";
				} else if ($zakaz && !$zakaz_price_null) {
					$sql .= " ORDER BY nalichie2 DESC, p.sort_order";
				} else if (!$zakaz && $zakaz_price_null) {
					$sql .= " ORDER BY nalichie DESC, p.sort_order";	
				} else {
					$sql .= " ORDER BY nalichie2 DESC, nalichie DESC, p.sort_order";
				}
			}
                
            if ($data['order'] == 'ASC') {
                $sql .= " ASC";
            } else {
                $sql .= " DESC";
            }
            
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }
                    
            
            $sql .= " LIMIT " . (int)$data['limit'];

            $product_data = array();
            $query = $this->db->query($sql);

			if ($query->rows) {
				$this->load->model('catalog/product');
			}
            foreach ($query->rows as $result) {
                $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
            }
            $setting_all_settings = $this->config->get('revtheme_all_settings');
			if ($setting_all_settings['cache_on']) {
				$this->cache->set('revslider_catproducts.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $product_data);
			}
        }
        return $product_data;    
    }
    
    public function getCategoriesByParentId($category_id) {
        $category_data = array();
        $category_query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "category WHERE parent_id = '" . (int)$category_id . "'");

        foreach ($category_query->rows as $category) {
            $category_data[] = $category['category_id'];
            $children = $this->getCategoriesByParentId($category['category_id']);

            if ($children) {
                $category_data = array_merge($children, $category_data);
            }            
        }

        return $category_data;
    }
	
	public function getAttrText($product_id) {
		$options = $this->config->get('revtheme_cat_attributes');
		$text = '';
		$this->load->model('catalog/product');
		$this->load->language('revolution/revolution');
		$attribute_groups = $this->model_catalog_product->getProductAttributes($product_id);
		$show_attributes_name  = isset($options['show_name']) ? $options['show_name'] : 0; 
		$show_attributes_tags = isset($options['show_tags']) ? $options['show_tags'] : 0;
		$attributes_count = isset($options['count']) ? $options['count'] : 0;
		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$separator = isset($options['separator']) ? $options['separator'] : '/';
			$separator = html_entity_decode($separator, ENT_QUOTES, 'UTF-8');
			if ($options['model']) {
				if ($product_info['model']) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_model') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right pr_model_' . $product_info['product_id'] . '">' . $product_info['model'] . '</span><br>';
					} else {
						$text .= $this->language->get('text_model') . ' <span class="pr_model_' . $product_info['product_id'] . '">' . $product_info['model'] . '</span>' . $separator;
					}
				} else {
					$text .= '<span class="hidden pr_model_' . $product_info['product_id'] . '">' . $product_info['model'] . '</span>';
				}
			}		
			if ($options['sku']) {
				if ($product_info['sku']) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_product_artikul') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . $product_info['sku'] . '</span><br>';
					} else {
						$text .= $this->language->get('text_product_artikul') . ' ' . $product_info['sku'] . $separator;
					}	
				}
			}
			if ($options['stock']) {
				if ($product_info['quantity'] <= 0) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_stock') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . $product_info['stock_status'] . '</span><br>';
					} else {
						$text .= $this->language->get('text_stock') . ' ' . $product_info['stock_status'] . $separator;
					}
					$text .= '<span class="hidden pr_quantity_' . $product_info['product_id'] . '">' . $product_info['quantity'] . '</span>';					
				} elseif ($this->config->get('config_stock_display')) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_stock') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . '<span class="pr_quantity_' . $product_info['product_id'] . '">' . $product_info['quantity'] . '</span> ' . $this->language->get('text_shtuki') . '</span><br>';
					} else {
						$text .= $this->language->get('text_stock') . ' <span class="pr_quantity_' . $product_info['product_id'] . '">' . $product_info['quantity'] . '</span> ' . $this->language->get('text_shtuki') . $separator;
					}	
				} else {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_stock') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . $this->language->get('text_instock') . '</span><br>';
					} else {
						$text .= $this->language->get('text_stock') . ' ' . $this->language->get('text_instock') . $separator;
					}
					$text .= '<span class="hidden pr_quantity_' . $product_info['product_id'] . '">' . $product_info['quantity'] . '</span>';
				}
			} else {
				$text .= '<span class="hidden pr_quantity_' . $product_info['product_id'] . '">' . $product_info['quantity'] . '</span>';
			}
			if ($options['length']) {
				if ($product_info['length'] > 0) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_product_razmers2') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . number_format($product_info['length'], 2) . ' х ' . number_format($product_info['width'], 2) . ' х ' . number_format($product_info['height'], 2) . ' ' . $this->length->getUnit($product_info['length_class_id']) . '</span><br>';
					} else {
						$text .= $this->language->get('text_product_razmers2') . ' ' . number_format($product_info['length'], 2) . ' х ' . number_format($product_info['width'], 2) . ' х ' . number_format($product_info['height'], 2) . ' ' . $this->length->getUnit($product_info['length_class_id']) . $separator;
					}
				}
			}
			if ($options['weight']) {
				if ($product_info['weight'] > 0) {
					if ($show_attributes_tags) {
						$text .= '<span class="dotted-line_left"><span class="dotted-line_title">' . $this->language->get('text_product_ves') . '</span><span class="dotted-line_line"></span></span><span class="dotted-line_right"><span class=pr_weight_' . $product_info['product_id'] . ' data-weight=' . number_format($product_info['weight'], 2) . '>' . number_format($product_info['weight'], 2) . '</span> ' . $this->weight->getUnit($product_info['weight_class_id']) . '</span><br>';
					} else {
						$text .= $this->language->get('text_product_ves') . ' <span class=pr_weight_' . $product_info['product_id'] . ' data-weight=' . number_format($product_info['weight'], 2) . '>' . number_format($product_info['weight'], 2) . '</span> ' . $this->weight->getUnit($product_info['weight_class_id']) . $separator;
					}
				}
			}
		}
		$attr_arr = array();
		$attributes_text_length = '';
		foreach ($attribute_groups as $group) {
			foreach ($group['attribute'] as $attribute) {
				if (isset($options['attributes'][$attribute['attribute_id']])) {
					$attribute_text = '';
					$attribute_text_length = 0;
					if ($options['attributes'][$attribute['attribute_id']]['show'] == 1) {
						$attribute_text = $attribute['text'];
					} else if ($options['attributes'][$attribute['attribute_id']]['show'] == 2 && !$show_attributes_name && in_array($attribute['text'], explode(',', $options['attributes'][$attribute['attribute_id']]['replace']))) {
						$attribute_text = $attribute['name'];
					} else {
						$attribute_text = '';
					}
					if ($attribute_text) {					
						$attribute_text_length = strlen($attribute_text);
						if ($show_attributes_name) {
							$attribute_text_length += strlen($attribute['name']) + 2; // 2 - ': '
							if ($show_attributes_tags) {
								$attribute_text = '<span class="dotted-line_left"><span class="dotted-line_title">' . $attribute['name'] . ':</span><span class="dotted-line_line"></span></span><span class="dotted-line_right">' . $attribute_text . '</span>';
							}
							else {
								$attribute_text = $attribute['name'] . ': ' . $attribute_text;
							}
						}                 
						$attr_arr[] = $attribute_text;
						if ($attributes_count) {
							if (count($attr_arr) >= $attributes_count) {
								break 2;
							}
						}
					}
				}
			}  
		}	
		if ($attr_arr) {
			$separator = isset($options['separator']) ? $options['separator'] : "/";
			$separator = html_entity_decode($separator, ENT_QUOTES, 'UTF-8');
			$text .= implode($attr_arr, $separator);
		}		
		return $text;    
	}
	
	public function getProductSpecialData($product_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}
		$query = $this->db->query("SELECT `price`, `date_end` FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
		if ($query->num_rows) {
			return $query->row;
		} else {
			return FALSE;
		}
	}

}