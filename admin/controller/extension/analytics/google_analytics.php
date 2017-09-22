<?php
class ControllerExtensionAnalyticsGoogleAnalytics extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/analytics/google_analytics');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->load->model('extension/analytics/google_analytics');
		
		$data['stores'] = array();
					
		$stores = $this->model_extension_analytics_google_analytics->getStores();
		
		foreach ($stores as $store) {
			$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'store_name' => $store['store_name']
			);
		}
			

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('google_analytics', $this->request->post, $this->request->post['google_analytics_store']);
			
			$this->session->data['store_name'] = $this->model_extension_analytics_google_analytics->getSelectedStoreName($this->request->post['google_analytics_store']);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=analytics', true));
			
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_signup'] = $this->language->get('text_signup');

		$data['entry_code'] = $this->language->get('entry_code');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];
		$data['help_ga_exclude_admin'] = $this->language->get('help_ga_exclude_admin');
		$data['help_ga_tracking_type'] = $this->language->get('help_ga_tracking_type');
		$data['help_ga_conversion_id'] = $this->language->get('help_ga_conversion_id');
		$data['help_ga_remarketing'] = $this->language->get('help_ga_remarketing');
		$data['help_ga_cookie'] = $this->language->get('help_ga_cookie');
		$data['help_ga_adwords'] = $this->language->get('help_ga_adwords');
		$data['help_ga_label'] = $this->language->get('help_ga_label');
		$data['help_ua_tracking'] = $this->language->get('help_ua_tracking');
		$data['entry_ga_exclude_admin'] = $this->language->get('entry_ga_exclude_admin');
		$data['entry_ga_conversion_id'] = $this->language->get('entry_ga_conversion_id');
		$data['entry_ga_remarketing'] = $this->language->get('entry_ga_remarketing');
		$data['entry_ga_cookie'] = $this->language->get('entry_ga_cookie');
		$data['entry_ga_adwords'] = $this->language->get('entry_ga_adwords');
		$data['entry_ga_label'] = $this->language->get('entry_ga_label');
		$data['entry_ua_tracking'] = $this->language->get('entry_ua_tracking');
		$data['text_classic'] = $this->language->get('text_classic');
		$data['text_universal'] = $this->language->get('text_universal');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_exclude'] = $this->language->get('text_exclude');
		$data['text_include'] = $this->language->get('text_include');
		$data['text_no_track'] = $this->language->get('text_no_track');
		$data['text_track'] = $this->language->get('text_track');
			


		if (isset($this->session->data['success'])) {
			$data['success'] = sprintf($this->session->data['success'], $this->session->data['store_name']);

			unset($this->session->data['success']);
			unset($this->session->data['store_name']);
		} else {
			$data['success'] = '';
		}
			
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_analytics'),
			'href' => $this->url->link('extension/analytics', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('analytics/google_analytics', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/analytics/google_analytics', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension/analytics', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['google_analytics_code'])) {
			$data['google_analytics_code'] = $this->request->post['google_analytics_code'];
		} else {
			$data['google_analytics_code'] = $this->config->get('google_analytics_code');
		}

		if (isset($this->request->post['google_analytics_status'])) {
			$data['google_analytics_status'] = $this->request->post['google_analytics_status'];
		} else {
			$data['google_analytics_status'] = $this->config->get('google_analytics_status');
		}


			if (isset($this->request->post['google_analytics_store'])) {
				$data['google_analytics_store'] = $this->request->post['google_analytics_store']; 
			} else {
				$data['google_analytics_store'] = $this->config->get('google_analytics_store');
			}
			
			if (isset($this->request->post['google_analytics_exclude_admin'])) {
				$data['google_analytics_exclude_admin'] = $this->request->post['google_analytics_exclude_admin']; 
			} else {
				$data['google_analytics_exclude_admin'] = $this->config->get('google_analytics_exclude_admin');
			}
						
			if (isset($this->request->post['google_analytics_property_id'])) {
				$data['google_analytics_property_id'] = $this->request->post['google_analytics_property_id']; 
			} else {
				$data['google_analytics_property_id'] = $this->config->get('google_analytics_property_id');
			}
			
			if (isset($this->request->post['google_analytics_remarketing'])) {
				$data['google_analytics_remarketing'] = $this->request->post['google_analytics_remarketing']; 
			} else {
				$data['google_analytics_remarketing'] = $this->config->get('google_analytics_remarketing');
			}
			
			if (isset($this->request->post['google_analytics_cookie'])) {
				$data['google_analytics_cookie'] = $this->request->post['google_analytics_cookie']; 
			} else {
				$data['google_analytics_cookie'] = $this->config->get('google_analytics_cookie');
			}
			
			if (isset($this->request->post['google_analytics_adwords'])) {
				$data['google_analytics_adwords'] = $this->request->post['google_analytics_adwords'];
			} else {
				$data['google_analytics_adwords'] = $this->config->get('google_analytics_adwords');
			}
			
			if (isset($this->request->post['google_analytics_conversion_id'])) {
				$data['google_analytics_conversion_id'] = $this->request->post['google_analytics_conversion_id']; 
			} else {
				$data['google_analytics_conversion_id'] = $this->config->get('google_analytics_conversion_id');
			}
			
			if (isset($this->request->post['google_analytics_label'])) {
				$data['google_analytics_label'] = $this->request->post['google_analytics_label']; 
			} else {
				$data['google_analytics_label'] = $this->config->get('google_analytics_label');
			}
			
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/analytics/google_analytics.tpl', $data));
	}


	public function getSettings() {				
		$this->load->model('extension/analytics/google_analytics');
	
		$settings = $this->model_extension_analytics_google_analytics->getSettings($this->request->post['store_id']);
										
		$this->response->setOutput(json_encode($settings));
	}			
		
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/analytics/google_analytics')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
			if (isset($this->request->post['google_analytics_status']) && empty($this->request->post['google_analytics_property_id'])) {
				$this->error['warning'] = $this->language->get('error_ga_property_id');
			}
			
			if (isset($this->request->post['google_analytics_adwords']) && $this->request->post['google_analytics_adwords'] == 1 && empty($this->request->post['google_analytics_conversion_id'])) {
				$this->error['warning'] = $this->language->get('error_ga_conversion_id');
			}
			
			if (isset($this->request->post['google_analytics_adwords']) && $this->request->post['google_analytics_adwords'] == 1 && empty($this->request->post['google_analytics_label'])) {
				$this->error['warning'] = $this->language->get('error_ga_label');
			}
			
			if ($this->request->post['google_analytics_store'] == '') {
				$this->error['warning'] = $this->language->get('error_ga_store');
			}
						
			if ($this->request->post['google_analytics_exclude_admin'] == ''|| $this->request->post['google_analytics_remarketing'] == '' || $this->request->post['google_analytics_cookie'] == '' || $this->request->post['google_analytics_status'] == '') {
				$this->error['warning'] = $this->language->get('error_empty');
			}
			
		return !$this->error;
	}
}
