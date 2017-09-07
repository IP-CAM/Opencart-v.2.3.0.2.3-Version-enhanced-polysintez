<?php
class ModelRevolutionRevsubscribe extends Model {
	public function addPhone($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "revsubscribe SET email = '" . $this->db->escape($data['email']) . "', date_created = NOW()");

		$subscribe_id = $this->db->getLastId();

		return $subscribe_id;
	}

	public function editPhone($subscribe_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "revsubscribe SET email = '" . $this->db->escape($data['email']) . "', date_created = '" . $this->db->escape($data['date_created']) . "' WHERE subscribe_id = '" . (int)$subscribe_id  . "'");
	}

	public function deletePhone($subscribe_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "revsubscribe WHERE subscribe_id = '" . (int)$subscribe_id . "'");
	}

	public function getPhone($subscribe_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "revsubscribe WHERE subscribe_id = '" . (int)$subscribe_id . "'");

		return $query->row;
	}

	public function getPhones($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "revsubscribe WHERE subscribe_id > 0";

		if (!empty($data['filter_email'])) {
			$sql .= " AND email = '" . $data['filter_email'] . "'";
		}

		if (!empty($data['filter_date_created'])) {
			$sql .= " AND DATE(date_created) = DATE('" . $this->db->escape($data['filter_date_created']) . "')";
		}

		$sort_data = array(
			'email',
			'date_created'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_created";
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
		
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "revsubscribe WHERE subscribe_id >= 0";

		if (!empty($data['filter_email'])) {
			$sql .= " AND email = '" . $data['filter_email'] . "'";
		}

		if (!empty($data['filter_date_created'])) {
			$sql .= " AND DATE(date_created) = DATE('" . $this->db->escape($data['filter_date_created']) . "')";
		}

		$query = $this->db->query($sql);
		
		if ($query->rows) {
			return $query->row['total'];
		}
	}
	
	
	
	public function viewsubscribers($data = array()) {
		$query =  $this->db->query("SELECT * FROM `" . DB_PREFIX . "revsubscribe`
			ORDER BY `date_created` DESC
			LIMIT ".$data['start'].", ".$data['limit']);
		return $query->rows; 
	}
	
	public function getTotalSubscriptions(){
		$query = $this->db->query("SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "revsubscribe`");
		return $query->row['count']; 
	}

}