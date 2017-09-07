<?php
class ModelExtensionModuleDocumentation extends Model {
	private $storage = 'storage/documentation/download/';

	public function getStorageDir() {
		return $this->storage;
	}
	public function getDocumentationByProduct($product_id) {
		$data = array();
		$folders = array();
		$sql = "
			SELECT *
				FROM " . DB_PREFIX . "documentation_folder df
					LEFT JOIN
					" . DB_PREFIX . "documentation_folder_description dfd ON (df.documentation_folder_id=dfd.documentation_folder_id)
				WHERE
					dfd.language_id = '" . (int)$this->config->get('config_language_id') . "'
					AND
					df.status = 1
				ORDER BY df.sort_order
		";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$folders[$result['documentation_folder_id']] = array(
				 'name'		=> $result['name']
				,'class'	=> $result['class']
				,'icon'		=> $result['icon']
			);
		}

		$groupid = $this->customer->getGroupId();
		$groupid = (isset($groupid) && (int)$groupid>0)?(int)$groupid:0;

		$showDefaultFolder = $this->config->get('documentation_default_folder_status');

		$data['docs'] = array();
		$sql = "
			SELECT d.*, dd.*, GROUP_CONCAT(df.documentation_folder_id SEPARATOR ',') as folders
				FROM " . DB_PREFIX . "product_to_documentation p2d
					LEFT JOIN
					" . DB_PREFIX . "documentation d ON (p2d.documentation_id=d.documentation_id)
					LEFT JOIN
					" . DB_PREFIX . "documentation_description dd ON (d.documentation_id=dd.documentation_id)
					LEFT JOIN
					" . DB_PREFIX . "documentation_customer_group dcg ON (d.documentation_id=dcg.documentation_id)
					LEFT JOIN 
					" . DB_PREFIX . "documentation_to_folder d2f ON (d.documentation_id=d2f.documentation_id)
					LEFT JOIN 
					" . DB_PREFIX . "documentation_folder df ON (df.documentation_folder_id=d2f.documentation_folder_id)
				WHERE
					p2d.product_id = ".(int)$product_id."
						AND
					dd.language_id = '" . (int)$this->config->get('config_language_id') . "'
						AND
					(
		";
		if ($groupid>0) {
			$sql .= "
						dcg.customer_group_id = ".(int)$groupid." OR
			";
		}
		$sql .= "
						dcg.customer_group_id IS NULL
					)
					AND (df.status IS NULL OR df.status = 1)
		";
		$sql .= "
				GROUP BY d.documentation_id
				ORDER BY DATE(d.date_modified) DESC, d.filename
		";
		$issetFolders = array();
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$fpath = DIR_SYSTEM . $this->storage . $result['filename'];
			$fname = '';
			if (is_file($fpath)) {
				$fname = utf8_substr($result['filename'],0,-33);
				$ext = '';
				if ($fname) {
					$docFolders = explode(',', $result['folders']?$result['folders']:0);
					foreach ($docFolders as $folder_id) {
						if (isset($folders[$folder_id]) || $showDefaultFolder && $folder_id==0) {
							if (!isset($issetFolders[$folder_id])) {
								$issetFolders[$folder_id] = array();
							}
							$issetFolders[$folder_id][] = $result['documentation_id'];
						}
					}
					if ($folder_id>0 || $showDefaultFolder && $folder_id==0) {
					$ext = strtolower(substr(strrchr($result['mask'], '.'), 1));
						$data['docs'][$result['documentation_id']] = array(
								'date_modified'		=> $result['date_modified'],
								'title'				=> $result['name'],
								'size'				=> $this->getFileSize($fpath),
								'ext'				=> $ext,
								'mask'				=> $result['mask'],
								'folders'			=> $docFolders
								);
					}
				}
			}
		}
		$data['folders'] = array();
		$manualFolders = array();
		if (!empty($issetFolders) && !empty($folders)) {
			foreach ($folders as $folder_id => $folder_data) {
				if (isset($issetFolders[$folder_id])) {
					$manualFolders[] = array(
						 'folder_id'	=> $folder_id
						,'data'			=> $folder_data
						,'documents'	=> $issetFolders[$folder_id]
					);
				}
			}
		}
		$default_folder = array();
		if (isset($issetFolders[0]) && $showDefaultFolder) {
			$default_folder_titles = $this->config->get('documentation_default_folder_titles');
			if (isset($default_folder_titles[$this->config->get('config_language_id')])) {
				$default_folder_name = $default_folder_titles[$this->config->get('config_language_id')];
			} else {
				$default_folder_name = '';
			}
			$default_folder[0] = array(
				 'folder_id'	=> 0
				,'data'			=> array(
									 'name'		=> $default_folder_name
									,'class'	=> $this->config->get('documentation_default_folder_class')
									,'icon'		=> $this->config->get('documentation_default_folder_icon')
								)
				,'documents'	=> $issetFolders[0]
			);
		}
		if ($this->config->get('documentation_default_folder_order')) {
			$data['folders'] = array_merge($default_folder,$manualFolders);
		} else {
			$data['folders'] = array_merge($manualFolders,$default_folder);
		}

		return $data;
	}
	public function getDocumentation($product_id, $documentation_id) {
		$data = array();
		$sql = "
			SELECT d.*, GROUP_CONCAT(dcg.customer_group_id SEPARATOR ',') as customer_groups
				FROM " . DB_PREFIX . "documentation d
					LEFT JOIN
					" . DB_PREFIX . "documentation_customer_group dcg ON (d.documentation_id=dcg.documentation_id)
					LEFT JOIN
					" . DB_PREFIX . "product_to_documentation p2d ON (d.documentation_id=p2d.documentation_id)
				WHERE
					d.documentation_id = ".(int)$documentation_id."
					AND
					p2d.product_id = ".(int)$product_id."
				GROUP BY d.documentation_id
				LIMIT 1
		";
		$query = $this->db->query($sql);
		return $query->row;
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