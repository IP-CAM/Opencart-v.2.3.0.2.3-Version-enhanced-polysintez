<?php
class ControllerExtensionFeedGoogleSitemap extends Controller {
	public function index() {
		
		$this->load->model('module/fx_sitemap');
		$host = $this->config->get('config_ssl') ? HTTPS_SERVER : HTTP_SERVER;
		
		$excluded  = $this->check("sitemap.txt");		
		$plus  =  $this->check("add_sitemap.txt");
		
		if (isset($this->request->get['multi'])){
		
			$limit = (isset($this->request->get['limit']) && ((int)$this->request->get['limit'] > 0)) ? (int)$this->request->get['limit'] : 47999;
			
			$url = '';
			
			if (isset($this->request->get['limit'])){
				$url .= '&amp;limit='. (int)$this->request->get['limit'];
			}
			
			if (isset($this->request->get['express'])){
				$url .= '&amp;express='. $this->request->get['express'];
			}
			
			if (isset($this->request->get['save'])){
				$url .= '&amp;save='. $this->request->get['save'].'{n}';
			}
			
			if (isset($this->request->get['file'])){
				$url .= '&amp;file='. $this->request->get['file'].'{n}';
			}
			
			$total_p = $this->model_module_fx_sitemap->getProductsTotal();
			$total = 0;
			if ($total_p < $limit) {
				$total += $this->model_module_fx_sitemap->getCategoriesTotal();
				$total += $this->model_module_fx_sitemap->getManufacturersTotal();
				$total += $this->model_module_fx_sitemap->getAllNewsTotal();
				$total += $this->model_module_fx_sitemap->getAllBlogTotal();
				$total += $this->model_module_fx_sitemap->getMFPTotal();
				$total += $this->model_module_fx_sitemap->getOCFilterTotal();
				$total += $this->model_module_fx_sitemap->getInformationsTotal();
				$total += $this->model_module_fx_sitemap->getCMSBlogTotal();
				$total += $this->model_module_fx_sitemap->getArticlesTotal();
				$total += count($plus) - count($excluded);
			}
			
			$output = '<?xml version="1.0" encoding="utf-8"?>';
			$output .= '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
		
			if (($total + $total_p) > $limit) {
				$num = ceil($total_p / $limit);
				$n = 0;
				do {
					$go = $host . 'index.php?route=feed/google_sitemap&amp;page=' . $n . str_replace("{n}", $n, $url);					
					$file = isset($this->request->get['file']) ? $host . $this->request->get['file'].$n.'.xml' : $go;
					
					$output .= '<sitemap>';
					$output .= '<loc>' . $file . '</loc>';
					$output .= '</sitemap>';
					
					if (isset($this->request->get['file']) && isset($this->request->get['save'])){
						$out = $this->goSitemap($go);
						//file_put_contents($this->request->get['save']. '-' . $n . '.xml', $out);
					}
					
					$n++;
				} while ($n <= $num);
							
			}else{
				$go = $host . 'index.php?route=feed/google_sitemap' . $url;					
				$file = isset($this->request->get['file']) ? $host . $this->request->get['file'].'.xml' : $go;
				
				$output .= '<sitemap>';
				$output .= '<loc>' . $file . '</loc>';
				$output .= '</sitemap>';
				
				if (isset($this->request->get['file']) && isset($this->request->get['save'])){
					$out = $this->goSitemap($go);
				}
			}

				$output .= '</sitemapindex>';
				
				$this->response->addHeader('Content-Type: application/xml');
				$this->response->setOutput($output);

			
		}else{
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			//$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';
			
			$data['limit'] = (isset($this->request->get['limit'])) ? (int)$this->request->get['limit'] : 47999;
			
			$data['limit'] = (isset($this->request->get['page']) && ($this->request->get['page'] == '0')) ? 0 : $data['limit'];
			
			$data['start'] = isset($this->request->get['page']) ? ((int)$this->request->get['page'] - 1)*$data['limit'] : 0;
			
			if ($data['start'] < 0) { $data['start'] = 0; } ;
			
			//$output .= $data['start'].':'.$data['limit'].'-'.$this->request->get['page'].'*'.
			
			//$this->load->model('catalog/product');
			//$this->load->model('tool/image');
			
			//$products = $this->model_catalog_product->getProducts();
			if (isset($this->request->get['express'])){
				$ext = $this->request->get['express'];
				$products = $this->model_module_fx_sitemap->getProductsExpress($data);
				foreach ($products as $product) {
						$output .= '<url>';				
						$output .= '<loc>' . $host . $product['keyword'] . $ext .'</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>1.0</priority>';
						$output .= '</url>';
				}
			}else{
				$products = $this->model_module_fx_sitemap->getProducts($data);
				foreach ($products as $product) {
				
					$date = date_format( new DateTime($product['date_modified']), 'Y-m-d');
					if ($date == '-0001-11-30') { $date = date_format( new DateTime($product['date_added']), 'Y-m-d'); };
					$url= str_replace("&p", "&amp;p", $this->url->link('product/product', 'product_id=' . $product['product_id']));
					
					if (!in_array($url, $excluded)) {
						$output .= '<url>';				
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
						$output .= '<lastmod>' . $date . '</lastmod>'; 
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>1.0</priority>';
						//$output .= '<image:image>';
						//$output .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')) . '</image:loc>';
						//$output .= '<image:caption>' . $product['name'] . '</image:caption>';
						//$output .= '<image:title>' . $product['name'] . '</image:title>';
						//$output .= '</image:image>';
						$output .= '</url>';
					}
				}
			}
			
			if (!isset($this->request->get['page']) || ((int)$this->request->get['page'] == 0)) {
				
				//$this->load->model('catalog/category');

				$cat = $this->getCategories($excluded);
				$output .= $cat[0];

				$this->load->model('catalog/manufacturer');

				$manufacturers = $this->model_module_fx_sitemap->getManufacturers();
				foreach ($manufacturers as $manufacturer) {					
					$url= str_replace("&m", "&amp;m", $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.7</priority>';
						$output .= '</url>';
					}
				}

				// $this->load->model('catalog/information');
				
				$informations = $this->model_module_fx_sitemap->getInformations();

				foreach ($informations as $information) {
					$url= str_replace("&i", "&amp;i", $this->url->link('information/information', 'information_id=' . $information['information_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						//$output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.5</priority>';
						$output .= '</url>';
					}
				}
				
				$blog = $this->model_module_fx_sitemap->getAllBlog(0);
				$route = isset($this->request->get['blog']) ? $this->request->get['blog'] : 'information/blog' ;
				foreach ($blog as $new) {
					$url= str_replace("&b", "&amp;b", $this->url->link( $route, 'blog_id=' . $new['blog_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}

				$news = $this->model_module_fx_sitemap->getAllNews(0);
				$route = isset($this->request->get['blog']) ? $this->request->get['blog'] : 'information/news' ;
				foreach ($news as $new) {
					$url= str_replace("&n", "&amp;n", $this->url->link( $route, 'news_id=' . $new['news_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}

				$articles = $this->model_module_fx_sitemap->getArticles(0);
				$route = isset($this->request->get['article']) ? $this->request->get['article'] : 'information/article' ;
				foreach ($articles as $new) {
					$url= str_replace("&n", "&amp;n", $this->url->link( $route, 'article=' . $new['article_id']));
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$blog = $this->model_module_fx_sitemap->getCMSBlog(0);
				$route = 'record/record' ;
				foreach ($blog as $new) {					
					$url= str_replace("&r", "&amp;r", $this->url->link( $route, 'record_id=' . $new['record_id']));
					$date = date_format( new DateTime($new['date_modified']), 'Y-m-d');
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<lastmod>' . $date . '</lastmod>'; 
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$mfp = $this->model_module_fx_sitemap->getMFP(0);
				foreach ($mfp as $new) {
					$url= $host.$new['path'].'/'.$new['alias'];
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				$ocf = $this->model_module_fx_sitemap->getOCFilter(0);
				foreach ($ocf as $new) {
					$url= str_replace("&p", "&amp;p", $this->url->link('product/category', 'path=' . $new['category_id'])).$new['keyword'];
					if (!in_array($url, $excluded)) {
						$output .= '<url>';
						$output .= '<loc>' . $url . '</loc>';
						$output .= '<changefreq>weekly</changefreq>';
						$output .= '<priority>0.9</priority>';
						$output .= '</url>';
					}
				}
				
				foreach ($plus as $p) {
					$output .= '<url>';
					$output .= '<loc>' . str_replace("&", "&amp;", $p) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<priority>0.9</priority>';
					$output .= '</url>';
				}
			
			}
			//$output .= $this->getCategories(0);
			$output .= '</urlset>';
			
			$output = str_replace('<lastmod>-0001-11-30</lastmod>', '', $output);

			
			if (isset($this->request->get['file'])){
				file_put_contents($this->request->get['file'].'.xml', $output);
				echo('<h1 style="position: absolute; top:50%; left: 50%">Saved<h1>');
			}else{
				$this->response->addHeader('Content-Type: application/xml');
				$this->response->setOutput($output);
			}
		}
		
	}

	protected function goSitemap($url){
	
		//print(file_get_contents($url));/*
		$headers = array('HTTP_ACCEPT: Something', 'HTTP_ACCEPT_LANGUAGE: ru, en, da, nl', 'HTTP_CONNECTION: Something');
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.1 (compatible; MSIE 6.0; Windows NT 5.1; FX Sitemap)');
		curl_setopt($ch, CURLOPT_URL, str_replace("&amp;", "&", $url));
		$pagecode = curl_exec( $ch );
		curl_close($ch);
		return $pagecode;
	}
	
	protected function addhost($url, $host){
		$outurl = $host.$url;
		return $outurl;
	}
		
	protected function check($var){		
		$arr = mb_split("\n",file_get_contents(DIR_CONFIG.$var));
		
		foreach ($arr as $key=>&$value) {
			if (strlen($value) < 10) {
				unset($arr[$key]);
			}
		}
		
		return $arr;
	}
	
	protected function getCategories($exclude) {		
		$results = $this->model_module_fx_sitemap->getCategories();
		$total = count($results);
		$output ='';
		
		foreach ($results as $result) {
			
			$date = date_format( new DateTime($result['date_modified']), 'Y-m-d');
			if ($date == '-0001-11-30') { $date = date_format( new DateTime($result['date_added']), 'Y-m-d'); };
			
			$url= str_replace("&p", "&amp;p", $this->url->link('product/category', 'path=' . $result['category_id']));
			
			if (!in_array($url, $exclude)) {
				$output .= '<url>';
				$output .= '<loc>' . $url . '</loc>';
				$output .= '<lastmod>' . $date . '</lastmod>'; 
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.7</priority>';
				$output .= '</url>';
			}
		}

		//return $output;
		return array($output, $total);
	}
}
