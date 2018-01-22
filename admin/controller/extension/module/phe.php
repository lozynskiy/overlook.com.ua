<?php
class ControllerExtensionModulePHE extends Controller {
	private $version = '5.0';
	private $code = 'phe';
	private $extension = 'Шаблоны писем';
	private $extension_id = '11490';
	private $purchase_url = 'pretty-html-email';
	private $error = array();
	private $product_table = '<table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
	<thead>
		<tr>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Изображение</td>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Товар</td>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Модель</td>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: right; padding: 7px; color: #222222;">Количество</td>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: right; padding: 7px; color: #222222;">Цена</td>
			<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: right; padding: 7px; color: #222222;">Стоимость</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;background:#ffffff"><img src="{no_image}" alt="iPhone" title="iPhone" /></td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">iPhone<br />
			<small>&nbsp;-Black</small></td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">iPhone-Black</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">2</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">$200.00</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">$400.00</td>
		</tr>
		<tr>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">&nbsp;</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">Подарочный сертификат для вас</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">&nbsp;</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">1</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">$20.00</td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">$20.00</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff"><b>Итого</b></td>
			<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;background:#ffffff">$420.00</td>
		</tr>
	</tfoot>
</table>';
	private $comment_table = '<table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
	<thead>
	  <tr>
		<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Инструкция</td>
	  </tr>
	</thead>
	<tbody>
	  <tr>
		<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff">Оплатите заказ #123456 через банк на нашу карту.</td>
	  </tr>
	</tbody>
  </table>';

	public function index() {
		$this->language->load('extension/module/phe');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module/phe');
				
		$this->getList();
	}
	
	public function insert() {
		$this->language->load('extension/module/phe');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module/phe');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_phe->addTemplate($this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
		
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->response->redirect($this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url, true));
		}
				
		$this->getForm();
	}
	
	public function update() {
		$this->language->load('extension/module/phe');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module/phe');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_phe->editTemplate($this->request->get['template_id'], $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
		
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->response->redirect($this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url, true));
		}
				
		$this->getForm();
	}
	
	public function delete() {
		$this->language->load('extension/module/phe');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module/phe');
		
		if (isset($this->request->post['selected']) && $this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $template_id) {
				$this->model_extension_module_phe->deleteTemplate($template_id);
			}
					
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
		
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->response->redirect($this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url, true));
		}
		
		$this->getList();
	}
	
	public function email() {
		$this->language->load('extension/module/phe');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module/phe');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $template_id) {
				$template_info = $this->model_extension_module_phe->getTemplateForEmail($template_id);
				
				$data['store_name'] = $this->config->get('config_name');
				$data['url'] = HTTP_CATALOG;
				
				if (defined('HTTPS_CATALOG')) {
					$url = HTTPS_CATALOG . 'image/';
				} else {
					$url = HTTPS_IMAGE;
				}
				
				$data['logo'] = $url . $this->config->get('config_logo');
				
				if (!empty($template_info['image'])) {
					$data['logo'] = $url . $template_info['image'];
				}
				
				$data['body'] = $template_info['body'];
				$data['heading'] = $template_info['heading'];
				$data['background'] = $template_info['background'];
				
				$this->load->model('tool/image');
				
				$product_table = str_replace('{no_image}', $this->model_tool_image->resize('no_image.png', 50, 50), $this->product_table);
				
				$search = array('{firstname}', '{lastname}', '{email}', '{telephone}', '{password}', '{enquiry}', '{customer_id}', '{order_id}', '{date_added}', '{payment_method}', '{shipping_method}', '{ip}', '{comment}', '{payment_address}', '{shipping_address}', '{product_table}', '{comment_table}', '{points}', '{total_points}', '{credits}', '{total_credits}', '{commission}', '{total_commission}', '{return_id}', '{message}', '{code}', '{amount}', '{to_name}', '{from_name}', '{voucher_theme}');
				$replace = array('John', 'Tan', 'test@example.com', '+65 12345678', 'mysecretpass', 'This is my enquiry message to you', '1', '1', '01/01/2000', 'PayPal', 'FeDex', '127.0.0.1', 'Make payment to our bank #123456', 'My Payment Address', 'My Shipping Address', $product_table, $this->comment_table, '20', '120', '20', '120', '20', '120', '1', 'Gift voucher message here.', 'abc123', '$10.00', 'John', 'Henry', '<img src="' . $this->model_tool_image->resize('no_image.png', 50, 50) . '" />');
				
				$data['subject'] = str_replace($search, $replace, html_entity_decode($template_info['subject']));
				$data['message'] = str_replace($search, $replace, html_entity_decode($template_info['message']));
				
				$html = $this->load->view('mail/phe.tpl', $data);
				
				if (version_compare(VERSION, '1.5.6.5', '<')) {
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->hostname = $this->config->get('config_smtp_host');
					$mail->username = $this->config->get('config_smtp_username');
					$mail->password = $this->config->get('config_smtp_password');
					$mail->port = $this->config->get('config_smtp_port');
					$mail->timeout = $this->config->get('config_smtp_timeout');
				} elseif (version_compare(VERSION, '2.0.2.0', '<')) {
					$mail = new Mail($this->config->get('config_mail'));
				} else {
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				}
				
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject($data['subject']);
				$mail->setText(html_entity_decode($template_info['message'], ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
				$mail->send();
			}
					
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
		
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->response->redirect($this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url, true));
		}
		
		$this->getList();
	}
	
	protected function getList() {
		$this->load->model('setting/setting');
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data = array(
			'sort'		=> $sort,
			'order'		=> $order,
			'page'		=> $page,
			'start'		=> $this->config->get('config_admin_limit') * ($page - 1),
			'limit'		=> $this->config->get('config_admin_limit')
		);
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'], true)
   		);
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['column_name'] = $this->language->get('column_name');
		$data['column_type'] = $this->language->get('column_type');
		$data['column_store'] = $this->language->get('column_store');
		$data['column_priority'] = $this->language->get('column_priority');
		$data['column_date_start'] = $this->language->get('column_date_start');
		$data['column_date_end'] = $this->language->get('column_date_end');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['text_edit'] = $this->language->get('text_edit');
		
		$data['tab_list'] = $this->language->get('tab_list');
		
		$data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_email'] = $this->language->get('button_email');
		
		$data['send_copy'] = $this->url->link('extension/module/phe/email', 'token=' . $this->session->data['token'], true);
		$data['action'] = $this->url->link('extension/module/phe/delete', 'token=' . $this->session->data['token'], true);
		$data['insert'] = $this->url->link('extension/module/phe/insert', 'token=' . $this->session->data['token'], true);
		$data['token'] = $this->session->data['token'];
		
		$templates = $this->model_extension_module_phe->getTemplates($data);
		
		$data['templates'] = array();
		
		$this->load->model('localisation/order_status');
		$this->load->model('localisation/return_status');
		$this->load->model('setting/store');
		
		foreach ($templates as $template) {
			$action = array();
			
			$action[] = array(
				'link'		=> $this->url->link('extension/module/phe/update', 'token=' . $this->session->data['token'] . $url . '&template_id=' . $template['email_template_id'], true),
				'name'		=> $this->language->get('text_edit_template')
			);
			
			$type = $this->model_localisation_order_status->getOrderStatus($template['type']);
			
			$return_type = $this->model_localisation_return_status->getReturnStatus(intval(str_replace('return_', '', $template['type'])));

			if ($return_type && !$type) {
				$type = $this->language->get('text_return') . ' ' . $return_type['name'];
			} elseif ($type) {
				$type = $this->language->get('text_status') . ' ' . $type['name'];
			} else {
				$type = $this->language->get('text_' . $template['type']);
			}
			
			if ($template['store_id']) {
				$store = $this->model_setting_store->getStore($template['store_id']);
				$store = $store['name'];
			} else {
				$store = $this->language->get('text_default');
			}
			
			$data['templates'][] = array(
				'email_template_id'		=> $template['email_template_id'],
				'name'					=> $template['name'],
				'type'					=> $type,
				'store'					=> $store,
				'priority'				=> $template['priority'],
				'date_start'			=> date($this->language->get('date_format_short'), strtotime($template['date_start'])),
				'date_end'				=> date($this->language->get('date_format_short'), strtotime($template['date_end'])),
				'selected'     			=> isset($this->request->post['selected']) && in_array($template['email_template_id'], $this->request->post['selected']),
				'action'				=> $action
			);
		}
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $this->model_extension_module_phe->getTotalTemplates();
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
		$data['pagination'] = $pagination->render();
		
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		if ($order == 'ASC') {
			$order = 'DESC';
		} else {
			$order = 'ASC';
		}
		
		$url = '';
		
		if (isset($this->request->get['page'])) { 
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_name'] = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . '&sort=name&order=' . $order . $url, true);
		$data['sort_type'] = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . '&sort=type&order=' . $order . $url, true);
		$data['sort_date_start'] = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . '&sort=date_start&order=' . $order . $url, true);
		$data['sort_date_end'] = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . '&sort=date_end&order=' . $order . $url, true);
		
		$data['version'] = $this->version;
		$data['code'] = $this->code;
		$data['extension'] = $this->extension;
		$data['extension_id'] = $this->extension_id;
		$data['purchase_url'] = $this->purchase_url;
		//$data['order_id'] = utf8_strtolower($this->config->get($this->code . '_domain')) == utf8_strtolower($domain) ? $this->config->get($this->code . '_order_id') : '';
		$data['email'] = $this->config->get($this->code . '_email');
		$data['domain'] = $this->config->get($this->code . '_domain');
		$data['activated_date'] = $this->config->get($this->code . '_activated_date');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/phe_list.tpl', $data));
	}
	
	protected function getForm() {
		$this->document->addScript('view/javascript/colorpicker/js/colorpicker.js');
		$this->document->addStyle('view/javascript/colorpicker/css/colorpicker.css');
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'], true)
   		);
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_style'] = $this->language->get('tab_style');
		$data['tab_preview'] = $this->language->get('tab_preview');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_priority'] = $this->language->get('entry_priority');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_subject'] = $this->language->get('entry_subject');
		$data['entry_message'] = $this->language->get('entry_message');
		$data['entry_background'] = $this->language->get('entry_background');
		$data['entry_body'] = $this->language->get('entry_body');
		$data['entry_heading'] = $this->language->get('entry_heading');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_account_approve'] = $this->language->get('text_account_approve');
		$data['text_account_transaction'] = $this->language->get('text_account_transaction');
		$data['text_affiliate_approve'] = $this->language->get('text_affiliate_approve');
		$data['text_affiliate_transaction'] = $this->language->get('text_affiliate_transaction');
		$data['text_gift_voucher'] = $this->language->get('text_gift_voucher');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_code'] = $this->language->get('text_code');
		$data['text_default'] = $this->language->get('text_default');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->request->get['template_id'])) {
			$data['action'] = $this->url->link('extension/module/phe/update', 'token=' . $this->session->data['token'] . $url . '&template_id=' . $this->request->get['template_id'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/phe/insert', 'token=' . $this->session->data['token'] . $url, true);
		}
		
		$data['cancel'] = $this->url->link('extension/module/phe', 'token=' . $this->session->data['token'] . $url, true);
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->get['template_id'])) { 
			$template_info = $this->model_extension_module_phe->getTemplate($this->request->get['template_id']);
		} else {
			$template_info = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($template_info)) {
			$data['name'] = $template_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($template_info)) {
			$data['type'] = $template_info['type'];
		} else {
			$data['type'] = '';
		}
		
		if (isset($this->request->post['date_start'])) {
			$data['date_start'] = $this->request->post['date_start'];
		} elseif (!empty($template_info)) {
			$data['date_start'] = $template_info['date_start'];
		} else {
			$data['date_start'] = date('Y-m-d', time() - 86400);
		}
		
		if (isset($this->request->post['date_end'])) {
			$data['date_end'] = $this->request->post['date_end'];
		} elseif (!empty($template_info)) {
			$data['date_end'] = $template_info['date_end'];
		} else {
			$data['date_end'] = date('Y-m-d', time() + 2592000);
		}
		
		if (isset($this->request->post['background'])) {
			$data['background'] = $this->request->post['background'];
		} elseif (!empty($template_info)) {
			$data['background'] = $template_info['background'];
		} else {
			$data['background'] = '#333333';
		}
		
		if (isset($this->request->post['body'])) {
			$data['body'] = $this->request->post['body'];
		} elseif (!empty($template_info)) {
			$data['body'] = $template_info['body'];
		} else {
			$data['body'] = '#eeeeee';
		}
		
		if (isset($this->request->post['heading'])) {
			$data['heading'] = $this->request->post['heading'];
		} elseif (!empty($template_info)) {
			$data['heading'] = $template_info['heading'];
		} else {
			$data['heading'] = '#19bdf0';
		}
		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($template_info)) {
			$data['image'] = $template_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['store_id'])) {
			$data['store_id'] = $this->request->post['store_id'];
		} elseif (!empty($template_info)) {
			$data['store_id'] = $template_info['store_id'];
		} else {
			$data['store_id'] = '';
		}
		
		if (isset($this->request->post['priority'])) {
			$data['priority'] = $this->request->post['priority'];
		} elseif (!empty($template_info)) {
			$data['priority'] = $template_info['priority'];
		} else {
			$data['priority'] = '';
		}
		
		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		$this->load->model('localisation/return_status');
		
		$data['return_statuses'] = $this->model_localisation_return_status->getReturnStatuses();
		
		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (!empty($template_info)) {
			$data['description'] = $template_info['description'];
		} else {
			$data['description'] = array();
		}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (defined('HTTPS_CATALOG')) {
			$url = HTTPS_CATALOG . 'image/';
		} else {
			$url = HTTPS_IMAGE;
		}
		
		$data['url'] = $url;
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$data['logo'] = $url . $this->config->get('config_logo');
		} else {
			$data['logo'] = $url . $this->config->get('config_logo');
		}
		
		if (!empty($this->request->post['image'])) {
			$data['logo'] = $url . $this->request->post['image'];
		} elseif (!empty($template_info['image'])) {
			$data['logo'] = $url . $template_info['image'];
		}
		
		$data['store_name'] = $this->config->get('config_name');
		
		$data['t_heading'] = isset($data['description'][$this->config->get('config_language_id')]['subject']) ? $data['description'][$this->config->get('config_language_id')]['subject'] : '';
		$data['t_message'] = html_entity_decode(isset($data['description'][$this->config->get('config_language_id')]['message']) ? $data['description'][$this->config->get('config_language_id')]['message'] : '');
		
		$this->load->model('tool/image');
		
		$data['no_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if (!empty($this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($template_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($template_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$product_table = str_replace('{no_image}', $this->model_tool_image->resize('no_image.png', 50, 50), $this->product_table);
		
		$search = array('{firstname}', '{lastname}', '{email}', '{telephone}', '{password}', '{enquiry}', '{customer_id}', '{order_id}', '{date_added}', '{payment_method}', '{shipping_method}', '{ip}', '{comment}', '{payment_address}', '{shipping_address}', '{product_table}', '{comment_table}', '{points}', '{total_points}', '{credits}', '{total_credits}', '{commission}', '{total_commission}', '{return_id}', '{message}', '{code}', '{amount}', '{to_name}', '{from_name}', '{voucher_theme}');
		$replace = array('John', 'Tan', 'test@example.com', '+65 12345678', 'mysecretpass', 'This is my enquiry message to you', '1', '1', '01/01/2000', 'PayPal', 'FeDex', '127.0.0.1', 'Make payment to our bank #123456', 'My Payment Address', 'My Shipping Address', $product_table, $this->comment_table, '20', '120', '20', '120', '20', '120', '1', 'Gift voucher message here.', 'abc123', '$10.00', 'John', 'Henry', '<img src="' . $this->model_tool_image->resize('no_image.png', 50, 50) . '" />');
		
		$data['t_heading'] = str_replace($search, $replace, $data['t_heading']);
		$data['t_message'] = str_replace($search, $replace, $data['t_message']);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/phe_form.tpl', $data));
	}
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/module/phe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (empty($this->request->post['name'])) {
			$this->error['warning'] = $this->language->get('error_name');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/module/phe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/phe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "email_template` (
			  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
			  `name` varchar(255) COLLATE utf8_bin NOT NULL,
			  `type` varchar(255) COLLATE utf8_bin NOT NULL,
			  `background` varchar(7) COLLATE utf8_bin NOT NULL,
			  `body` varchar(7) COLLATE utf8_bin NOT NULL,
			  `heading` varchar(7) COLLATE utf8_bin NOT NULL,
			  `image` varchar(255) COLLATE utf8_bin NOT NULL,
			  `store_id` int(11) NOT NULL,
			  `priority` int(11) NOT NULL,
			  `date_start` date NOT NULL,
			  `date_end` date NOT NULL,
			  `date_added` datetime NOT NULL,
			  PRIMARY KEY (`email_template_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;
		");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "email_template_description` (
			  `email_template_id` int(11) NOT NULL,
			  `language_id` int(11) NOT NULL,
			  `subject` varchar(255) NOT NULL,
			  `message` text NOT NULL,
			  PRIMARY KEY (`email_template_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
		");
		
		$this->db->query("INSERT INTO `" . DB_PREFIX . "email_template` (`email_template_id`, `name`, `type`, `background`, `body`, `heading`, `image`, `store_id`, `date_start`, `date_end`, `date_added`) VALUES
			(1, 'Регистрация аккаунта', 'register', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:26'),
			(2, 'Регистрация партнера', 'affiliate', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:31'),
			(3, 'Обратная связь', 'contact', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:36'),
			(4, 'Восстановление пароля', 'forgotten', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:40'),
			(5, 'Оформление заказа', 'order', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:48'),
			(7, 'Изменение статуса заказа', '2', '#333333', '#eeeeee', '#19bef0', '', '0', '2013-04-16', '2025-01-01', '2013-04-18 13:07:54'),
			(8, 'Добавление бонусов', 'reward', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 15:51:00'),
			(9, 'Подтверждение аккаунта', 'account_approve', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:06:54'),
			(10, 'Кредит магазина', 'account_transaction', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:08:35'),
			(11, 'Подтверждение аккаунта', 'affiliate_approve', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:10:38'),
			(12, 'Комиссия партнера', 'affiliate_transaction', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:12:43'),
			(13, 'Изменение статуса возврата', 'return_3', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:12:43'),
			(14, 'Подарочный сертификат', 'gift_voucher', '#333333', '#eeeeee', '#19bdf0', '', 0, '2013-04-16', '2025-01-01', '2013-05-30 20:12:43');
		");
		
		$this->db->query("INSERT INTO `" . DB_PREFIX . "email_template_description` (`email_template_id`, `language_id`, `subject`, `message`) VALUES
			(1, 1, 'Welcome to " . $this->config->get('config_name') . "', '&lt;p&gt;Welcome {firstname} and thank you for registering at " . $this->config->get('config_name') . "!&lt;/p&gt;\r\n\r\n&lt;p&gt;Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;raquo; Login:&amp;nbsp;&lt;a href=&quot;" . HTTP_CATALOG . "index.php?route=account/login&quot;&gt;" . HTTP_CATALOG . "index.php?route=account/login&lt;/a&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Email: {email}&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;line-height: 1.6em;&quot;&gt;&amp;raquo; Password: {password}&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Upon logging in, you will be able to access other services including reviewing past orders, printing invoices and editing your account information.&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(2, 1, 'Welcome to " . $this->config->get('config_name') . "''s Affiliate Program', '&lt;p&gt;Welcome {firstname} and thank you for joining " . $this->config->get('config_name') . "''s Affiliate Program.&lt;/p&gt;\r\n\r\n&lt;p&gt;Your account must be approved before you can login. Once approved you can log in by using your email address and password by visiting our website or at the following URL:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Login:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;" . HTTP_CATALOG . "index.php?route=affiliate/login&quot;&gt;" . HTTP_CATALOG . "index.php?route=affiliate/login&lt;/a&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Email: {email}&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;&amp;raquo; Password: {password}&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Upon logging in, you will be able to generate tracking codes, track commission payments and edit your account information.&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(3, 1, 'Thank you for contacting " . $this->config->get('config_name') . "', '&lt;p&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p&gt;Thank you for contacting us. We will get back to you as soon as possible.&lt;/p&gt;\r\n\r\n&lt;p&gt;Below is what you had sent to us:&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;{enquiry}&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;If you had entered anything wrongly, feel free to fill in another contact form.&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(4, 1, 'Password Reset', '&lt;p&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p&gt;You requested for a new password from us. You can log in at the following URL with the new password:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Login:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;" . HTTP_CATALOG . "index.php?route=account/login&quot; style=&quot;font-size: 13px;&quot;&gt;" . HTTP_CATALOG . "index.php?route=account/login&lt;/a&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Email: {email}&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;&amp;raquo; Password: {password}&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;If you did not request for a new password, please inform us immediately and update your password.&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(5, 1, 'Your Order at " . $this->config->get('config_name') . "', '&lt;p&gt;Thank you for your interest in our products. Your order has been received and will be processed once payment has been confirmed.&lt;/p&gt;\r\n\r\n&lt;table style=&quot;border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;2&quot; style=&quot;font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;&quot;&gt;Order Details&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff&quot;&gt;&lt;b&gt;Order ID:&lt;/b&gt; {order_id}&lt;br /&gt;\r\n			&lt;b&gt;Date Added:&lt;/b&gt; {date_added}&lt;br /&gt;\r\n			&lt;b&gt;Payment Method:&lt;/b&gt; {payment_method}&lt;br /&gt;\r\n			&lt;b&gt;Shipping Method:&lt;/b&gt; {shipping_method}&lt;/td&gt;\r\n			&lt;td style=&quot;font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff&quot;&gt;&lt;b&gt;Email:&lt;/b&gt; {email}&lt;br /&gt;\r\n			&lt;b&gt;Telephone:&lt;/b&gt; {telephone}&lt;br /&gt;\r\n			&lt;b&gt;IP Address:&lt;/b&gt; {ip}&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;{comment_table}&lt;/p&gt;\r\n\r\n&lt;table style=&quot;border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;&quot;&gt;Payment Address:&lt;/td&gt;\r\n			&lt;td style=&quot;font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #cccccc; font-weight: bold; text-align: left; padding: 7px; color: #222222;&quot;&gt;Shipping Address:&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff;&quot;&gt;{payment_address}&lt;/td&gt;\r\n			&lt;td style=&quot;font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;background:#ffffff&quot;&gt;{shipping_address}&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;{product_table}&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(7, 1, 'Processing your Order #{order_id}', '&lt;p&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p&gt;We are currently processing your order. Feel free drop us an email if you have any queries.&lt;/p&gt;\r\n\r\n&lt;p&gt;{comment}&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n'),
			(8, 1, 'Reward Points', '&lt;p&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p&gt;You have received {points} reward points! You may now spend it in our store.&lt;/p&gt;\r\n\r\n&lt;p&gt;You currently have a total of {total_points} reward points.&lt;/p&gt;\r\n\r\n&lt;p&gt;Best regards,&lt;br /&gt;\r\n" . $this->config->get('config_name') . "&lt;/p&gt;\r\n\r\n'),
			(9, 1, 'Account Approved', '&lt;p&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;Your account has now been approved and you can log in by using your email address and password by visiting our website or at the following URL:&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Login:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;" . HTTP_CATALOG . "index.php?route=account/login&quot; style=&quot;font-size: 13px;&quot;&gt;" . HTTP_CATALOG . "index.php?route=account/login&lt;/a&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Email: {email}&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Upon logging in, you will be able to access other services including reviewing past orders, printing invoices and editing your account information.&lt;/p&gt;\r\n\r\n'),
			(10, 1, 'Store Credits', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;You have received {credits} store credits! You may now spend it in our store.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;You currently have a total of {total_credits} store credits.&lt;/p&gt;\r\n\r\n'),
			(11, 1, 'Affiliate Approved', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Welcome {firstname} and thank you for joining " . $this->config->get('config_name') . "''s Affiliate Program.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Your account has been approved.&amp;nbsp;You can now log in by using your email address and password by visiting our website or at the following URL:&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;&amp;raquo; Login:&amp;nbsp;&lt;a href=&quot;" . HTTP_CATALOG . "index.php?route=affiliate/login&quot;&gt;" . HTTP_CATALOG . "index.php?route=affiliate/login&lt;/a&gt;&lt;br /&gt;\r\n&amp;raquo; Email: {email}&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Upon logging in, you will be able to generate tracking codes, track commission payments and edit your account information.&lt;/p&gt;\r\n\r\n'),
			(12, 1, 'Commission Earned', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Hi {firstname},&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;You have received {commission} commission!&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;You have currently earned&amp;nbsp;a total of {total_commission} commission.&lt;/p&gt;\r\n\r\n'),
			(13, 1, 'Product Return Request Complete', '&lt;p&gt;Hi {firstname},&lt;/p&gt;&lt;p&gt;Your return request (Return ID {return_id}) has been completed.&lt;/p&gt;&lt;p&gt;{comment}&lt;/p&gt;&lt;p&gt;Best regards,&lt;br /&gt;" . $this->config->get('config_name') . "&lt;/p&gt;'),
			(14, 1, 'You have been sent a gift voucher from {from_name}', '&lt;p&gt;Hi {to_name},&lt;/p&gt;&lt;p&gt;{voucher_theme}&lt;/p&gt;&lt;p&gt;You have received a gift voucher worth {amount}.&lt;/p&gt;&lt;p&gt;Message from {from_name}:&lt;/p&gt;&lt;p&gt;{message}&lt;/p&gt;&lt;p&gt;You can redeem the gift voucher with the&amp;nbsp;code &lt;strong&gt;{code}&lt;/strong&gt; on our website.&lt;/p&gt;&lt;p&gt;Best regards,&lt;br /&gt;" . $this->config->get('config_name') . "&lt;/p&gt;');
		");
	}
	
	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "email_template");
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "email_template_description");
	}
}