<?php
namespace progroman\CityManager\Driver;

use progroman\CityManager\Driver;

class Sypex extends Driver {
    protected function initGeoFilter() {
        $file = file_exists(__DIR__ . '/SxGeoCity.dat') ? __DIR__ . '/SxGeoCity.dat' : __DIR__ . '/sxgeocity.dat';
        $sxGeo = new SxGeo($file);
        $data = $sxGeo->getCityFull($this->ip);

        if ($data) {
            $this->geo_filter = [
                'city_name' => $data['city']['name_ru'],
                'zone_name' => $data['region']['name_ru'],
                'iso_code_2' => $data['country']['iso'],
                'country_name' => $this->getCountryNameByIso($data['country'])
            ];
        }
    }

    private function getCountryNameByIso($country) {
        if ($country['iso'] == 'BY') {
            return 'Белоруссия';
        }

        return $country['name_ru'];
    }
}