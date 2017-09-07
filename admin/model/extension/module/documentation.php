<?php
class ModelExtensionModuleDocumentation extends Model {
	private $workdir = 'storage/documentation';
	private $storage = 'download';
	private $tmpdir = 'upload';

	public function getDirs() {
		return array('workdir' => $this->workdir, 'storage' => $this->workdir . '/' . $this->storage, 'tmpdir' => $this->workdir . '/' . $this->tmpdir);
	}

	public function addDocumentation($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "documentation SET filename = '" . $this->db->escape($data['filename']) . "', mask = '" . $this->db->escape($data['mask']) . "'");

		$documentation_id = $this->db->getLastId();

		foreach ($data['documentation_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "documentation_description SET documentation_id = '" . (int)$documentation_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}

		if (isset($data['documentation_links']) && !empty($data['documentation_links'])) {
			$sqlIns = array();
			foreach ($data['documentation_links'] as $product_id) {
				if ((int)$product_id>0) {
					$sqlIns[] = '('.(int)$product_id.','.(int)$documentation_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "product_to_documentation 
					(`product_id`,`documentation_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}

		if (isset($data['documentation_link_folders']) && !empty($data['documentation_link_folders'])) {
			$sqlIns = array();
			foreach ($data['documentation_link_folders'] as $documentation_folder_id) {
				if ((int)$documentation_folder_id>0) {
					$sqlIns[] = '('.(int)$documentation_id.','.(int)$documentation_folder_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "documentation_to_folder 
					(`documentation_id`,`documentation_folder_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}

		if (isset($data['documentation_customer_group']) && !empty($data['documentation_customer_group'])) {
			$sqlIns = array();
			foreach ($data['documentation_customer_group'] as $customer_group_id) {
				if ((int)$customer_group_id>0) {
					$sqlIns[] = '('.(int)$documentation_id.','.(int)$customer_group_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "documentation_customer_group 
					(`documentation_id`,`customer_group_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}

		return $documentation_id;
	}

	public function editDocumentation($documentation_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "documentation SET filename = '" . $this->db->escape($data['filename']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE documentation_id = '" . (int)$documentation_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_description WHERE documentation_id = '" . (int)$documentation_id . "'");

		foreach ($data['documentation_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "documentation_description SET documentation_id = '" . (int)$documentation_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_documentation WHERE documentation_id = '" . (int)$documentation_id . "'");

		if (isset($data['documentation_links']) && !empty($data['documentation_links'])) {
			$sqlIns = array();
			foreach ($data['documentation_links'] as $product_id) {
				if ((int)$product_id>0) {
					$sqlIns[] = '('.(int)$product_id.','.(int)$documentation_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "product_to_documentation 
					(`product_id`,`documentation_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_to_folder WHERE documentation_id = '" . (int)$documentation_id . "'");

		if (isset($data['documentation_link_folders']) && !empty($data['documentation_link_folders'])) {
			$sqlIns = array();
			foreach ($data['documentation_link_folders'] as $documentation_folder_id) {
				if ((int)$documentation_folder_id>0) {
					$sqlIns[] = '('.(int)$documentation_id.','.(int)$documentation_folder_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "documentation_to_folder 
					(`documentation_id`,`documentation_folder_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_customer_group WHERE documentation_id = '" . (int)$documentation_id . "'");

		if (isset($data['documentation_customer_group']) && !empty($data['documentation_customer_group'])) {
			$sqlIns = array();
			foreach ($data['documentation_customer_group'] as $customer_group_id) {
				if ((int)$customer_group_id>0) {
					$sqlIns[] = '('.(int)$documentation_id.','.(int)$customer_group_id.')';
				}
			}
			$sql = "
				INSERT IGNORE INTO " . DB_PREFIX . "documentation_customer_group 
					(`documentation_id`,`customer_group_id`)
					VALUES
			";
			if (!empty($sqlIns)) {
				$sql .= implode(', ', $sqlIns);
				$this->db->query($sql);
			}
		}
	}

	public function deleteDocumentation($documentation = array()) {
		if (!is_array($documentation) && (int)$documentation>0) {
			$documentation = array((int)$documentation);
		} 
		if (!empty($documentation)) {
			foreach ($documentation as $documentation_id) {

				$this->removeDocumentationFile($documentation_id);

				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation WHERE documentation_id = '" . (int)$documentation_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_description WHERE documentation_id = '" . (int)$documentation_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_documentation WHERE documentation_id = '" . (int)$documentation_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_customer_group WHERE documentation_id = '" . (int)$documentation_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_to_folder WHERE documentation_id = '" . (int)$documentation_id . "'");

			}
		} else {
			return;
		}
	}

	public function getDocumentation($documentation_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "documentation d LEFT JOIN " . DB_PREFIX . "documentation_description dd ON (d.documentation_id = dd.documentation_id) WHERE d.documentation_id = '" . (int)$documentation_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getDocumentationDescription($documentation_id) {
		$documentation_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "documentation_description WHERE documentation_id = '" . (int)$documentation_id . "'");

		foreach ($query->rows as $result) {
			$documentation_description_data[$result['language_id']] = html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8');
		}

		return $documentation_description_data;
	}

	public function getDocumentationFileData($documentation_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "documentation WHERE documentation_id = '" . (int)$documentation_id . "'");

		$query->row['mask'] = html_entity_decode($query->row['mask'], ENT_QUOTES, 'UTF-8');
		return $query->row;
	}

	public function getDocumentationLinks($documentation_id) {
		$documentation_links = array();
		$sql = "
			SELECT pd.product_id, pd.name
				FROM
					" . DB_PREFIX . "product_to_documentation p2d
						LEFT JOIN
					" . DB_PREFIX . "product_description pd ON (p2d.product_id = pd.product_id)
				WHERE
					p2d.documentation_id = '" . (int)$documentation_id . "'
					AND
					pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				ORDER BY pd.name";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$documentation_links[] = array('pid' => $result['product_id'], 'name' => $result['name']);
		}

		return $documentation_links;
	}

	public function getDocumentationCustomerGroups($documentation_id) {
		$documentation_customer_group = array();
		$sql = "
			SELECT dc.customer_group_id, cgd.name
				FROM
					" . DB_PREFIX . "documentation_customer_group dc
						LEFT JOIN
					" . DB_PREFIX . "customer_group_description cgd ON (dc.customer_group_id = cgd.customer_group_id)
						LEFT JOIN
					" . DB_PREFIX . "customer_group cg ON (cgd.customer_group_id = cg.customer_group_id)
				WHERE
					dc.documentation_id = '" . (int)$documentation_id . "'
					AND
					cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				ORDER BY cg.sort_order";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$documentation_customer_group[] = array('gid' => $result['customer_group_id'], 'name' => $result['name']);
		}

		return $documentation_customer_group;
	}

	public function getDocumentationFolders($documentation_id) {
		$documentation_folders = array();
		$sql = "
			SELECT d2f.documentation_folder_id, dfd.name
				FROM
					" . DB_PREFIX . "documentation_to_folder d2f
						LEFT JOIN
					" . DB_PREFIX . "documentation_folder_description dfd ON (d2f.documentation_folder_id = dfd.documentation_folder_id)
						LEFT JOIN
					" . DB_PREFIX . "documentation_folder df ON (d2f.documentation_folder_id = df.documentation_folder_id)
				WHERE
					d2f.documentation_id = '" . (int)$documentation_id . "'
					AND
					dfd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				ORDER BY df.sort_order";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$documentation_folders[] = array('fid' => $result['documentation_folder_id'], 'name' => $result['name']);
		}

		return $documentation_folders;
	}

	public function getAllDocumentation($data = array()) {
		$sql = "
			SELECT  d.*, dd.*
		";
		if (!empty($data['product'])) {
			$sql .= "
				, IF(p2d.product_id IS NOT NULL,1,0) as linked
			";
		}
		$sql .= "
				, (SELECT GROUP_CONCAT(doc_cg.customer_group_id SEPARATOR ',') FROM " . DB_PREFIX . "documentation_customer_group doc_cg WHERE doc_cg.documentation_id = d.documentation_id) as customer_groups
		";
		$sql .= "
				, (SELECT GROUP_CONCAT(doc_df.documentation_folder_id SEPARATOR ',') FROM " . DB_PREFIX . "documentation_to_folder doc_df WHERE doc_df.documentation_id = d.documentation_id) as link_folders
		";
		$sql .= "
				, (SELECT COUNT(*) FROM " . DB_PREFIX . "product_to_documentation cnt WHERE cnt.documentation_id = d.documentation_id) as links
				FROM
					" . DB_PREFIX . "documentation d
						LEFT JOIN
					" . DB_PREFIX . "documentation_description dd ON (d.documentation_id = dd.documentation_id)
		";
		if (!empty($data['product'])) {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "product_to_documentation p2d ON (d.documentation_id = p2d.documentation_id AND p2d.product_id=".(int)$data['product'].")
			";
		} else {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "product_to_documentation p2d ON (d.documentation_id = p2d.documentation_id)
			";
		}

		$sql .= "
					LEFT JOIN
				" . DB_PREFIX . "documentation_to_folder d2f ON (d.documentation_id = d2f.documentation_id)
		";

		$sql .= "
					LEFT JOIN
				" . DB_PREFIX . "documentation_customer_group dcg ON (d.documentation_id = dcg.documentation_id)
		";
		$sql .= "
				WHERE dd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['product']) && $data['filter_linked']===1) {
			$sql .= " AND p2d.product_id = " . (int)$data['product'] . "";
		} elseif ($data['filter_linked']===1) {
			$sql .= " AND p2d.product_id IS NOT NULL";
		} elseif ($data['filter_linked']===0) {
			$sql .= " AND p2d.product_id IS NULL";
		}

		if (!empty($data['filter_name'])) {
			$sql .= " AND ( dd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'
							OR d.filename LIKE '%" . $this->db->escape($data['filter_name']) . "%'
							OR d.mask LIKE '%" . $this->db->escape($data['filter_name']) . "%'
						)
			";
		}

		if (!empty($data['folder_id']) && (int)$data['folder_id']>0) {
			$sql .= " AND d2f.documentation_folder_id = " . (int)$data['folder_id'] . "
			";
		} else if ($data['folder_id']===0) {
			$sql .= " AND d2f.documentation_folder_id IS NULL
			";
		}

		if (!empty($data['customer_group']) && (int)$data['customer_group']>0) {
			$sql .= " AND ( dcg.customer_group_id = " . (int)$data['customer_group'] . "
							OR dcg.customer_group_id IS NULL
						)
			";
		} else if ($data['customer_group']===0) {
			$sql .= " AND dcg.customer_group_id IS NULL
			";
		}

		$sql .= " GROUP BY d.documentation_id ";

		$sort_data = array(
			'dd.name',
			'd.date_modified',
			'd.mask'
		);

		$sql .= " ORDER BY ";

		/*if (!empty($data['product'])) {
			$sql .= "
				linked DESC, 
			";
		}*/

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= $data['sort'];
		} else {
			$sql .= "dd.name";
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

	public function getTotalDocumentation($data = array()) {
		$sql = "
		SELECT count(*) as total FROM (
			SELECT d.*
				FROM
					" . DB_PREFIX . "documentation d
						LEFT JOIN
					" . DB_PREFIX . "documentation_description dd ON (d.documentation_id = dd.documentation_id)
		";
		if (!empty($data['product'])) {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "product_to_documentation p2d ON (d.documentation_id = p2d.documentation_id AND p2d.product_id=".(int)$data['product'].")
			";
		} else {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "product_to_documentation p2d ON (d.documentation_id = p2d.documentation_id)
			";
		}
		if (!empty($data['folder_id']) || $data['folder_id']===0) {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "documentation_to_folder d2f ON (d.documentation_id = d2f.documentation_id)
			";
		}
		if (!empty($data['customer_group']) || $data['customer_group']===0) {
			$sql .= "
						LEFT JOIN
					" . DB_PREFIX . "documentation_customer_group dcg ON (d.documentation_id = dcg.documentation_id)
			";
		}
		$sql .= "
				WHERE dd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['product']) && $data['filter_linked']===1) {
			$sql .= " AND p2d.product_id = " . (int)$data['product'] . "";
		} elseif ($data['filter_linked']===1) {
			$sql .= " AND p2d.product_id IS NOT NULL";
		} elseif ($data['filter_linked']===0) {
			$sql .= " AND p2d.product_id IS NULL";
		}

		if (!empty($data['filter_name'])) {
			$sql .= " AND ( dd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'
							OR d.filename LIKE '%" . $this->db->escape($data['filter_name']) . "%'
							OR d.mask LIKE '%" . $this->db->escape($data['filter_name']) . "%'
						)
			";
		}

		if (!empty($data['folder_id']) && (int)$data['folder_id']>0) {
			$sql .= " AND d2f.documentation_folder_id = " . (int)$data['folder_id'] . "
			";
		} else if ($data['folder_id']===0) {
			$sql .= " AND d2f.documentation_folder_id IS NULL
			";
		}

		if (!empty($data['customer_group']) && (int)$data['customer_group']>0) {
			$sql .= " AND ( dcg.customer_group_id = " . (int)$data['customer_group'] . "
							OR dcg.customer_group_id IS NULL
						)
			";
		} else if ($data['customer_group']===0) {
			$sql .= " AND dcg.customer_group_id IS NULL
			";
		}

		$sql .= " GROUP BY d.documentation_id";
		$sql .= ") ttl";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getProducts($product_query = '') {
		$sql = "
			SELECT p.product_id, pd.name, p.model
				FROM " . DB_PREFIX . "product p
				LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
				WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
					AND ( pd.name LIKE '%" . $this->db->escape($product_query) . "%'
							OR p.model LIKE '%" . $this->db->escape($product_query) . "%'
							OR p.sku LIKE '%" . $this->db->escape($product_query) . "%'
						)
				GROUP BY p.product_id
				ORDER BY pd.name ASC
				LIMIT 20
		";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getFilesList($query = '') {
		$query = trim(trim($query),'./');
		$files = array();
		if (utf8_strlen($query)<3) {
			return $files;
		}
		$dirs = $this->getDirs();
		$i = 0;
		foreach (new moduleDocumentationStorageFilter(new FilesystemIterator(DIR_SYSTEM . $dirs['storage']),$query) as $doc) {
			$fname = $doc->getFilename();
			if ($fname == 'index.html') {
				continue;
			}
			$files[] = $fname;
			if ($i>=14) {
				break;
			} else {
				$i++;
			}
		}
		natcasesort($files);
		return $files;
	}

	public function linkFilesToProduct($product_id = 0, $documents = array()) {
		$product_id = (int)$product_id;
		$documents = (array)$documents;
		if (empty($documents) || $product_id <= 0) {
			return;
		}
		$sqlIns = array();
		foreach ($documents as $documentation_id) {
			if ((int)$documentation_id>0) {
				$sqlIns[] = '('.(int)$product_id.','.(int)$documentation_id.')';
			}
		}
		$sql = "
			INSERT IGNORE INTO " . DB_PREFIX . "product_to_documentation 
				(`product_id`,`documentation_id`)
				VALUES
		";
		if (!empty($sqlIns)) {
			$sql .= implode(', ', $sqlIns);
			$this->db->query($sql);
		}
	}

	public function unlinkFilesToProduct($product_id = 0, $documents = array()) {
		$product_id = (int)$product_id;
		$documents = (array)$documents;
		if (empty($documents) || $product_id <= 0) {
			return;
		}
		$sqlIns = array();
		foreach ($documents as $documentation_id) {
			if ((int)$documentation_id>0) {
				$sqlIns[] = (int)$documentation_id;
			}
		}
		if (!empty($sqlIns)) {
			$sql = "
				DELETE FROM " . DB_PREFIX . "product_to_documentation 
					WHERE product_id = ".(int)$product_id."
						AND documentation_id IN (".implode(', ', $sqlIns).")
			";
			$this->db->query($sql);
		}
	}

	public function linksActualization() {
		$sql = "
			DELETE p2d
				FROM " . DB_PREFIX . "product_to_documentation p2d
				LEFT JOIN
					" . DB_PREFIX . "product p ON (p2d.product_id = p.product_id)
				WHERE p.product_id IS NULL
		";
		$this->db->query($sql);
		return (int)$this->db->countAffected();
	}

	public function deleteLink($product_id) {
		$sql = "
			DELETE
				FROM " . DB_PREFIX . "product_to_documentation 
				WHERE product_id = ".(int)$product_id."
		";
		$this->db->query($sql);
	}

	private function removeDocumentationFile($documentation_id) {
		if ($this->config->get('documentation_auto_delete_files')) {
			$dirs = $this->getDirs();
			$documentation = $this->getDocumentation($documentation_id);
			$sql = "
				SELECT COUNT(*) as total
					FROM " . DB_PREFIX . "documentation
					WHERE filename = '".$this->db->escape($documentation['filename'])."'
			";
			$query = $this->db->query($sql);
			if ($query->row['total']==1) {
				$filepath = DIR_SYSTEM . $dirs['storage'] . '/' . $documentation['filename'];
				if (file_exists($filepath)) {
					@unlink($filepath);
				}
			}
		}
	}

	public function removeOldDocumentationFiles() {
		$result = 0;
		$error = false;
		$filenames = array();
		$query = $this->db->query("SELECT filename FROM " . DB_PREFIX . "documentation");
		foreach ($query->rows as $documentation) {
			$filenames[$documentation['filename']] = true;
		}
		$dirs = $this->getDirs();
		$storage = DIR_SYSTEM . $dirs['storage'] . '/';
		if (!is_dir($storage)) {
			$error = $this->language->get('error_storage_exists');
		} elseif (!is_readable($storage)) {
			$error = $this->language->get('error_storage_read');
		} elseif (!is_writeable($storage)) {
			$error = $this->language->get('error_storage_write');
		}
		if ($error === false) {
			$documentationFiles = opendir($storage);
			if (!empty($documentationFiles)) {
				while(($fname = readdir($documentationFiles)) !== false){
					if ($fname == '.' || $fname == '..' || $fname == 'index.html') {
						continue;
					}
					if (!isset($filenames[$fname])){
						@unlink($storage.$fname);
						$result++;
					}
				}
			}
		} else {
			$result = $error;
		}
		return $result;
	}

	public function removeTemporaryFiles() {
		$result = 0;
		$error = false;
		$dirs = $this->getDirs();
		$tmpdir = DIR_SYSTEM . $dirs['tmpdir'] . '/';
		if (!is_dir($tmpdir)) {
			$error = $this->language->get('error_tmpdir_exists');
		} elseif (!is_readable($tmpdir)) {
			$error = $this->language->get('error_tmpdir_read');
		} elseif (!is_writeable($tmpdir)) {
			$error = $this->language->get('error_tmpdir_write');
		}
		if ($error === false) {
			$documentationFiles = opendir($tmpdir);
			if (!empty($documentationFiles)) {
				while(($fname = readdir($documentationFiles)) !== false){
					if ($fname == '.' || $fname == '..') {
						continue;
					}
					$tmpSize = $this->getFileSize($tmpdir.$fname);
					usleep(50000);
					clearstatcache();
					if ($tmpSize != $this->getFileSize($tmpdir.$fname)) {
						continue;
					}
					@unlink($tmpdir.$fname);
					$result++;
				}
			}
		} else {
			$result = $error;
		}
		return $result;
	}

	public function getCustomerGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'cgd.name',
			'cg.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cgd.name";
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

	public function getFolders() {
		$sql = "
			SELECT *
				FROM 
					" . DB_PREFIX . "documentation_folder f
				ORDER BY f.sort_order
		";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getFolderTitles($documentation_folder_id) {
		$result = array();
		$sql = "
			SELECT *
				FROM 
					" . DB_PREFIX . "documentation_folder_description fd
				WHERE fd.documentation_folder_id = ".(int)$documentation_folder_id."
		";
		$query = $this->db->query($sql);
		foreach ($query->rows as $row) {
			$result[$row['language_id']] = strip_tags(html_entity_decode($row['name'], ENT_QUOTES, 'UTF-8'));
		}
		return $result;
	}

	public function addFolder($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "documentation_folder SET class = '" . $this->db->escape($data['class']) . "', icon = '" . $this->db->escape($data['icon']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");
		$folder_id = $this->db->getLastId();
		foreach ($data['titles'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "documentation_folder_description SET documentation_folder_id = '" . (int)$folder_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value) . "'");
		}
		return $folder_id;
	}

	public function editFolder($folder_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "documentation_folder SET class = '" . $this->db->escape($data['class']) . "', icon = '" . $this->db->escape($data['icon']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE documentation_folder_id = '" . (int)$folder_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_folder_description WHERE documentation_folder_id = '" . (int)$folder_id . "'");

		foreach ($data['titles'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "documentation_folder_description SET documentation_folder_id = '" . (int)$folder_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value) . "'");
		}
	}

	public function updateFolders($folders = array()) {
		$truncate = false;
		if (!empty($folders)) {
			$affected = array();
			foreach ($folders as $folder) {
				if ($folder['folder_id']==0) {
					$folder_id = $this->addFolder($folder);
					if ($folder_id) {
						$affected[] = (int)$folder_id;
					}
				} else {
					$this->editFolder($folder['folder_id'], $folder);
					$affected[] = (int)$folder['folder_id'];
				}
			}
			if (!empty($affected)) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_folder WHERE documentation_folder_id NOT IN (" . implode(',',$affected) . ")");
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_folder_description WHERE documentation_folder_id NOT IN (" . implode(',',$affected) . ")");
				$this->db->query("DELETE FROM " . DB_PREFIX . "documentation_to_folder WHERE documentation_folder_id NOT IN (" . implode(',',$affected) . ")");
			}
		} else {
			$truncate = true;
		}
		if ($truncate) {
			$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "documentation_folder");
			$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "documentation_folder_description");
			$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "documentation_to_folder");
		}
	}

	public function install() {
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation` (
				`documentation_id` int(11) NOT NULL AUTO_INCREMENT,
				`filename` varchar(160) NOT NULL DEFAULT '',
				`mask` varchar(128) NOT NULL DEFAULT '',
				`date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				PRIMARY KEY (`documentation_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation_description` (
				`documentation_id` int(11) NOT NULL,
				`language_id` int(11) NOT NULL,
				`name` varchar(128) NOT NULL DEFAULT '',
				PRIMARY KEY (`documentation_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_to_documentation` (
				`product_id` int(11) NOT NULL,
				`documentation_id` int(11) NOT NULL,
				PRIMARY KEY (`product_id`,`documentation_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation_customer_group` (
				`documentation_id` int(11) NOT NULL,
				`customer_group_id` int(11) NOT NULL,
				PRIMARY KEY (`documentation_id`,`customer_group_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation_folder` (
				`documentation_folder_id` int(11) NOT NULL AUTO_INCREMENT,
				`class` varchar(128) NOT NULL DEFAULT '',
				`icon` varchar(128) NOT NULL DEFAULT '',
				`sort_order` int(3) NOT NULL DEFAULT '0',
				`status` tinyint(1) unsigned NOT NULL DEFAULT '1',
				PRIMARY KEY (`documentation_folder_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation_folder_description` (
				`documentation_folder_id` int(11) NOT NULL,
				`language_id` int(11) NOT NULL,
				`name` varchar(128) NOT NULL DEFAULT '',
				PRIMARY KEY (`documentation_folder_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "documentation_to_folder` (
				`documentation_id` int(11) NOT NULL,
				`documentation_folder_id` int(11) NOT NULL,
				PRIMARY KEY (`documentation_id`,`documentation_folder_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");

		$dirs = $this->getDirs();
		$storage = $dirs['storage'] . '/';
		$tmpdir = $dirs['tmpdir'] . '/';

		if (!is_dir(DIR_SYSTEM . $storage) && !mkdir(DIR_SYSTEM . $storage,0755,true)) {
			$this->session->data['warning'] = $this->language->get('error_mkdir_storage');
		} else {
			if(!file_exists(DIR_SYSTEM . $storage . '/index.html') && touch(DIR_SYSTEM . $storage . '/index.html')) {
				@chmod(DIR_SYSTEM . $storage . '/index.html', 0644);
			}
		}
		if (!is_dir(DIR_SYSTEM . $tmpdir) && !mkdir(DIR_SYSTEM . $tmpdir,0755,true)) {
			$this->session->data['warning'] = $this->language->get('error_mkdir_tmpdir');
		}
		if(!file_exists(DIR_SYSTEM . $this->workdir . '/index.html') && @touch(DIR_SYSTEM . $this->workdir . '/index.html')) {
			@chmod(DIR_SYSTEM . $this->workdir . '/index.html', 0644);
		}
	}

	public function uninstall() {
	}

	public function getFileSize($fpath)	{
		$fp = fopen($fpath, 'r');
		$pos = 0;
		$size = 1073741824;
		fseek($fp, 0, SEEK_SET);
		while ($size > 1) {
			fseek($fp, $size, SEEK_CUR);
			if (fgetc($fp) === false) {
				fseek($fp, -$size, SEEK_CUR);
				$size = (int)($size / 2);
			} else {
				fseek($fp, -1, SEEK_CUR);
				$pos += $size;
			}
		}
		while (fgetc($fp) !== false) {
			$pos++;
		}
		return $pos;
	}
}

class moduleDocumentationStorageFilter extends FilterIterator {
	private $pattern = '.*';
	function __construct(Iterator $iterator, $pattern) {
		parent::__construct($iterator);
		$this->pattern = $pattern;
	}
	public function accept() {
		$docInfo = $this->getInnerIterator()->current();
		return preg_match('#.*'.preg_quote($this->pattern,'#').'.*#iu', $docInfo->getFilename());
	}
}
