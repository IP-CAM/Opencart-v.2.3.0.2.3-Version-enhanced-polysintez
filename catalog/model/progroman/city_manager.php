<?php
    class ModelProgromanCityManager extends Model {
        public function getCities() {
            return $this->db->query("SELECT * FROM prmn_cm_city ORDER BY sort, name")->rows;
        }

        public function getMessages($fias_ids = []) {
            if ($fias_ids) {
                $where = $fias_ids ? ' WHERE fias_id IN (' . implode(',', $fias_ids) . ')' : '';
                return $this->db->query("SELECT * FROM prmn_cm_message" . $where)->rows;
            }

            return [];
        }

        public function getRedirects() {
            return $this->db->query("SELECT * FROM prmn_cm_redirect")->rows;
        }

        public function getCurrencyForCountry($country_id) {
            $row = $this->db->query("SELECT code FROM prmn_cm_currency WHERE country_id = " . (int)$country_id)->row;
            return $row ? $row['code'] : false;
        }

        public function getCustomersGroups($fias_ids = []) {
            if (!$fias_ids) {
                return [];
            }

            return $this->db->query("SELECT * FROM prmn_cm_customer_group WHERE fias_id IN (" . implode(',', $fias_ids) . ")")->rows;
        }
}