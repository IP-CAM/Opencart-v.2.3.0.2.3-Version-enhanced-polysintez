<?php
require_once( DIR_SYSTEM . "/engine/soforp_model.php");

class ModelExtensionModuleSoforpRedirectManager extends SoforpModel {

	public function install() {
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "redirect` (";
		$sql .= " `redirect_id` int(11) NOT NULL AUTO_INCREMENT,";
		$sql .= " `active` tinyint(1) NOT NULL DEFAULT '0',";
		$sql .= " `from_url` varchar(256) NOT NULL,";
		$sql .= " `to_url` varchar(256) NOT NULL,";
		$sql .= " `response_code` int(3) NOT NULL DEFAULT '301',";
		$sql .= " `date_start` date NOT NULL DEFAULT '0000-00-00',";
		$sql .= " `date_end` date NOT NULL DEFAULT '0000-00-00',";
		$sql .= " `times_used` int(5) NOT NULL DEFAULT '0',";
		$sql .= " PRIMARY KEY (`redirect_id`),";
		$sql .= " KEY `from_url` (`from_url`)";
		$sql .= ") CHARSET=utf8 COLLATE=utf8_general_ci";
		$this->db->query($sql);

		// Пермишены
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/soforp_redirect_manager');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/soforp_redirect_manager');
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'tool/soforp_redirect_manager');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'tool/soforp_redirect_manager');

		// Значения параметров по умолчанию
		$this->initParamsDefaults(array(
			'status' => 1,
			'debug' => 0,
			'joomla_status' => 0,
			'joomla_product' => "shop.product_details",
			'joomla_category' => "shop.browse",
		));
	}


	public function upgrade()
	{
		return TRUE;
	}

	public function uninstall()
	{
		return TRUE;
	}


}

?>