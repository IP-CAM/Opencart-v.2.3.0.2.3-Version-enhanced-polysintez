<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelExtensionModuleManufacturerpercategory extends Model {
	
	public function getManufacturersByCategory($category_id) {
		

			$sql = "	SELECT DISTINCT m.manufacturer_id, m.name, m.image FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (m.manufacturer_id = p.manufacturer_id) LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON (p.product_id= p2c.product_id)";
			$sql .= "	LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '0' AND category_id = ". (int)$category_id . " AND md.language_id = '1' GROUP BY m.manufacturer_id ORDER BY m.name ASC";
			
		    
            $query = $this->db->query($sql);

			
			return $query->rows;
			
			
	
	}	
}
?>