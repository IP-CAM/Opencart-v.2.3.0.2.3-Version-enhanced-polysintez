<?php
class NeoSeoProfiler {
	protected $tabCount = 0;
	protected $tab = "        ";
	private $allowed_ips = array(
		'127.0.0.1',
		'93.188.37.10'
	);

	public function getMicroTime($time){
		return sprintf("%3.1f",$time) . " ms";
	}

	public function getTimeDiff($from){
		$time = 1000*round(microtime(true) - $from,4);
		return $this->getMicroTime($time);
	}

	public function getTime(){
		$micro_date = microtime();
		$date_array = explode(" ",$micro_date);
		$time = date("Y-m-d H:i:s", $date_array[1]) . ".";
		$ms = (int)(1000*$date_array[0]);
		if( $ms < 10 )
			$time .= "00" . $ms;
		else if( $ms < 100 )
			$time .= "0" . $ms;
		else
			$time .= $ms;
		return $time;
	}

	public function log($message){
		if( !in_array($_SERVER['REMOTE_ADDR'], $this->allowed_ips) ) {
			return;
		}
		
		$file = DIR_LOGS . "profile.log";
		file_put_contents($file, $this->getTime() . " " . $message . "\r\n", FILE_APPEND );
	}

	public function page_started(){
		$name = $_SERVER['REQUEST_URI'];
		$this->log(str_repeat($this->tab, $this->tabCount). "page started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function page_finished($from){
		$this->tabCount--;
		$name = $_SERVER['REQUEST_URI'];
		$this->log(str_repeat($this->tab, $this->tabCount). "page finished: $name - " . $this->getTimeDiff($from) );

		if( false === strpos($_SERVER['REQUEST_URI'],"captcha") ) {
			file_put_contents( DIR_LOGS . "profile_" . date("Y_m_d") . ".csv", $_SERVER['REMOTE_ADDR'] . '"' . $this->getTime() .  '";"' . (int)(1000 * round(microtime(true) - $from,3)) . '";"http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . '"' . "\r\n", FILE_APPEND );
		}
	}

	public function email_started($name){
		$this->log(str_repeat($this->tab, $this->tabCount). "email started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function email_finished($name,$from){
		$this->tabCount--;
		$this->log(str_repeat($this->tab, $this->tabCount). "email finished: $name - " . $this->getTimeDiff($from) );
	}

	public function controller_started($name){
		$this->log(str_repeat($this->tab, $this->tabCount). "controller started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function controller_finished($name,$from){
		$this->tabCount--;
		$this->log(str_repeat($this->tab, $this->tabCount). "controller finished: $name - " . $this->getTimeDiff($from) );
	}

	public function object_init_started($name){
		$this->log(str_repeat($this->tab, $this->tabCount). "object init started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function object_init_finished($name,$from){
		$this->tabCount--;
		$this->log(str_repeat($this->tab, $this->tabCount). "object init finished: $name - " . $this->getTimeDiff($from) );
	}

	public function child_controller_started($name){
		$this->log(str_repeat($this->tab, $this->tabCount). "child controller started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function child_controller_finished($name,$from){
		$this->tabCount--;
		$this->log(str_repeat($this->tab, $this->tabCount). "child controller finished: $name - " . $this->getTimeDiff($from) );
	}

	public function template_started($name){
		$this->log(str_repeat($this->tab, $this->tabCount). "template started: $name" );
		$this->tabCount++;
		return microtime(true);
	}

	public function template_finished($name,$from){
		$this->tabCount--;
		$this->log(str_repeat($this->tab, $this->tabCount). "template finished: $name - " . $this->getTimeDiff($from) );
	}

	public function query_finished($sql,$time){
		$sql = strtr($sql,array("\r"=>"","\n"=>""));
		$this->log( str_repeat($this->tab, $this->tabCount). $this->getTimeDiff($time) . " - $sql" );
	}
}
