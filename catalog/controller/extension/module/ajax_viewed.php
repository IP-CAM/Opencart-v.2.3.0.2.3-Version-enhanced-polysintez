<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleAjaxViewed extends Controller {
	public function index($setting) {
				
				
		$this->load->model('setting/setting');
		$xds_coloring = $this->model_setting_setting->getSetting('xds_coloring_theme');
		if (is_array($xds_coloring) && !empty($xds_coloring)) {
			$this->document->addScript('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.min.js');
			$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.css');
			$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.theme.css');		
		}
		
			
		if (isset($this->request->get['product_id'])) {
			$data['product_id'] = (int)$this->request->get['product_id'];//$this->url->link('module/ajax_viewed', 'product_id=' . (int)$this->request->get['product_id']);
		} else {
			$data['product_id'] = 0;
		}
		
		$data['module_setting'] = base64_encode(json_encode($setting));
		
		return $this->load->view('extension/module/ajax_viewed', $data);

	}
		
	
	
	
	public function getproducts() {
		
		$setting = array();
		
		if (isset($this->request->post['setting'])) {
			

		$setting = (array)json_decode(base64_decode($this->request->post['setting']));

		
		$limit = (int)$setting['limit'];
		
		$viewed_products = array();
		
		 if (isset($this->session->data['viewed'])) {
			$viewed_products = $this->session->data['viewed'];
		} elseif(isset($this->request->cookie['viewed'])) {
			$viewed_products = explode(',', $this->request->cookie['viewed']);
		}
	
	   if (isset($this->request->post['product_id']) && $this->request->post['product_id'] != '0') {
            
            $product_id = (string)$this->request->post['product_id'];   
			
			array_unshift($viewed_products, $product_id);
			
			$viewed_products = array_unique($viewed_products);
			

			if(count($viewed_products) >  $limit+1) {
				$viewed_products = array_slice($viewed_products, 0, $limit+1);
			}
			
		
	           
            setcookie('viewed', implode(',',$viewed_products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);

            if (!isset($this->session->data['viewed']) || ($this->session->data['viewed'] != $viewed_products)) {
				   
          		$this->session->data['viewed'] = $viewed_products;
												
        	}
		
			unset($viewed_products[array_search($product_id, $viewed_products)]);
				
        } 

		$viewed_products = array_slice($viewed_products, 0, $limit);
	
		$data['heading_title'] = $setting['name'];

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
		
		$this->load->model('setting/setting');
		$xds_coloring = $this->model_setting_setting->getSetting('xds_coloring_theme');
		if (is_array($xds_coloring) && !empty($xds_coloring)) {
				$language_id = $this->config->get('config_language_id');
				$data['disable_cart_button'] = false;
				if (isset($xds_coloring['xds_coloring_theme_disable_cart_button'])) {
					$data['disable_cart_button'] = $xds_coloring['xds_coloring_theme_disable_cart_button'];
				}
				$data['disable_cart_button_text'] = "";
				if (isset($xds_coloring['xds_coloring_theme_disable_cart_button_text'])) {
					$data['disable_cart_button_text'] = $xds_coloring['xds_coloring_theme_disable_cart_button_text'][$language_id];
				}					
		}
		
		
		foreach ($viewed_products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
					
					$stickers = $this->getStickers($product_info['product_id']) ;

					$data['products'][] = array(
						'quantity'    => $product_info['quantity'],
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'sticker'     => $stickers,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
				
			if(!empty($data['products'])) {
				$this->response->setOutput($this->load->view('extension/module/ajax_viewed_product', $data));
			}
		
		}	
	
	}
	
	private function getStickers($product_id) {
	
 	$stickers = $this->model_catalog_product->getProductStickerbyProductId($product_id) ;	

		
		if (!$stickers) {
			return;
		}
		
		$data['stickers'] = array();
		
		foreach ($stickers as $sticker) {
			$data['stickers'][] = array(
				'position' => $sticker['position'],
				'image'    => HTTP_SERVER . 'image/' . $sticker['image']
			);		
		}
				
		return $this->load->view('product/stickers', $data);
	
	}
	
}
