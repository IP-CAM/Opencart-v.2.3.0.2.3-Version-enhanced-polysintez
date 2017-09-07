<?php// *	@copyright	OPENCART.PRO 2011 - 2016.// *	@forum	http://forum.opencart.pro// *	@source		See SOURCE.txt for source and other copyright.// *	@license	GNU General Public License version 3; see LICENSE.txt
class ModelExtensionModuleBestsellerPerCategory extends Model {
	public function getBestSellerProductsPerCategory($limit, $category_id = null, $manufacturer_id = null) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
				
		$product_data = $this->cache->get('product.bestsellerpercategory.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''));

		if (!$product_data) { 
			$product_data = array();
			
			$sql = "SELECT op.product_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id)";			            if ($category_id) {                $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";								$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW()";				  				$sql .= " AND p2c.category_id = '" . (int)$category_id . "' ";				            } elseif ($manufacturer_id) {				$sql .= " LEFT JOIN " . DB_PREFIX . "product pm ON (p.product_id = pm.product_id)";									$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW()";							$sql .= " AND p.manufacturer_id = '" . (int)$manufacturer_id . "'";						} else {							$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW()";						}            $sql .= " AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int)$limit;            $query = $this->db->query($sql);
						$this->load->model('catalog/product');
			foreach ($query->rows as $result) { 		
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}
			$this->cache->set('product.bestsellerpercategory.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''), $product_data);

		}
		return $product_data;
	}
	
}
?>