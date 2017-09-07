<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_bestseller'] = $this->language->get('text_bestseller');
		$data['text_mostviewed'] = $this->language->get('text_mostviewed');
		$data['text_latest'] = $this->language->get('text_latest');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');


				$header_phone = $this->config->get('revtheme_header_phone');
				$data['header_phone_cod'] = $header_phone[$this->config->get('config_language_id')]['cod'];
				$data['header_phone_number'] = $header_phone[$this->config->get('config_language_id')]['number'];
				$data['header_phone_cod2'] = $header_phone[$this->config->get('config_language_id')]['cod2'];
				$data['header_phone_number2'] = $header_phone[$this->config->get('config_language_id')]['number2'];
				$results = $this->config->get('revtheme_footer_icon');
				if (!empty($results)){
					$this->load->model('tool/image');
					foreach ($results as $result) {
						$image = $this->model_tool_image->resize($result['image'], 50, 30);
						$data['revtheme_footer_icons'][] = array(
							'image' => $image,
							'sort'  => $result['sort']
						);
					}
				} else {			
					$data['revtheme_footer_icons'] = false;
				}
				if (!empty($data['revtheme_footer_icons'])){
					foreach ($data['revtheme_footer_icons'] as $key => $value) {
						$sort[$key] = $value['sort'];
					}
					array_multisort($sort, SORT_ASC, $data['revtheme_footer_icons']);
				}				
				$results2 = $this->config->get('revtheme_footer_soc');
				if (!empty($results2)){
					foreach ($results2 as $result) {
						$data['revtheme_footer_socs'][] = array(
							'image' => $result['image'],
							'link'  => $result['link'],
							'title' => $result['title'][$this->config->get('config_language_id')],
							'sort'  => $result['sort']
						);
					}
				} else {
					$data['revtheme_footer_socs'] = false;
				}
				if (!empty($data['revtheme_footer_socs'])){
					foreach ($data['revtheme_footer_socs'] as $key => $value) {
						$sort2[$key] = $value['sort'];
					}
					array_multisort($sort2, SORT_ASC, $data['revtheme_footer_socs']);
				}
				$results_f_links = $this->config->get('revtheme_footer_link');
				if (!empty($results_f_links)){
					foreach ($results_f_links as $result) {
						$data['revtheme_footer_links'][] = array(
							'link'  => $result['link'],
							'title' => $result['title'][$this->config->get('config_language_id')],
							'sort'  => $result['sort']
						);
					}
				} else {
					$data['revtheme_footer_links'] = false;
				}
				if (!empty($data['revtheme_footer_links'])){
					foreach ($data['revtheme_footer_links'] as $key => $value) {
						$sort3[$key] = $value['sort'];
					}
					if (count($data['revtheme_footer_links']) > 1) {
					array_multisort($sort3, SORT_ASC, $data['revtheme_footer_links']);
					}
				}
				$setting_menu = $this->config->get('revtheme_header_menu');
				$data['up_menu_height'] = $setting_menu['up_menu_height'];
				$data['sticky'] = $setting_menu['sticky'];
				$data['image_in_ico'] = $setting_menu['image_in_ico'];
				$data['header_menu_type'] = $setting_menu['type'];
				$setting_footer_all = $this->config->get('revtheme_footer_all');
				$data['in_top'] = $setting_footer_all['in_top'];
				$data['popup_phone'] = $setting_footer_all['popup_phone'];
				$data['f_map'] = $setting_footer_all['f_map'];
				$setting_footer_user_set = $this->config->get('revtheme_footer_user_set');
				$data['user_scripts'] = html_entity_decode($setting_footer_user_set['scripts'], ENT_QUOTES, 'UTF-8');
				$settings_all_settings = $this->config->get('revtheme_all_settings');
				$data['modal_status'] = $settings_all_settings['modal_status'];
				$data['modal_buttons'] = $settings_all_settings['modal_buttons'];
				$data['n_progres'] = $settings_all_settings['n_progres'];
				$this->load->language('revolution/revolution');
				$data['text_footer_popup_phone_tooltip'] = $this->language->get('text_footer_popup_phone_tooltip');
				$data['text_loadmore'] = $this->language->get('text_loadmore');
				$data['description_options'] = $this->config->get('revtheme_cat_attributes');
				$data['setting_catalog_all'] = $this->config->get('revtheme_catalog_all');
				$data['revtheme_header_cart'] = $this->config->get('revtheme_header_cart');
				$data['setting_all_settings'] = $this->config->get('revtheme_all_settings');
				$data['revsubscribe'] = $this->load->controller('revolution/revsubscribe');
				if ($setting_footer_all['f_map']) {
					$data['yamap'] = html_entity_decode($settings_all_settings['yamap'], ENT_QUOTES, 'UTF-8');
					$data['telephone'] = $this->config->get('config_telephone');
					$data['store'] = $this->config->get('config_name');
					$data['address'] = nl2br($this->config->get('config_address'));
					$data['text_contact_ourcontacts'] = $this->language->get('text_contact_ourcontacts');
					$data['settings_all_settings'] = $this->config->get('revtheme_all_settings');
					$results3 = $this->config->get('revtheme_footer_soc');
					if (!empty($results3)){
						$http_s = array("http://", "https://");
						foreach ($results3 as $result) {
							$data['revtheme_footer_socs_p'][] = array(
								'image' => $result['image'],
								'link'  => $result['link'],
								'link_t'  => str_replace($http_s,'',$result['link']),
								'title' => $result['title'][$this->config->get('config_language_id')],
								'sort'  => $result['sort']
							);
						}
					} else {
						$data['revtheme_footer_socs_p'] = false;
					}
					if (!empty($data['revtheme_footer_socs_p'])){
						foreach ($data['revtheme_footer_socs_p'] as $key => $value) {
							$sort3[$key] = $value['sort'];
						}
						array_multisort($sort3, SORT_ASC, $data['revtheme_footer_socs_p']);
					}
					$dop_contact_status = $this->config->get('revtheme_header_dop_contacts_status');
					if ($dop_contact_status){
						$dop_contact = $this->config->get('revtheme_header_dop_contact');
						if (!empty($dop_contact)){
							foreach ($dop_contact as $result) {
								$data['dop_contacts'][] = array(
									'icon' 		=> $result['icon'],
									'number' 	=> $result['number']
								);
							}
						} else {			
							$data['dop_contacts'] = false;
						}
					} else {			
						$data['dop_contacts'] = false;
					}
				}
			
		$data['informations'] = array();

		//opencart turbo start
		
		$cache_data = null;
		
		if ($this->config->get('turbo_information') && $this->config->get('turbo_status')) {
			$cache = 'turbo.footer_information.' . $this->language->get('code') . '.' . $this->config->get('config_store_id');
			$cache_data = $this->cache->get($cache);
		}
		
		if (!empty($cache_data) && is_array($cache_data)) {	
			$data['informations'] = $cache_data;	
		} else {	
		//opencart turbo end 
	

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}


		//opencart turbo start
			if ($this->config->get('turbo_information') && $this->config->get('turbo_status')) {
				$this->cache->set($cache, $data['informations']);
			}
		}
		//opencart turbo end 
	
		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['bestseller'] = $this->url->link('product/bestseller');
		$data['mostviewed'] = $this->url->link('product/mostviewed');
		$data['latest'] = $this->url->link('product/latest');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
$data['yandex_metrika'] = $this->config->get('ya_metrika_code') ? html_entity_decode($this->config->get('ya_metrika_code'), ENT_QUOTES, 'UTF-8') : '';
			$data['ya_metrika_active'] = $this->config->get('ya_metrika_active') ? true : false;
			

		
				$domen = $_SERVER['HTTP_HOST'];
				if(stristr($domen, 'xn--')) {
					require_once('catalog/controller/revolution/idna_convert.class.php');
					$idn = new idna_convert(array('idn_version'=>2008));
					$domen = (stripos($domen, 'xn--')!==false) ? $idn->decode($domen) : $idn->encode($domen);
				} else {					
					$domen = $_SERVER['HTTP_HOST'];
				}
				$data['powered'] = sprintf($this->language->get('text_powered_rev'), date('Y', time()));
			

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
