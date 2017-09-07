<?php
class ModelModuleRevolution extends Model {

	public function install() {
		
		// revmenu

		$this->db->query("
		ALTER TABLE `" . DB_PREFIX . "category` 
		ADD COLUMN `image2` VARCHAR(255) NULL DEFAULT NULL AFTER `parent_id`,
		ADD COLUMN `category_icontype` INT(11) UNSIGNED NOT NULL DEFAULT '1' AFTER `image2`,
		ADD COLUMN `category_icon` VARCHAR(50) NOT NULL DEFAULT 'fa none' AFTER `category_icontype`,
		ADD COLUMN `category_image` VARCHAR(255) NULL DEFAULT NULL AFTER `category_icon`;
		");
		
		$this->db->query("
		ALTER TABLE `" . DB_PREFIX . "information` 
		ADD COLUMN `top` INT(1) NOT NULL DEFAULT '0' AFTER `bottom`, 
		ADD COLUMN `top2` INT(1) NOT NULL DEFAULT '0' AFTER `top`;
		");

		// revblog
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog` ( 
		`revblog_id` int(11) NOT NULL AUTO_INCREMENT, 
		`image` varchar(255) DEFAULT NULL, 
		`date_added` datetime NOT NULL, 
		`date_modified` datetime NOT NULL, 
		`date_available` date NOT NULL DEFAULT '0000-00-00', 
		`sort_order` int(3) NOT NULL DEFAULT '0', 
		`status` tinyint(1) NOT NULL DEFAULT '1', 
		PRIMARY KEY (`revblog_id`) 
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		");
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_description` ( 
		`revblog_id` int(11) NOT NULL, 
		`language_id` int(11) NOT NULL, 
		`title` varchar(64) NOT NULL, 
		`title_pr` varchar(64) NOT NULL, 
		`title_products` varchar(64) NOT NULL, 
		`description` text NOT NULL, 
		`meta_title` varchar(255) NOT NULL, 
		`meta_description` varchar(255) NOT NULL, 
		`meta_keyword` varchar(255) NOT NULL, 
		PRIMARY KEY (`revblog_id`,`language_id`) 
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_to_category` (
		`revblog_id` int(11) NOT NULL,
		`category_id` int(11) NOT NULL,
		`main_category` tinyint(1) NOT NULL DEFAULT '0',
		PRIMARY KEY (`revblog_id`,`category_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_category` (
		`category_id` int(11) NOT NULL AUTO_INCREMENT,
		`image` varchar(255) DEFAULT NULL,
		`parent_id` int(11) NOT NULL DEFAULT '0',
		`sort_order` int(3) NOT NULL DEFAULT '0',
		`status` tinyint(1) NOT NULL,
		`date_added` datetime NOT NULL,
		`date_modified` datetime NOT NULL,
		PRIMARY KEY (`category_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_category_description` (
		`category_id` int(11) NOT NULL,
		`language_id` int(11) NOT NULL,
		`title` varchar(255) NOT NULL,
		`description` text NOT NULL,
		`meta_title` varchar(255) NOT NULL,
		`meta_description` varchar(255) NOT NULL,
		`meta_keyword` varchar(255) NOT NULL,
		PRIMARY KEY (`category_id`,`language_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_category_path` (
		`category_id` int(11) NOT NULL,
		`path_id` int(11) NOT NULL,
		`level` int(11) NOT NULL,
		PRIMARY KEY (`category_id`,`path_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_category_to_layout` (
		`category_id` int(11) NOT NULL,
		`store_id` int(11) NOT NULL,
		`layout_id` int(11) NOT NULL,
		PRIMARY KEY (`category_id`,`store_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_category_to_store` (
		`category_id` int(11) NOT NULL,
		`store_id` int(11) NOT NULL,
		PRIMARY KEY (`category_id`,`store_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		// --
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_to_layout` ( 
		`revblog_id` int(11) NOT NULL, 
		`store_id` int(11) NOT NULL, 
		`layout_id` int(11) NOT NULL, 
		PRIMARY KEY (`revblog_id`,`store_id`) 
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");

		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_to_store` ( 
		`revblog_id` int(11) NOT NULL, 
		`store_id` int(11) NOT NULL, 
		PRIMARY KEY (`revblog_id`,`store_id`) 
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_product` ( 
		`revblog_id` int(11) NOT NULL, 
		`product_id` int(11) NOT NULL, 
		PRIMARY KEY (`revblog_id`,`product_id`) 
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		$this->db->query("
		CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revblog_images` (
		`image_id` int(11) NOT NULL AUTO_INCREMENT,
		`revblog_id` int(11) NOT NULL,
		`image` varchar(255) DEFAULT NULL,
		`sort_order` int(3) NOT NULL DEFAULT '0',
		PRIMARY KEY (`image_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		");

		// revsubscribe
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revsubscribe` (
		`subscribe_id` INT(11) NOT NULL AUTO_INCREMENT, 
		`email` VARCHAR(200) NULL DEFAULT NULL, 
		`store_id` int(11) DEFAULT NULL, 
		`date_created` DATETIME  NOT NULL DEFAULT '0000-00-00 00:00:00', 
		`language_id` VARCHAR(100) NULL DEFAULT '".$this->config->get('config_language_id')."', 
		PRIMARY KEY (`subscribe_id`));
		");
		
		// revtabs_product
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX ."product_tab` (
		`product_tab_id` int(11) NOT NULL AUTO_INCREMENT, 
		`product_id` INT(11) NOT NULL, 
		`sort_order` TINYINT(4) NOT NULL, 
		`status` TINYINT(4) NOT NULL, 
		PRIMARY KEY(`product_tab_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_tab_desc` (
		`product_tab_id` int(11) NOT NULL, 
		`heading` varchar(255) NOT NULL, 
		`description` text NOT NULL, 
		`product_id` int(11) NOT NULL, 
		`language_id` int(11) NOT NULL ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		// revtabs_products
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX ."tabs` (
		`tab_id` int(11) NOT NULL AUTO_INCREMENT, 
		`products` text NOT NULL, 
		`categories` text NOT NULL, 
		`manufactures` text NOT NULL, 
		`ingore_products` text NOT NULL, 
		`stores` text NOT NULL, 
		`allproducts` tinyint(4) NOT NULL, 
		`status` int(11) NOT NULL, 
		`sort_order` int(11) NOT NULL, 
		`date_added` datetime NOT NULL,PRIMARY KEY (`tab_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."tabs_description` (
		`tab_id` int(11) NOT NULL, 
		`language_id` int(11) NOT NULL, 
		`title` varchar(255) NOT NULL, 
		`description` text NOT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
		
		// review_admin_ansver
		
		$this->db->query("ALTER TABLE `" . DB_PREFIX ."review` ADD COLUMN `answer` TEXT NOT NULL AFTER `text`");
		$this->db->query("ALTER TABLE `" . DB_PREFIX ."review` ADD COLUMN `answer_from` VARCHAR(64) NOT NULL AFTER `answer`");
		
		// video_in_product
		
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_image` 
		ADD COLUMN `video` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL");
		
		// popupphone_in_admin
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "revpopupphones` (
		`pphone_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(64) NOT NULL,
		`telephone` varchar(64) NOT NULL,
		`email` varchar(64) NOT NULL,
		`comment` text NOT NULL,
		`status` int(1) NOT NULL DEFAULT '0',
		`date_added` datetime NOT NULL,
		PRIMARY KEY (`pphone_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
		");
		
		// seo_urls

		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`query`, `keyword`) VALUES ('revolution/revpbest', 'best')");
		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`query`, `keyword`) VALUES ('revolution/revplast', 'latest')");
		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`query`, `keyword`) VALUES ('revolution/revstorereview', 'otzivy')");
		
		// option_image_model
		
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD COLUMN `options_buy` TINYINT(1) NOT NULL DEFAULT '0' AFTER `shipping`");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD COLUMN `opt_image` VARCHAR(255) NULL DEFAULT NULL AFTER `weight_prefix`");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD COLUMN `model` VARCHAR(64) NOT NULL AFTER `opt_image`");

	}

	public function uninstall() {

		// revmenu

		$this->db->query("
		ALTER TABLE `" . DB_PREFIX . "category` 
		DROP image2,
		DROP category_icontype,
		DROP category_icon,
		DROP category_image
		");
		
		$this->db->query("
		ALTER TABLE `" . DB_PREFIX . "information` 
		DROP top, 
		DROP top2
		");
		
		// revblog
		
		$this->db->query("
		DROP TABLE IF EXISTS 
		`" . DB_PREFIX . "revblog`, 
		`" . DB_PREFIX . "revblog_category`, 
		`" . DB_PREFIX . "revblog_category_description`, 
		`" . DB_PREFIX . "revblog_category_path`, 
		`" . DB_PREFIX . "revblog_category_to_layout`, 
		`" . DB_PREFIX . "revblog_category_to_store`, 
		`" . DB_PREFIX . "revblog_description`, 
		`" . DB_PREFIX . "revblog_to_category`, 
		`" . DB_PREFIX . "revblog_to_layout`, 
		`" . DB_PREFIX . "revblog_to_store`, 
		`" . DB_PREFIX . "revblog_product`, 
		`" . DB_PREFIX . "revblog_images`
		");
		
		// revsubscribe
		
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "revsubscribe`");
		
		// revtabs_product
		
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_tab`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_tab_desc`");
		
		// revtabs_products
		
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "tabs`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "tabs_description`");
				
		// review_admin_ansver

		$this->db->query("ALTER TABLE `" . DB_PREFIX . "review` 
		DROP `answer`,
		DROP `answer_from`
		");
		
		// video_in_product
		
		$this->db->query("
		ALTER TABLE `" . DB_PREFIX . "product_image` DROP video");
		
		// popupphone_in_admin
		
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "revpopupphones`");
		
		// seo_urls
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` = 'revolution/revpbest'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` = 'revolution/revplast'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` = 'revolution/revstorereview'");
		
		// option_image_model
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` DROP options_buy");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` 
		DROP opt_image,
		DROP model
		");
		
		// user_permission
		
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'module/revblogmod');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'module/revblogmod');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revblog');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revblog');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revblogcategory');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revblogcategory');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revblog_setting');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revblog_setting');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revpopupphone');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revpopupphone');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revreview');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revreview');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revsubscribe');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revsubscribe');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revtabs');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revtabs');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'revolution/revtheme');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'revolution/revtheme');
		
	}
	
	public function install_demo_autotovars() {
		$db_prefix = DB_PREFIX;
		if(VERSION >= 2.2) {
			$file = DIR_APPLICATION . 'model/module/demo_autotovars_23.sql';
		} else {
			$file = DIR_APPLICATION . 'model/module/demo_autotovars.sql';
		}
		
		if (!file_exists($file)) {
			exit('Нет файла настроек: ' . $file);
		}
		
		$lines = file($file);

		if ($lines) {
			$sql = '';

			foreach($lines as $line) {
				if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
					$sql .= $line;

					if (preg_match('/;\s*$/', $line)) {
						$sql = str_replace("TRUNCATE TABLE `oc_", "TRUNCATE TABLE `" . $db_prefix, $sql);
						$sql = str_replace("DELETE FROM `oc_", "DELETE FROM `" . $db_prefix, $sql);
						$sql = str_replace("UPDATE `oc_", "UPDATE `" . $db_prefix, $sql);
						$sql = str_replace("INSERT INTO `oc_", "INSERT INTO `" . $db_prefix, $sql);

						$this->db->query($sql);

						$sql = '';
					}
				}
			}
			
			$this->db->query("SET CHARACTER SET utf8");
			$this->db->query("SET @@session.sql_mode = 'MYSQL40'");
		}
	}
	
	public function install_demo_odegda() {
		$db_prefix = DB_PREFIX;
		if(VERSION >= 2.2) {
			$file = DIR_APPLICATION . 'model/module/demo_odegda_23.sql';
		} else {
			$file = DIR_APPLICATION . 'model/module/demo_odegda.sql';
		}
		
		if (!file_exists($file)) {
			exit('Нет файла настроек: ' . $file);
		}

		$lines = file($file);

		if ($lines) {
			$sql = '';

			foreach($lines as $line) {
				if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
					$sql .= $line;

					if (preg_match('/;\s*$/', $line)) {
						$sql = str_replace("TRUNCATE TABLE `oc_", "TRUNCATE TABLE `" . $db_prefix, $sql);
						$sql = str_replace("DELETE FROM `oc_", "DELETE FROM `" . $db_prefix, $sql);
						$sql = str_replace("UPDATE `oc_", "UPDATE `" . $db_prefix, $sql);
						$sql = str_replace("INSERT INTO `oc_", "INSERT INTO `" . $db_prefix, $sql);

						$this->db->query($sql);

						$sql = '';
					}
				}
			}

			$this->db->query("SET CHARACTER SET utf8");
			$this->db->query("SET @@session.sql_mode = 'MYSQL40'");
		}
	}
} 
?>