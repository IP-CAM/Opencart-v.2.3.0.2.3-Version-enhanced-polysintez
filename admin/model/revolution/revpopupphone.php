<?php
class ModelRevolutionRevpopupphone extends Model {
	public function addPhone($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "revpopupphones SET name = '" . $this->db->escape($data['name']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', email = '" . $this->db->escape($data['email']) . "', comment = '" . $this->db->escape($data['comment']) . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "'");

		$pphone_id = $this->db->getLastId();

		return $pphone_id;
	}

	public function editPhone($pphone_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "revpopupphones SET name = '" . $this->db->escape($data['name']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', email = '" . $this->db->escape($data['email']) . "', comment = '" . $this->db->escape($data['comment']) . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "' WHERE pphone_id = '" . (int)$pphone_id  . "'");
	}

	public function deletePhone($pphone_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "revpopupphones WHERE pphone_id = '" . (int)$pphone_id . "'");

		$this->cache->delete('product');
	}

	public function getPhone($pphone_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revpopupphones WHERE pphone_id = '" . (int)$pphone_id . "'");

		return $query->row;
	}

	public function getPhones($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "revpopupphones WHERE status >= 0";

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$sort_data = array(
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
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

	public function getTotalPhones($data = array()) {
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revpopupphones` (
		`pphone_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(64) NOT NULL,
		`telephone` varchar(64) NOT NULL,
		`email` varchar(64) NOT NULL,
		`comment` text NOT NULL,
		`status` int(1) NOT NULL DEFAULT '0',
		`date_added` datetime NOT NULL,
		PRIMARY KEY (`pphone_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
		");
		
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "revpopupphones WHERE status >= 0";

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$query = $this->db->query($sql);
		
		if ($query->rows) {
			return $query->row['total'];
		}
	}

}