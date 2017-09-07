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
final class Shoputilsmailtemplates {
    private $registry;
    private $_http_root;
    private $_SIMPLE_PATH;
    private $_SIMPLE_MODEL;
    private $_SIMPLE_OBJECT;
    private static $_SIMPLE_METHOD = 'getCustomFields';
    private static $_simple_objects = array(
        'order'    => 1,
        'customer' => 2,
        'address'  => 3
    );

    public function __construct($registry) {
        $this->registry = $registry;

        if (defined('HTTP_CATALOG')) { //backend
            $this->_http_root     = isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG;
            $this->_SIMPLE_PATH   = 'model/module/simplecustom.php';
            $this->_SIMPLE_MODEL  = 'module/simplecustom';
            $this->_SIMPLE_OBJECT = 'model_module_simplecustom';
        } else { //frontend
            $this->_http_root     = isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? $this->config->get('config_ssl') : $this->config->get('config_url');
            $this->_SIMPLE_PATH   = 'model/tool/simplecustom.php';
            $this->_SIMPLE_MODEL  = 'tool/simplecustom';
            $this->_SIMPLE_OBJECT = 'model_tool_simplecustom';
        }
    }

    public function __get($name) {
        return $this->registry->get($name);
    }

    public function sendMail($subject, $content, $type, $to = '', $attachment = '') {
        if ($type == 'admin') {
            $to = $this->config->get('config_email');
        }

        $message  = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">' . "\n";
        $message .= '  <head>' . "\n";
        $message .= '    <title>' . html_entity_decode($subject, ENT_QUOTES, 'UTF-8') . '</title>' . "\n";
        $message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
        $message .= '  </head>' . "\n";
        $message .= '  <body>' . $content . '</body>' . "\n";
        $message .= '</html>' . "\n";

        //echo $message;
        //exit;
        /////////////////////////////////
        if (version_compare(VERSION, '2.0.0.0', '>=') && version_compare(VERSION, '2.0.2.0', '<')) { // 2.0.0.0 || 2.0.1 || 2.0.1.1 || 2.0.1.2_rc
            $mail = new Mail($this->config->get('config_mail'));
        } elseif (version_compare(VERSION, '2.0.3.1', '>=')) { // 2.0.3.1 || 2.1.x || 2.2.x
            $mail = new Mail();
            $mail->protocol       = $this->config->get('config_mail_protocol');
            $mail->parameter      = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname  = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username  = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password  = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port      = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout   = $this->config->get('config_mail_smtp_timeout');
        } else { // 2.0.2.0
            $mail = new Mail();
            $mail->protocol       = $this->config->get('config_mail_protocol');
            $mail->parameter      = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname  = $this->config->get('config_mail_smtp_host');
            $mail->smtp_username  = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password  = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port      = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout   = $this->config->get('config_mail_smtp_timeout  ');
        }

        $mail->setTo($to);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($message);
        if ($attachment) {
            $mail->addAttachment($attachment);
        }
        $mail->send();

        if ($type == 'admin' && is_string($this->config->get('config_alert_email'))) {
            $emails = explode(',', $this->config->get('config_alert_email'));
            $regexp = $this->config->get('config_mail_regexp') ?: '/^[^\@]+@.*.[a-z]{2,15}$/i';
            foreach ($emails as $email) {
                if ($email && preg_match($regexp, $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }
    }

    public function getDataInfo($data = array()) {
        if (!$data || !isset($data['type'])) {
            return array();
        }

        $result['input'] = array(
            '{store_name}',
            '{store}',
            '{logo}',
            '{date_time_now}',
            '{date_now}',
            '{time_now}'
        );

        $result['output'] = array(
            'store_name'    => $this->config->get('config_name'),
            'store'         => '<a href="' . $this->_http_root . '">' . $this->config->get('config_name') . '</a>',
            'logo'          => '<a href="' . $this->_http_root . '"><img src="' . $this->_http_root . 'image/' . $this->config->get('config_logo') . '" /></a>',
            'date_time_now' => date($this->config->get('shoputils_mail_order_status_date_time_format')),
            'date_now'      => date($this->config->get('shoputils_mail_order_status_date_format')),
            'time_now'      => date($this->config->get('shoputils_mail_order_status_time_format'))
        );

        switch ($data['type']) {
            case 'new_order':
            case 'update_order':
            case 'voucher':
                if (!isset($data['order_id'])) {
                    return array();
                }

                $order_info = $this->getOrder((int)$data['order_id']);

                if (!$order_info) {
                    return array();
                }
                
                $order_status_id = isset($data['order_status_id']) ? (int)$data['order_status_id'] : 0;
                $admin_comment = isset($data['admin_comment']) ? $data['admin_comment'] : '';
                $trackcode = isset($data['trackcode']) ? $data['trackcode'] : '';

                $order_link = $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_info['order_id'];
                $trackcode_link = 'http://gdeposylka.ru/' . $trackcode;
                $trackcode_link2 = 'https://moyaposylka.ru/' . $trackcode;

                $result['input'] = array_merge($result['input'], array(
                    '{order_id}',
                    '{language_id}',
                    '{order_status}',
                    '{order_link}',
                    '{comment}',
                    '{admin_comment}',
                    '{ip}',
                    '{date_added}',
                    '{date_modified}',
                    '{firstname}',
                    '{lastname}',
                    '{group}',
                    '{email}',
                    '{telephone}',
                    '{products}',
                    '{totals}',
                    '{total}',
                    '{shipping_total}',
                    '{product_first}',
                    '{product_last}',

                    '{payment_firstname}',
                    '{payment_lastname}',
                    '{payment_company}',
                    '{payment_address_1}',
                    '{payment_address_2}',
                    '{payment_city}',
                    '{payment_postcode}',
                    '{payment_country}',
                    '{payment_zone}',
                    '{payment_method}',

                    '{shipping_firstname}',
                    '{shipping_lastname}',
                    '{shipping_company}',
                    '{shipping_address_1}',
                    '{shipping_address_2}',
                    '{shipping_city}',
                    '{shipping_postcode}',
                    '{shipping_country}',
                    '{shipping_zone}',
                    '{shipping_method}'
                ));

                $result['output'] = array_merge($result['output'], array(
                    'order_id'            => $order_info['order_id'],
                    'language_id'         => $order_info['language_id'],
                    'order_status'        => $this->getOrderStatusById($order_status_id, $order_info['language_id']),
                    'order_link'          => sprintf('<a href="%1$s" target="_blank">%1$s</a>', $order_link),
                    'comment'             => nl2br($order_info['comment']),
                    'admin_comment'       => nl2br($admin_comment),
                    'ip'                  => $order_info['ip'],
                    'date_added'          => $order_info['date_added'],
                    'date_modified'       => $order_info['date_modified'],
                    'firstname'           => $order_info['firstname'],
                    'lastname'            => $order_info['lastname'],
                    'group'               => $this->getCustomerGroup($order_info['customer_group_id']),
                    'email'               => $order_info['email'],
                    'telephone'           => $order_info['telephone'],
                    'products'            => $this->getProducts($order_info['order_id']),
                    'totals'              => $this->getTotals($order_info['order_id'], $order_info['currency_code'], $order_info['currency_value']),
                    'total'               => $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value']),
                    'shipping_total'      => $this->getShippingTotal($order_info['order_id'], $order_info['currency_code'], $order_info['currency_value']),
                    'product_first'       => $this->getProductFirst($order_info['order_id']),
                    'product_last'        => $this->getProductLast($order_info['order_id']),

                    'payment_firstname'   => $order_info['payment_firstname'],
                    'payment_lastname'    => $order_info['payment_lastname'],
                    'payment_company'     => $order_info['payment_company'],
                    'payment_address_1'   => $order_info['payment_address_1'],
                    'payment_address_2'   => $order_info['payment_address_2'],
                    'payment_city'        => $order_info['payment_city'],
                    'payment_postcode'    => $order_info['payment_postcode'],
                    'payment_country'     => $order_info['payment_country'],
                    'payment_zone'        => $order_info['payment_zone'],
                    'payment_method'      => $order_info['payment_method'],

                    'shipping_firstname'  => $order_info['shipping_firstname'],
                    'shipping_lastname'   => $order_info['shipping_lastname'],
                    'shipping_company'    => $order_info['shipping_company'],
                    'shipping_address_1'  => $order_info['shipping_address_1'],
                    'shipping_address_2'  => $order_info['shipping_address_2'],
                    'shipping_city'       => $order_info['shipping_city'],
                    'shipping_postcode'   => $order_info['shipping_postcode'],
                    'shipping_country'    => $order_info['shipping_country'],
                    'shipping_zone'       => $order_info['shipping_zone'],
                    'shipping_method'     => $order_info['shipping_method']
                ));
                
                
                if ($data['type'] == 'update_order') {
                    $result['input'] = array_merge($result['input'], array(
                        '{trackcode}',
                        '{trackcode_link}',
                        '{trackcode_link2}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'trackcode'           => $trackcode,
                        'trackcode_link'      => $trackcode ? sprintf('<a href="%1$s" target="_blank">%1$s</a>', $trackcode_link) : '',
                        'trackcode_link2'     => $trackcode ? sprintf('<a href="%1$s" target="_blank">%1$s</a>', $trackcode_link2) : ''
                    ));
                }

                if ($data['type'] == 'voucher') {
                    $voucher_info = $data['voucher_info'];
                    
                    if (!isset($voucher_info['image']) || !isset($voucher_info['name']) || !isset($voucher_info['theme'])) {
                        $voucher_info = array_merge($this->getVoucherTheme($voucher_info['voucher_theme_id']), $voucher_info); //При вызове из админки некоторых ключей, таких как 'image', 'name', 'theme' может не существовать, возьмем их из темы серификата.
                        
                        if (!isset($voucher_info['theme'])) {
                            $voucher_info['theme'] = $voucher_info['name'];
                        }
                    }
                    
                    $voucher_amount = $this->currency->format($voucher_info['amount'], $order_info['currency_code'], $order_info['currency_value']);
                    $voucher_image = $this->imageResize($voucher_info['image'], $this->config->get('shoputils_mail_order_status_product_image_w'), $this->config->get('shoputils_mail_order_status_product_image_h'));

                    $result['input'] = array_merge($result['input'], array(
                        '{voucher_code}',
                        '{voucher_from_name}',
                        '{voucher_from_email}',
                        '{voucher_to_name}',
                        '{voucher_to_email}',
                        '{voucher_message}',
                        '{voucher_amount}',
                        '{voucher_image}',
                        '{voucher_name}',
                        '{voucher_theme}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'voucher_code'        => $voucher_info['code'],
                        'voucher_from_name'   => $voucher_info['from_name'],
                        'voucher_from_email'  => $voucher_info['from_email'],
                        'voucher_to_name'     => $voucher_info['to_name'],
                        'voucher_to_email'    => $voucher_info['to_email'],
                        'voucher_message'     => nl2br($voucher_info['message']),
                        'voucher_amount'      => $voucher_amount,
                        'voucher_image'       => '<img src="' . $voucher_image . '" />',
                        'voucher_name'        => $voucher_info['name'],
                        'voucher_theme'       => $voucher_info['theme']
                    ));
                }

                $filter_data = array(
                    'order_id'    => $order_info['order_id'],
                    'language_id' => $order_info['language_id']
                );
                
                $simple_data = $this->getSimpleDataInfo($filter_data);
                
                if ($simple_data) {
                    $result['input'] = array_merge($result['input'], $simple_data['input']);
                    $result['output'] = array_merge($result['output'], $simple_data['output']);
                }
                
                return $result;

            case 'customer_register':
            case 'affiliate_register':
            case 'customer_transaction':
            case 'affiliate_transaction':
                if (!isset($data['customer_info'])) {
                    return array();
                }

                $customer_id = (int)$data['customer_id'];
                $password = isset($data['data']['password']) ? $data['data']['password'] : '';

                if (($data['type'] == 'customer_register') || ($data['type'] == 'customer_transaction')) {
                    $account_link = defined('HTTP_CATALOG') ? $this->_http_root . 'index.php?route=account/account' : $this->url->link('account/account', '', 'SSL');
                } else {
                    $account_link = defined('HTTP_CATALOG') ? $this->_http_root . 'index.php?route=affiliate/account' : $this->url->link('affiliate/account', '', 'SSL');
                }

                $result['input'] = array_merge($result['input'], array(
                    '{language_id}',
                    '{account_link}',
                    '{ip}',
                    '{date_added}',
                    '{firstname}',
                    '{lastname}',
                    '{email}',
                    '{telephone}',
                    '{fax}',

                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{country}',
                    '{zone}'
                    
                ));

                $result['output'] = array_merge($result['output'], array(
                    'language_id'         => $this->config->get('config_language_id'),
                    'account_link'        => sprintf('<a href="%1$s" target="_blank">%1$s</a>', $account_link),
                    'ip'                  => $data['customer_info']['ip'],
                    'date_added'          => $data['customer_info']['date_added'],
                    'firstname'           => $data['customer_info']['firstname'],
                    'lastname'            => $data['customer_info']['lastname'],
                    'email'               => $data['customer_info']['email'],
                    'telephone'           => $data['customer_info']['telephone'],
                    'fax'                 => $data['customer_info']['fax'],

                    'company'             => $data['customer_info']['company'],
                    'address_1'           => $data['customer_info']['address_1'],
                    'address_2'           => $data['customer_info']['address_2'],
                    'city'                => $data['customer_info']['city'],
                    'postcode'            => $data['customer_info']['postcode'],
                    'country'             => $this->getCountry($data['customer_info']['country_id']),
                    'zone'                => $this->getZone($data['customer_info']['zone_id'])
                ));
                
                if (($data['type'] == 'customer_register') || ($data['type'] == 'customer_transaction')) {
                    $result['input'] = array_merge($result['input'], array(
                        '{group}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'group' => $this->getCustomerGroup($data['customer_info']['customer_group_id'])
                    ));
                }

                if (($data['type'] == 'customer_register') || ($data['type'] == 'affiliate_register')) {
                    $result['input'] = array_merge($result['input'], array(
                        '{password}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'password' => $password
                    ));
                }


                if (($data['type'] == 'affiliate_register') || ($data['type'] == 'affiliate_transaction')) {
                    $result['input'] = array_merge($result['input'], array(
                        '{website}',
                        '{tax}',
                        '{payment}',
                        '{cheque}',
                        '{paypal}',
                        '{bank_name}',
                        '{bank_branch_number}',
                        '{bank_swift_code}',
                        '{bank_account_name}',
                        '{bank_account_number}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'website'             => $data['customer_info']['website'],
                        'tax'                 => $data['customer_info']['tax'],
                        'payment'             => $this->getAffiliatePaymentMethod($data['customer_info']['payment']),
                        'cheque'              => $data['customer_info']['cheque'],
                        'paypal'              => $data['customer_info']['paypal'],
                        'bank_name'           => $data['customer_info']['bank_name'],
                        'bank_branch_number'  => $data['customer_info']['bank_branch_number'],
                        'bank_swift_code'     => $data['customer_info']['bank_swift_code'],
                        'bank_account_name'   => $data['customer_info']['bank_account_name'],
                        'bank_account_number' => $data['customer_info']['bank_account_number']
                    ));
                }

                if (($data['type'] == 'customer_transaction') || ($data['type'] == 'affiliate_transaction')) {
                    $result['input'] = array_merge($result['input'], array(
                        '{transaction_description}',
                        '{transaction_amount}',
                        '{transaction_total}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'transaction_description' => $data['description'],
                        'transaction_amount'      => $data['amount'],
                        'transaction_total'       => $data['total']
                    ));
                }

                return $result;

            case 'customer_forgotten':
            case 'affiliate_forgotten':
                if (!isset($data['password']) || !isset($data['email']) || !isset($data['customer_info'])) {
                    return array();
                }

                $customer_id = (int)$data['customer_info']['customer_id'];

                $password = isset($data['password']) ? $data['password'] : '';

                if ($data['type'] == 'customer_forgotten') {
                    $account_link = defined('HTTP_CATALOG') ? $this->_http_root . 'index.php?route=account/account' : $this->url->link('account/account', '', 'SSL');
                    $reset_link = defined('HTTP_CATALOG') ? $this->_http_root . 'index.php?route=account/reset&code=' . $password : $this->url->link('account/reset', 'code=' . $password, 'SSL');
                } else {
                    $account_link = defined('HTTP_CATALOG') ? $this->_http_root . 'index.php?route=affiliate/account' : $this->url->link('affiliate/account', '', 'SSL');
                }

                $result['input'] = array_merge($result['input'], array(
                    '{language_id}',
                    '{account_link}',
                    '{ip}',
                    '{date_added}',
                    '{firstname}',
                    '{lastname}',
                    '{group}',
                    '{email}',
                    '{telephone}',
                    '{fax}'
                ));

                $result['output'] = array_merge($result['output'], array(
                    'language_id'         => $this->config->get('config_language_id'),
                    'account_link'        => sprintf('<a href="%1$s" target="_blank">%1$s</a>', $account_link),
                    'ip'                  => $data['customer_info']['ip'],
                    'date_added'          => $data['customer_info']['date_added'],
                    'firstname'           => $data['customer_info']['firstname'],
                    'lastname'            => $data['customer_info']['lastname'],
                    'group'               => $this->getCustomerGroup($data['customer_info']['customer_group_id']),
                    'email'               => $data['email'],
                    'telephone'           => $data['customer_info']['telephone'],
                    'fax'                 => $data['customer_info']['fax']
                ));

                if ($data['type'] == 'customer_forgotten') {
                    $result['input'] = array_merge($result['input'], array(
                        '{reset_code}',
                        '{reset_link}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'reset_code' => $password,
                        'reset_link' => sprintf('<a href="%1$s" target="_blank">%1$s</a>', $reset_link)
                    ));
                }

                if ($data['type'] == 'affiliate_forgotten') {
                    $result['input'] = array_merge($result['input'], array(
                        '{password}'
                    ));

                    $result['output'] = array_merge($result['output'], array(
                        'password' => $password
                    ));
                }
                
                return $result;

            default:
                return array();
        }
    }

    public function getOrderStatusById($order_status_id, $language_id = false) {
        if (!$language_id) {
          $language_id = (int)$this->config->get('config_language_id');
        }
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . $language_id . "'");
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getCustomerGroup($customer_group_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cg.customer_group_id = '" . (int)$customer_group_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getCountry($country_id) {
        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "country WHERE country_id = '" . (int)$country_id . "' AND status = '1'");
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getZone($zone_id) {
        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getAffiliatePaymentMethod($method) {
        $this->load->language('affiliate/register');
        
        return $this->language->get('text_' . $method);
    }

    public function getTotals($order_id, $currency_code, $currency_value) {
				$order_info = $this->getOrder($order_id);
				if (!$order_info) {
            return '';
				}

		    $totals_ft = $this->config->get('shoputils_mail_order_status_totals_ft');
		    $totals_ft = $totals_ft[(int)$order_info['language_id']];
		    $totals_header_ft = $this->config->get('shoputils_mail_order_status_totals_header_ft');
		    $totals_header_ft = $totals_header_ft[(int)$order_info['language_id']];
		    $totals_footer_ft = $this->config->get('shoputils_mail_order_status_totals_footer_ft');
		    $totals_footer_ft = $totals_footer_ft[(int)$order_info['language_id']];
		    $totals = $this->getOrdertotals($order_id);

				$order_totals = '';
				foreach ($totals as $total) {
            $input = array(
                '{totals_title}',
                '{totals_text}'
            );

            $output = array(
                'totals_title'  => $total['title'],
                'totals_text'   => $this->currency->format($total['value'], $currency_code, $currency_value)
            );
            $order_totals .= str_replace($input, $output, $totals_ft);
			  }

		    return html_entity_decode($totals_header_ft . $order_totals . $totals_footer_ft, ENT_QUOTES, 'UTF-8');
    }

    public function getProducts($order_id) {
				$order_info = $this->getOrder($order_id);
				if (!$order_info) {
            return '';
				}

		    $products_ft = $this->config->get('shoputils_mail_order_status_products_ft');
		    $products_ft = $products_ft[(int)$order_info['language_id']];
		    $products_header_ft = $this->config->get('shoputils_mail_order_status_products_header_ft');
		    $products_header_ft = $products_header_ft[(int)$order_info['language_id']];
		    $products_footer_ft = $this->config->get('shoputils_mail_order_status_products_footer_ft');
		    $products_footer_ft = $products_footer_ft[(int)$order_info['language_id']];
		    $products = $this->getOrderProducts($order_id);

				$order_products = '';
				foreach ($products as $count => $product) {
            $input = array(
                '{products_count}',
                '{products_image}',
                '{products_name}',
                '{products_href}',
                '{products_model}',
                '{products_sku}',
                '{products_upc}',
                '{products_ean}',
                '{products_jan}',
                '{products_isbn}',
                '{products_mpn}',
                '{products_location}',
                '{products_manufacturer}',
                '{products_quantity}',
                '{products_price}',
                '{products_total}',
                '{products_reward}'
            );

            $output = array(
                'products_count'        => $count + 1,
                'products_image'        => (isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank"><img src="' . $product['image'] . '" alt="' . $product['image'] . '" /></a>' : '<img src="' . $product['image'] . '" alt="' . $product['image'] . '" />'),
                'products_name'         => isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank">' . $product['name'] . '</a>' . ($product['options'] ? ' ' . $product['options'] : '') : $product['name'],
                'products_href'         => isset($product['link']) ? $product['link'] : '',
                'products_model'        => isset($product['model']) ? $product['model'] : '',
                'products_sku'          => isset($product['sku']) ? $product['sku'] : '',
                'products_upc'          => isset($product['upc']) ? $product['upc'] : '',
                'products_ean'          => isset($product['ean']) ? $product['ean'] : '',
                'products_jan'          => isset($product['jan']) ? $product['jan'] : '',
                'products_isbn'         => isset($product['isbn']) ? $product['isbn'] : '',
                'products_mpn'          => isset($product['mpn']) ? $product['mpn'] : '',
                'products_location'     => isset($product['location']) ? $product['location'] : '',
                'products_manufacturer' => isset($product['manufacturer']) ? $product['manufacturer'] : '',
                'products_quantity'     => $product['quantity'],
                'products_price'        => $product['price'],
                'products_total'        => $product['total'],
                'products_reward'       => isset($product['reward']) ? $product['reward'] : ''
            );
            $order_products .= str_replace($input, $output, $products_ft);
			  }

		    return html_entity_decode($products_header_ft . $order_products . $products_footer_ft, ENT_QUOTES, 'UTF-8');
    }

    public function getProductFirst($order_id) {
				$order_info = $this->getOrder($order_id);
				if (!$order_info) {
            return '';
				}

		    $product_first_ft = $this->config->get('shoputils_mail_order_status_product_first_ft');
		    $product_first_ft = $product_first_ft[(int)$order_info['language_id']];
		    $products = $this->getOrderProducts($order_id);
		    
		    if (!$products) {
            return '';
		    }

		    $product = $products[0];

				$order_product = '';
        $input = array(
            '{products_count}',
            '{products_image}',
            '{products_name}',
            '{products_href}',
            '{products_model}',
            '{products_sku}',
            '{products_upc}',
            '{products_ean}',
            '{products_jan}',
            '{products_isbn}',
            '{products_mpn}',
            '{products_location}',
            '{products_manufacturer}',
            '{products_quantity}',
            '{products_price}',
            '{products_total}',
            '{products_reward}'
        );

        $output = array(
            'products_count'        => 1,
            'products_image'        => (isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank"><img src="' . $product['image'] . '" alt="' . $product['image'] . '" /></a>' : '<img src="' . $product['image'] . '" alt="' . $product['image'] . '" />'),
            'products_name'         => isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank">' . $product['name'] . '</a>' . ($product['options'] ? ' ' . $product['options'] : '') : $product['name'],
            'products_href'         => isset($product['link']) ? $product['link'] : '',
            'products_model'        => isset($product['model']) ? $product['model'] : '',
            'products_sku'          => isset($product['sku']) ? $product['sku'] : '',
            'products_upc'          => isset($product['upc']) ? $product['upc'] : '',
            'products_ean'          => isset($product['ean']) ? $product['ean'] : '',
            'products_jan'          => isset($product['jan']) ? $product['jan'] : '',
            'products_isbn'         => isset($product['isbn']) ? $product['isbn'] : '',
            'products_mpn'          => isset($product['mpn']) ? $product['mpn'] : '',
            'products_location'     => isset($product['location']) ? $product['location'] : '',
            'products_manufacturer' => isset($product['manufacturer']) ? $product['manufacturer'] : '',
            'products_quantity'     => $product['quantity'],
            'products_price'        => $product['price'],
            'products_total'        => $product['total'],
            'products_reward'       => isset($product['reward']) ? $product['reward'] : ''
        );
        $order_product .= str_replace($input, $output, $product_first_ft);

		    return html_entity_decode($order_product, ENT_QUOTES, 'UTF-8');
    }

    public function getProductLast($order_id) {
				$order_info = $this->getOrder($order_id);
				if (!$order_info) {
            return '';
				}

		    $product_last_ft = $this->config->get('shoputils_mail_order_status_product_last_ft');
		    $product_last_ft = $product_last_ft[(int)$order_info['language_id']];
		    $products = $this->getOrderProducts($order_id);

		    if (!$products) {
            return '';
		    }

		    $product = array_pop($products);

				$order_product = '';
        $input = array(
            '{products_count}',
            '{products_image}',
            '{products_name}',
            '{products_href}',
            '{products_model}',
            '{products_sku}',
            '{products_upc}',
            '{products_ean}',
            '{products_jan}',
            '{products_isbn}',
            '{products_mpn}',
            '{products_location}',
            '{products_manufacturer}',
            '{products_quantity}',
            '{products_price}',
            '{products_total}',
            '{products_reward}'
        );

        $output = array(
            'products_count'        => 1,
            'products_image'        => (isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank"><img src="' . $product['image'] . '" alt="' . $product['image'] . '" /></a>' : '<img src="' . $product['image'] . '" alt="' . $product['image'] . '" />'),
            'products_name'         => isset($product['link']) ? '<a href="' . $product['link'] . '" target="_blank">' . $product['name'] . '</a>' . ($product['options'] ? ' ' . $product['options'] : '') : $product['name'],
            'products_href'         => isset($product['link']) ? $product['link'] : '',
            'products_model'        => isset($product['model']) ? $product['model'] : '',
            'products_sku'          => isset($product['sku']) ? $product['sku'] : '',
            'products_upc'          => isset($product['upc']) ? $product['upc'] : '',
            'products_ean'          => isset($product['ean']) ? $product['ean'] : '',
            'products_jan'          => isset($product['jan']) ? $product['jan'] : '',
            'products_isbn'         => isset($product['isbn']) ? $product['isbn'] : '',
            'products_mpn'          => isset($product['mpn']) ? $product['mpn'] : '',
            'products_location'     => isset($product['location']) ? $product['location'] : '',
            'products_manufacturer' => isset($product['manufacturer']) ? $product['manufacturer'] : '',
            'products_quantity'     => $product['quantity'],
            'products_price'        => $product['price'],
            'products_total'        => $product['total'],
            'products_reward'       => isset($product['reward']) ? $product['reward'] : ''
        );
        $order_product .= str_replace($input, $output, $product_last_ft);

		    return html_entity_decode($order_product, ENT_QUOTES, 'UTF-8');
    }

    public function getShippingTotal($order_id, $currency_code, $currency_value) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' AND code = 'shipping'");
        return $query->num_rows ? $this->currency->format($query->row['value'], $currency_code, $currency_value) : '';
    }

    public function getOrder($order_id) {
      $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
      return $query->num_rows ? $query->row : false;
    }

    public function getSimpleDataInfo($data = array()) {
        //Get Simple Data
        $this->load->model('localisation/language');
        $language_info = $this->model_localisation_language->getLanguage($data['language_id']);
        $language_code = $language_info ? $language_info['code'] : $this->config->get('config_language');
        
        //$result = array('input' => array(), $output => array());
        $result = array();

        foreach($this->getSimpleData('order', $data['order_id'], $language_code) as $id => $value) {
            if (strpos($id, 'shipping_') === 0) {
                $id = str_replace('shipping_', 'simple_', $id);
                $result['input'][] = '{' . $id . '}';
                $result['output'][$id] = $value;
            } elseif (strpos($id, 'payment_') === false) {
                $id = 'simple_' . $id;
                $result['input'][] = '{' . $id . '}';
                $result['output'][$id] = $value;
            }
        }
        
        return $result;
    }

    public function getSimpleData($object = 'order', $order_id = 0, $language_code = '') {
        if ($this->isSimpleExists()) {
            $this->load->model($this->_SIMPLE_MODEL);
                if (method_exists($this->{$this->_SIMPLE_OBJECT}, self::$_SIMPLE_METHOD)) {
                    //Simple v4.x
                    $language_code = $language_code ? $language_code : $this->config->get('config_language');
                    return $this->{$this->_SIMPLE_OBJECT}->{self::$_SIMPLE_METHOD}($object, $order_id, $language_code);
                } else {
                    //Simple v3.x
                    return $this->getSimpleDataFromOldFormat($object, $order_id);
                }
        } else {
            return array();
        }
    }

    public function isSimpleExists() {
        return is_file(DIR_APPLICATION . $this->_SIMPLE_PATH);
    }

    public function getSimpleFields() {
        $simple_settings = json_decode($this->config->get('simple_settings'), true);
        $result = array();
        
        if (isset($simple_settings['fields']) && is_array($simple_settings['fields'])) {
            foreach ($simple_settings['fields'] as $field) {
                if (!$field['custom']) continue;
                $result[] = $field;
            }
        }
        
        return $result;
    }

    protected function getSimpleDataFromOldFormat($object, $id) {
        $query = $this->db->query("SHOW TABLES LIKE 'simple_custom_data'");
        if (!$query->rows) {
            //Simple not Installed
            return array();
        }

        //Get Simple Data
        $object = !empty($this->_SIMPLE_OBJECTs[$object]) ? $this->_SIMPLE_OBJECTs[$object] : 0;

        if (!$object || !$id) {
            return array();
        }

        $query = $this->db->query("SELECT DISTINCT data FROM `simple_custom_data` WHERE object_type = '" . (int)$object . "' AND object_id = '" . (int)$id . "'");

        $result = array();

        if ($query->num_rows) {
            $data = unserialize($query->row['data']);

            foreach ($data as $key => $item) {
                $result[$key] = !empty($item['text']) ? $item['text'] : '';
            }
        }

        return $result;
    }

    protected function getOrderTotals($order_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");
        return $query->num_rows ? $query->rows : array();
    }

    protected function getOrderProducts($order_id) {
        $this->load->model('catalog/product');
        
        $lenght = (int)$this->config->get('shoputils_mail_order_status_option_lenght');
        
        $order_info = $this->getOrder($order_id);
        $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
        //$order_download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "'");
        $order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
				
				$result = array();
				foreach ($order_product_query->rows as $product) {
					//$result .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . '<br />';
					$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");
					
					$options ='';
					foreach ($order_option_query->rows as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
						}
											
						$options .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > $lenght ? utf8_substr($value, 0, $lenght) . '..' : $value) . '<br />';
					}

          $product_info = $this->model_catalog_product->getProduct($product['product_id']);

          $image = $this->imageResize($product_info['image'], $this->config->get('shoputils_mail_order_status_product_image_w'), $this->config->get('shoputils_mail_order_status_product_image_h'));
          
          $result[] = array(
              'product_id'    => $product['product_id'],
              'link'          => $order_info['store_url'] . 'index.php?route=product/product/&product_id=' . $product['product_id'],
              'image'         => $image,
              'name'          => $product['name'],
              'model'         => $product['model'],
              'quantity'      => $product['quantity'],
              'tax'           => $product['tax'],
              'price'         => html_entity_decode($this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8'),
              'total'         => html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8'),
              'reward'        => $product['reward'],
              'sku'           => isset($product_info['sku']) ? $product_info['sku'] : '',
              'upc'           => isset($product_info['upc']) ? $product_info['upc'] : '',
              'ean'           => isset($product_info['ean']) ? $product_info['ean'] : '',
              'jan'           => isset($product_info['jan']) ? $product_info['jan'] : '',
              'isbn'          => isset($product_info['isbn']) ? $product_info['isbn'] : '',
              'mpn'           => isset($product_info['mpn']) ? $product_info['mpn'] : '',
              'location'      => isset($product_info['location']) ? $product_info['location'] : '',
              'manufacturer'  => isset($product_info['manufacturer']) ? $product_info['manufacturer'] : '',
              'options'       => $options
          );
        }

        if (isset($order_voucher_query)) {
            foreach ($order_voucher_query->rows as $voucher) {
                $voucher_theme_info = $this->getVoucherTheme($voucher['voucher_theme_id']);
                $image = $voucher_theme_info ? $this->imageResize($voucher_theme_info['image'], $this->config->get('shoputils_mail_order_status_product_image_w'), $this->config->get('shoputils_mail_order_status_product_image_h')) : '';
                $price = html_entity_decode($this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8');

                $result[] = array(
                    'product_id'    => $voucher['voucher_id'],
                    'image'         => $image,
                    'name'          => html_entity_decode($voucher['description'], ENT_NOQUOTES, 'UTF-8'),
                    'quantity'      => 1,
                    'price'         => $price,
                    'total'         => $price,
                    'options'       => ''
                );
            }
        }

        return $result;
    }

    public function getVouchers($order_id) {
        return $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
    }

    public function getVoucherTheme($voucher_theme_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "voucher_theme vt LEFT JOIN " . DB_PREFIX . "voucher_theme_description vtd ON (vt.voucher_theme_id = vtd.voucher_theme_id) WHERE vt.voucher_theme_id = '" . (int)$voucher_theme_id . "' AND vtd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function imageResize($filename, $width = "80", $height = "80") {
        if (!is_file(DIR_IMAGE . $filename)) {
          if (is_file(DIR_IMAGE . 'no_image.png')) {
            $filename = 'no_image.png';
          } elseif (is_file(DIR_IMAGE . 'no_image.jpg')) {
            $filename = 'no_image.jpg';
          } else {
            return;
          }
        }

        $extension = pathinfo($filename, PATHINFO_EXTENSION);

        $old_image = $filename;
        $new_image = 'mail_cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

        if (!is_file(DIR_IMAGE . $new_image) || (filectime(DIR_IMAGE . $old_image) > filectime(DIR_IMAGE . $new_image))) {
          $path = '';

          $directories = explode('/', dirname(str_replace('../', '', $new_image)));

          foreach ($directories as $directory) {
            $path = $path . '/' . $directory;

            if (!is_dir(DIR_IMAGE . $path)) {
              @mkdir(DIR_IMAGE . $path, 0777);
            }
          }

          list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

          if ($width_orig != $width || $height_orig != $height) {
            $image = new Image(DIR_IMAGE . $old_image);
            $image->resize($width, $height);
            $image->save(DIR_IMAGE . $new_image);
          } else {
            copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
          }
        }

          return $this->_http_root . 'image/' . $new_image;
    }
}