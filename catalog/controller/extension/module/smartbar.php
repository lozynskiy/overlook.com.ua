<?php

class ControllerExtensionModuleSmartbar extends Controller {
	public function index($setting) {

		$data['css_id'] = 'smartbar_' . md5(json_encode($setting));
		
		if ($setting['repeat_conditions'] && isset($_COOKIE[$data['css_id']])) {
			return;
		}

		if (!$this->timeIsBetween($setting['start_time'],$setting['end_time'], $setting['time_interval'])) {
			return;
		}

		if (!$this->dateIsBetween($setting['start_date'] ,$setting['end_date'],$setting['date_interval'])) {
			return;
		}

		$this->document->addScript('catalog/view/theme/pavilion/scripts/smartbar.js');

		if (file_exists(DIR_TEMPLATE . $this->getTemplate() . '/style/smartbar.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->getTemplate() . '/style/smartbar.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/smartbar.css');
		}

		$data['text'] = !empty($setting['text'][$this->config->get('config_language_id')]) ? html_entity_decode($setting['text'][$this->config->get('config_language_id')]) : '';
		$data['width'] = $setting['width'];		
		$data['repeat_conditions'] = $setting['repeat_conditions'];
		$data['repeat_after_days'] = $setting['repeat_after_days'];
		$data['color'] = $setting['color'];
		$data['bgcolor'] = $setting['bgcolor'];
		$data['css'] = $setting['css'];
		$data['position'] = $setting['position'];
		$data['effect'] = $setting['effect'];		
		$data['add_close_btn'] = $setting['add_close_btn'] == 'enable' ? true : false;
		$data['close_btn_position'] = !empty($setting['close_btn_position']) ? $setting['close_btn_position'] : '' ;

		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/smartbar.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/extension/module/smartbar.tpl', $data);
			} else {
				return $this->load->view('default/template/extension/module/smartbar.tpl', $data);
			}
		} else {
			return $this->load->view('extension/module/smartbar', $data);
		}
	}

	private function getTemplate() {
		return version_compare(VERSION, '2.2.0.0', '<') ? $this->config->get('config_template') : $this->config->get($this->config->get('config_theme') . '_directory');
	}

	private function timeIsBetween($from, $to, $enabled) {
		$date = 'now';
	    $date = is_int($date) ? $date : strtotime($date); // convert non timestamps
	    
	    $from = is_int($from) ? $from : strtotime($from); // ..
	    $to = is_int($to) ? $to : strtotime($to);
	 
	    if($enabled=="disabled")
	    	return true;
	    else         // ..
	    	return ($date > $from) && ($date < $to); // extra parens for clarity
	}

	private function dateIsBetween($start_date, $end_date, $enabled)
	{
	  	// Convert to timestamp
		  $start_ts = strtotime($start_date);
		  $end_ts = strtotime($end_date);
		  $current_ts = strtotime(date("Y-m-d"));

		 if($enabled=="disabled"){
		    	return true;
		 } else {
		 	 return (($current_ts >= $start_ts) && ($current_ts <= $end_ts));
		 }	 
	}
}