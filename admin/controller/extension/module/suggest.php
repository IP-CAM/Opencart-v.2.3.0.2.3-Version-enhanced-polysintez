<?php

class ControllerExtensionModuleSuggest extends Controller
{
    private $error = array();
    protected $version = '1.3.4';


    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->model('setting/setting');
        $this->load->language('extension/module/suggest');
    }

    public function getVersion()
    {
        return $this->version;
    }

    public function index()
    {
        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('suggest', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            //$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['version'] = '';
        if ((!$this->config->get('suggest_version') || $this->config->get('suggest_version') != $this->getVersion())) {
            $this->error['warning'] = $this->language->get('text_not_installed') . " <a href=\"" . $this->url->link('extension/module/suggest/reinstall', 'token=' . $this->session->data['token'], 'SSL') . "\">" . $this->language->get('button_reinstall') . "</a>";
        } else {
            $data['version'] = $this->config->get('suggest_version');
        }

        $data['heading_title'] = $this->language->get('heading_title') . ($data['version'] ? " " . $data['version'] : "");

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_module'] = $this->language->get('text_module');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_api'] = $this->language->get('entry_api');
        $data['entry_tips'] = $this->language->get('entry_tips');
        $data['entry_geo'] = $this->language->get('entry_geo');
        $data['entry_gender'] = $this->language->get('entry_gender');
        $data['entry_citytype'] = $this->language->get('entry_citytype');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['suggest_api'])) {
            $data['error_api'] = $this->error['suggest_api'];
        } else {
            $data['error_api'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/suggest', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/module/suggest', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        $data['token'] = $this->session->data['token'];

        $data['fio_field_parts_data'] = $this->getFioParts();
        $data['address_field_parts_data'] = $this->getAddressParts();
        $data['fieldTypes'] = array(
            array('name' => 'Поле ввода(input)', 'value' => 'input'),
            array('name' => 'Выпадающий список(select)', 'value' => 'select')
        );
        if (isset($this->request->post['suggest_api'])) {
            $data['suggest_api'] = $this->request->post['suggest_api'];
        } elseif ($this->config->get('suggest_api')) {
            $data['suggest_api'] = $this->config->get('suggest_api');
        } else {
            $data['suggest_api'] = '';
        }

        if (isset($this->request->post['suggest_fio'])) {
            $data['fio_groups'] = $this->request->post['suggest_fio'];
        } elseif ($this->config->get('suggest_fio')) {
            $data['fio_groups'] = $this->config->get('suggest_fio');
        } else {
            $data['fio_groups'] = array();
        }

        if (isset($this->request->post['suggest_email'])) {
            $data['email_groups'] = $this->request->post['suggest_email'];
        } elseif ($this->config->get('suggest_email')) {
            $data['email_groups'] = $this->config->get('suggest_email');
        } else {
            $data['email_groups'] = array();
        }

        if (isset($this->request->post['suggest_address'])) {
            $data['address_groups'] = $this->request->post['suggest_address'];
        } elseif ($this->config->get('suggest_address')) {
            $data['address_groups'] = $this->config->get('suggest_address');
        } else {
            $data['address_groups'] = array();
        }

        if (isset($this->request->post['suggest_address_additional'])) {
            $data['address_additional'] = $this->request->post['suggest_address_additional'];
        } elseif ($this->config->get('suggest_address_additional')) {
            $data['address_additional'] = $this->config->get('suggest_address_additional');
        } else {
            $data['address_additional'] = array();
        }

        if (isset($this->request->post['suggest_tips'])) {
            $data['suggest_tips'] = $this->request->post['suggest_tips'];
        } elseif ($this->config->get('suggest_tips')) {
            $data['suggest_tips'] = $this->config->get('suggest_tips');
        } else {
            $data['suggest_tips'] = 10;
        }

        if (isset($this->request->post['suggest_geo'])) {
            $data['suggest_geo'] = $this->request->post['suggest_geo'];
        } else {
            $geo = $this->config->get('suggest_geo');
            if (strlen(trim($geo)) > 0) {
                $data['suggest_geo'] = $this->config->get('suggest_geo');
            } else {
                $data['suggest_geo'] = 1;
            }
        }

        if (isset($this->request->post['suggest_status'])) {
            $data['suggest_status'] = $this->request->post['suggest_status'];
        } else {
            $status = $this->config->get('suggest_status');
            if (strlen(trim($status)) > 0) {
                $data['suggest_status'] = $this->config->get('suggest_status');
            } else {
                $data['suggest_status'] = 0;
            }
        }



        $data['url'] = $this->url;
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/suggest.tpl', $data));

    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/suggest')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['suggest_api']) {
            $this->error['suggest_api'] = $this->language->get('error_api');
        }

        if (isset($this->request->post['suggest_fio']) && !empty($this->request->post['suggest_fio'])) {
            foreach ($this->request->post['suggest_fio'] as $fio_group_key => $fio_group) {
                if (empty($fio_group) || (isset($fio_group['data']) && empty($fio_group['data'])) || !isset($fio_group['data'])) {
                    unset($this->request->post['suggest_fio'][$fio_group_key]);
                } else {
                    foreach ($fio_group['data'] as $fio_field_key => $fio_field_val) {
                        if (empty($fio_field_val['name'])) {
                            unset($this->request->post['suggest_fio'][$fio_group_key]['data'][$fio_field_key]);
                        }
                    }
                    if (empty($this->request->post['suggest_fio'][$fio_group_key]['data'])) {
                        unset($this->request->post['suggest_fio'][$fio_group_key]);
                    } else {
                        $this->request->post['suggest_fio'][$fio_group_key]['data'] = array_values($this->request->post['suggest_fio'][$fio_group_key]['data']);
                    }
                }
            }
            $this->request->post['suggest_fio'] = array_values($this->request->post['suggest_fio']);
        }

        if (isset($this->request->post['suggest_address']) && !empty($this->request->post['suggest_address'])) {
            foreach ($this->request->post['suggest_address'] as $address_group_key => $address_group) {
                if (empty($address_group) || (isset($address_group['data']) && empty($address_group['data'])) || !isset($address_group['data'])) {
                    unset($this->request->post['suggest_address'][$address_group_key]);
                } else {
                    foreach ($address_group['data'] as $address_field_key => $address_field_val) {
                        if (empty($address_field_val['name'])) {
                            unset($this->request->post['suggest_address'][$address_group_key]['data'][$address_field_key]);
                        }
                    }
                    if (empty($this->request->post['suggest_address'][$address_group_key]['data'])) {
                        unset($this->request->post['suggest_address'][$address_group_key]);
                    } else {
                        $this->request->post['suggest_address'][$address_group_key]['data'] = array_values($this->request->post['suggest_address'][$address_group_key]['data']);
                    }
                }
            }
            $this->request->post['suggest_address'] = array_values($this->request->post['suggest_address']);
        }

        if (isset($this->request->post['suggest_email']) && !empty($this->request->post['suggest_email'])) {
            foreach ($this->request->post['suggest_email'] as $email_group_key => $email_group) {
                if (empty($email_group) || (isset($email_group['data']) && empty($email_group['data'])) || !isset($email_group['data'])) {
                    unset($this->request->post['suggest_email'][$email_group_key]);
                } else {
                    foreach ($email_group['data'] as $email_field_key => $email_field_val) {
                        if (empty($email_field_val['name'])) {
                            unset($this->request->post['suggest_email'][$email_group_key]['data'][$email_field_key]);
                        }
                    }
                    if (empty($this->request->post['suggest_email'][$email_group_key]['data'])) {
                        unset($this->request->post['suggest_email'][$email_group_key]);
                    } else {
                        $this->request->post['suggest_email'][$email_group_key]['data'] = array_values($this->request->post['suggest_email'][$email_group_key]['data']);
                    }
                }
            }
            $this->request->post['suggest_email'] = array_values($this->request->post['suggest_email']);
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function getFioParts()
    {
        return array(
            array('name' => 'Фамилия', 'value' => 'SURNAME'),
            array('name' => 'Имя', 'value' => 'NAME'),
            array('name' => 'Отчество', 'value' => 'PATRONYMIC')
        );
    }

    protected function getAddressParts()
    {
        return array(
            array('name' => 'Индекс', 'value' => 'postcode'),
            array('name' => 'Регион', 'value' => 'region'),
            array('name' => 'Район', 'value' => 'area'),
            array('name' => 'Город', 'value' => 'city'),
            array('name' => 'Населенный пункт', 'value' => 'settlement'),
            array('name' => 'Улица', 'value' => 'street'),
            array('name' => 'Дом', 'value' => 'house')
        );
    }

    protected function getFioDefaults()
    {
        return array(
            'suggest_fio' => array(
                array(
                    'group_id' => '#account',
                    'data' => array(
                        array(
                            'name' => 'firstname',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'lastname',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#collapse-shipping-address',
                    'data' => array(
                        array(
                            'name' => 'firstname',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'lastname',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
            )
        );
    }

    protected function getFioSimpleDefaults()
    {
        return array(
            'suggest_fio' => array(
                array(
                    'group_id' => '#simplecheckout_customer',
                    'data' => array(
                        array(
                            'name' => 'customer[firstname]',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'customer[lastname]',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simplecheckout_payment_address',
                    'data' => array(
                        array(
                            'name' => 'payment_address[firstname]',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'payment_address[lastname]',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simplecheckout_shipping_address',
                    'data' => array(
                        array(
                            'name' => 'shipping_address[firstname]',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'shipping_address[lastname]',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simpleregister',
                    'data' => array(
                        array(
                            'name' => 'register[firstname]',
                            'parts' => array('NAME', 'PATRONYMIC'),
                            'status' => '1',
                        ),
                        array(
                            'name' => 'register[lastname]',
                            'parts' => array('SURNAME'),
                            'status' => '1',
                        ),
                    )
                ),
            )
        );
    }

    protected function getAddressDefaults()
    {
        return array(
            'suggest_address' => array(
                array(
                    'group_id' => '#address',
                    'data' => array(
                        array(
                            'name' => 'city',
                            'type' => 'input',
                            'parts_suggest' => array('city', 'settlement'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'zone_id',
                            'type' => 'select',
                            'parts_suggest' => array('region'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'postcode',
                            'type' => 'input',
                            'parts_suggest' => array('postcode'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'address_1',
                            'type' => 'input',
                            'parts_suggest' => array('street', 'house'),
                            'constraint' => 'city',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#collapse-shipping-address',
                    'data' => array(
                        array(
                            'name' => 'city',
                            'type' => 'input',
                            'parts_suggest' => array('city', 'settlement'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'zone_id',
                            'type' => 'select',
                            'parts_suggest' => array('region'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'postcode',
                            'type' => 'input',
                            'parts_suggest' => array('postcode'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'address_1',
                            'type' => 'input',
                            'parts_suggest' => array('street', 'house'),
                            'constraint' => 'city',
                            'status' => '1',
                        ),
                    )
                ),
            )
        );
    }

    protected function getAddressSimpleDefaults()
    {
        return array(
            'suggest_address' => array(
                array(
                    'group_id' => '#simplecheckout_payment_address',
                    'data' => array(
                        array(
                            'name' => 'payment_address[city]',
                            'type' => 'input',
                            'parts_suggest' => array('city', 'settlement'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'payment_address[zone_id]',
                            'type' => 'select',
                            'parts_suggest' => array('region'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'payment_address[postcode]',
                            'type' => 'input',
                            'parts_suggest' => array('postcode'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'payment_address[address_1]',
                            'type' => 'input',
                            'parts_suggest' => array('street', 'house'),
                            'constraint' => 'payment_address[city]',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simplecheckout_shipping_address',
                    'data' => array(
                        array(
                            'name' => 'shipping_address[city]',
                            'type' => 'input',
                            'parts_suggest' => array('city', 'settlement'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'shipping_address[zone_id]',
                            'type' => 'select',
                            'parts_suggest' => array('region'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'shipping_address[postcode]',
                            'type' => 'input',
                            'parts_suggest' => array('postcode'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'shipping_address[address_1]',
                            'type' => 'input',
                            'parts_suggest' => array('street', 'house'),
                            'constraint' => 'shipping_address[city]',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simpleregister',
                    'data' => array(
                        array(
                            'name' => 'register[city]',
                            'type' => 'input',
                            'parts_suggest' => array('city', 'settlement'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'register[zone_id]',
                            'type' => 'select',
                            'parts_suggest' => array('region'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'register[postcode]',
                            'type' => 'input',
                            'parts_suggest' => array('postcode'),
                            'constraint' => '',
                            'status' => '1',
                        ),
                        array(
                            'name' => 'register[address_1]',
                            'type' => 'input',
                            'parts_suggest' => array('street', 'house'),
                            'constraint' => 'register[city]',
                            'status' => '1',
                        ),
                    )
                ),
            )
        );
    }

    protected function getEmailDefaults()
    {
        return array(
            'suggest_email' => array(
                array(
                    'group_id' => '#account',
                    'data' => array(
                        array(
                            'name' => 'email',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#collapse-checkout-option',
                    'data' => array(
                        array(
                            'name' => 'email',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => 'body.account-login',
                    'data' => array(
                        array(
                            'name' => 'email',
                            'status' => '1',
                        ),
                    )
                ),
            )
        );
    }

    protected function getEmailSimpleDefaults()
    {
        return array(
            'suggest_email' => array(
                array(
                    'group_id' => '#simplecheckout_customer',
                    'data' => array(
                        array(
                            'name' => 'customer[email]',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simplecheckout_payment_address',
                    'data' => array(
                        array(
                            'name' => 'payment_address[email]',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simplecheckout_login',
                    'data' => array(
                        array(
                            'name' => 'email',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '.login-content',
                    'data' => array(
                        array(
                            'name' => 'email',
                            'status' => '1',
                        ),
                    )
                ),
                array(
                    'group_id' => '#simpleregister',
                    'data' => array(
                        array(
                            'name' => 'register[email]',
                            'status' => '1',
                        ),
                    )
                ),

            )
        );
    }

    public function install()
    {
        $this->model_setting_setting->editSetting('suggest',
            array(
				'suggest_fio'=> $this->getFioSimpleDefaults()['suggest_fio'],
                'suggest_address'=>$this->getAddressSimpleDefaults()['suggest_address'],
                'suggest_email'=>$this->getEmailSimpleDefaults()['suggest_email'],
                'suggest_version' => $this->getVersion()
            )
        );
    }

    public function installDefaultDemoData()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/suggest')) {
            $this->error['warning'] = $this->language->get('error_permission');
        } else {
            $FioDefaults = $this->getFioDefaults();
            $AddressDefaults = $this->getAddressDefaults();
            $EmailDefaults = $this->getEmailDefaults();
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_fio', $FioDefaults['suggest_fio']);
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_address', $AddressDefaults['suggest_address']);
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_email', $EmailDefaults['suggest_email']);

            $this->session->data['success'] = $this->language->get('text_success');
        }
        $this->response->redirect($this->url->link('extension/module/suggest', 'token=' . $this->session->data['token'], true));

    }

    public function installSimpleDemoData()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/suggest')) {
            $this->error['warning'] = $this->language->get('error_permission');
        } else {
            $FioDefaults = $this->getFioSimpleDefaults();
            $AddressDefaults = $this->getAddressSimpleDefaults();
            $EmailDefaults = $this->getEmailSimpleDefaults();
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_fio', $FioDefaults['suggest_fio']);
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_address', $AddressDefaults['suggest_address']);
            $this->model_setting_setting->editSettingValue('suggest', 'suggest_email', $EmailDefaults['suggest_email']);

            $this->session->data['success'] = $this->language->get('text_success');
        }
        $this->response->redirect($this->url->link('extension/module/suggest', 'token=' . $this->session->data['token'], 'SSL'));

    }

    public function uninstall()
    {
        $this->model_setting_setting->deleteSetting('suggest');
    }

    public function reinstall()
    {
        //$this->uninstall();
        //$this->install();
        $suggest_settings = $this->model_setting_setting->getSetting('suggest');
        $suggest_settings['suggest_version'] = $this->getVersion();
        $this->model_setting_setting->editSetting('suggest', $suggest_settings);
        $this->session->data['success'] = $this->language->get('text_success');
        $this->response->redirect($this->url->link('extension/module/suggest', 'token=' . $this->session->data['token'], 'SSL'));
    }

}
