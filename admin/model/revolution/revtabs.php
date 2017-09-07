<?php
class ModelRevolutionRevtabs extends Model {
	public function addtabs($data){
		$this->event->trigger('pre.admin.tabs.add', $data);
		
		if(!empty($data['tabs_product'])){
			$data['tabs_product'] = json_encode($data['tabs_product']);
		}else{
			$data['tabs_product'] = '';
		}
		
		if(!empty($data['tabs_category'])){
			$data['tabs_category'] = json_encode($data['tabs_category']);
		}else{
			$data['tabs_category'] = '';
		}
		
		if(!empty($data['tabs_manufacturer'])){
			$data['tabs_manufacturer'] = json_encode($data['tabs_manufacturer']);
		}else{
			$data['tabs_manufacturer'] = '';
		}
		
		if(!empty($data['tabs_ingore_product'])){
			$data['tabs_ingore_product'] = json_encode($data['tabs_ingore_product']);
		}else{
			$data['tabs_ingore_product'] = '';
		}
		
		if(!empty($data['tabs_store'])){
			$data['tabs_store'] = json_encode($data['tabs_store']);
		}else{
			$data['tabs_store'] = '';
		}
		
		if(!isset($data['allproducts'])){
			$data['allproducts'] = 0;
		}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "tabs SET sort_order = '" . (int)$data['sort_order'] . "', status = '".(int)$data['status']."', products = '".$data['tabs_product']."', categories = '".$data['tabs_category']."', manufactures = '".$data['tabs_manufacturer']."', ingore_products = '".$data['tabs_ingore_product']."',stores = '".$data['tabs_store']."', allproducts = '".(int)$data['allproducts']."', date_added = NOW()");
		
		$tab_id = $this->db->getLastId();
		
		foreach($data['tabs_description'] as $language_id => $value){
			$this->db->query("INSERT INTO " . DB_PREFIX . "tabs_description SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->event->trigger('post.admin.tabs.add', $tab_id);

		return $tab_id;
	}
	
	public function edittabs($tab_id, $data){
		$this->event->trigger('pre.admin.tabs.edit', $data);

		if(!empty($data['tabs_product'])){
			$data['tabs_product'] = json_encode($data['tabs_product']);
		}else{
			$data['tabs_product'] = '';
		}
		
		if(!empty($data['tabs_category'])){
			$data['tabs_category'] = json_encode($data['tabs_category']);
		}else{
			$data['tabs_category'] = '';
		}
		
		if(!empty($data['tabs_manufacturer'])){
			$data['tabs_manufacturer'] = json_encode($data['tabs_manufacturer']);
		}else{
			$data['tabs_manufacturer'] = '';
		}
		
		if(!empty($data['tabs_ingore_product'])){
			$data['tabs_ingore_product'] = json_encode($data['tabs_ingore_product']);
		}else{
			$data['tabs_ingore_product'] = '';
		}
		
		if(!empty($data['tabs_store'])){
			$data['tabs_store'] = json_encode($data['tabs_store']);
		}else{
			$data['tabs_store'] = '';
		}
		
		if(!isset($data['allproducts'])){
			$data['allproducts'] = 0;
		}
		
		$this->db->query("UPDATE " . DB_PREFIX . "tabs SET sort_order = '" . (int)$data['sort_order'] . "', status = '".(int)$data['status']."', products = '".$data['tabs_product']."', categories = '".$data['tabs_category']."', manufactures = '".$data['tabs_manufacturer']."', ingore_products = '".$data['tabs_ingore_product']."',stores = '".$data['tabs_store']."',allproducts = '".(int)$data['allproducts']."' WHERE tab_id = '".(int)$tab_id."'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "tabs_description WHERE tab_id = '" . (int)$tab_id . "'");
		
		foreach($data['tabs_description'] as $language_id => $value){
			$this->db->query("INSERT INTO " . DB_PREFIX . "tabs_description SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->cache->delete('tabs');

		$this->event->trigger('post.admin.tabs.edit', $tabs_id);
	}
	
	public function deletetabs($tab_id) {
		$this->event->trigger('pre.admin.tabs.delete', $tab_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "tabs WHERE tab_id = '" . (int)$tab_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "tabs_description WHERE tab_id = '" . (int)$tab_id . "'");
		
		$this->event->trigger('post.admin.tabs.delete', $tab_id);
	}
	
	public function gettabs($tab_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tabs WHERE tab_id = '" . (int)$tab_id . "'");

		return $query->row;
	}
	
	public function gettabss($data = array()){

		$sql = "SELECT * FROM " . DB_PREFIX . "tabs t LEFT JOIN ".DB_PREFIX."tabs_description td ON(t.tab_id = td.tab_id) WHERE td.language_id = '".$this->config->get('config_language_id')."'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND td.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND t.status = '" . (int)$data['filter_status'] . "'";
		}

		$sort_data = array(
			'td.title',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY td.title";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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

		return $query->rows;
	}
	
	public function getTabsDescriptions($tab_id) {
		$category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tabs_description WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['title'],
				'description'      => $result['description']
			);
		}

		return $category_description_data;
	}
	
	public function getTotaltabss() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tabs");

		return $query->row['total'];
	}
}