<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelExtensionTotalLowOrderFee extends Model {
	public function getTotal($total) {
		if ($this->cart->getSubTotal() && ($this->cart->getSubTotal() < $this->config->get('low_order_fee_total'))) {
			$this->load->language('extension/total/low_order_fee');

			$total['totals'][] = array(
				'code'       => 'low_order_fee',
				'title'      => $this->language->get('text_low_order_fee'),
				'value'      => $this->config->get('low_order_fee_fee'),
				'sort_order' => $this->config->get('low_order_fee_sort_order')
			);

			if ($this->config->get('low_order_fee_tax_class_id')) {
				$tax_rates = $this->tax->getRates($this->config->get('low_order_fee_fee'), $this->config->get('low_order_fee_tax_class_id'));

				foreach ($tax_rates as $tax_rate) {
					if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
						$total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
					} else {
						$total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
					}
				}
			}

			$total['total'] += $this->config->get('low_order_fee_fee');
		}
	}
}