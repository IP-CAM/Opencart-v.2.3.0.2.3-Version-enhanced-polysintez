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

    public function test() {
        $filter_data = array(
            'reset_code' => token(40),
            'email' => 'support@opencart.market'
        );
        
        $this->customerForgotten($filter_data);
    }

    //$data['order_id'] - #заказа;
    //$data['order_status_id'] -  новый id стауса заказа
    //$data['admin_comment'] - коммент админа (инструкции);
    //$data['attachment'] -  прикрепление к письму вложений
    public function confirmOrder($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_new_status')) {
            return false;
        }

		    $order_id = isset($data['order_id']) ? (int)$data['order_id'] : 0;
		    $order_status_id = isset($data['order_status_id']) ? (int)$data['order_status_id'] : 0;
		    $admin_comment = isset($data['admin_comment']) && $data['admin_comment'] ? $data['admin_comment'] : '';
		    $attachment = isset($data['attachment']) && $data['attachment'] ? $data['attachment'] : '';
		    
		    $filter_data = array(
            'type'            => 'new_order',
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id,
            'admin_comment'   => $admin_comment
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $result['output']['email'];

		    $subject = $this->config->get('shoputils_mail_order_status_new_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_new_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'customer', $to, $attachment);
				return true;
    }

    //$data['order_id'] - #заказа;
    //$data['order_status_id'] -  новый id стауса заказа
    //$data['admin_comment'] - коммент админа (инструкции);
    //$data['attachment'] -  прикрепление к письму вложений
    public function confirmOrderAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_new_status')) {
            return false;
        }

		    $order_id = isset($data['order_id']) ? (int)$data['order_id'] : 0;
		    $order_status_id = isset($data['order_status_id']) ? (int)$data['order_status_id'] : 0;
		    $admin_comment = isset($data['admin_comment']) && $data['admin_comment'] ? $data['admin_comment'] : '';
		    $attachment = isset($data['attachment']) && $data['attachment'] ? $data['attachment'] : '';

		    $filter_data = array(
            'type'            => 'new_order',
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id,
            'admin_comment'   => $admin_comment
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_new_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_new_content');
		    $content = $content[(int)$result['output']['language_id']];

		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to, $attachment);
				return true;
    }

    //$data['order_id'] - #заказа;
    //$data['order_status_id'] -  новый id стауса заказа
    //$data['admin_comment'] - коммент админа (инструкции)
    //$data['admin_notify'] - галка "Уведомить покупателя" из истории "Заказы->Продажи"
    //$data['send'] - true - отправка письма, false - проверка на возможность отправки
    //$data['trackcode'] - $data['trackcode'] из model/sale/order для {trackcode} и {trackcode_link}
    //$data['attachment'] -  прикрепление к письму вложений
    //public function updateOrder($order_id, $order_status_id, $admin_comment = '', $admin_notify = true, $send = true, $trackcode = '', $attachment = false) {
    public function updateOrder($data = array()) {
		    $order_id = isset($data['order_id']) ? (int)$data['order_id'] : 0;
		    $order_status_id = isset($data['order_status_id']) ? (int)$data['order_status_id'] : 0;
		    $admin_comment = isset($data['admin_comment']) && $data['admin_comment'] ? $data['admin_comment'] : '';
		    $admin_notify = isset($data['admin_notify']) ? $data['admin_notify'] : true;
		    $send = isset($data['send']) ? $data['send'] : true;
		    $trackcode = isset($data['trackcode']) && $data['trackcode'] ? $data['trackcode'] : '';
		    $attachment = isset($data['attachment']) && $data['attachment'] ? $data['attachment'] : '';

        if (!$this->config->get('shoputils_mail_order_status_status' . $order_status_id)) {
            return false;
        }

        if ($this->config->get('shoputils_mail_order_status_notify' . $order_status_id) && !$admin_notify) {
            return false;
        }

		    $filter_data = array(
            'type'            => 'update_order',
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id,
            'admin_comment'   => $admin_comment,
            'trackcode'       => $trackcode
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $result['output']['email'];

		    $subject = $this->config->get('shoputils_mail_order_status_subject' . $order_status_id);
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_content' . $order_status_id);
		    $content = $content[(int)$result['output']['language_id']];

		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				if ($send) {
            $this->mail_templates->sendMail($subject, $content, 'customer', $to, $attachment);
				}

				return true;
    }

    //$data['order_id'] - #заказа;
    //$data['order_status_id'] -  новый id стауса заказа
    //$data['admin_comment'] - коммент админа (инструкции)
    //$data['admin_notify'] - галка "Уведомить покупателя" из истории "Заказы->Продажи"
    //$data['send'] - true - отправка письма, false - проверка на возможность отправки
    //$data['trackcode'] - $data['trackcode'] из model/sale/order для {trackcode} и {trackcode_link}
    //$data['attachment'] -  прикрепление к письму вложений
    //public function updateOrderAdmin($order_id, $order_status_id, $admin_comment = '', $trackcode = '', $attachment = false) {
    public function updateOrderAdmin($data) {
		    $order_id = isset($data['order_id']) ? (int)$data['order_id'] : 0;
		    $order_status_id = isset($data['order_status_id']) ? (int)$data['order_status_id'] : 0;
		    $admin_comment = isset($data['admin_comment']) && $data['admin_comment'] ? $data['admin_comment'] : '';
		    $admin_notify = isset($data['admin_notify']) ? $data['admin_notify'] : true;
		    $send = isset($data['send']) ? $data['send'] : true;
		    $trackcode = isset($data['trackcode']) && $data['trackcode'] ? $data['trackcode'] : '';
		    $attachment = isset($data['attachment']) && $data['attachment'] ? $data['attachment'] : '';

        if (!$this->config->get('shoputils_mail_order_status_admin_status' . $order_status_id)) {
            return false;
        }

		    $filter_data = array(
            'type'            => 'update_order',
            'order_id'        => $order_id,
            'order_status_id' => $order_status_id,
            'admin_comment'   => $admin_comment,
            'trackcode'       => $trackcode
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_subject' . $order_status_id);
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_content' . $order_status_id);
		    $content = $content[(int)$result['output']['language_id']];

		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

        $this->mail_templates->sendMail($subject, $content, 'admin', $to, $attachment);

				return true;
    }

    //$data['password'] - новый пароль;
    //$data['email'] - email, с которого запрошено восстановление пароля;
    public function customerForgotten($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_customer_forgotten_status')) {
            return false;
        }

        if ((!isset($data['reset_code']) && empty($data['reset_code'])) || (!isset($data['email']) && empty($data['email']))) {
            return false;
        }
        
        $this->load->model('account/customer');
        
		    $reset_code = $data['reset_code'];
		    $email = $data['email'];

        $customer_info = $this->model_account_customer->getCustomerByEmail($email);
        
        if (!$customer_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'            => 'customer_forgotten',
            'password'        => $reset_code,
            'email'           => $email,
            'customer_info'   => $customer_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $email;

		    $subject = $this->config->get('shoputils_mail_order_status_customer_forgotten_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_customer_forgotten_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'customer', $to);
				return true;
    }

    //$data['password'] - новый пароль;
    //$data['email'] - email, с которого запрошено восстановление пароля;
    public function customerForgottenAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_customer_forgotten_status')) {
            return false;
        }

        if ((!isset($data['reset_code']) && empty($data['reset_code'])) || (!isset($data['email']) && empty($data['email']))) {
            return false;
        }
        
        $this->load->model('account/customer');
        
		    $reset_code = $data['reset_code'];
		    $email = $data['email'];

        $customer_info = $this->model_account_customer->getCustomerByEmail($email);
        
        if (!$customer_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'            => 'customer_forgotten',
            'password'        => $reset_code,
            'email'           => $email,
            'customer_info'   => $customer_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_customer_forgotten_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_customer_forgotten_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }

    //$data['password'] - новый пароль;
    //$data['email'] - email, с которого запрошено восстановление пароля;
    public function affiliateForgotten($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_affiliate_forgotten_status')) {
            return false;
        }

        if ((!isset($data['password']) && empty($data['password'])) || (!isset($data['email']) && empty($data['email']))) {
            return false;
        }
        
        $this->load->model('affiliate/affiliate');
        
		    $password = $data['password'];
		    $email = $data['email'];

        $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByEmail($email);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'            => 'affiliate_forgotten',
            'password'        => $password,
            'email'           => $email,
            'customer_info'   => $affiliate_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = $email;

		    $subject = $this->config->get('shoputils_mail_order_status_affiliate_forgotten_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_affiliate_forgotten_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'affiliate', $to);
				return true;
    }

    //$data['password'] - новый пароль;
    //$data['email'] - email, с которого запрошено восстановление пароля;
    public function affiliateForgottenAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_affiliate_forgotten_status')) {
            return false;
        }

        if ((!isset($data['password']) && empty($data['password'])) || (!isset($data['email']) && empty($data['email']))) {
            return false;
        }
        
        $this->load->model('affiliate/affiliate');
        
		    $password = $data['password'];
		    $email = $data['email'];

        $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByEmail($email);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'            => 'affiliate_forgotten',
            'password'        => $password,
            'email'           => $email,
            'customer_info'   => $affiliate_info
		    );
		    
		    $result = $this->mail_templates->getDataInfo($filter_data);
		    
		    if (!$result) {
            return false;
		    }
		    
		    if (!$result['output']['language_id']) {
            $result['output']['language_id'] = 1;
		    }
		    
		    $to = '';

		    $subject = $this->config->get('shoputils_mail_order_status_admin_affiliate_forgotten_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_affiliate_forgotten_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }

    //$data['customer_id'] - ID покупателя;
    //$data['data'] - данные регистрации покупателя;
    public function customerRegister($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_customer_register_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('account/customer');
        $this->load->model('account/address');
        
        $customer_id = $data['customer_id'];

        $customer_info = $this->model_account_customer->getCustomer($customer_id);
        
        if (!$customer_info) {
            return false;
        }

        $address_info = $this->model_account_address->getAddress($customer_info['address_id']);
        
        if (!$address_info) {
            $address_info = $data['data'];
        }

        $customer_info = array_merge($address_info, $customer_info);
		    
		    $email = isset($data['data']['email']) ? $data['data']['email'] : '';
		    
		    if (!$email) {
            return false;
		    }
		    
		    $filter_data = array(
            'type'          => 'customer_register',
            'data'          => $data['data'],
            'customer_id'   => $customer_id,
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

		    $subject = $this->config->get('shoputils_mail_order_status_customer_register_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_customer_register_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'customer', $to);
				return true;
    }

    //$data['customer_id'] - ID покупателя;
    //$data['data'] - данные регистрации покупателя;
    public function customerRegisterAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_customer_register_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('account/customer');
        $this->load->model('account/address');
        
        $customer_id = $data['customer_id'];

        $customer_info = $this->model_account_customer->getCustomer($customer_id);
        
        if (!$customer_info) {
            return false;
        }

        $address_info = $this->model_account_address->getAddress($customer_info['address_id']);
        
        if (!$address_info) {
            $address_info = $data['data'];
        }

        $customer_info = array_merge($address_info, $customer_info);
		    
		    $filter_data = array(
            'type'          => 'customer_register',
            'data'          => $data['data'],
            'customer_id'   => $customer_id,
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

		    $subject = $this->config->get('shoputils_mail_order_status_admin_customer_register_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_customer_register_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'admin', $to);
				return true;
    }

    //$data['affiliate_id'] - ID партнера;
    //$data['data'] - данные регистрации пфртнера;
    public function affiliateRegister($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_affiliate_register_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('affiliate/affiliate');
        
		    $affiliate_id = $data['affiliate_id'];

        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($affiliate_id);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $email = isset($data['data']['email']) ? $data['data']['email'] : '';
		    
		    if (!$email) {
            return false;
		    }
		    
		    $filter_data = array(
            'type'          => 'affiliate_register',
            'data'          => $data['data'],
            'customer_id'   => $affiliate_id,
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

		    $subject = $this->config->get('shoputils_mail_order_status_affiliate_register_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_affiliate_register_content');
		    $content = $content[(int)$result['output']['language_id']];
    
		    $subject = html_entity_decode(trim(str_replace($result['input'], $result['output'], $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($result['input'], $result['output'], $content), ENT_QUOTES, 'UTF-8');

				$this->mail_templates->sendMail($subject, $content, 'affiliate', $to);
				return true;
    }

    //$data['affiliate_id'] - ID партнера;
    //$data['data'] - данные регистрации пфртнера;
    public function affiliateRegisterAdmin($data = array()) {
        if (!$this->config->get('shoputils_mail_order_status_admin_affiliate_register_status')) {
            return false;
        }

        if (!$data) {
            return false;
        }
        
        $this->load->model('affiliate/affiliate');
        
		    $affiliate_id = $data['affiliate_id'];

        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($affiliate_id);
        
        if (!$affiliate_info) {
            return false;
        }
		    
		    $filter_data = array(
            'type'          => 'affiliate_register',
            'data'          => $data['data'],
            'customer_id'   => $affiliate_id,
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

		    $subject = $this->config->get('shoputils_mail_order_status_admin_affiliate_register_subject');
		    $subject = $subject[(int)$result['output']['language_id']];
		    $content = $this->config->get('shoputils_mail_order_status_admin_affiliate_register_content');
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