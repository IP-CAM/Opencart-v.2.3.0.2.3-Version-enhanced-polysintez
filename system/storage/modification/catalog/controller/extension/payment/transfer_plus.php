<?php
class ControllerExtensionPaymentTransferPlus extends Controller {
    private $pretype = 'extension';
    private $type = 'payment';
   	private $name = 'transfer_plus';

    public function index() {
        $data = $this->load->language($this->pretype . '/' . $this->type . '/' . $this->name);

        $data['text_instruction'] = nl2br($this->language->get('text_instruction'));

        $m = $this->getCurrentPayment();

        if (isset($m['info'])) {
		    $data['info'] = html_entity_decode($m['info'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        }
        else {
            $data['info'] = '';
        }

        $data['info'] = str_replace("<p><br></p>", "", $data['info']);

        if (isset($this->session->data['order_id'])) {
            $data['info'] = str_replace("{order_id}", $this->session->data['order_id'], $data['info']);
        }

        if (isset($this->session->data['order_all_total'])) {
            $data['info'] = str_replace("{total}", $this->session->data['order_all_total'], $data['info']);
        }

        $this->session->data['order_payment_info'] = '<h2>'.$data['text_instruction'].'</h2> '.$data['info'];

        $data['button_confirm'] = $this->language->get('button_confirm');
		$data['continue'] = $this->url->link('checkout/success');
        $data['name'] = $this->name;

        return $this->load->view($this->pretype . '/' . $this->type . '/'.$this->name, $data);
        
	}


	public function confirm() {
unset($this->session->data['order_payment_info']);
        $data = $this->load->language($this->pretype . '/' . $this->type . '/' . $this->name);

        $data['text_instruction'] = nl2br($this->language->get('text_instruction'));


        $m = $this->getCurrentPayment();

        if (isset($m['email'])) {
            $comment = html_entity_decode($m['email'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        }
        else {
            $comment = '';
        }

        $comment = str_replace("<p><br></p>", "", $comment);

        if (isset($this->session->data['order_id'])) {
            $comment = str_replace("{order_id}", $this->session->data['order_id'], $comment);
        }

        if (isset($this->session->data['order_all_total'])) {
            $comment = str_replace("{total}", $this->session->data['order_all_total'], $comment);
        }

        $this->session->data['order_payment_info'] = '<h2>'.$data['text_instruction'].'</h2> '.$comment;

        $data['name'] = $this->name;

        if (isset($this->session->data['order_id']) and isset($m['order_status_id'])) {
            $this->load->model('checkout/order');

            $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $m['order_status_id'], $comment, true);
        }
	}


    private function getCurrentPayment() {
        if (isset($this->session->data['payment_method']['code'])) {
            $current_payment_method = $this->session->data['payment_method']['code'];

            $arr_payment_info = explode('.', $current_payment_method);

            $modules = $this->config->get($this->name.'_module');

            if (isset($arr_payment_info[1])) {
                foreach ($modules as $key => $value) {
                    if ($key == $arr_payment_info[1]) {
                        $m = $value;
                        return $m;

                        break;
                    }
                }
            }
        }

        return false;
    }
}
?>