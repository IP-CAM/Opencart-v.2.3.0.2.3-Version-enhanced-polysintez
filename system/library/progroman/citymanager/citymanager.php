<?php
    namespace progroman\CityManager;

    class CityManager extends Core {
        const VERSION = '6.0';

        protected static $instance;

        public function setFias($fias_id) {
            $result = parent::setFias($fias_id);
            if ($result) {
                $this->forceSaveInSession();
            }

            return $result;
        }

        /**
         * Записывает адреса доставки и оплаты в сессию,
         * только если эти значения не были установлены ранее.
         * Не перезаписывает уже установленных значений.
         */
        public function saveInSession() {
            foreach ($this->getData() as $key => $value) {
                if (empty($this->session->data['payment_address'][$key])) {
                    $this->session->data['payment_address'][$key] = $value;
                }

                if (empty($this->session->data['shipping_address'][$key])) {
                    $this->session->data['shipping_address'][$key] = $value;
                }

                if (empty($this->session->data['simple']['payment_address'][$key])) {
                    $this->session->data['simple']['payment_address'][$key] = $value;
                }

                if (empty($this->session->data['simple']['shipping_address'][$key])) {
                    $this->session->data['simple']['shipping_address'][$key] = $value;
                }
            }
        }

        /**
         * Записывает адреса доставки и оплаты в сессию.
         * Используется, когда пользователь меняет регион вручную.
         */
        public function forceSaveInSession() {
            foreach ($this->getData() as $key => $value) {
                $this->session->data['payment_address'][$key] = $this->session->data['shipping_address'][$key]
                    = $this->session->data['simple']['payment_address'][$key]
                    = $this->session->data['simple']['shipping_address'][$key]
                    = $value;

                // Для совместимости с Simple, вообще в OC2 такие поля не используются
                // $this->session->data['shipping_' . $key] = $this->session->data['payment_' . $key] = $value;
            }
        }

        private function getData() {
            return [
                'country_id' => $this->getCountryId(),
                'zone_id' => $this->getZoneId(),
                'postcode' => $this->getPostcode(),
                'city' => $this->getCityName()
            ];
        }

        public function isNeedRedirect($request_uri) {
            // Редирект уже был
            if (!empty($this->session->data[$this->getSessionKey()]['redirected'])) {
                return false;
            }

            return $this->getRedirectUrl($request_uri);
        }

        public function getCookieKey($key) {
            return str_replace('prmn.', 'prmn_', parent::getCookieKey($key));
        }

        public function getMessage($key, $default = '') {
            $messages = $this->getMessages();
            return isset($messages[$key]) ? $messages[$key] : $default;
        }
    }