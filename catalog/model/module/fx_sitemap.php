<?php
class ModelModuleFXSitemap extends Model{
    
	public function getProducts($data = array()) {

		$query = $this->db->query("SELECT product_id, date_added, date_modified FROM " . DB_PREFIX . "product WHERE status = '1' LIMIT ".(int)$data['start'].", ".(int)$data['limit']);
	
		return $query->rows;
	}	
	
	public function getProductsTotal($data = array()) {

		$query = $this->db->query("SELECT COUNT(product_id) AS total FROM " . DB_PREFIX . "product WHERE status = '1'");
	
		return $query->row['total'];
	}
	
	public function getProductsExpress($data = array()) {

		$query = $this->db->query("SELECT u.keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "url_alias u ON (u.query = CONCAT('product_id=', p.product_id))  WHERE status = '1' LIMIT ".(int)$data['start'].", ".(int)$data['limit']);
	
		return $query->rows;
	}
/*-------------------------------------------------------*/	
	public function getCategories() {
		$query = $this->db->query("SELECT category_id, date_added, date_modified FROM " . DB_PREFIX . "category WHERE status = '1'");

		return $query->rows;
	}
	
	public function getCategoriesTotal() {
		$query = $this->db->query("SELECT COUNT(category_id) AS total FROM " . DB_PREFIX . "category WHERE status = '1'");

		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
	
	public function getManufacturers() {
		
		$query = $this->db->query("SELECT manufacturer_id FROM " . DB_PREFIX . "manufacturer");
		
		return $query->rows;
	}

	public function getManufacturersTotal() {
		
		$query = $this->db->query("SELECT COUNT(manufacturer_id) AS total FROM " . DB_PREFIX . "manufacturer");
		
		return $query->row['total'];
	}

/*-------------------------------------------------------*/		
	public function getAllNews() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "news'");
		if($test->num_rows < 1) {return Array();}
		
		$test = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "news LIKE 'status'");
		$status = $test->num_rows < 1 ? "" : " WHERE status = '1'";
	
		$query = $this->db->query("SELECT news_id FROM " . DB_PREFIX . "news " . $status);	
		return $query->rows;
	}
	
	public function getAllNewsTotal() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "news'");
		if($test->num_rows < 1) {return 0;}
		
		$test = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "news LIKE 'status'");
		$status = $test->num_rows < 1 ? "" : " WHERE status = '1'";
	
		$query = $this->db->query("SELECT COUNT(news_id) AS total FROM " . DB_PREFIX . "news " . $status);	
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
	
	public function getAllBlog() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "blog'");
		if($test->num_rows < 1) {return Array();}
		
		$test = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "blog LIKE 'status'");
		$status = $test->num_rows < 1 ? "" : " WHERE status = '1'";
		
		$query = $this->db->query("SELECT blog_id FROM " . DB_PREFIX . "blog " . $status);
		return $query->rows;
	}
	
	public function getAllBlogTotal() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "blog'");
		if($test->num_rows < 1) {return 0;}
		
		$test = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "blog LIKE 'status'");
		$status = $test->num_rows < 1 ? "" : " WHERE status = '1'";
		
		$query = $this->db->query("SELECT COUNT(blog_id) AS total FROM " . DB_PREFIX . "blog " . $status);
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
	
	public function getMFP() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "mfilter_url_alias'");
		if($test->num_rows < 1) {return Array();}
		
		$query = $this->db->query("SELECT path, alias FROM " . DB_PREFIX . "mfilter_url_alias");
		return $query->rows;
	}
	
	public function getMFPTotal() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "mfilter_url_alias'");
		if($test->num_rows < 1) {return 0;}
		
		$query = $this->db->query("SELECT COUNT(path) AS total FROM " . DB_PREFIX . "mfilter_url_alias");
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
	
	public function getOCFilter() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "ocfilter_page'");
		if($test->num_rows < 1) {return Array();}
		
		$query = $this->db->query("SELECT category_id, keyword FROM " . DB_PREFIX . "ocfilter_page WHERE status = '1'");
		return $query->rows;
	}
	
	public function getOCFilterTotal() {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "ocfilter_page'");
		if($test->num_rows < 1) {return 0;}
		
		$query = $this->db->query("SELECT COUNT(keyword) AS total FROM " . DB_PREFIX . "ocfilter_page WHERE status = '1'");
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
	
	public function getInformations() {
		
		$query = $this->db->query("SELECT information_id FROM " . DB_PREFIX . "information WHERE status = '1'");
		
		return $query->rows;
	}
	
	public function getInformationsTotal() {
		
		$query = $this->db->query("SELECT COUNT(information_id) AS total FROM " . DB_PREFIX . "information WHERE status = '1'");
		
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
    
	public function getCMSBlog($data = array()) {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "record'");
		if($test->num_rows < 1) {return Array();}

		$query = $this->db->query("SELECT record_id, date_modified FROM " . DB_PREFIX . "record WHERE status = '1' AND index_page NOT LIKE '%noindex%'");
	
		return $query->rows;
	}	
	
	public function getCMSBlogTotal($data = array()) {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "record'");
		if($test->num_rows < 1) {return 0;}

		$query = $this->db->query("SELECT COUNT(record_id) AS total FROM " . DB_PREFIX . "record WHERE status = '1' AND index_page NOT LIKE '%noindex%'");
	
		return $query->row['total'];
	}
/*-------------------------------------------------------*/	
    
	public function getArticles($data = array()) {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "article'");
		if($test->num_rows < 1) {return Array();}

		$query = $this->db->query("SELECT article_id FROM " . DB_PREFIX . "article WHERE status = '1'");
	
		return $query->rows;
	}	
	
	public function getArticlesTotal($data = array()) {
		$test = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "article'");
		if($test->num_rows < 1) {return 0;}

		$query = $this->db->query("SELECT COUNT(article_id) AS total FROM " . DB_PREFIX . "article WHERE status = '1'");
	
		return $query->row['total'];
	}
}
?>