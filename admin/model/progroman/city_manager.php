<?php
    class ModelProgromanCityManager extends Model {
        private $country_zones = [];

        public function getCities() {
            return $this->db->query("SELECT * FROM prmn_cm_city ORDER BY sort, name")->rows;
        }

        public function getMessages() {
            return $this->db->query("SELECT * FROM prmn_cm_message")->rows;
        }

        public function getRedirects() {
            return $this->db->query("SELECT * FROM prmn_cm_redirect")->rows;
        }

        public function getCurrencies() {
            return $this->db->query("SELECT * FROM prmn_cm_currency")->rows;
        }

        public function getCustomerGroups() {
            return $this->db->query("SELECT * FROM prmn_cm_customer_group")->rows;
        }

        public function getFiasCountries() {
            return $this->db->query(
                    "SELECT f.fias_id, f.offname fias_name, cf.country_id\n"
                    . "FROM fias f\n"
                    . "LEFT JOIN country_to_fias cf USING(fias_id)"
                    . "WHERE `level` = 0\n"
                    . "ORDER BY offname")->rows;
        }

        public function getFiasRegions() {
            return $this->db->query(
                    "SELECT f.fias_id, CONCAT(f.offname, ' ', f.shortname) fias_name, zf.zone_id, z.country_id\n"
                    . "FROM fias f\n"
                    . "LEFT JOIN zone_to_fias zf USING(fias_id)"
                    . "LEFT JOIN " . DB_PREFIX . "zone z ON z.zone_id = zf.zone_id\n"
                    . "WHERE `level` = 1\n"
                    . "ORDER BY parent_id, offname")->rows;
        }

        public function getZonesForCountry($country_id) {
            if (!$country_id) {
                return [];
            }

            if (!isset($this->country_zones[$country_id])) {
                $this->country_zones[$country_id] = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = " . (int)$country_id . " ORDER BY name")->rows;
            }

            return $this->country_zones[$country_id];
        }

        public function editCities($cities) {
            $query = "INSERT INTO prmn_cm_city (`fias_id`, `name`, `sort`) VALUES\n";
            $values = [];

            foreach ($cities as $city) {
                $values[] = "(" . (int)$city['fias_id'] . ", '" . $this->db->escape($city['name']) . "', " . (int)$city['sort']  . ")";
            }

            $this->db->query($query . implode(", ", $values) . "\nON DUPLICATE KEY UPDATE name = name");
        }

        public function editMessages($messages) {
            $query = "INSERT INTO prmn_cm_message (`fias_id`, `key`, `value`) VALUES\n";
            $values = [];

            foreach ($messages as $message) {
                $values[] = "(" . (int)$message['fias_id'] . ", '" . $this->db->escape($message['key']) . "', '" . $this->db->escape($message['value']) . "')";
            }

            $this->db->query($query . implode(", ", $values));
        }

        public function editRedirects($redirects) {
            $query = "INSERT INTO prmn_cm_redirect (`fias_id`, `url`) VALUES\n";
            $values = [];

            foreach ($redirects as $redirect) {
                $values[] = "(" . (int)$redirect['fias_id'] . ", '" . $this->db->escape($redirect['url']) . "')";
            }

            $this->db->query($query . implode(", ", $values));
        }

        public function editCurrencies($currencies) {
            $query = "INSERT INTO prmn_cm_currency (`country_id`, `code`) VALUES\n";
            $values = [];

            foreach ($currencies as $currency) {
                $values[] = "(" . (int)$currency['country_id'] . ", '" . $this->db->escape($currency['code']) . "')";
            }

            $this->db->query($query . implode(", ", $values));
        }

        public function editCustomerGroups($data) {
            $query = "INSERT INTO prmn_cm_customer_group (`fias_id`, `customer_group_id`) VALUES\n";
            $values = [];

            foreach ($data as $row) {
                $values[] = "(" . (int)$row['fias_id'] . ", '" . (int)$row['customer_group_id'] . "')";
            }

            $this->db->query($query . implode(", ", $values));
        }

        public function editCountryToFias($rows) {
            $query = "INSERT INTO country_to_fias (`country_id`, `fias_id`) VALUES\n";
            $values = [];

            foreach ($rows as $row) {
                if (!empty($row['fias_id']) && !empty($row['country_id'])) {
                    $values[] = "(" . (int)$row['country_id'] . ", '" . (int)$row['fias_id'] . "')";
                }
            }

            if ($values) {
                $this->db->query($query . implode(", ", $values));
            }
        }

        public function editZoneToFias($rows) {
            $query = "INSERT INTO zone_to_fias (`zone_id`, `fias_id`) VALUES\n";
            $values = [];

            foreach ($rows as $row) {
                if (!empty($row['fias_id']) && !empty($row['zone_id'])) {
                    $values[] = "(" . (int)$row['zone_id'] . ", '" . (int)$row['fias_id'] . "')";
                }
            }

            if ($values) {
                $this->db->query($query . implode(", ", $values));
            }
        }

        public function clearCities() {
            $this->db->query("TRUNCATE prmn_cm_city");
        }

        public function clearMessages() {
            $this->db->query("TRUNCATE prmn_cm_message");
        }

        public function clearRedirects() {
            $this->db->query("TRUNCATE prmn_cm_redirect");
        }

        public function clearCurrencies() {
            $this->db->query("TRUNCATE prmn_cm_currency");
        }

        public function clearCustomeprGroups() {
            $this->db->query("TRUNCATE prmn_cm_customer_group");
        }

        public function clearCountryToFias() {
            $this->db->query("TRUNCATE country_to_fias");
        }

        public function clearZoneToFias() {
            $this->db->query("TRUNCATE zone_to_fias");
        }

        public function getFiasName($fiasId) {
            $row = $this->db->query("SELECT CONCAT(shortname, ' ', offname) name FROM fias WHERE fias_id = " . (int)$fiasId)->row;
            return $row ? $row['name'] : null;
        }

        public function findFiasByName($term) {
            $parts = explode(' ', $term, 2);
            $where = '';

            if (isset($parts[1])) {
                $where .= "(f1.offname LIKE '%" . $this->db->escape(utf8_strtolower($parts[0])) . "%'
                        AND (f2.offname LIKE '%" . $this->db->escape(utf8_strtolower($parts[1])) . "%' OR f3.offname LIKE '%" . $this->db->escape(utf8_strtolower($parts[1])) . "%')) OR ";
            }

            $where .= "(f1.offname LIKE '%" . $this->db->escape(utf8_strtolower($term)) . "%')";

            $query = $this->db->query("SELECT CONCAT_WS(', ',
                                                    CONCAT(f1.shortname, ' ', f1.offname),
                                                    CONCAT(f2.offname, ' ', f2.shortname),
                                                    CONCAT(f3.offname, ' ', f3.shortname)) label,
                                            CONCAT(f1.shortname, ' ', f1.offname) value,
                                            f1.fias_id
                                        FROM fias f1
                                            LEFT JOIN fias f2 ON f2.fias_id = f1.parent_id
                                            LEFT JOIN fias f3 ON f3.fias_id = f2.parent_id
                                        WHERE (" . $where . ")
                                            AND f1.level IN (0, 1, 4)
                                        ORDER BY f1.level, f2.level, f3.level
                                        LIMIT 10");

            return $query->rows;
        }
    }