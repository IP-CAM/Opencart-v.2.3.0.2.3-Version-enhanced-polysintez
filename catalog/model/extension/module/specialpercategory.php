<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelExtensionModuleSpecialpercategory extends Model {

	
	 public function getSpecialPerCategories($data = array(), $category_id = null, $manufacturer_id = null) {
	 
		if (isset($data['limit'])) {
	
			$limit=(int)$data['limit'];
			
			
		if ($this->customer->isLogged()) {


		$customer_group_id = $this->customer->getGroupId();


		} else {


			$customer_group_id = $this->config->get('config_customer_group_id');


		}	
	
		
	
		
		$product_data = $this->cache->get('product.specialpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''));

		
		if (!$product_data) { 


			$product_data = array();
		


		$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)"; 
		
		if ($category_id) {

            $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (ps.product_id = p2c.product_id) ";

          }
		  
		if ($manufacturer_id) {

            $sql .= " LEFT JOIN " . DB_PREFIX . "product pm ON (ps.product_id = pm.product_id) ";

          }

		$sql .= "WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
   

         if ($category_id) {
		 
               $sql .= " AND p2c.category_id = '" . (int)$category_id . "' ";
			}
	    
         if ($manufacturer_id) {

               $sql .= " AND pm.manufacturer_id = '" . (int)$manufacturer_id . "' ";
			}
   
		$sql .= "AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";		
		

		$sql .= " ORDER BY p.sort_order ASC  LIMIT " . $limit;	

		$product_data = array();

		$query = $this->db->query($sql);
	
		$this->load->model('catalog/product');

		foreach ($query->rows as $result) { 	
	
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);

			}
			
			
		$this->cache->set('product.specialpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''), $product_data);

		}

		return $product_data;

	}
	
	}

}

?>