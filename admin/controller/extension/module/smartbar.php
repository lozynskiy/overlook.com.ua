<?php
class ControllerExtensionModuleSmartbar extends Controller {
	private $error = array();

	public function index() {
		//$this->language->load('module/smartbar');
		$data = array();
		$this->load->model('extension/module/smartbar');
		$this->load->model('extension/module');
		$this->load->model('setting/setting');

		$this->document->addStyle('view/stylesheet/smartbar.css');
		$this->document->addStyle('view/javascript/summernote/summernote.css');
		$this->document->addStyle('view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		$this->document->addStyle('view/javascript/smartbar/colorpicker/css/colorpicker.css');

		$this->document->addScript('view/javascript/smartbar/colorpicker/js/colorpicker.js');
		$this->document->addScript('view/javascript/summernote/summernote.js');
		$this->document->addScript('view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');

//		$license = array(
//			'smartbar_licensed_on' => '',
//			'smartbar_license' => ''
//		);

//		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
//			if (!empty($this->request->post['OaXRyb1BhY2sgLSBDb21'])) {
//			    $license['smartbar_licensed_on'] = $this->request->post['OaXRyb1BhY2sgLSBDb21'];
//			}
//
//			if (!empty($this->request->post['cHRpbWl6YXRpb24ef4fe'])) {
//			    $license['smartbar_license'] = json_decode(base64_decode($this->request->post['cHRpbWl6YXRpb24ef4fe']), true);
//			}
//
//			$this->model_setting_setting->editSetting('smartbar_license', $license);
//		}

		$language_strings = $this->language->load('extension/module/smartbar');

		foreach ($language_strings as $code => $languageVariable) {
		     $data[$code] = $languageVariable;
		}

		$data['success'] = '';

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('smartbar', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				$data['success'] = $this->language->get('text_success');
			}
		}

		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		

		///$saved_license = $this->model_setting_setting->getSetting('smartbar_license');
//		if (!empty($saved_license)) {
//			$license = $saved_license;
//		}
//
//		if (empty($license['smartbar_licensed_on']) && empty($this->error['warning'])) {
//            $this->error['warning'] = $this->language->get('license_missing');
//        }
//
//		$data['smartbar_licensed_on'] = $license['smartbar_licensed_on'];
//		$data['smartbar_license'] = $license['smartbar_license'];
		
	
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info['name'])) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['entry_status'] = $this->language->get('entry_status');

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($module_info['status'])) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}


		if (isset($this->request->post['start_date'])) {
			$data['start_date'] = $this->request->post['start_date'];
		} elseif (!empty($module_info['start_date'])) {
			$data['start_date'] = $module_info['start_date'];
		} else {
			$data['start_date'] = '';
		}



		if (isset($this->request->post['end_date'])) {
			$data['end_date'] = $this->request->post['end_date'];
		} elseif (!empty($module_info['end_date'])) {
			$data['end_date'] = $module_info['end_date'];
		} else {
			$data['end_date'] = '';
		}

		if (isset($this->request->post['start_time'])) {
			$data['start_time'] = $this->request->post['start_time'];
		} elseif (!empty($module_info['start_time'])) {
			$data['start_time'] = $module_info['start_time'];
		} else {
			$data['start_time'] = '';
		}

	
		if (isset($this->request->post['repeat_conditions'])) {
			$data['repeat_conditions'] = $this->request->post['repeat_conditions'];
		} elseif (!empty($module_info['repeat_conditions'])) {
			$data['repeat_conditions'] = $module_info['repeat_conditions'];
		} else {
			$data['repeat_conditions'] = 0;
		}


		if (isset($this->request->post['repeat_after_days'])) {
			$data['repeat_after_days'] = $this->request->post['repeat_after_days'];
		} elseif (!empty($module_info['repeat_after_days'])) {
			$data['repeat_after_days'] = $module_info['repeat_after_days'];
		} else {
			$data['repeat_after_days'] = '1';
		}



		if (isset($this->request->post['end_time'])) {
			$data['end_time'] = $this->request->post['end_time'];
		} elseif (!empty($module_info['end_time'])) {
			$data['end_time'] = $module_info['end_time'];
		} else {
			$data['end_time'] = '';
		}


		$data['entry_position'] = $this->language->get('entry_position');

		if (isset($this->request->post['position'])) {
			$data['position'] = $this->request->post['position'];
		} elseif (!empty($module_info['position'])) {
			$data['position'] = $module_info['position'];
		} else {
			$data['position'] = 'top';
		}

		if (isset($this->request->post['effect'])) {
			$data['effect'] = $this->request->post['effect'];
		} elseif (!empty($module_info['effect'])) {
			$data['effect'] = $module_info['effect'];
		} else {
			$data['effect'] = 'appear';
		}

		if (isset($this->request->post['close_btn_position'])) {
			$data['close_btn_position'] = $this->request->post['close_btn_position'];
		} elseif (!empty($module_info['close_btn_position'])) {
			$data['close_btn_position'] = $module_info['close_btn_position'];
		} else {
			$data['close_btn_position'] = 'right';
		}


		if (isset($this->request->post['add_close_btn'])) {
			$data['add_close_btn'] = $this->request->post['add_close_btn'];
		} elseif (!empty($module_info['add_close_btn'])) {
			$data['add_close_btn'] = $module_info['add_close_btn'];
		} else {
			$data['add_close_btn'] = 'disabled';
		}

		if (isset($this->request->post['date_interval'])) {
			$data['date_interval'] = $this->request->post['date_interval'];
		} elseif (!empty($module_info['date_interval'])) {
			$data['date_interval'] = $module_info['date_interval'];
		} else {
			$data['date_interval'] = 'disabled';
		}

		if (isset($this->request->post['time_interval'])) {
			$data['time_interval'] = $this->request->post['time_interval'];
		} elseif (!empty($module_info['time_interval'])) {
			$data['time_interval'] = $module_info['time_interval'];
		} else {
			$data['time_interval'] = 'disabled';
		}

		$data['text_appear'] = $this->language->get('text_appear');
		$data['text_slide_down'] = $this->language->get('text_slide_down');
		$data['text_fade_in'] = $this->language->get('text_fade_in');

		$data['entry_width'] = $this->language->get('entry_width');
		$data['placeholder_width'] = $this->language->get('placeholder_width');

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info['width'])) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '';
		}

		$data['entry_color'] = $this->language->get('entry_color');
		$data['placeholder_color'] = $this->language->get('placeholder_color');

		if (isset($this->request->post['color'])) {
			$data['color'] = $this->request->post['color'];
		} elseif (!empty($module_info['color'])) {
			$data['color'] = $module_info['color'];
		} else {
			$data['color'] = '';
		}

		$data['entry_bgcolor'] = $this->language->get('entry_bgcolor');
		$data['placeholder_bgcolor'] = $this->language->get('placeholder_color');

		if (isset($this->request->post['bgcolor'])) {
			$data['bgcolor'] = $this->request->post['bgcolor'];
		} elseif (!empty($module_info['bgcolor'])) {
			$data['bgcolor'] = $module_info['bgcolor'];
		} else {
			$data['bgcolor'] = '';
		}

		$data['entry_css'] = $this->language->get('entry_css');
		
		if (isset($this->request->post['css'])) {
			$data['css'] = $this->request->post['css'];
		} elseif (!empty($module_info['css'])) {
			$data['css'] = $module_info['css'];
		} else {
			$data['css'] = '';
		}

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

		$data['languages'] = $this->model_extension_module_smartbar->getLanguages();

		$data['entry_text'] = $this->language->get('entry_text');
		$data['placeholder_text'] = $this->language->get('placeholder_text');

		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (!empty($module_info['text'])) {
			$data['text'] = $module_info['text'];
		} else {
			$data['text'] = array();
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/smartbar', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/smartbar', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/smartbar', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/smartbar', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&type=module', 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/smartbar.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/smartbar')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}