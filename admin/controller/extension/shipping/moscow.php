<?php
class ControllerExtensionShippingMoscow extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('extension/shipping/moscow');

    $this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      $this->model_setting_setting->editSetting('moscow', $this->request->post);

      $this->session->data['success'] = $this->language->get('text_success');

      $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true));
    }

    $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');

    $data['text_none'] = $this->language->get('text_none');
    $data['text_enabled'] = $this->language->get('text_enabled');
    $data['text_disabled'] = $this->language->get('text_disabled');

    $data['text_all_zones'] = $this->language->get('text_all_zones');
    $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');

    $data['entry_moscow_rate'] = $this->language->get('entry_moscow_rate');
    $data['entry_zamkad_rate'] = $this->language->get('entry_zamkad_rate');
    $data['entry_max_distance'] = $this->language->get('entry_max_distance');

    $data['entry_tax_class'] = $this->language->get('entry_tax_class');
    $data['entry_status'] = $this->language->get('entry_status');
    $data['entry_sort_order'] = $this->language->get('entry_sort_order');

    $data['button_save'] = $this->language->get('button_save');
    $data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
      $data['error_warning'] = $this->error['warning'];
    } else {
      $data['error_warning'] = '';
    }

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_extension'),
      'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true)
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('extension/shipping/moscow', 'token=' . $this->session->data['token'], true)
    );

    $data['action'] = $this->url->link('extension/shipping/moscow', 'token=' . $this->session->data['token'], true);

    $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true);

    $this->load->model('localisation/geo_zone');

    if (isset($this->request->post['moscow_moscow_rate'])) {
      $data['moscow_moscow_rate'] = $this->request->post['moscow_moscow_rate'];
    } else {
      $data['moscow_moscow_rate'] = $this->config->get('moscow_moscow_rate');
    }

    if (isset($this->request->post['moscow_zamkad_rate'])) {
      $data['moscow_zamkad_rate'] = $this->request->post['moscow_zamkad_rate'];
    } else {
      $data['moscow_zamkad_rate'] = $this->config->get('moscow_zamkad_rate');
    }

    if (isset($this->request->post['moscow_max_distance'])) {
      $data['moscow_max_distance'] = $this->request->post['moscow_max_distance'];
    } else {
      $data['moscow_max_distance'] = $this->config->get('moscow_max_distance');
    }

    if (isset($this->request->post['moscow_status'])) {
      $data['moscow_status'] = $this->request->post['moscow_status'];
    } else {
      $data['moscow_status'] = $this->config->get('moscow_status');
    }

    $this->load->model('localisation/geo_zone');

    $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

    if (isset($this->request->post['moscow_geo_zone_id'])) {
      $data['moscow_geo_zone_id'] = $this->request->post['moscow_geo_zone_id'];
    } else {
      $data['moscow_geo_zone_id'] = $this->config->get('moscow_geo_zone_id');
    }

    if (isset($this->request->post['moscow_tax_class_id'])) {
      $data['moscow_tax_class_id'] = $this->request->post['moscow_tax_class_id'];
    } else {
      $data['moscow_tax_class_id'] = $this->config->get('moscow_tax_class_id');
    }

    if (isset($this->request->post['moscow_status'])) {
      $data['moscow_status'] = $this->request->post['moscow_status'];
    } else {
      $data['moscow_status'] = $this->config->get('moscow_status');
    }

    if (isset($this->request->post['moscow_sort_order'])) {
      $data['moscow_sort_order'] = $this->request->post['moscow_sort_order'];
    } else {
      $data['moscow_sort_order'] = $this->config->get('moscow_sort_order');
    }

    $this->load->model('localisation/tax_class');

    $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/shipping/moscow', $data));

  }

  protected function validate() {
    if (!$this->user->hasPermission('modify', 'extension/shipping/moscow')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    return !$this->error;
  }
}
?>
