<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class Response {
	private $headers = array();
	private $level = 0;

			private $filename;
			private $startttime;
	
	private $output;

	public function addHeader($header) {
		$this->headers[] = $header;
	}

	public function redirect($url, $status = 302) {
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url), true, $status);
		exit();
	}

	public function setCompression($level) {
		$this->level = $level;
	}

	public function getOutput() {
		return $this->output;
	}
	

		public function setCache($filename, $startttime) {
			$this->filename = $filename;
			$this->startttime = $startttime;
		}
	
	public function setOutput($output) {
		$this->output = $output;
	}

	private function compress($data, $level = 0) {
		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
			$encoding = 'gzip';
		}

		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
			$encoding = 'x-gzip';
		}

		if (!isset($encoding) || ($level < -1 || $level > 9)) {
			return $data;
		}

		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			return $data;
		}

		if (headers_sent()) {
			return $data;
		}

		if (connection_status()) {
			return $data;
		}

		$this->addHeader('Content-Encoding: ' . $encoding);

		return gzencode($data, (int)$level);
	}

	public function output() {
		if ($this->output) {
			

		//opencart turbo start	
		if($this->filename) {
			$page_data = [
				'content' => $this->output,
				'headers' => $this->headers,
				'time' => round((microtime(true) - $this->startttime),5)
			 ];				
			file_put_contents($this->filename, json_encode($page_data));	
		}
		//opencart turbo start	
	
			//Add NeoSeo
			if ($this->level) {
				$output = $this->compress($this->output, $this->level);
			} else {
				/* NeoSeo Optimizer - begin */
				if (!defined('HTTP_CATALOG') ) {
				    require_once DIR_APPLICATION . 'model/tool/soforp_optimizer.php';
				    $optimizer = new ModelToolSoforpOptimizer(array());
				    $output = $optimizer->process($this->output);
				} else {
				    $output = $this->output;
				}
				/* NeoSeo Optimizer - end */
			}
			/*
			$output = $this->level ? $this->compress($this->output, $this->level) : $this->output;
			*/
			if (!headers_sent()) {
				foreach ($this->headers as $header) {
					header($header, true);
				}
			}

			if ((isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == '1' || $_SERVER['HTTPS'])) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'))) {
				$output = str_replace(HTTP_SERVER, HTTPS_SERVER, $output);
			} else {
				$output = str_replace(HTTPS_SERVER, HTTP_SERVER, $output);
			}
    
			echo $output;
		}
	}
}
