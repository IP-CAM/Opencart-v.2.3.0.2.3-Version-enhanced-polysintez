<?php  
class ControllerExtensionModuleShippingMoscow extends Controller {
  public function moscow_cost() {
    $this->load->language('extension/shipping/moscow');
        $this->load->model('extension/shipping/moscow');
    $weight = floatval($this->request->get['weight']);
    $show_weight = false;
    $cost = $this->model_extension_shipping_moscow->getMoscowCost($weight);
    $text = $this->currency->format($this->tax->calculate($cost, $this->config->get('moscow_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']);
    $ret = array(
        'code'         => 'moscow.moscow',
        'title'        => $this->model_extension_shipping_moscow->getMoscowTitle($weight, $show_weight),
        'cost'         => $cost,
        'tax_class_id' => $this->config->get('moscow_tax_class_id'),
        'text'         => $text);
    if (isset($this->session->data['shipping_methods']['moscow']) && isset($this->session->data['shipping_methods']['moscow']['quote'])) {
      $this->session->data['shipping_methods']['moscow']['quote']['moscow'] = $ret;
    } 
    $this->response->setOutput(json_encode($ret));
  }

  public function zamkad_cost() {
    $this->load->language('extension/shipping/moscow');
    $weight = floatval($this->request->get['weight']);
    $distance = floatval($this->request->get['zamkad_distance']);
    if ($distance > 0) {
      $this->load->model('extension/shipping/moscow');
      $show_weight = false;
      $cost = $this->model_extension_shipping_moscow->getZamkadCost($weight, $distance);
      
      if ($cost == 'toofar') {
        $ret = array(
            'code'         => 'moscow.moscow',
            'title'        => sprintf($this->language->get('zamkad_toofar'), (int)$this->config->get('moscow_max_distance')),
            'cost'         => 0,
            'distance'	   => 'error',
            'tax_class_id' => $this->config->get('moscow_tax_class_id'),
            'text'         => '');
      }
      else {
        $text = $this->currency->format($this->tax->calculate($cost, $this->config->get('moscow_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']);
        $ret = array(
            'code'         => 'moscow.moscow',
            'title'        => $this->model_extension_shipping_moscow->getZamkadTitle($weight, $distance, $show_weight),
            'cost'         => $cost,
            'distance'	   => $distance,
            'tax_class_id' => $this->config->get('moscow_tax_class_id'),
            'text'         => $text);
      }
      
      if (isset($this->session->data['shipping_methods']['moscow']) && isset($this->session->data['shipping_methods']['moscow']['quote'])) {
        $this->session->data['shipping_methods']['moscow']['quote']['moscow'] = $ret;
      }
      $this->response->setOutput(json_encode($ret));
    }
  }
     
  public function zamkad_fault() {
    $this->load->language('extension/shipping/moscow');
    $this->load->model('extension/shipping/moscow');
    $ret = array(
        'code'         => 'moscow.moscow',
        'title'        => $this->model_extension_shipping_moscow->getZamkadErrTitle(),
        'cost'         => 0,
        'distance'	   => 'error',
        'tax_class_id' => $this->config->get('moscow_tax_class_id'),
        'text'         => '');
            
    if (isset($this->session->data['shipping_methods']['moscow']) && isset($this->session->data['shipping_methods']['moscow']['quote'])) {
      $this->session->data['shipping_methods']['moscow']['quote']['moscow'] = $ret;
    }
    $this->response->setOutput(json_encode($ret));
  }
}
