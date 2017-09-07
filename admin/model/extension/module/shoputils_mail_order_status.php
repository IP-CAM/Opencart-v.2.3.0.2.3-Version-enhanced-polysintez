<?php
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.2.3.x.RUS.TXT
 * Так же лицензионное соглашение можно найти по адресу:
 * https://opencart.market/LICENSE.2.3.x.RUS.TXT
 * 
 * =================================================================
 * OPENCART/ocStore 2.3.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart/ocStore 2.3.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart/ocStore, кроме Opencart/ocStore 2.3.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart/ocStore.
 * =================================================================
*/

class ModelExtensionModuleShoputilsMailOrderStatus extends Model {
    public function __construct($registry) {
        parent::__construct($registry);
        $this->mail_templates = new Shoputilsmailtemplates($registry);
    }

    //$data['affiliate_id'] - ID партнера;
    //$data['description'] - Описание транзакции;
    //$data['amount'] - Сумма транзакции;
    //$data['order_id'] - ID заказа;
    public function affiliateTransaction($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_affiliate_transaction_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('marketing/affiliate');
        
        $affiliate_id = $data['affiliate_id'];
        $description  = $data['description'];
        $amount       = $data['amount'];
        $total        = $data['total'];
        $order_id     = $data['order_id'];

        $affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $email = $affiliate_info['email'];
		    
		    if (!$email) {
            return false;
		    }
		    
		    $filter_data = array(
            'type'          => 'affiliate_transaction',
            'customer_id'  => $affiliate_id,
            'description'   => $description,
            'amount'        => $amount,
            'total'         => $total,
            'order_id'      => $order_id,
            'customer_info' => $affiliate_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $email;

		    $subject = $this->config->get('shoputils_mail_order_status_affiliate_transaction_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_affiliate_transaction_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'affiliate', $to);
				return true;
    }

    //$data['affiliate_id'] - ID партнера;
    //$data['description'] - Описание транзакции;
    //$data['amount'] - Сумма транзакции;
    //$data['order_id'] - ID заказа;
    public function affiliateTransactionAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_affiliate_transaction_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('marketing/affiliate');
        
        $affiliate_id = $data['affiliate_id'];
        $description  = $data['description'];
        $amount       = $data['amount'];
        $total        = $data['total'];
        $order_id     = $data['order_id'];

        $affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'          => 'affiliate_transaction',
            'customer_id'  => $affiliate_id,
            'description'   => $description,
            'amount'        => $amount,
            'total'         => $total,
            'order_id'      => $order_id,
            'customer_info' => $affiliate_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_affiliate_transaction_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_affiliate_transaction_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }

    //$data['customer_id'] - ID партнера;
    //$data['description'] - Описание транзакции;
    //$data['amount'] - Сумма транзакции;
    //$data['order_id'] - ID заказа;
    public function customerTransaction($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_customer_transaction_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $customer_id  = $data['customer_id'];
        $description  = $data['description'];
        $amount       = $data['amount'];
        $total        = $data['total'];
        $order_id     = $data['order_id'];

        $this->load->model('customer/customer');
        $customer_info = $this->model_customer_customer->getCustomer($customer_id);
        
        if (!$customer_info) {
            return false;
        }

        $address_info = $this->model_customer_customer->getAddress($customer_info['address_id']);
        
        if (!$address_info) {
            return false;
        }

        $customer_info = array_merge($address_info, $customer_info);
		    
		    $email = $customer_info['email'];
		    
		    if (!$email) {
            return false;
		    }
		    
		    $filter_data = array(
            'type'          => 'customer_transaction',
            'customer_id'   => $customer_id,
            'description'   => $description,
            'amount'        => $amount,
            'total'         => $total,
            'order_id'      => $order_id,
            'customer_info' => $customer_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $email;

		    $subject = $this->config->get('shoputils_mail_order_status_customer_transaction_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_customer_transaction_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'customer', $to);
				return true;
    }

    //$data['customer_id'] - ID партнера;
    //$data['description'] - Описание транзакции;
    //$data['amount'] - Сумма транзакции;
    //$data['order_id'] - ID заказа;
    public function customerTransactionAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_customer_transaction_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $customer_id  = $data['customer_id'];
        $description  = $data['description'];
        $amount       = $data['amount'];
        $total        = $data['total'];
        $order_id     = $data['order_id'];

        $this->load->model('customer/customer');
        $customer_info = $this->model_customer_customer->getCustomer($customer_id);
        
        if (!$customer_info) {
            return false;
        }

        $address_info = $this->model_customer_customer->getAddress($customer_info['address_id']);
        
        if (!$address_info) {
            return false;
        }

        $customer_info = array_merge($address_info, $customer_info);
		    
		    $filter_data = array(
            'type'          => 'customer_transaction',
            'customer_id'   => $customer_id,
            'description'   => $description,
            'amount'        => $amount,
            'total'         => $total,
            'order_id'      => $order_id,
            'customer_info' => $customer_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_customer_transaction_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_customer_transaction_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }

    //$data['voucher_info'] - Voucher Info;
    //$data['otder_info'] - Order Info;
    public function voucher($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_voucher_status')) {
            return false;
        }

        if (!$data || !isset($data['voucher_info'])) {
            return false;
        }

		    $order_id = isset($data['order_info']['order_id']) ? (int)$data['order_info']['order_id'] : 0;
		    $order_status_id = isset($data['order_info']['order_status_id']) ? (int)$data['order_info']['order_status_id'] : 0;
   
		    $filter_data = array(
            'type'            => 'voucher',
            'voucher_info'    => $data['voucher_info'],
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $result['output']['email'];

		    $subject = $this->config->get('shoputils_mail_order_status_voucher_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_voucher_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'customer', $to);
				return true;
    }

    //$data['voucher_info'] - Voucher Info;
    //$data['otder_info'] - Order Info;
    public function voucherAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_voucher_status')) {
            return false;
        }

        if (!$data || !isset($data['voucher_info'])) {
            return false;
        }
        
		    $order_id = isset($data['order_info']['order_id']) ? (int)$data['order_info']['order_id'] : 0;
		    $order_status_id = isset($data['order_info']['order_status_id']) ? (int)$data['order_info']['order_status_id'] : 0;
   
		    $filter_data = array(
            'type'            => 'voucher',
            'voucher_info'    => $data['voucher_info'],
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_voucher_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_voucher_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }
}
?>