<?php
class ModelModuleSeoPageSitemap extends Model{
    
	public function getProducts($data = array()) {

		$query = $this->db->query("SELECT product_id, date_added, date_modified FROM " . DB_PREFIX . "product WHERE status = '1' LIMIT ".(int)$data['start'].", ".(int)$data['limit']);
	
		return $query->rows;
	}
	
	public function getProductsExpress($data = array()) {

		$query = $this->db->query("SELECT u.keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "url_alias u ON (u.query = CONCAT('product_id=', p.product_id))  WHERE status = '1' LIMIT ".(int)$data['start'].", ".(int)$data['limit']);
	
		return $query->rows;
	}
	
	public function getCategories() {
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "category WHERE status != '1'");

		return $query->rows;
	}
	
	public function getManufacturers() {
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer");
		
		return $query->rows;
	}
	
	public function getCategoriesTotal() {

		$query = $this->db->query("SELECT COUNT(*) FROM " . DB_PREFIX . "category WHERE status = '1'");
	
		return $query->rows;
	}
	
	public function getAllNews() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "news'");
		if($test->num_rows < 1) {return Array();}
	
		$query = $this->db->query("SELECT news_id FROM " . DB_PREFIX . "news WHERE status = '1'");	
		return $query->rows;
	}
	
	public function getAllBlog() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "blog'");
		if($test->num_rows < 1) {return Array();}
		
		$query = $this->db->query("SELECT blog_id FROM " . DB_PREFIX . "blog WHERE status = '1'");
		return $query->rows;
	}
	
	public function getMFP() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "mfilter_url_alias'");
		if($test->num_rows < 1) {return Array();}
		
		$query = $this->db->query("SELECT path, alias FROM " . DB_PREFIX . "mfilter_url_alias");
		return $query->rows;
	}
	
	public function getInformations() {
		
		$query = $this->db->query("SELECT information_id FROM " . DB_PREFIX . "information WHERE status = '1'");
		
		return $query->rows;
	}
	
}
?>