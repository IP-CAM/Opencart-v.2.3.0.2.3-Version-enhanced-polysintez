<?php
class ControllerRevolutionRevmodal extends Controller {
	public function index() {

		$settings = $this->config->get('revtheme_all_settings');
		if (!$settings['modal_status']) {
			return false;
		}
		
		$data = array();
		$this->load->language('revolution/revolution');
		if ($settings[$this->config->get('config_language_id')]['text_yes'] && $settings[$this->config->get('config_language_id')]['text_no']) {
			$data['text_yes'] = $settings[$this->config->get('config_language_id')]['text_yes'];
			$data['text_no'] = $settings[$this->config->get('config_language_id')]['text_no'];
		} else {
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
		}
		$data['modal_heading_title'] = $settings[$this->config->get('config_language_id')]['modal_header'];
		$data['modal_message'] = html_entity_decode((str_replace("<img", "<img class='img-responsive'", $settings[$this->config->get('config_language_id')]['modal_text'])), ENT_QUOTES, 'UTF-8');
		$data['modal_time'] = $settings['modal_time'];
		$data['modal_buttons'] = $settings['modal_buttons'];
		
		if (VERSION >= 2.2) {
			$this->response->setOutput($this->load->view('revolution/revmodal', $data));
		} else {
			$this->response->setOutput($this->load->view('revolution/template/revolution/revmodal.tpl', $data));
		}

	}
}