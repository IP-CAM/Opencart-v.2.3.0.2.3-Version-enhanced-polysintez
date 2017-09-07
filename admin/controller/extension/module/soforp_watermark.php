<?php

require_once( DIR_SYSTEM . "/engine/soforp_controller.php");

class ControllerExtensionModuleSoforpWatermark extends SoforpController {

    private $error = array();

    public function __construct($registry) {
        parent::__construct($registry);
        $this->_moduleSysName = "soforp_watermark";
        $this->_logFile = $this->_moduleSysName . ".log";
        $this->debug = $this->config->get($this->_moduleSysName . "_debug");
    }

    public function index() {
        $this->checkLicense();

        $data = $this->language->load('extension/module/' . $this->_moduleSysName);

        $this->document->setTitle($this->language->get('heading_title_raw'));
        $this->document->addStyle('view/javascript/' . $this->_moduleSysName . '/jquery-ui.css');
        $this->document->addScript('view/javascript/' . $this->_moduleSysName . '/jquery-ui.js');
        $this->document->addStyle('view/stylesheet/' . $this->_moduleSysName . '.css');
        $this->document->addScript('view/javascript/' . $this->_moduleSysName . '/jquery.ui.rotatable.js');
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting($this->_moduleSysName, $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success_options');

            if (isset($this->request->get['close'])) {
                $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
            } else {
                $this->response->redirect($this->url->link('extension/module/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL'));
            }
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        $data = $this->initBreadcrumbs(array(
            array("extension/module", "text_module"),
            array('module/' . $this->_moduleSysName, "heading_title_raw")
                ), $data);

        $data['clean'] = $this->url->link('extension/module/' . $this->_moduleSysName . '/clean', 'token=' . $this->session->data['token'], 'SSL');
        $data['recheck'] = $this->url->link("extension/module/" . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL');
        $data['action'] = $this->url->link('extension/module/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
        $data['clear'] = $this->url->link('extension/module/' . $this->_moduleSysName . '/clear', 'token=' . $this->session->data['token'], 'SSL');
        $data['save'] = $this->url->link('extension/module/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL');
        $data['save_and_close'] = $this->url->link('extension/module/' . $this->_moduleSysName, 'token=' . $this->session->data['token'] . "&close=1", 'SSL');
        $data['close'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');



        $data['image_directories'] = $this->getWatermarkDirectories(DIR_IMAGE . 'catalog', array());

        $this->load->model('setting/store');
        $stores = array();
        $stores[0] = array(
            "name" => $this->config->get('config_name') . $this->language->get('text_default'),
            "url" => rtrim($this->config->get('config_secure') ? HTTPS_CATALOG : HTTP_CATALOG, "/") . "/");
        foreach ($this->model_setting_store->getStores() as $store) {
            $stores[$store['store_id']] = array(
                "name" => $store['name'],
                "url" => rtrim($store["url"], "/") . "/");
        }

        $this->load->model("tool/image");

        $data = $this->initParams(array(
            array($this->_moduleSysName . "_debug", 0),
                ), $data);

        foreach ($stores as $store_id => $store_data) {
            $data = $this->initParams(array(
                array($this->_moduleSysName . "_status_${store_id}", 1),
                array($this->_moduleSysName . "_hide_real_path_${store_id}", 1),
                array($this->_moduleSysName . "_debug_${store_id}", 0),
                array($this->_moduleSysName . "_exclude_${store_id}", array(DIR_IMAGE . "catalog/" . $this->_moduleSysName)),
                array($this->_moduleSysName . "_size_${store_id}", 50),
                array($this->_moduleSysName . "_min_height_${store_id}", 150),
                array($this->_moduleSysName . "_min_width_${store_id}", 150),
                array($this->_moduleSysName . "_max_height_${store_id}", 600),
                array($this->_moduleSysName . "_max_width_${store_id}", 600),
                array($this->_moduleSysName . "_left_${store_id}", 40),
                array($this->_moduleSysName . "_top_${store_id}", 45),
                array($this->_moduleSysName . "_width_${store_id}", 50),
                array($this->_moduleSysName . "_height_${store_id}", 50),
                array($this->_moduleSysName . "_angle_${store_id}", 0),
                    ), $data);

            $savedImage = $this->config->get($this->_moduleSysName . "_image_${store_id}");
            if ($savedImage && file_exists(DIR_IMAGE . $savedImage) && is_file(DIR_IMAGE . $savedImage)) {
                $data[$this->_moduleSysName . "_image_${store_id}"] = $savedImage;
            } else {
                $data[$this->_moduleSysName . "_image_${store_id}"] = "catalog/" . $this->_moduleSysName . "/watermark.png";
            }
            $data[$this->_moduleSysName . "_default_image_${store_id}"] = "catalog/" . $this->_moduleSysName . "/watermark.png";

            $sizes = getimagesize(DIR_IMAGE . $data[$this->_moduleSysName . "_default_image_${store_id}"]);
            $data[$this->_moduleSysName . "_default_image_width_${store_id}"] = 40;
            $data[$this->_moduleSysName . "_default_image_height_${store_id}"] = ceil($sizes[1] * ( 40 / $sizes[0] ));
            $data[$this->_moduleSysName . "_default_image_left_${store_id}"] = 50;
            $data[$this->_moduleSysName . "_default_image_top_${store_id}"] = 90 - $data[$this->_moduleSysName . "_default_image_height_${store_id}"];
            $data[$this->_moduleSysName . "_default_image_angle_${store_id}"] = 0;
            $data[$this->_moduleSysName . "_product_image_${store_id}"] = "catalog/" . $this->_moduleSysName . "/product.jpg";
            $data[$this->_moduleSysName . "_product_image_thumb_${store_id}"] = $this->model_tool_image->resize($data[$this->_moduleSysName . "_product_image_${store_id}"], 300, 300);
            $data[$this->_moduleSysName . "_image_root_${store_id}"] = $store_data['url'];
        }

        $data['stores'] = $stores;


        $data['params'] = $data;
        $data['token'] = $this->session->data['token'];

        if (is_file(DIR_LOGS . $this->_logFile))
            $data["logs"] = substr(file_get_contents(DIR_LOGS . $this->_logFile), -10000);
        else
            $data["logs"] = "";

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('extension/module/' . $this->_moduleSysName . '.tpl', $data));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/' . $this->_moduleSysName)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function getWatermarkDirectories($dir, $result) {
        $items = glob($dir . '/*', GLOB_ONLYDIR);

        if (!empty($items)) {
            foreach ($items as $entry) {
                if ($entry == '.' || $entry == '..')
                    continue;

                $result[] = array(
                    'text' => substr($entry, strlen(DIR_IMAGE . 'catalog/')),
                    'value' => $entry
                );

                // Врядли кому-то надо будет исключить каталог /p/1/2/3/1/2/3,
                // а вот сканирование такого количества каталогов может быть
                // очень и очень долгим процессом. Поэтому - ограничимся
                // первым уровнем
                //$result = $this->getWatermarkDirectories($entry, $result);
            }
        }

        return $result;
    }

    private function deldir($dirname) {
        if (file_exists($dirname)) {
            if (is_dir($dirname)) {
                $dir = opendir($dirname);
                while ($filename = readdir($dir)) {
                    if ($filename != "." && $filename != "..") {
                        $file = $dirname . "/" . $filename;
                        $this->deldir($file);
                    }
                }
                closedir($dir);
                rmdir($dirname);
            } else {
                @unlink($dirname);
            }
        }
    }

    public function image() {
        $this->load->model('tool/image');

        if (isset($this->request->get['image'])) {
            $this->response->setOutput($this->model_tool_image->resize(html_entity_decode($this->request->get['image'], ENT_QUOTES, 'UTF-8'), 200, 200));
        }
    }

    public function getImgSize() {
        $json = array();
        $json['success'] = false;

        $isfile = file_exists(DIR_IMAGE . $this->request->post["src"]);


        if (!$isfile)
            return;

        $size = getimagesize(DIR_IMAGE . $this->request->post["src"]);

        if ($size) {
            $json["size"] = $size;
            $json['success'] = true;
        }

        $this->response->setOutput(json_encode($json));
    }

    public function clean() {

        $dirs = glob(DIR_IMAGE . 'cache/*');
        foreach ($dirs as $dir) {
            $this->deldir($dir);
        }

        $this->language->load('extension/module/' . $this->_moduleSysName);
        $this->session->data['success'] = $this->language->get('text_success_clean');
        $this->response->redirect($this->url->link('extension/module/' . $this->_moduleSysName, 'token=' . $this->session->data['token'], 'SSL'));
    }

}

?>