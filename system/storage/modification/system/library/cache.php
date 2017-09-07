<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class Cache {

private $ssl = 'http_';
    
	private $adaptor;

	public function __construct($adaptor, $expire = 3600) {
		if ((isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == '1' || $_SERVER['HTTPS'])) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'))) {
			$this->ssl = 'https_';
		}
		$class = 'Cache\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($expire);
		} else {
			throw new \Exception('Error: Could not load cache adaptor ' . $adaptor . ' cache!');
		}
	}
	
	public function get($key) {

		$key = $this->ssl.$key;
    
		return $this->adaptor->get($key);
	}

	public function set($key, $value) {

		$key = $this->ssl.$key;
    
		return $this->adaptor->set($key, $value);
	}

	public function delete($key) {

		$key = $this->ssl.$key;
    
		return $this->adaptor->delete($key);
	}
}
