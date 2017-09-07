<?php
/*
@author Dmitriy Kubarev
@link   http://www.simpleopencart.com
@link   http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4811
*/
namespace Simple;

class Rewrite {
    private $config;

    public function __construct($config) {
        $this->config = $config;
    }

    public function rewrite($url) {
        $get_route = isset($_GET['route']) ? $_GET['route'] : (isset($_GET['_route_']) ? $_GET['_route_'] : '');

        if (!empty($this->config) && $this->config->get('simple_settings')) {
            if ($this->config->get('simple_replace_cart') && strpos($url, 'checkout/cart') && $get_route != 'checkout/cart') {
                $url = str_replace('checkout/cart', 'checkout/simplecheckout', $url);
            }

            if ($this->config->get('simple_replace_checkout') && strpos($url, 'checkout/checkout') && $get_route != 'checkout/checkout') {
                $url = str_replace('checkout/checkout', 'checkout/simplecheckout', $url);
            }

            if ($this->config->get('simple_replace_register') && strpos($url, 'account/register') && $get_route != 'account/register') {
                $url = str_replace('account/register', 'account/simpleregister', $url);
            }

            if ($this->config->get('simple_replace_edit') && strpos($url, 'account/edit') && $get_route != 'account/edit') {
                $url = str_replace('account/edit', 'account/simpleedit', $url);
            }

            if ($this->config->get('simple_replace_address') && strpos($url, 'account/address/update') && $get_route != 'account/address/update') {
                $url = str_replace('account/address/update', 'account/simpleaddress/update', $url);
            }

            if ($this->config->get('simple_replace_address') && strpos($url, 'account/address/edit') && $get_route != 'account/address/edit') {
                $url = str_replace('account/address/edit', 'account/simpleaddress/update', $url);
            }

            if ($this->config->get('simple_replace_address') && strpos($url, 'account/address/insert') && $get_route != 'account/address/insert') {
                $url = str_replace('account/address/insert', 'account/simpleaddress/insert', $url);
            }

            if ($this->config->get('simple_replace_address') && strpos($url, 'account/address/add') && $get_route != 'account/address/add') {
                $url = str_replace('account/address/add', 'account/simpleaddress/insert', $url);
            }
        }

        return $url;
    }
}