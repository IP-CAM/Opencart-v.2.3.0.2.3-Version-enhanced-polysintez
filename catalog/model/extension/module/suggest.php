<?php

class ModelExtensionModuleSuggest extends Model
{
    const DADATA_URL = 'https://suggestions.dadata.ru/suggestions/api/4_1/rs';

    const METHOD_POST = 'POST';
    const METHOD_GET = 'GET';

    public function curlCall($url, $data, $method = self::METHOD_GET)
    {
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_FRESH_CONNECT,true);
        curl_setopt($ch, CURLOPT_POST, self::METHOD_GET === $method ? 0 : 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-Partner: OPENCART.EFREMOVAV','Content-Type: application/json', 'Accept: application/json', 'Authorization: Token ' . $this->config->get('suggest_api')));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        if($method === self::METHOD_POST) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            $http_query='';
        } else {
            $http_query="?".http_build_query($data);
        }
        curl_setopt($ch, CURLOPT_URL, $url.$http_query);


        $server_output = curl_exec($ch);
        curl_close($ch);
        unset($ch);
        if ($server_output)
        return $server_output;
    }

}
