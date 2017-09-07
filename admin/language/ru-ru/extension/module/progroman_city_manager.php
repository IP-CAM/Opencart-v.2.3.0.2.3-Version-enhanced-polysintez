<?php
$_['heading_title'] = 'ProgRoman - CityManager+GeoIP';

// Entry
$_['entry_default_city'] = 'Город по-умолчанию';
$_['entry_use_geoip'] = 'Определять город по IP<span class="help" data-toggle="tooltip" title="Включить определение города по IP-адресу"></span>';
$_['entry_use_cookie'] = 'Сохранять регион в cookie';
$_['entry_popup_cookie_time'] = 'Период показа "Угадали город", сек.<span class="help" data-toggle="tooltip" title="Попап \'Угадали город\' показывается при каждом визите, установите время, в течение которого попап не появится после первого захода: 86400 - сутки, 2592000 - месяц, 31536000 - год"></span>';
$_['entry_popup_view'] = 'Тип попапа';
$_['entry_key'] = 'Ключ';
$_['entry_zone'] = 'Город / регион / страна';
$_['entry_city'] = 'Город';
$_['entry_sort'] = 'Сортировка';
$_['entry_value'] = 'Значение';
$_['entry_subdomain'] = 'Поддомен';
$_['entry_country'] = 'Страна';
$_['entry_disable_autoredirect'] = 'Отключить авторедирект при первом заходе<span class="help" data-toggle="tooltip" title="Переход на поддомен только при выборе города в попапе"></span>';
$_['entry_currency'] = 'Валюта';
$_['entry_domain'] = 'Основной домен (без http://)<span class="help" data-toggle="tooltip" title="Укажите, если отличается от текущего"></span>';
$_['entry_license'] = 'Лицензия<span class="help" data-toggle="tooltip" title="Ключ, выданный автором"></span>';
$_['entry_status'] = 'Статус';
$_['entry_customer_group'] = 'Группы покупателей';
$_['entry_sub_enabled'] = 'Включено<span class="help" data-toggle="tooltip" title="Отключите, если не используете данный функционал, чтобы избежать дополнительных запросов к БД"></span>';

$_['text_popup_cities'] = 'Города для попапа выбора города';
$_['text_regions_info'] = 'Эти настройки используются для сопоставления регионов OpenCart и базы ФИАС, когда у вас регионы отличаются от стандартных OpenCart (например, добавлены/отредактированы вручную). Убедитесь, что регионы соответствую друг другу!';
$_['text_available_geoip_plus'] = 'Ключ подходит для GeoIP Pro';
$_['text_customer_groups_info'] = 'Функционал доступен только для GeoIP Pro!';
$_['text_module'] = 'Модули';
$_['text_success'] = 'Настройки модуля обновлены!';

$_['tab_popup'] = 'Попапы';
$_['tab_messages'] = 'Геосообщения';
$_['tab_redirects'] = 'Редиректы';
$_['tab_currencies'] = 'Валюта';
$_['tab_regions'] = 'Регионы';
$_['tab_groups'] = 'Группы покупателей';

$_['button_customer_group'] = 'Создать группу покупателей';

$_['error_permission'] = 'У Вас нет прав для управления этим модулем!';
$_['error_key'] = 'Поле должно содержать латинские буквы, цифры и знаки "-", "_"';
$_['error_fias'] = 'Укажите зону';
$_['error_subdomain'] = 'Укажите поддомен в виде: http://abc.site.com/ или http://abc.site.com/path/to/';
$_['error_currency_country'] = 'Укажите страну';
$_['error_currency_code'] = 'Укажите валюту';
$_['error_license'] = 'Модуль не активирован, получите лицензионный ключ у автора модуля';
$_['error_unique_regions'] = 'На вкладке "Регионы" не все значения уникальны, проверьте значение для ';
$_['error_customer_group'] = 'Выберите группу покупателей';