<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleCustomBanner extends Controller {
	public function index() {
		
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/custom_banner.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/custom_banner.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/custom_banner.css');
		}
		
		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		
		$data['text_block_1'] = html_entity_decode($this->config->get('custom_banner_text_block_1'), ENT_QUOTES, 'UTF-8');
		$data['text_block_2'] = html_entity_decode($this->config->get('custom_banner_text_block_2'), ENT_QUOTES, 'UTF-8');
		$data['text_block_3'] = html_entity_decode($this->config->get('custom_banner_text_block_3'), ENT_QUOTES, 'UTF-8');
		$data['text_block_4'] = html_entity_decode($this->config->get('custom_banner_text_block_4'), ENT_QUOTES, 'UTF-8');
		
		$data['link_block_1'] = html_entity_decode($this->config->get('custom_banner_link_block_1'), ENT_QUOTES, 'UTF-8');
		$data['link_block_2'] = html_entity_decode($this->config->get('custom_banner_link_block_2'), ENT_QUOTES, 'UTF-8');
		$data['link_block_3'] = html_entity_decode($this->config->get('custom_banner_link_block_3'), ENT_QUOTES, 'UTF-8');
		$data['link_block_4'] = html_entity_decode($this->config->get('custom_banner_link_block_4'), ENT_QUOTES, 'UTF-8');
		
		$data['ico_block_1'] = html_entity_decode($this->config->get('custom_banner_ico_block_1'), ENT_QUOTES, 'UTF-8');
		$data['ico_block_2'] = html_entity_decode($this->config->get('custom_banner_ico_block_2'), ENT_QUOTES, 'UTF-8');
		$data['ico_block_3'] = html_entity_decode($this->config->get('custom_banner_ico_block_3'), ENT_QUOTES, 'UTF-8');
		$data['ico_block_4'] = html_entity_decode($this->config->get('custom_banner_ico_block_4'), ENT_QUOTES, 'UTF-8');
		
		$data['target_block_1'] = html_entity_decode($this->config->get('custom_banner_target_block_1'), ENT_QUOTES, 'UTF-8');
		$data['target_block_2'] = html_entity_decode($this->config->get('custom_banner_target_block_2'), ENT_QUOTES, 'UTF-8');
		$data['target_block_3'] = html_entity_decode($this->config->get('custom_banner_target_block_3'), ENT_QUOTES, 'UTF-8');
		$data['target_block_4'] = html_entity_decode($this->config->get('custom_banner_target_block_4'), ENT_QUOTES, 'UTF-8');
		
		return $this->load->view('extension/module/custom_banner', $data);

	}
}