<?php
class ControllerRevolutionRevsocvinsta extends Controller {
	public function index() {
		$setting = $this->config->get('revtheme_home_socv');
		if (!$setting['status_insta']) {
			return false;
		}
		$data['userInfo'] = $this->getUserInfo($setting['id_insta']);
		$data['width'] = $setting['width_insta'];
		if (VERSION >= 2.2) {
			return $this->load->view('revolution/revsocvinsta', $data);
		} else {
			return $this->load->view('revolution/template/revolution/revsocvinsta.tpl', $data);
		}
	}
	private function getUserInfo($username) {
		$curl = $this->cache->get('revinsta');
		if (!$curl) {
			$url = 'https://www.instagram.com/' . $username . '/?__a=1';
			$curl = $this->curl($url);
			$this->cache->set('revinsta',$curl);
		}
		return $curl;
	}
	private function curl($url, $additional_opts = array()) {
		$default_opts = array(
			CURLOPT_HEADER         => false,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false,
			CURLOPT_RETURNTRANSFER => 1,
			CURLOPT_URL            => $url,
		);
		$ch = curl_init($url);
		$opts = $default_opts + $additional_opts;
		curl_setopt_array($ch, $opts);
		$response = json_decode(curl_exec($ch),true);
		curl_close($ch);
		return $response;
	}
}