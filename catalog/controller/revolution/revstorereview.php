<?php
class ControllerRevolutionRevstorereview extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('revolution/revstore_review');
		$this->load->language('revolution/revolution');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

		$setting = $this->config->get('revtheme_home_storereview');
		
        $data['heading_title'] = $setting[$this->config->get('config_language_id')]['title'];

		$this->document->setTitle("Отзывы об интернет-магазине компании ПОЛИСИНТЕЗ");
		$this->document->setdescription("На данной странице представлены отзывы клиентов компании Полисинтез о работе интернет-магазина фирмы.");

        $data['text_write'] =  $this->language->get('text_write');
        $data['text_note'] = $this->language->get('text_note');
        $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
        $data['text_loading'] = $this->language->get('text_loading');
		$data['text_product_wr_review'] = $this->language->get('text_product_wr_review');
		$data['text_product_otmena'] = $this->language->get('text_product_otmena');
		$data['text_product_oshibka'] = $this->language->get('text_product_oshibka');
		$data['text_product_spasibo_otz'] = $this->language->get('text_product_spasibo_otz');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_review'] = $this->language->get('entry_review');
        $data['entry_rating'] = $this->language->get('entry_rating');
        $data['entry_good'] = $this->language->get('entry_good');
        $data['entry_bad'] = $this->language->get('entry_bad');

        $data['button_continue'] = $this->language->get('button_continue');

        $this->load->model('revolution/revolution');

        $data['review_status'] = $this->config->get('config_review_status');

        if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
            $data['review_guest'] = true;
        } else {
            $data['review_guest'] = false;
        }

        if ($this->customer->isLogged()) {
            $data['customer_name'] = $this->customer->getFirstName();
        } else {
            $data['customer_name'] = '';
        }

        $data['breadcrumbs'][] = array(
            'text' => $data['heading_title'],
            'href' => $this->url->link('revolution/revstorereview')
        );

        // Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
			if (VERSION >= 2.2) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
			} else {
				$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'));
			}
		} else {
			$data['captcha'] = '';
		}

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');
		$data['entry_answer'] = $this->language->get('entry_answer');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['reviews'] = array();

        $review_total = $this->model_revolution_revolution->getTotalReviews();

        $results = $this->model_revolution_revolution->getReviews(($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'author'     	=> $result['author'],
                'text'       	=> nl2br($result['text']),
				'answer'     	=> $result['answer'],
				'answer_from'   => $result['answer_from'],
                'rating'     	=> (int)$result['rating'],
                'date_added' 	=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $pagination = new Pagination();

        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('revolution/revstorereview', '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($review_total - 10)) ? $review_total : ((($page - 1) * 10) + 10), $review_total, ceil($review_total / 10));

		if ($page == 1) {
		    $this->document->addLink($this->url->link('revolution/revstorereview', '', 'SSL'), 'canonical');
		} elseif ($page == 2) {
		    $this->document->addLink($this->url->link('revolution/revstorereview', '', 'SSL'), 'prev');
		} else {
		    $this->document->addLink($this->url->link('revolution/revstorereview', 'page='. ($page - 1), 'SSL'), 'prev');
		}

		if (10 && ceil($review_total / 10) > $page) {
		    $this->document->addLink($this->url->link('revolution/revstorereview', 'page='. ($page + 1), 'SSL'), 'next');
		}
		
		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revstorereview', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/template/revolution/revstorereview.tpl', $data));
		}

    }

    public function write() {
        $this->load->language('revolution/revstore_review');

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            $data['error_name'] =  $this->language->get('error_name');
            $data['error_text'] =  $this->language->get('error_text');
            $data['error_rating'] =  $this->language->get('error_rating');
            $data['error_captcha'] =  $this->language->get('error_captcha');
            $data['text_success'] = $this->language->get('text_success');


            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $data['error_name'];
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 3000)) {
                $json['error'] = $data['error_text'];
            }
            if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
                $json['error'] = $data['error_rating'];
            }

            if ($this->config->get('config_google_captcha_status')) {
                $recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('config_google_captcha_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);

                $recaptcha = json_decode($recaptcha, true);

                if (!$recaptcha['success']) {
                    $json['error'] = $data['error_captcha'];
                }
            }

            // Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				if (VERSION >= 2.2) {
					$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
				} else {
					$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');
				}

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

            if (!isset($json['error'])) {
                $this->load->model('revolution/revolution');
                $json['success'] = $data['text_success'];

                $this->model_revolution_revolution->addReview($this->request->post);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}