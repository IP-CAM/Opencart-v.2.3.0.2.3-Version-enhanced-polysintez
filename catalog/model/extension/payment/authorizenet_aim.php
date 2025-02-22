<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelExtensionPaymentAuthorizeNetAim extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/authorizenet_aim');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('authorizenet_aim_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('authorizenet_aim_total') > 0 && $this->config->get('authorizenet_aim_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('authorizenet_aim_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'authorizenet_aim',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('authorizenet_aim_sort_order')
			);
		}

		return $method_data;
	}
}