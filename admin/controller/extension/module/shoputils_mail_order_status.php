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

class ControllerExtensionModuleShoputilsMailOrderStatus extends Controller {
    private $error = array();
    private $version = 'v3.0.1';
    const FILE_NAME_LIC = 'shoputils_mailorder.lic';
    const SIMPLE_PATH   = 'model/extension/module/simplecustom.php';
    const SIMPLE_MODEL  = 'extension/module/simplecustom';
    const SIMPLE_OBJECT = 'model_extension_module_simplecustom';
    const SIMPLE_METHOD = 'getCustomFields';
    const NEW_ORDER     = 'new_order';
    const UPDATE_ORDER  = 'update_order';
    const VOUCHER       = 'voucher';

    public function __construct($registry) {
        parent::__construct($registry);
        $this->load->language('extension/module/shoputils_mail_order_status');
        $this->load->model('localisation/language');
        $this->load->model('localisation/order_status');
        $this->load->model('tool/image');
        $this->document->setTitle($this->language->get('heading_title'));
    }

    public function index() {
        if (!is_file(DIR_APPLICATION . self::FILE_NAME_LIC)) {
            $this->response->redirect($this->url->link('extension/module/shoputils_mail_order_status/lic', '&token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('shoputils/mail_order_status');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_shoputils_mail_order_status->setSetting();
            $this->response->redirect($this->makeUrl('extension/module/shoputils_mail_order_status'));
        }

        //Make Cache Folder is not exists
        $mail_cache_dir = DIR_IMAGE.'mail_cache';
        if (!is_dir($mail_cache_dir)) {
            if (!mkdir($mail_cache_dir, 0755)) {
                $this->error['warning'] = sprintf($this->language->get('error_mkdir'), $mail_cache_dir);
            } else {
                if (!is_writable($mail_cache_dir)) {
                    if (function_exists('chmode')) {
                        chmod($mail_cache_dir, 0755);
                    }
                    if (!is_writable($mail_cache_dir)) {
                        $this->error['warning'] = sprintf($this->language->get('error_dir_perm'), $mail_cache_dir);
                    }
                }
            }
        }

        //CKEditor
        if ($this->config->get('config_editor_default')) {
            $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
            $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
        } else {
            $this->document->addScript('view/javascript/summernote/summernote.js');
            if (is_file(DIR_APPLICATION . 'view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js')) {
                $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
            }
            $this->document->addScript('view/javascript/summernote/shoputils_mail_order_status_init.js');
            $this->document->addStyle('view/javascript/summernote/summernote.css');
        }

        $data = $this->_setData(array(
            'heading_title',
            'button_save',
            'button_cancel',
            'button_default',
            'lang',
            'tab_new_order',
            'tab_order_statuses',
            'tab_customer_register',
            'tab_customer_forgotten',
            'tab_customer_transaction',
            'tab_affiliate_register',
            'tab_affiliate_forgotten',
            'tab_affiliate_transaction',
            'tab_voucher',
            'tab_settings_ft',
            'text_confirm',
            'text_enabled',
            'text_disabled',
            'text_yes',
            'text_no',
            'entry_current_order_status',
            'entry_admin_current_order_status',
            'entry_status',
            'entry_admin_status',
            'entry_chkbox_notify',
            'entry_subject',
            'entry_content',
            'entry_new_order',
            'entry_admin_new_order',
            'entry_customer_register',
            'entry_admin_customer_register',
            'entry_customer_forgotten',
            'entry_customer_transaction',
            'entry_admin_customer_transaction',
            'entry_admin_customer_forgotten',
            'entry_affiliate_register',
            'entry_admin_affiliate_register',
            'entry_affiliate_forgotten',
            'entry_admin_affiliate_forgotten',
            'entry_affiliate_transaction',
            'entry_admin_affiliate_transaction',
            'entry_voucher',
            'entry_admin_voucher',
            'entry_products_ft',
            'entry_products_header_ft',
            'entry_products_footer_ft',
            'entry_totals_ft',
            'entry_totals_header_ft',
            'entry_totals_footer_ft',
            'entry_product_first_ft',
            'entry_product_last_ft',
            'entry_other_settings',
            'entry_date_time_format_ft',
            'entry_date_format_ft',
            'entry_time_format_ft',
            'entry_product_image_w_h',
            'entry_option_lenght',
            'help_list_helper',
            'help_date_format',
            'help_button_default',
            'help_status',
            'help_admin_status',
            'help_chkbox_notify',
            'help_subject',
            'help_content',
            'help_new_status',
            'help_admin_new_status',
            'help_new_subject',
            'help_new_content',
            'help_customer_register_status',
            'help_admin_customer_register_status',
            'help_customer_register_subject',
            'help_customer_register_content',
            'help_customer_forgotten_status',
            'help_admin_customer_forgotten_status',
            'help_customer_forgotten_subject',
            'help_customer_forgotten_content',
            'help_customer_transaction_status',
            'help_admin_customer_transaction_status',
            'help_customer_transaction_subject',
            'help_customer_transaction_content',
            'help_affiliate_register_status',
            'help_admin_affiliate_register_status',
            'help_affiliate_register_subject',
            'help_affiliate_register_content',
            'help_affiliate_forgotten_status',
            'help_admin_affiliate_forgotten_status',
            'help_affiliate_forgotten_subject',
            'help_affiliate_forgotten_content',
            'help_affiliate_transaction_status',
            'help_admin_affiliate_transaction_status',
            'help_affiliate_transaction_subject',
            'help_affiliate_transaction_content',
            'help_voucher_status',
            'help_admin_voucher_status',
            'help_voucher_subject',
            'help_voucher_content',
            'help_on_ckeditor',
            'help_products_ft',
            'help_products_header_ft',
            'help_products_footer_ft',
            'help_totals_ft',
            'help_totals_header_ft',
            'help_totals_footer_ft',
            'help_product_first_ft',
            'help_product_last_ft',
            'help_date_time_format_ft',
            'help_date_format_ft',
            'help_time_format_ft',
            'text_info'                   => sprintf($this->language->get('text_info'), $this->makeUrl('localisation/order_status')),
            'text_copyright'              => sprintf($this->language->get('text_copyright'), $this->language->get('heading_title'), date('Y', time())),
            'entry_chkbox_notify'         => sprintf($this->language->get('entry_chkbox_notify'), $this->makeUrl('sale/order')),
            'action'                      => $this->makeUrl('extension/module/shoputils_mail_order_status'),
            'cancel'                      => $this->makeUrl('extension/extension', 'type=module'),
            'token'                       => isset($this->session->data['token']) ? $this->session->data['token'] : '',
            'ckeditor'                    => $this->config->get('config_editor_default'),
            'error_warning'               => isset($this->error['warning']) ? $this->error['warning'] : '',
            'placeholder'                 => $this->model_tool_image->resize('no_image.png', 100, 100),
            'list_helper_new_order'             => $this->getOrderHelper(),
            'list_helper_update_order'          => $this->getOrderHelper(self::UPDATE_ORDER),
            'list_helper_customer_register'     => $this->getCustomerRegisterHelper(),
            'list_helper_customer_forgotten'    => $this->getCustomerForgottenHelper(),
            'list_helper_customer_transaction'  => $this->getCustomerTransactionHelper(),
            'list_helper_affiliate_register'    => $this->getAffiliateRegisterHelper(),
            'list_helper_affiliate_forgotten'   => $this->getAffiliateForgottenHelper(),
            'list_helper_affiliate_transaction' => $this->getAffiliateTransactionHelper(),
            'list_helper_voucher'         => $this->getOrderHelper(self::VOUCHER),
            'new_subject_default'                     => $this->language->get('text_new_subject_default'),
            'new_content_default'                     => $this->getNewContentDefault(),
            'customer_register_subject_default'       => $this->language->get('text_customer_register_subject_default'),
            'customer_register_content_default'       => $this->getCustomerRegisterContentDefault(),
            'customer_forgotten_subject_default'      => $this->language->get('text_customer_forgotten_subject_default'),
            'customer_forgotten_content_default'      => $this->getCustomerForgottenContentDefault(),
            'customer_transaction_subject_default'    => $this->language->get('text_customer_transaction_subject_default'),
            'customer_transaction_content_default'    => $this->getCustomerTransactionContentDefault(),
            'affiliate_register_subject_default'      => $this->language->get('text_affiliate_register_subject_default'),
            'affiliate_register_content_default'      => $this->getAffiliateRegisterContentDefault(),
            'affiliate_forgotten_subject_default'     => $this->language->get('text_affiliate_forgotten_subject_default'),
            'affiliate_forgotten_content_default'     => $this->getAffiliateForgottenContentDefault(),
            'affiliate_transaction_subject_default'   => $this->language->get('text_affiliate_transaction_subject_default'),
            'affiliate_transaction_content_default'   => $this->getAffiliateTransactionContentDefault(),
            'voucher_subject_default'           => $this->language->get('text_voucher_subject_default'),
            'voucher_content_default'           => $this->getVoucherContentDefault(),
            'products_helper'             => $this->getProductsHelper(),
            'products_ft_default'         => $this->getProductsFT(),
            'products_header_ft_default'  => $this->getProductsHeaderFT(),
            'products_footer_ft_default'  => $this->getProductsFooterFT(),
            'totals_helper'               => $this->getTotalsHelper(),
            'totals_ft_default'           => $this->getTotalsFT(),
            'totals_header_ft_default'    => $this->getTotalsHeaderFT(),
            'totals_footer_ft_default'    => $this->getTotalsFooterFT(),
            'product_first_ft_default'    => $this->getProductFirstFT(),
            'product_last_ft_default'     => $this->getProductLastFT(),
            'order_statuses'              => $this->model_localisation_order_status->getOrderStatuses(),
            'oc_languages'                => $this->model_localisation_language->getLanguages()
        ));

        $data = array_merge($data, $this->_setErrors(
            array(
                'error_subject',
                'error_content',
                'error_admin_subject',
                'error_admin_content'
            ), $data['order_statuses']
        ));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->makeUrl('common/dashboard')
        );

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_module'),
          'href' => $this->makeUrl('extension/extension', 'type=module')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->makeUrl('extension/module/shoputils_mail_order_status')
        );

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data = array_merge($data, $this->_updateData(
            array(
                 'shoputils_mail_order_status_new_status',
                 'shoputils_mail_order_status_new_subject',
                 'shoputils_mail_order_status_new_content',
                 'shoputils_mail_order_status_admin_new_status',
                 'shoputils_mail_order_status_admin_new_subject',
                 'shoputils_mail_order_status_admin_new_content',
                 'shoputils_mail_order_status_customer_register_status',
                 'shoputils_mail_order_status_customer_register_subject',
                 'shoputils_mail_order_status_customer_register_content',
                 'shoputils_mail_order_status_admin_customer_register_status',
                 'shoputils_mail_order_status_admin_customer_register_subject',
                 'shoputils_mail_order_status_admin_customer_register_content',
                 'shoputils_mail_order_status_customer_forgotten_status',
                 'shoputils_mail_order_status_customer_forgotten_subject',
                 'shoputils_mail_order_status_customer_forgotten_content',
                 'shoputils_mail_order_status_customer_transaction_status',
                 'shoputils_mail_order_status_customer_transaction_subject',
                 'shoputils_mail_order_status_customer_transaction_content',
                 'shoputils_mail_order_status_admin_customer_transaction_status',
                 'shoputils_mail_order_status_admin_customer_transaction_subject',
                 'shoputils_mail_order_status_admin_customer_transaction_content',
                 'shoputils_mail_order_status_admin_customer_forgotten_status',
                 'shoputils_mail_order_status_admin_customer_forgotten_subject',
                 'shoputils_mail_order_status_admin_customer_forgotten_content',
                 'shoputils_mail_order_status_affiliate_register_status',
                 'shoputils_mail_order_status_affiliate_register_subject',
                 'shoputils_mail_order_status_affiliate_register_content',
                 'shoputils_mail_order_status_admin_affiliate_register_status',
                 'shoputils_mail_order_status_admin_affiliate_register_subject',
                 'shoputils_mail_order_status_admin_affiliate_register_content',
                 'shoputils_mail_order_status_affiliate_forgotten_status',
                 'shoputils_mail_order_status_affiliate_forgotten_subject',
                 'shoputils_mail_order_status_affiliate_forgotten_content',
                 'shoputils_mail_order_status_admin_affiliate_forgotten_status',
                 'shoputils_mail_order_status_admin_affiliate_forgotten_subject',
                 'shoputils_mail_order_status_admin_affiliate_forgotten_content',
                 'shoputils_mail_order_status_affiliate_transaction_status',
                 'shoputils_mail_order_status_affiliate_transaction_subject',
                 'shoputils_mail_order_status_affiliate_transaction_content',
                 'shoputils_mail_order_status_admin_affiliate_transaction_status',
                 'shoputils_mail_order_status_admin_affiliate_transaction_subject',
                 'shoputils_mail_order_status_admin_affiliate_transaction_content',
                 'shoputils_mail_order_status_voucher_status',
                 'shoputils_mail_order_status_voucher_subject',
                 'shoputils_mail_order_status_voucher_content',
                 'shoputils_mail_order_status_admin_voucher_status',
                 'shoputils_mail_order_status_admin_voucher_subject',
                 'shoputils_mail_order_status_admin_voucher_content',
                 'shoputils_mail_order_status_products_ft',
                 'shoputils_mail_order_status_products_header_ft',
                 'shoputils_mail_order_status_products_footer_ft',
                 'shoputils_mail_order_status_totals_ft',
                 'shoputils_mail_order_status_totals_header_ft',
                 'shoputils_mail_order_status_totals_footer_ft',
                 'shoputils_mail_order_status_product_first_ft',
                 'shoputils_mail_order_status_product_last_ft',
                 'shoputils_mail_order_status_date_time_format',
                 'shoputils_mail_order_status_date_format',
                 'shoputils_mail_order_status_time_format',
                 'shoputils_mail_order_status_product_image_w',
                 'shoputils_mail_order_status_product_image_h',
                 'shoputils_mail_order_status_option_lenght'
           ),
            array(
                'shoputils_mail_order_status_date_time_format'  => 'd.m.Y H:i:s',
                'shoputils_mail_order_status_date_format'       => 'd.m.Y',
                'shoputils_mail_order_status_time_format'       => 'H:i:s',
                'shoputils_mail_order_status_product_image_w'   => 80,
                'shoputils_mail_order_status_product_image_h'   => 80,
                'shoputils_mail_order_status_option_lenght'     => 40
            )

        ));

        $data = array_merge($data, $this->_updateDataStatuses(
            array(
                 'shoputils_mail_order_status_status',
                 'shoputils_mail_order_status_notify',
                 'shoputils_mail_order_status_subject',
                 'shoputils_mail_order_status_content',
                 'shoputils_mail_order_status_admin_status',
                 'shoputils_mail_order_status_admin_subject',
                 'shoputils_mail_order_status_admin_content'
            ), $data['order_statuses']
        ));

        $data = array_merge($data, $this->_setData(
            array(
                 'header'       => $this->load->controller('common/header'),
                 'column_left'  => $this->load->controller('common/column_left'),
                 'footer'       => $this->load->controller('common/footer')
            )
        ));
        $this->response->setOutput($this->load->view('extension/module/shoputils_mail_order_status', $data));
    }

    public function lic() {
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'extension/module/shoputils_mail_order_status')) {
                $this->session->data['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));
            } elseif (!empty($this->request->post['lic_data'])) {
                if (!is_writable(DIR_APPLICATION)) {
                    $perms = fileperms(DIR_APPLICATION);
                    chmod(DIR_APPLICATION, 0755);
                }
                
                $lic = '------ LICENSE FILE DATA -------' . "\n";
                $lic .= trim($this->request->post['lic_data']) . "\n";
                $lic .= '--------------------------------' . "\n";
                $file = DIR_APPLICATION . self::FILE_NAME_LIC;
                $handle = @fopen($file, 'w'); 
                fwrite($handle, $lic);
                fclose($handle); 
                if (isset($perms)) {
                    chmod(DIR_APPLICATION, $perms);
                }

                if (!is_file($file)) {
                    $this->session->data['warning'] = sprintf($this->language->get('error_dir_perm'), DIR_APPLICATION);
                    $this->response->redirect($this->url->link('extension/module/shoputils_mail_order_status/lic', '&token=' . $this->session->data['token'], 'SSL'));
                }

                register_shutdown_function(array($this, 'licShutdownHandler'));
                $this->load->model('shoputils/mail_order_status');

                $this->response->redirect($this->url->link('extension/module/shoputils_mail_order_status', '&token=' . $this->session->data['token'], 'SSL'));
            }
        }

        $domain = str_replace('http://', '', HTTP_SERVER);
        $domain = explode('/', str_replace('https://', '', $domain));
        
        $loader = extension_loaded('ionCube Loader');

        $loader_min_version = '4.5';
        $loader_version = function_exists('ioncube_loader_version') ? ioncube_loader_version() : $loader_min_version;
        $loader_compare = version_compare($loader_version, $loader_min_version, '>=');

        $php_min_version = '5.3';
        $php_version = phpversion();
        $php_compare = version_compare($php_version, $php_min_version, '>=');

        $data = $this->_setData(array(
            'heading_title',
            'button_save',
            'button_cancel',
            'text_ok',
            'text_error',
            'text_get_key',
            'entry_key',
            'error_key',
            'error_php_version',
            'error_loader'          => sprintf($this->language->get('error_loader'), $loader_min_version),
            'error_loader_version'  => sprintf($this->language->get('error_loader_version'), $loader_min_version),
            'error'                 => !($loader && $loader_compare && $php_compare),
            'text_domain'           => sprintf($this->language->get('text_domain'), $domain[0]),
            'text_loader'           => sprintf($this->language->get('text_loader'), $loader_version, $loader_min_version),
            'text_php'              => sprintf($this->language->get('text_php'), $php_version, $php_min_version),
            'action'                => $this->url->link('extension/module/shoputils_mail_order_status/lic', '&token=' . $this->session->data['token'], 'SSL'),
            'cancel'                => $this->url->link('extension/extension', 'type=module&token=' . $this->session->data['token'], 'SSL'),
            'loader'                => $loader,
            'icon'                  => 'view/image/module/shoputils_mail_order_status.png',
            'loader_compare'        => $loader_compare,
            'php_compare'           => $php_compare
        ));
        
        if (isset($this->session->data['warning'])) {
          $data['error_warning'] = $this->session->data['warning'];
          unset($this->session->data['warning']);
          if (is_file(DIR_APPLICATION . self::FILE_NAME_LIC)) {
              @unlink(DIR_APPLICATION . self::FILE_NAME_LIC);
          }
        } else {
          $data['error_warning'] = '';
        }

        $data = array_merge($data, $this->_setData(
            array(
                 'header'       => $this->load->controller('common/header'),
                 'column_left'  => $this->load->controller('common/column_left'),
                 'footer'       => $this->load->controller('common/footer')
            )
        ));
        
        $this->response->setOutput($this->load->view('shoputils/admin/mail_order_status_lic', $data));
    }


    protected function getListHelper() {
        $data = $this->_setData(array(
                             'entry_main_ft',
                             'text_store_name_ft',
                             'text_store_ft',
                             'text_logo_ft',
                             'text_date_time_now_ft',
                             'text_date_now_ft',
                             'text_time_now_ft'
                        ));

        return $this->load->view('shoputils/shoputils_mail_order_status/list_helper', $data);
    }

    protected function getOrderHelper($type = self::NEW_ORDER) {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_order_id_ft',
                             'text_order_status_ft',
                             'text_order_link_ft',
                             'text_comment_ft',
                             'text_admin_comment_ft',
                             'text_ip_ft',
                             'text_date_added_ft',
                             'text_date_modified_ft',
                             'text_firstname_ft',
                             'text_lastname_ft',
                             'text_group_ft',
                             'text_email_ft',
                             'text_telephone_ft',
                             'text_products_ft',
                             'text_totals_ft',
                             'text_total_ft',
                             'text_shipping_total_ft',
                             'text_product_first_ft',
                             'text_product_last_ft',

                             'entry_payment_ft',
                             'text_payment_firstname_ft',
                             'text_payment_lastname_ft',
                             'text_payment_company_ft',
                             'text_payment_address_1_ft',
                             'text_payment_address_2_ft',
                             'text_payment_city_ft',
                             'text_payment_postcode_ft',
                             'text_payment_country_ft',
                             'text_payment_zone_ft',
                             'text_payment_method_ft',

                             'entry_shipping_ft',
                             'text_shipping_firstname_ft',
                             'text_shipping_lastname_ft',
                             'text_shipping_company_ft',
                             'text_shipping_address_1_ft',
                             'text_shipping_address_2_ft',
                             'text_shipping_city_ft',
                             'text_shipping_postcode_ft',
                             'text_shipping_country_ft',
                             'text_shipping_zone_ft',
                             'text_shipping_method_ft',

                             'entry_voucher_ft',
                             'text_voucher_code_ft',
                             'text_voucher_from_name_ft',
                             'text_voucher_from_email_ft',
                             'text_voucher_to_name_ft',
                             'text_voucher_to_email_ft',
                             'text_voucher_message_ft',
                             'text_voucher_amount_ft',
                             'text_voucher_image_ft',
                             'text_voucher_name_ft',
                             'text_voucher_theme_ft',

                             'entry_simple_fields_ft',
                             'simple_fields'  => $this->getSimpleFields(),

                             'entry_others_ft',
                             'text_trackcode_ft',
                             'text_trackcode_link_ft',
                             'text_trackcode_link2_ft',
                             
                             'type' => $type
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/order_helper', $data);
    }

    protected function getCustomerRegisterHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_account_link_ft',
                             'text_ip_ft',
                             'text_customer_date_added_ft',
                             'text_firstname_ft',
                             'text_lastname_ft',
                             'text_password_ft',
                             'text_group_ft',
                             'text_email_ft',
                             'text_telephone_ft',
                             'text_fax_ft',

                             'entry_address_ft',
                             'text_company_ft',
                             'text_address_1_ft',
                             'text_address_2_ft',
                             'text_city_ft',
                             'text_postcode_ft',
                             'text_country_ft',
                             'text_zone_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/customer_register_helper', $data);
    }

    protected function getCustomerForgottenHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_account_link_ft',
                             'text_ip_ft',
                             'text_customer_date_added_ft',
                             'text_firstname_ft',
                             'text_lastname_ft',
                             'text_reset_code_ft',
                             'text_reset_link_ft',
                             'text_group_ft',
                             'text_email_ft',
                             'text_telephone_ft',
                             'text_fax_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/customer_forgotten_helper', $data);
    }

    protected function getCustomerTransactionHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_account_link_ft',
                             'text_ip_ft',
                             'text_customer_date_added_ft',
                             'text_firstname_ft',
                             'text_lastname_ft',
                             'text_group_ft',
                             'text_email_ft',
                             'text_telephone_ft',
                             'text_fax_ft',

                             'entry_address_ft',
                             'text_company_ft',
                             'text_address_1_ft',
                             'text_address_2_ft',
                             'text_city_ft',
                             'text_postcode_ft',
                             'text_country_ft',
                             'text_zone_ft',

                             'entry_transaction_ft',
                             'text_transaction_description_ft',
                             'text_transaction_amount_ft',
                             'text_transaction_total_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/customer_transaction_helper', $data);
    }

    protected function getAffiliateRegisterHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_affiliate_account_link_ft',
                             'text_affiliate_ip_ft',
                             'text_affiliate_date_added_ft',
                             'text_affiliate_firstname_ft',
                             'text_affiliate_lastname_ft',
                             'text_affiliate_password_ft',
                             'text_affiliate_email_ft',
                             'text_affiliate_telephone_ft',
                             'text_affiliate_fax_ft',

                             'entry_address_ft',
                             'text_company_ft',
                             'text_affiliate_website_ft',
                             'text_address_1_ft',
                             'text_address_2_ft',
                             'text_city_ft',
                             'text_postcode_ft',
                             'text_country_ft',
                             'text_zone_ft',

                             'entry_affiliate_payment_ft',
                             'text_affiliate_tax_ft',
                             'text_affiliate_payment_ft',
                             'text_affiliate_cheque_ft',
                             'text_affiliate_paypal_ft',
                             'text_affiliate_bank_name_ft',
                             'text_affiliate_bank_branch_number_ft',
                             'text_affiliate_bank_swift_code_ft',
                             'text_affiliate_bank_account_name_ft',
                             'text_affiliate_bank_account_number_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/affiliate_register_helper', $data);
    }

    protected function getAffiliateForgottenHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_affiliate_account_link_ft',
                             'text_affiliate_ip_ft',
                             'text_affiliate_date_added_ft',
                             'text_affiliate_firstname_ft',
                             'text_affiliate_lastname_ft',
                             'text_affiliate_password_ft',
                             'text_affiliate_group_ft',
                             'text_affiliate_email_ft',
                             'text_affiliate_telephone_ft',
                             'text_affiliate_fax_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/affiliate_forgotten_helper', $data);
    }

    protected function getAffiliateTransactionHelper() {
        $data = $this->_setData(array(
                             'entry_general_ft',
                             'text_affiliate_account_link_ft',
                             'text_affiliate_ip_ft',
                             'text_affiliate_date_added_ft',
                             'text_affiliate_firstname_ft',
                             'text_affiliate_lastname_ft',
                             'text_affiliate_email_ft',
                             'text_affiliate_telephone_ft',
                             'text_affiliate_fax_ft',

                             'entry_address_ft',
                             'text_company_ft',
                             'text_affiliate_website_ft',
                             'text_address_1_ft',
                             'text_address_2_ft',
                             'text_city_ft',
                             'text_postcode_ft',
                             'text_country_ft',
                             'text_zone_ft',

                             'entry_affiliate_payment_ft',
                             'text_affiliate_tax_ft',
                             'text_affiliate_payment_ft',
                             'text_affiliate_cheque_ft',
                             'text_affiliate_paypal_ft',
                             'text_affiliate_bank_name_ft',
                             'text_affiliate_bank_branch_number_ft',
                             'text_affiliate_bank_swift_code_ft',
                             'text_affiliate_bank_account_name_ft',
                             'text_affiliate_bank_account_number_ft',

                             'entry_transaction_ft',
                             'text_transaction_description_ft',
                             'text_transaction_amount_ft',
                             'text_transaction_total_ft'
                        ));

        return $this->getListHelper() . $this->load->view('shoputils/shoputils_mail_order_status/affiliate_transaction_helper', $data);
    }

    protected function getProductsHelper() {
        $data = $this->_setData(array(
                             'text_products_header',
                             'text_products_count',
                             'text_products_image',
                             'text_products_name',
                             'text_products_href',
                             'text_products_model',
                             'text_products_sku',
                             'text_products_upc',
                             'text_products_ean',
                             'text_products_jan',
                             'text_products_isbn',
                             'text_products_mpn',
                             'text_products_location',
                             'text_products_manufacturer',
                             'text_products_quantity',
                             'text_products_price',
                             'text_products_total',
                             'text_products_reward',
                             'text_products_footer',
                             'text_products_warning'
                        ));

        return $this->load->view('shoputils/shoputils_mail_order_status/products_helper', $data);
    }

    protected function getProductsFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/products', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getProductsHeaderFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/products_header', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getProductsFooterFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/products_footer', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getTotalsHelper() {
        $data = $this->_setData(array(
                             'text_totals_title',
                             'text_totals_text'
                        ));

        return $this->load->view('shoputils/shoputils_mail_order_status/totals_helper', $data);
    }

    protected function getTotalsFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/totals', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getTotalsHeaderFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/totals_header', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getTotalsFooterFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/totals_footer', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getProductFirstFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/product_first', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getProductLastFT() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/product_last', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getNewContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/new', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getCustomerRegisterContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/customer_register', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getCustomerForgottenContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/customer_forgotten', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getCustomerTransactionContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/customer_transaction', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getAffiliateRegisterContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/affiliate_register', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getAffiliateForgottenContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/affiliate_forgotten', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getAffiliateTransactionContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/affiliate_transaction', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getVoucherContentDefault() {
        return htmlentities($this->load->view('shoputils/shoputils_mail_order_status/voucher', array()), ENT_QUOTES, 'UTF-8');
    }

    protected function getSimpleFields() {
        $this->mail_templates = new Shoputilsmailtemplates($this->registry);
        if ($this->mail_templates->isSimpleExists()) {
            $this->load->model(self::SIMPLE_MODEL);
            $fields = array();

            //if Simple v4.x
            $simple_fields_info = $this->mail_templates->getSimpleFields();

            foreach($simple_fields_info as $value) {
                $fields['{simple_' . $value['id'] . '}'] = $this->{self::SIMPLE_OBJECT}->getFieldLabel($value['id']);
            }

            return $fields;
        } else {
            //if Simple v3.x
            $this->load->model('setting/setting');
            $simple_old_data = $this->model_setting_setting->getSetting('simple');
            if (empty($simple_old_data) || !isset($simple_old_data['simple_fields_custom'])) {
                //Simple not Installed
                return array();
            }

            foreach ($simple_old_data['simple_fields_custom'] as $old_data) {
                $fields['{simple_' . $old_data['id'] . '}'] = $old_data['label'][$this->config->get('config_language')];
            }
            return $fields;
        }
    }

    protected function validate() {
        if (!$this->model_shoputils_mail_order_status->validatePermission()) {
            $this->error['warning'] = $this->language->get('error_permission');
        } else {
        
            $order_stasuses = $this->model_localisation_order_status->getOrderStatuses();
            foreach ($this->model_localisation_language->getLanguages() as $language) {
              foreach ($order_stasuses as $order_status) {
                if (($this->request->post['shoputils_mail_order_status_status' . $order_status['order_status_id']]) && ((!isset($this->request->post['shoputils_mail_order_status_subject' . $order_status['order_status_id']][$language['language_id']]) || !trim($this->request->post['shoputils_mail_order_status_subject' . $order_status['order_status_id']][$language['language_id']])))) {
                    $this->error['warning'] = $this->error['error_subject' . $order_status['order_status_id']] = sprintf($this->language->get('error_form'),
                                                                                                            $this->language->get('entry_subject'),
                                                                                                            $order_status['name']);
                }

                if (($this->request->post['shoputils_mail_order_status_status' . $order_status['order_status_id']]) && ((!isset($this->request->post['shoputils_mail_order_status_content' . $order_status['order_status_id']][$language['language_id']]) || !trim($this->request->post['shoputils_mail_order_status_content' . $order_status['order_status_id']][$language['language_id']])))) {
                    $this->error['warning'] = $this->error['error_content' . $order_status['order_status_id']] = sprintf($this->language->get('error_form'),
                                                                                                            $this->language->get('entry_content'),
                                                                                                            $order_status['name']);
                }

                if (($this->request->post['shoputils_mail_order_status_admin_status' . $order_status['order_status_id']]) && ((!isset($this->request->post['shoputils_mail_order_status_admin_subject' . $order_status['order_status_id']][$language['language_id']]) || !trim($this->request->post['shoputils_mail_order_status_admin_subject' . $order_status['order_status_id']][$language['language_id']])))) {
                    $this->error['warning'] = $this->error['error_admin_subject' . $order_status['order_status_id']] = sprintf($this->language->get('error_form'),
                                                                                                            $this->language->get('entry_subject'),
                                                                                                            $order_status['name']);
                }

                if (($this->request->post['shoputils_mail_order_status_admin_status' . $order_status['order_status_id']]) && ((!isset($this->request->post['shoputils_mail_order_status_admin_content' . $order_status['order_status_id']][$language['language_id']]) || !trim($this->request->post['shoputils_mail_order_status_admin_content' . $order_status['order_status_id']][$language['language_id']])))) {
                    $this->error['warning'] = $this->error['error_admin_content' . $order_status['order_status_id']] = sprintf($this->language->get('error_form'),
                                                                                                            $this->language->get('entry_content'),
                                                                                                            $order_status['name']);
                }
              }
            }
        
        }
        return !$this->error;
    }

    function licShutdownHandler() {
        if (@is_array($e = @error_get_last())) {
            $code = isset($e['type']) ? $e['type'] : 0;
            $msg = isset($e['message']) ? $e['message'] : '';
            if(($code > 0) && (strpos($msg, 'requires a license file') || strpos($msg, 'is not valid for this server'))) {
                $this->session->data['warning'] = $this->language->get('error_key');
                $this->response->redirect($this->makeUrl('extension/module/shoputils_mail_order_status/lic'));
            }
        }
    }

    protected function _setData($values) {
        $data = array();
        foreach ($values as $key => $value) {
            if (is_int($key)) {
                $data[$value] = $this->language->get($value);
            } else {
                $data[$key] = $value;
            }
        }
        return $data;
    }

    protected function _updateData($keys, $info = array()) {
        $data = array();
        foreach ($keys as $key) {
            if (isset($this->request->post[$key])) {
                $data[$key] = $this->request->post[$key];
            } elseif ($this->config->get($key)) {
                $data[$key] = $this->config->get($key);
            } elseif (isset($info[$key])) {
                $data[$key] = $info[$key];
            } else {
                $data[$key] = null;
            }
        }
        return $data;
    }

    protected function _updateDataStatuses($keys, $order_statuses) {
        $data = array();
        foreach ($keys as $key) {
            $values = array();
            foreach ($order_statuses as $order_status) {
                if (isset($this->request->post[$key . $order_status['order_status_id']])) {
                    $values[$order_status['order_status_id']] = $this->request->post[$key . $order_status['order_status_id']];
                } else {
                    $values[$order_status['order_status_id']] = $this->config->get($key . $order_status['order_status_id']);
                }
            }
            $data[$key] = $values;
        }
        return $data;
    }

    protected function _setErrors($keys, $order_statuses) {
        $data = array();
        foreach ($keys as $key) {
            $values = array();
            foreach ($order_statuses as $order_status) {
                $values[$order_status['order_status_id']] = isset($this->error[$key . $order_status['order_status_id']])
                                                                        ? $this->error[$key . $order_status['order_status_id']] : '';
            }
            $data[$key] = $values;
        }
        return $data;
    }

    protected function makeUrl($route, $url = '') {
        if (isset($this->session->data['token'])){
            return str_replace('&amp;', '&', $this->url->link($route, $url.'&token=' . $this->session->data['token'], 'SSL'));
        } else {
            return str_replace('&amp;', '&', $this->url->link($route, $url, 'SSL'));
        }
    }
}