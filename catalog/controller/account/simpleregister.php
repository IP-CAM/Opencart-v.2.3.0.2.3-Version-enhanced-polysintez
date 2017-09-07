<?php
/*
@author	Dmitriy Kubarev
@link	http://www.simpleopencart.com
@link	http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4811
*/

include_once(DIR_SYSTEM . 'library/simple/simple_controller.php');

class ControllerAccountSimpleRegister extends SimpleController {
    private $_templateData = array();

    public function index($args = null) {

        $this->loadLibrary('simple/simpleregister');

        $this->simpleregister = SimpleRegister::getInstance($this->registry);

        if ($this->customer->isLogged()) {
            $this->simpleregister->redirect($this->url->link('account/account','','SSL'));
        }

        $this->language->load('account/register');
        $this->language->load('account/simpleregister');

        if (empty($args)) {
            $this->document->setTitle($this->language->get('heading_title'));
        }

        $this->_templateData['breadcrumbs'] = array();

        $this->_templateData['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->_templateData['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('account/simpleregister', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->_templateData['action'] = 'index.php?'.$this->simpleregister->getAdditionalParams().'route=account/simpleregister';

        $this->_templateData['heading_title']        = $this->language->get('heading_title');
        $this->_templateData['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));
        $this->_templateData['button_continue']      = $this->language->get('button_continue');

        $this->_templateData['error_warning'] = '';

        $this->simpleregister->clearSimpleSession();

        $this->simpleregister->init();

        $this->_templateData['rows'] = $this->simpleregister->getRows();
        $this->_templateData['hidden_rows'] = $this->simpleregister->getHiddenRows();

        $this->_templateData['redirect'] = '';

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->_templateData['agreement'] = !empty($this->request->post['agreement']) ? true : false;
        } else {
            $this->_templateData['agreement'] = $this->simpleregister->getSettingValue('agreementCheckboxInit');
        }

        if ($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['submitted']) && $this->validate()) {
            $this->load->model('account/customer');
            $this->load->model('account/address');

            $this->simpleregister->clearUnusedFields();

            $info = $this->session->data['simple']['register'];

            if (empty($info['password'])) {
                $this->load->model('tool/simpleapimain');

                if (method_exists($this->model_tool_simpleapimain, 'getRandomPassword') || property_exists($this->model_tool_simpleapimain, 'getRandomPassword') || (method_exists($this->model_tool_simpleapimain, 'isExistForSimple') && $this->model_tool_simpleapimain->isExistForSimple('getRandomPassword'))) {
                    $info['password'] = $this->model_tool_simpleapimain->getRandomPassword();
                }
            }

            // fix for old versions
            $tmpCustomerGroupId = $this->config->get('config_customer_group_id');
            $this->config->set('config_customer_group_id', $info['customer_group_id']);

            $this->model_account_customer->addCustomer($info);

            $this->config->set('config_customer_group_id', $tmpCustomerGroupId);

            if ($this->simpleregister->getOpencartVersion() > 200) {
                $this->model_account_customer->deleteLoginAttempts($info['email']);
            }

            $this->customer->login($info['email'], $info['password']);

            $customerId = 0;
            $addressId = 0;

            if ($this->customer->isLogged()) {
                $customerId = $this->customer->getId();
                $addressId = $this->customer->getAddressId();
            } else {
                $customerInfo = $this->simpleregister->getCustomerInfoByEmail($info['email']);
                $customerId = $customerInfo['customer_id'];
                $addressId = $customerInfo['address_id'];
            }

            $this->simpleregister->saveCustomFields(array('register'), 'customer', $customerId);
            $this->simpleregister->saveCustomFields(array('register'), 'address', $addressId);

            if (($this->simpleregister->getOpencartVersion() > 200 && $this->simpleregister->getOpencartVersion() < 230) || ($this->simpleregister->getOpencartVersion() >= 230 && $this->config->get('config_customer_activity'))) {
                // Add to activity log
                $this->load->model('account/activity');

                $activity_data = array(
                    'customer_id' => $customerId,
                    'name'        => $info['firstname'] . ' ' . $info['lastname']
                );

                $this->model_account_activity->addActivity('register', $activity_data);
            }

            // Default Shipping Address
            if ($this->config->get('config_tax_customer') == 'shipping') {
                $this->session->data['shipping_country_id'] = $info['country_id'];
                $this->session->data['shipping_zone_id']    = $info['zone_id'];
                $this->session->data['shipping_postcode']   = $info['postcode'];
            }

            // Default Payment Address
            if ($this->config->get('config_tax_customer') == 'payment') {
                $this->session->data['payment_country_id'] = $info['country_id'];
                $this->session->data['payment_zone_id']    = $info['zone_id'];
            }

            if ($this->simpleregister->isAjaxRequest()) {
                $this->_templateData['redirect'] = $this->url->link('account/success');
            } else {
                $this->simpleregister->redirect($this->url->link('account/success'));
            }
        }

        $this->_templateData['ajax']                       = $this->simpleregister->isAjaxRequest();
        $this->_templateData['additional_path']            = $this->simpleregister->getAdditionalPath();
        $this->_templateData['additional_params']          = $this->simpleregister->getAdditionalParams();
        $this->_templateData['display_agreement_checkbox'] = $this->simpleregister->getSettingValue('displayAgreementCheckbox');
        $this->_templateData['use_autocomplete']           = $this->simpleregister->getCommonSetting('useAutocomplete');
        $this->_templateData['use_google_api']             = $this->simpleregister->getCommonSetting('useGoogleApi');
        $this->_templateData['scroll_to_error']            = $this->simpleregister->getSettingValue('scrollToError');

        $this->_templateData['javascript_callback']        = $this->simpleregister->getJavascriptCallback();

        $this->_templateData['display_error']              = $this->simpleregister->displayError();

        $this->_templateData['popup']     = !empty($args['popup']) ? true : (isset($this->request->get['popup']) ? true : false);
        $this->_templateData['as_module'] = !empty($args['module']) ? true : (isset($this->request->get['module']) ? true : false);

        $langId = ($this->config->get('config_template') == 'shoppica' || $this->config->get('config_template') == 'shoppica2') ? 'text_agree_shoppica' : 'text_agree';
        $title = $this->simpleregister->getInformationTitle($this->simpleregister->getSettingValue('agreementId'));
        $this->_templateData['text_agreement'] = sprintf($this->language->get($langId), $this->url->link($this->simpleregister->getInformationRoute(), $this->simpleregister->getAdditionalParams() . 'information_id=' . $this->simpleregister->getSettingValue('agreementId'), 'SSL'), $title, $title);

        $childrens = array();

        if (!$this->simpleregister->isAjaxRequest() && !$this->_templateData['popup'] && !$this->_templateData['as_module']) {
            $childrens = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header',
            );

            $this->_templateData['simple_header'] = $this->simpleregister->getLinkToHeaderTpl();
            $this->_templateData['simple_footer'] = $this->simpleregister->getLinkToFooterTpl();
        }

        $this->setOutputContent(trim($this->renderPage('account/simpleregister', $this->_templateData, $childrens)));
    }

    private function validate() {
        $error = false;

        if ($this->simpleregister->getSettingValue('displayAgreementCheckbox') && !$this->_templateData['agreement']) {
            $this->_templateData['error_warning'] = sprintf($this->language->get('error_agree'), $this->simpleregister->getInformationTitle($this->simpleregister->getSettingValue('agreementId')));
            $error = true;
        }

        if (!$this->simpleregister->validateFields()) {
            $error = true;
        }

        return !$error;
    }
}
