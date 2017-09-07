<?php
class ModelRevolutionRevblog extends Model {
	public function addBlog($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "revblog SET sort_order = '" . (int)$data['sort_order'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$revblog_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog SET image = '" . $this->db->escape($data['image']) . "' WHERE revblog_id = '" . (int)$revblog_id . "'");
		}

		foreach ($data['revblog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_description SET revblog_id = '" . (int)$revblog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', title_pr = '" . $this->db->escape($value['title_pr']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}
		
		if (isset($data['blog_category'])) {
			foreach ($data['blog_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_category SET revblog_id = '" . (int)$revblog_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['main_category_id'])) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "' AND category_id = '" . (int)$data['main_category_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_category SET revblog_id = '" . (int)$revblog_id . "', category_id = '" . (int)$data['main_category_id'] . "', main_category = 1");
		} else if (isset($data['blog_category'][0])) {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog_to_category SET main_category = 1 WHERE revblog_id = '" . (int)$revblog_id . "' AND category_id = '" . (int)$data['blog_category'][0] . "'");
		}

		if (isset($data['blog_store'])) {
			foreach ($data['blog_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_store SET revblog_id = '" . (int)$revblog_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['blog_layout'])) {
			foreach ($data['blog_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_layout SET revblog_id = '" . (int)$revblog_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if (isset($data['blog_product'])) {
			foreach ($data['blog_product'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_product WHERE revblog_id = '" . (int)$revblog_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_product SET revblog_id = '" . (int)$revblog_id . "', product_id = '" . (int)$product_id . "'");
			}
		}
		
		if (isset($data['blog_image'])) {
			foreach ($data['blog_image'] as $blog_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_images SET revblog_id = '" . (int)$revblog_id . "', image = '" . $this->db->escape($blog_image['image']) . "', sort_order = '" . (int)$blog_image['sort_order'] . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'revblog_id=" . (int)$revblog_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('revblog');

		return $revblog_id;
	}
	
	public function addBlogCategory($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category SET parent_id = '" . (int)$data['parent_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_added = NOW(), date_modified = NOW()");

		$category_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog_category SET image = '" . $this->db->escape($data['image']) . "' WHERE category_id = '" . (int)$category_id . "'");
		}

		foreach ($data['revblog_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$level = 0;
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY `level` ASC");

		foreach ($query->rows as $result) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "revblog_category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', `level` = '" . (int)$level . "'");
			$level++;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "revblog_category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', `level` = '" . (int)$level . "'");

		if (isset($data['blog_category_store'])) {
			foreach ($data['blog_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_to_store SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['blog_category_layout'])) {
			foreach ($data['blog_category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_to_layout SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'revblog_category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('revblog_category');

		return $category_id;
	}

	public function editBlog($revblog_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "revblog SET sort_order = '" . (int)$data['sort_order'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog SET image = '" . $this->db->escape($data['image']) . "' WHERE revblog_id = '" . (int)$revblog_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_description WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($data['revblog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_description SET revblog_id = '" . (int)$revblog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', title_pr = '" . $this->db->escape($value['title_pr']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['blog_category'])) {
			foreach ($data['blog_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_category SET revblog_id = '" . (int)$revblog_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['main_category_id'])) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "' AND category_id = '" . (int)$data['main_category_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_category SET revblog_id = '" . (int)$revblog_id . "', category_id = '" . (int)$data['main_category_id'] . "', main_category = 1");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog_to_category SET main_category = 1 WHERE revblog_id = '" . (int)$revblog_id . "' AND category_id = '" . (int)$data['blog_category'][0] . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_store WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['blog_store'])) {
			foreach ($data['blog_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_store SET revblog_id = '" . (int)$revblog_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_layout WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['blog_layout'])) {
			foreach ($data['blog_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_to_layout SET revblog_id = '" . (int)$revblog_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_product WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['blog_product'])) {
			foreach ($data['blog_product'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_product WHERE revblog_id = '" . (int)$revblog_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_product SET revblog_id = '" . (int)$revblog_id . "', product_id = '" . (int)$product_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_images WHERE revblog_id = '" . (int)$revblog_id . "'");

		if (isset($data['blog_image'])) {
			foreach ($data['blog_image'] as $blog_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_images SET revblog_id = '" . (int)$revblog_id . "', image = '" . $this->db->escape($blog_image['image']) . "', sort_order = '" . (int)$blog_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_id=" . (int)$revblog_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'revblog_id=" . (int)$revblog_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('revblog');
	}
	
	public function editBlogCategory($category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "revblog_category SET parent_id = '" . (int)$data['parent_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE category_id = '" . (int)$category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "revblog_category SET image = '" . $this->db->escape($data['image']) . "' WHERE category_id = '" . (int)$category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_description WHERE category_id = '" . (int)$category_id . "'");

		foreach ($data['revblog_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}
		
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "revblog_category_path` WHERE path_id = '" . (int)$category_id . "' ORDER BY level ASC");
		if ($query->rows) {
			foreach ($query->rows as $category_path) {
				$this->db->query("DELETE FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' AND level < '" . (int)$category_path['level'] . "'");
				$path = array();
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");
				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' ORDER BY level ASC");
				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}
				$level = 0;
				foreach ($path as $path_id) {
					$this->db->query("REPLACE INTO `" . DB_PREFIX . "revblog_category_path` SET category_id = '" . (int)$category_path['category_id'] . "', `path_id` = '" . (int)$path_id . "', level = '" . (int)$level . "'");
					$level++;
				}
			}
		} else {
			$this->db->query("DELETE FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$category_id . "'");
			$level = 0;
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "revblog_category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");
			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "revblog_category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");
				$level++;
			}
			$this->db->query("REPLACE INTO `" . DB_PREFIX . "revblog_category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', level = '" . (int)$level . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_to_store WHERE category_id = '" . (int)$category_id . "'");

		if (isset($data['blog_category_store'])) {
			foreach ($data['blog_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_to_store SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_to_layout WHERE category_id = '" . (int)$category_id . "'");

		if (isset($data['blog_category_layout'])) {
			foreach ($data['blog_category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "revblog_category_to_layout SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_category_id=" . (int)$category_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'revblog_category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('revblog_category');
	}

	public function deleteBlog($revblog_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_description WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_store WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_product WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_images WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_layout WHERE revblog_id = '" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_id=" . (int)$revblog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "'");

		$this->cache->delete('revblog');
	}
	
	public function deleteBlogCategory($category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_path WHERE category_id = '" . (int)$category_id . "'");
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_category_path WHERE path_id = '" . (int)$category_id . "'");
		foreach ($query->rows as $result) {
			$this->deleteBlogCategory($result['category_id']);
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category WHERE category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_description WHERE category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_to_store WHERE category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "revblog_category_to_layout WHERE category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_category_id=" . (int)$category_id . "'");

		$this->cache->delete('revblog_category');
	}

	public function getBlog($revblog_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_id=" . (int)$revblog_id . "') AS keyword FROM " . DB_PREFIX . "revblog b LEFT JOIN " . DB_PREFIX . "revblog_description bd ON (b.revblog_id = bd.revblog_id) WHERE b.revblog_id = '" . (int)$revblog_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	
	public function getBlogCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'revblog_category_id=" . (int)$category_id . "') AS keyword FROM " . DB_PREFIX . "revblog_category c LEFT JOIN " . DB_PREFIX . "revblog_category_description cd ON (c.category_id = cd.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getBlogs($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "revblog b LEFT JOIN " . DB_PREFIX . "revblog_description bd ON (b.revblog_id = bd.revblog_id)";

			if (!empty($data['filter_category'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "revblog_to_category b2c ON (b.revblog_id = b2c.revblog_id)";
			}

			$sql .= " WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			
			if (!empty($data['filter_name'])) {
				$sql .= " AND bd.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
			}
			
			if (!empty($data['filter_category'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();

					$implode_data[] = "category_id = '" . (int)$data['filter_category'] . "'";

					$this->load->model('catalog/category');

					$categories = $this->model_catalog_category->getCategories($data['filter_category']);

					foreach ($categories as $category) {
						$implode_data[] = "b2c.category_id = '" . (int)$category['category_id'] . "'";
					}

					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";
				} else {
					$sql .= " AND b2c.category_id = '" . (int)$data['filter_category'] . "'";
				}
			}

			$sql .= " GROUP BY b.revblog_id";

			$sort_data = array(
				'bd.title',
				'b.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY bd.title";
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
		} else {
			$blog_data = $this->cache->get('revblog.' . (int)$this->config->get('config_language_id'));

			if (!$blog_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog b LEFT JOIN " . DB_PREFIX . "revblog_description id ON (b.revblog_id = bd.revblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bd.title");

				$blog_data = $query->rows;

				$this->cache->set('revblog.' . (int)$this->config->get('config_language_id'), $blog_data);
			}

			return $blog_data;
		}
	}
	
	public function getBlogCategories($data = array()) {
		$blog_category_data = array();
	
		$sql = "SELECT * FROM " . DB_PREFIX . "revblog_category c LEFT JOIN " . DB_PREFIX . "revblog_category_description cd ON (c.category_id = cd.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND cd.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY c.category_id";

		$sort_data = array(
			'cd.title',
			'c.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cd.title";
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
		$blog_category_data = $query->rows;
		return $blog_category_data;
	}

	public function getBlogDescriptions($revblog_id) {
		$revblog_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_description WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($query->rows as $result) {
			$revblog_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'title_pr'   => $result['title_pr'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $revblog_description_data;
	}
	
	public function getBlogCategoryDescriptions($category_id) {
		$revblog_category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_category_description WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$revblog_category_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $revblog_category_description_data;
	}

	public function getBlogStores($revblog_id) {
		$blog_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_to_store WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($query->rows as $result) {
			$blog_store_data[] = $result['store_id'];
		}

		return $blog_store_data;
	}
	
	public function getBlogCategoryStores($category_id) {
		$blog_caegory_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_category_to_store WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$blog_caegory_store_data[] = $result['store_id'];
		}

		return $blog_caegory_store_data;
	}

	public function getBlogLayouts($revblog_id) {
		$blog_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_to_layout WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($query->rows as $result) {
			$blog_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $blog_layout_data;
	}

	public function getTotalBlogs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "revblog");

		return $query->row['total'];
	}
	
	public function getTotalBlogCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "revblog_category");

		return $query->row['total'];
	}

	public function getTotalBlogsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "revblog_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}

	public function getBlogProduct($revblog_id) {
		$product_blog_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_product WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($query->rows as $result) {
			$product_blog_data[] = $result['product_id'];
		}

		return $product_blog_data;
	}

	public function getTotalStoresByBlogId($revblog_id) {
		$account_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$revblog_id . "' AND store_id != '0'");

		$checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$revblog_id . "' AND store_id != '0'");

		return ($account_query->row['total'] + $checkout_query->row['total']);
	}
	
	public function getAllBlogCategories() {
		$category_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_category c LEFT JOIN " . DB_PREFIX . "revblog_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "revblog_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ORDER BY c.parent_id, c.sort_order, cd.title");
		foreach ($query->rows as $row) {
			$category_data[$row['parent_id']][$row['category_id']] = $row;
		}
		return $category_data;
	}
	
	public function getBlogMainCategoryId($revblog_id) {
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "' AND main_category = '1' LIMIT 1");

		return ($query->num_rows ? (int)$query->row['category_id'] : 0);
	}
	
	public function getBlogtoCategories($revblog_id) {
		$blog_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_to_category WHERE revblog_id = '" . (int)$revblog_id . "'");

		foreach ($query->rows as $result) {
			$blog_category_data[] = $result['category_id'];
		}

		return $blog_category_data;
	}
	
	public function getBlogImages($revblog_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revblog_images WHERE revblog_id = '" . (int)$revblog_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

}