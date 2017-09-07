<?php

class ControllerExtensionModuleSuggest extends Controller
{
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->model('extension/module/suggest');
    }

    public function index($setting)
    {
        static $module = 0;
        $this->document->addStyle('https://cdn.jsdelivr.net/jquery.suggestions/17.2/css/suggestions.css', 'stylesheet', 'all');
        $this->document->addScript('https://cdn.jsdelivr.net/jquery.suggestions/17.2/js/jquery.suggestions.min.js');
        $this->document->addScript('catalog/view/javascript/suggest/suggest.js');


        if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/suggest.css')) {
            $this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/suggest.css');
        } else {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/suggest.css');
        }
        $data['module'] = $module++;

        $data['suggest_api'] = $this->config->get('suggest_api');
        $data['suggest_tips'] = $this->config->get('suggest_tips');
        $data['suggest_correction'] = $this->config->get('suggest_correction');
        $data['suggest_additional'] = $this->config->get('suggest_additional');
        $data['suggest_gender'] = $this->config->get('suggest_gender');
        $data['suggest_paid'] = $this->config->get('suggest_paid');
        $data['suggest_status'] = $this->config->get('suggest_status');
        $data['suggest_citytype'] = $this->config->get('suggest_citytype');
        $data['suggest_geo'] = $this->config->get('suggest_geo');

        $data['suggest_fio'] = $this->config->get('suggest_fio');
        $data['suggest_address'] = $this->config->get('suggest_address');
        $data['suggest_email'] = $this->config->get('suggest_email');
       
        if ($data['suggest_status']) {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/suggest.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/extension/module/suggest.tpl', $data);
            } else {
                return $this->load->view('extension/module/suggest.tpl', $data);
            }
        }

    }


    public function request()
    {
        $post = file_get_contents("php://input");
        $url = $this->request->get['r'];

        $method = $this->request->server['REQUEST_METHOD'];


        if ($this->config->get('suggest_status') == 1) {

                $url = ModelExtensionModuleSuggest::DADATA_URL . $url;
            
            if ($this->request->get['r'] == '/detectAddressByIp') {
                $post = array('ip' => $this->getRealIpAddr());
            }
            if (empty($post)) {
                $post = array();
            }
            $result = $this->model_extension_module_suggest->curlCall($url, $post, $method);

            if ($result)
                echo $result;
        }
    }

    protected function getRealIpAddr()
    {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) { //check ip from share internet
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) { //to check ip is pass from proxy
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        if ($ip != '127.0.0.1')
            return $ip;
    }
}
