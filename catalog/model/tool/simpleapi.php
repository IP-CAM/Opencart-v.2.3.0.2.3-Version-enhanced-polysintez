<?php
/*
@author Dmitriy Kubarev
@link   http://www.simpleopencart.com
*/

class ModelToolSimpleApi extends Model {
    public function getAddresses($term) {
        $address_data = array();

        $query = $this->db->query("SELECT
                country_id, zone_id, city, postcode
            FROM
                " . DB_PREFIX . "address
            WHERE
                city LIKE '%" . $this->db->escape($term) . "%'
            OR
                postcode LIKE '%" . $this->db->escape($term) . "%'
            GROUP BY
                country_id, zone_id, city, postcode");

        foreach ($query->rows as $result) {
            $country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$result['country_id'] . "'");

            if ($country_query->num_rows) {
                $country = $country_query->row['name'];
                $iso_code_2 = $country_query->row['iso_code_2'];
                $iso_code_3 = $country_query->row['iso_code_3'];
                $address_format = $country_query->row['address_format'];
            } else {
                $country = '';
                $iso_code_2 = '';
                $iso_code_3 = '';
                $address_format = '';
            }

            $zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$result['zone_id'] . "'");

            if ($zone_query->num_rows) {
                $zone = $zone_query->row['name'];
                $zone_code = $zone_query->row['code'];
            } else {
                $zone = '';
                $zone_code = '';
            }

            $address_data[] = array(
                'postcode'       => $result['postcode'],
                'city'           => $result['city'],
                'zone_id'        => $result['zone_id'],
                'zone'           => $zone,
                'zone_code'      => $zone_code,
                'country_id'     => $result['country_id'],
                'country'        => $country,
                'address_format' => $address_format
            );
        }

        return $address_data;
    }

    public function getProductsByName($name) {
        $query = $this->db->query("SELECT
                *
            FROM
                " . DB_PREFIX . "product p
            LEFT JOIN
                " . DB_PREFIX . "product_description pd
            ON
                (p.product_id = pd.product_id)
            WHERE
                pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
            AND
                (pd.name LIKE '" . $this->db->escape($name) . "%' OR p.model LIKE '" . $this->db->escape($name) . "%')
            GROUP BY
                p.product_id
            ORDER BY
                name ASC
            LIMIT 0, 20");

        return $query->rows;
    }

    public function getZonesByName($name) {
        $query = $this->db->query("SELECT
                z.zone_id,
                z.name AS zone_name,
                c.name AS country_name
            FROM
                " . DB_PREFIX . "zone z
            LEFT JOIN
                " . DB_PREFIX . "country c
            ON
                z.country_id = c.country_id
            WHERE
                z.name LIKE '%" . $this->db->escape($name) . "%'
            ORDER BY
                z.name ASC");

        return $query->rows;
    }

    public function getZonesByIds($ids) {
        $query = $this->db->query("SELECT
                z.zone_id,
                z.name AS zone_name,
                c.name AS country_name
            FROM
                " . DB_PREFIX . "zone z
            LEFT JOIN
                " . DB_PREFIX . "country c
            ON
                z.country_id = c.country_id
            WHERE
                z.zone_id IN (" . implode(',', $ids) . ")
            ORDER BY
                z.name ASC");

        return $query->rows;
    }
}