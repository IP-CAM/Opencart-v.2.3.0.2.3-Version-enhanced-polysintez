<?php
$data['sorts'] = array();

$setting_sort = $this->config->get('revtheme_catalog_sorts_category');
$sort_order_ASC = $setting_sort['order_ASC'];
$sort_name_ASC = $setting_sort['name_ASC'];
$sort_name_DESC = $setting_sort['name_DESC'];
$sort_price_ASC = $setting_sort['price_ASC'];
$sort_price_DESC = $setting_sort['price_DESC'];
$sort_rating_DESC = $setting_sort['rating_DESC'];
$sort_rating_ASC = $setting_sort['rating_ASC'];
$sort_model_ASC = $setting_sort['model_ASC'];
$sort_model_DESC = $setting_sort['model_DESC'];
$sort_date_added_ASC = $setting_sort['date_added_ASC'];
$sort_date_added_DESC = $setting_sort['date_added_DESC'];

$sort_order_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['order_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['order_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['order_ASC_text'] : $this->language->get('text_default'));
$sort_name_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['name_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['name_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['name_ASC_text'] : $this->language->get('text_name_asc'));
$sort_name_DESC_text = (isset($setting_sort[$this->config->get('config_language_id')]['name_DESC_text']) && $setting_sort[$this->config->get('config_language_id')]['name_DESC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['name_DESC_text'] : $this->language->get('text_name_desc'));
$sort_price_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['price_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['price_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['price_ASC_text'] : $this->language->get('text_price_asc'));
$sort_price_DESC_text = (isset($setting_sort[$this->config->get('config_language_id')]['price_DESC_text']) && $setting_sort[$this->config->get('config_language_id')]['price_DESC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['price_DESC_text'] : $this->language->get('text_price_desc'));
$sort_rating_DESC_text = (isset($setting_sort[$this->config->get('config_language_id')]['rating_DESC_text']) && $setting_sort[$this->config->get('config_language_id')]['rating_DESC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['rating_DESC_text'] : $this->language->get('text_rating_desc'));
$sort_rating_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['rating_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['rating_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['rating_ASC_text'] : $this->language->get('text_rating_asc'));
$sort_model_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['model_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['model_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['model_ASC_text'] : $this->language->get('text_model_asc'));
$sort_model_DESC_text = (isset($setting_sort[$this->config->get('config_language_id')]['model_DESC_text']) && $setting_sort[$this->config->get('config_language_id')]['model_DESC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['model_DESC_text'] : $this->language->get('text_model_desc'));
$sort_date_added_ASC_text = (isset($setting_sort[$this->config->get('config_language_id')]['date_added_ASC_text']) && $setting_sort[$this->config->get('config_language_id')]['date_added_ASC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['date_added_ASC_text'] : $this->language->get('text_date_added_asc'));
$sort_date_added_DESC_text = (isset($setting_sort[$this->config->get('config_language_id')]['date_added_DESC_text']) && $setting_sort[$this->config->get('config_language_id')]['date_added_DESC_text'] != '' ? $setting_sort[$this->config->get('config_language_id')]['date_added_DESC_text'] : $this->language->get('text_date_added_desc'));

if ($sort_order_ASC) {
	$data['sorts'][] = array(
		'text'  => $sort_order_ASC_text,
		'value' => 'p.sort_order-ASC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.sort_order&order=ASC' . $url)
	);
}
if ($sort_name_ASC) {	
	$data['sorts'][] = array(
		'text'  => $sort_name_ASC_text,
		'value' => 'pd.name-ASC',
		'href'  => $this->url->link('revolution/revplast', '&sort=pd.name&order=ASC' . $url)
	);
}
if ($sort_name_DESC) {	
	$data['sorts'][] = array(
		'text'  => $sort_name_DESC_text,
		'value' => 'pd.name-DESC',
		'href'  => $this->url->link('revolution/revplast', '&sort=pd.name&order=DESC' . $url)
	);
}
if ($sort_price_ASC) {	
	$data['sorts'][] = array(
		'text'  => $sort_price_ASC_text,
		'value' => 'p.price-ASC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.price&order=ASC' . $url)
	);
}
if ($sort_price_DESC) {	
	$data['sorts'][] = array(
		'text'  => $sort_price_DESC_text,
		'value' => 'p.price-DESC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.price&order=DESC' . $url)
	);
}
if ($sort_rating_DESC) {
$data['sorts'][] = array(
	'text'  => $sort_rating_DESC_text,
	'value' => 'rating-DESC',
	'href'  => $this->url->link('revolution/revplast', '&sort=rating&order=DESC' . $url)
);
}
if ($sort_rating_ASC) {
$data['sorts'][] = array(
	'text'  => $sort_rating_ASC_text,
	'value' => 'rating-ASC',
	'href'  => $this->url->link('revolution/revplast', '&sort=rating&order=ASC' . $url)
);
}
if ($sort_model_ASC) {
	$data['sorts'][] = array(
		'text'  => $sort_model_ASC_text,
		'value' => 'p.model-ASC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.model&order=ASC' . $url)
	);
}
if ($sort_model_DESC) {
	$data['sorts'][] = array(
		'text'  => $sort_model_DESC_text,
		'value' => 'p.model-DESC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.model&order=DESC' . $url)
	);
}
if ($sort_date_added_ASC) {
	$data['sorts'][] = array(
		'text'  => $sort_date_added_ASC_text,
		'value' => 'p.date_added-ASC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.date_added&order=ASC' . $url)
	);
}
if ($sort_date_added_DESC) {
	$data['sorts'][] = array(
		'text'  => $sort_date_added_DESC_text,
		'value' => 'p.date_added-DESC',
		'href'  => $this->url->link('revolution/revplast', '&sort=p.date_added&order=DESC' . $url)
	);
}
?>