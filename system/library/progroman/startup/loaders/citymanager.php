<?php
namespace progroman\Startup\Loaders;

use progroman\Startup\Loader;
use progroman\CityManager\CityManager as CM;
use progroman\CityManager\Driver\Sypex;

class CityManager extends Loader {
    protected function runLoader() {
        if ($this->registry->get('config')->get('progroman_cm_status')) {
            $this->enableGeoIp();
            $city_manager = CM::instance($this->registry);
            $city_manager->saveInSession();
            $this->registry->set('progroman_city_manager', $city_manager);
        }
    }

    private function enableGeoIp() {
        /** @var \Config $config */
        $config = $this->registry->get('config');
        $settings = $config->get('progroman_cm_setting');
        if (!empty($settings['use_geoip'])) {
            CM::addDriver(new Sypex($this->registry));
        }
    }
}