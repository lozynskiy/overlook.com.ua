<?php

/**
    error_reporting(0);
    ini_set('error_reporting', -1);
    ini_set('error_reporting', 0);
    ini_set('display_errors', 0);

    ini_set('xdebug.var_display_max_children', 228); // def: 128
    ini_set('xdebug.var_display_max_data', 50000); // // def: 512
    ini_set('xdebug.var_display_max_depth', 7); // def: 3

 * 
 */
class ControllerSaleSmsSending extends Controller {

    private $error = array();
    private $data = array();
    
    //
    private function getProxyApi($settings) {
        if ( ! isset($settings['private_key']) || ! isset($settings['public_key']) || ! isset($settings['sender_name']) || $settings['private_key'] == '' || $settings['public_key'] == '' || $settings['sender_name'] == '') {
            $this->data['error_warning'] = $this->language->get('error_warning');
            return false;
        }
        require_once (DIR_APPLICATION . 'libs/ProxyApi.php');
        $proxyApi = new ProxyApi;
        $proxyApi->connect($settings['private_key'], $settings['public_key']);
        return $proxyApi;
    }
    // 
    
    public function addReturn($route, $args, $return_id) {
        $return = $args[0];
        $return['return_id'] = $return_id;
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeReturnRules($return, 'OnReturnAdd');
    }
    
    /**
     * post.return.add
     */
    public function postReturnAdd($return_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/return.php');
        $modelSaleReturn = new ModelSaleReturn( $this->registry );
        $return = $modelSaleReturn->getReturn($return_id);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeReturnRules($return, 'OnReturnAdd');
    }
    
    /**
     * 
     */
    public function addCustomer($route, $args, $customer_id) {
        $customer = $args[0];
        $customer['customer_id'] = $customer_id;
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeCustomerRules($customer, 'OnCustomerAdd');
    }
    
    /**
     * 2.0 > OC < 2.2
     * post.customer.add
     */
    public function postCustomerAdd($customer_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/customer.php');
        $modelSaleCustomer = new ModelSaleCustomer( $this->registry );
        $customer = $modelSaleCustomer->getCustomer($customer_id);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeCustomerRules($customer, 'OnCustomerAdd');
    }
    
    public function addProduct($route, $args, $product_id) {
        $product = $args[0];
        $product['product_id'] = $product_id;
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );
        $modelSaleSmsSending->executeProductRules($product, 'OnProductAdd');
    }
    
    /**
     * post.admin.product.add
     */
    public function postAdminProductAdd($product_id) {
        require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
        $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
        $product = $modelCatalogProduct->getProduct($product_id);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );
        $modelSaleSmsSending->executeProductRules($product, 'OnProductAdd');
    }
    
    /**
     * TODO прикрутить редактирование продукта
     */
    public function editProduct($route, $args) {
        require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
        $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
        $product = $modelCatalogProduct->getProduct($args[0]);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeProductRules($product, 'OnProductEdit');
    }
    
    /**
     * TODO прикрутить редактирование продукта
     * post.admin.product.edit
     */
    public function postAdminProductEdit($product_id) {
        require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
        $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
        $product = $modelCatalogProduct->getProduct($product_id);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeProductRules($product, 'OnProductEdit');
    }
    
    /**
     * OC > 2.2
     */
    public function deleteOrder($route, $args) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/order.php');
        $modelSaleOrder = new ModelSaleOrder( $this->registry );
        $order = $modelSaleOrder->getOrder($args[0]);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeOrderRules($order, 'OnOrderDelete');
    }
    
    /**
     * 2.0 > OC < 2.2
     * pre.order.delete
     */
    public function preOrderDelete($order_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/order.php');
        $modelSaleOrder = new ModelSaleOrder( $this->registry );
        $order = $modelSaleOrder->getOrder($order_id);
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeOrderRules($order, 'OnOrderDelete');
    }
    
    public function check_old_version() {
        /*list($v1,$v2) = explode('.', VERSION);
        $v1 = (int) $v1;
        $v2 = (int) $v2;
        if ($v1 >= 2 AND $v2 >= 0 AND $v2 < 2) { // 2.0 - 2.1 // https://github.com/opencart/opencart/wiki/Events-(script-notifications)-2.0.x.x-&-2.1.x.x
            return true;
        } else {// >= 2.2 // https://github.com/opencart/opencart/wiki/Events-(script-notifications)-2.2.x.x
            return false;
        }*/
        return false;
    }
    
    public function reinstall() {
        if ($this->check_old_version()) {
            $this->load->model('tool/event');
            $this->model_tool_event->deleteEvent('event_epochta');
            $this->model_tool_event->addEvent('event_epochta', 'post.order.add', 'sale/sms_sending/postOrderAdd');//+?
            $this->model_tool_event->addEvent('event_epochta', 'post.order.history.add', 'sale/sms_sending/postOrderHistoryAdd');
            $this->model_tool_event->addEvent('event_epochta', 'post.order.edit', 'sale/sms_sending/postOrderEdit');
            $this->model_tool_event->addEvent('event_epochta', 'post.customer.add', 'sale/sms_sending/postCustomerAdd');
            $this->model_tool_event->addEvent('event_epochta', 'pre.order.delete', 'sale/sms_sending/preOrderDelete');
            $this->model_tool_event->addEvent('event_epochta', 'post.admin.edit.product', 'sale/sms_sending/postAdminProductEdit'); //+
            $this->model_tool_event->addEvent('event_epochta', 'post.admin.add.product', 'sale/sms_sending/postAdminProductAdd'); //+
            $this->model_tool_event->addEvent('event_epochta', 'post.customer.add', 'sale/sms_sending/postCustomerAdd');
            $this->model_tool_event->addEvent('event_epochta', 'post.return.add', 'sale/sms_sending/postReturnAdd');
                
        } else { 
            $this->load->model('extension/event');
            $this->model_tool_event->deleteEvent('event_epochta');
            $this->model_tool_event->addEvent('event_epochta', 'catalog/model/checkout/order/editOrder/after', 'sale/sms_sending/editOrder');
            $this->model_tool_event->addEvent('event_epochta', 'catalog/model/checkout/order/addOrder/after', 'sale/sms_sending/addOrder');
            // $this->model_tool_event->addEvent('event_epochta', 'admin/model/sale/order/deleteOrder/after', 'sale/sms_sending/deleteOrder');
            $this->model_tool_event->addEvent('event_epochta', 'admin/model/sale/order/deleteOrder/before', 'sale/sms_sending/deleteOrder');
            $this->model_tool_event->addEvent('event_epochta', 'catalog/model/checkout/order/addOrderHistory/after', 'sale/sms_sending/addOrderHistory');
            $this->model_tool_event->addEvent('event_epochta', 'admin/model/sale/return/addReturn/after', 'sale/sms_sending/addReturn');
            $this->model_tool_event->addEvent('event_epochta', 'admin/model/customer/customer/addCustomer/after', 'sale/sms_sending/addCustomer');
            $this->model_tool_event->addEvent('event_epochta', 'catalog/model/account/customer/addCustomer/after', 'sale/sms_sending/addCustomer');
            $this->model_tool_event->addEvent('event_epochta', 'admin/model/catalog/product/addProduct/after', 'sale/sms_sending/addProduct');
            $this->model_tool_event->addEvent('event_epochta', 'admin/model/catalog/product/editProduct/after', 'sale/sms_sending/editProduct');
            $this->model_tool_event->addEvent('event_epochta', 'catalog/model/catalog/product/editProduct/after', 'sale/sms_sending/editProduct');
        } 
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode(array('success'=>true)));
    }
    
    public function index() {
        
        $this->load->model('sale/sms_sending');
        $this->load->language('sale/sms_sending');
        $settings = $this->model_sale_sms_sending->getSettings();
        $proxyApi = $this->getProxyApi($settings);

        // get user getUserBalance
        if ($proxyApi) {
            $res = $proxyApi->getUserBalance();
            if (isset($res["error"])) {
                $this->data['error_warning'] = $this->language->get('error') . $res["error"] . "<br>";
            }
        }

        /* start Customer Groups */
        $customer_groups = $this->model_sale_sms_sending->getCustomerGroups();
        foreach ($customer_groups as $group) {
            $this->data['customer_groups'][] = array(
                'customer_group_id' => $group['customer_group_id'],
                'name' => $group['name'] . (($group['customer_group_id'] == $this->config->get('config_customer_group_id')) ? $this->language->get('text_default') : null)
            );
        }
        /* end Customer Groups */

        $this->data['settings_link'] = $this->url->link('sale/sms_sending/settings', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['settings_label'] = $this->language->get('settings_label');

        $this->document->setTitle($this->language->get('heading_title'));
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['balance'] = !isset($res["error"]) ? $res["result"]["balance_currency"] . ' ' . $res["result"]["currency"] : $this->language->get('error_settings');
        $this->data['alias'] = isset($settings['sender_name']) ? $settings['sender_name'] : $this->language->get('error_settings');
        $this->data['text_balance'] = $this->language->get('text_balance');
        $this->data['text_alias'] = $this->language->get('text_alias');
        $this->data['text_datetime'] = $this->language->get('text_datetime');
        $this->data['text_instantly'] = $this->language->get('text_instantly');
        $this->data['text_start_at'] = $this->language->get('text_start_at');
        $this->data['filter_date_start'] = date('Y-m-d H:i:s');
        // $this->data['entry_date_start'] = '';
        $this->data['text_translit'] = $this->language->get('text_translit');
        $this->data['text_message'] = $this->language->get('text_message');
        $this->data['text_symbols'] = $this->language->get('text_symbols');
        $this->data['entry_message'] = $this->language->get('entry_message');
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_to'] = $this->language->get('entry_to');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_customer'] = $this->language->get('entry_customer');
        $this->data['button_send'] = $this->language->get('button_send');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_ignore'] = $this->language->get('button_ignore');
        $this->data['button_correct'] = $this->language->get('button_correct');
        $this->data['error_settings'] = $this->language->get('error_settings');
        $this->data['token'] = $this->session->data['token'];
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        $this->data['cancel'] = $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['correct'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');
        $this->load->model('setting/store');
        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->template = 'sale/sms_sending.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('sale/sms_sending.tpl', $this->data));
    }

    public function settings() {
        $this->language->load('sale/sms_sending');
        $this->load->model('sale/sms_sending');
        
        $settings = $this->model_sale_sms_sending->getSettings();
        $proxyApi = $this->getProxyApi($settings);

        
        $this->data['token'] = $this->session->data['token'];

        $this->document->setTitle($this->language->get('settings_title'));
        $this->data['heading_title'] = $this->language->get('settings_title');
        $this->data['settings'] = $settings;


        $this->data['sms_alias_label'] = $this->language->get('sms_alias');
        $this->data['public_key_label'] = $this->language->get('public_key');
        $this->data['private_key_label'] = $this->language->get('private_key');

        $this->data['sender_name'] = $settings['sender_name'];
        $this->data['public_key'] = $settings['public_key'];
        $this->data['private_key'] = $settings['private_key'];

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('settings_title'),
            'href' => $this->url->link('sale/sms_sending_settings', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $this->data['error']['warning'] = $this->language->get('error_permission');
            }

            if (!isset($this->data['error'])) {
                $this->load->model('sale/sms_sending');
                $res = $this->model_sale_sms_sending->setSettings($this->request->post['sender_name'], $this->request->post['public_key'], $this->request->post['private_key']);
                if ($res) {
                    $this->data['success'] = $this->language->get('text_settings_success');
                } else {
                    $this->data['error']['warning'] = $this->language->get('text_settings_error');
                }
            }
            die(json_encode($this->data));
            return;
        }

        /* */
        $this->data['settings_link'] = $this->url->link('sale/sms_sending/settings', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['settings_label'] = $this->language->get('settings_label');

        $this->document->setTitle($this->language->get('settings_title'));
        $this->data['heading_title'] = $this->language->get('settings_title');
        $this->data['alias'] = isset($settings['sender_name']) ? $settings['sender_name'] : $this->language->get('error_settings');
        $this->data['text_balance'] = $this->language->get('text_balance');
        $this->data['text_alias'] = $this->language->get('text_alias');
        $this->data['text_datetime'] = $this->language->get('text_datetime');
        $this->data['text_instantly'] = $this->language->get('text_instantly');
        $this->data['text_start_at'] = $this->language->get('text_start_at');
        $this->data['text_translit'] = $this->language->get('text_translit');
        $this->data['text_message'] = $this->language->get('text_message');
        $this->data['text_symbols'] = $this->language->get('text_symbols');
        $this->data['entry_message'] = $this->language->get('entry_message');
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_to'] = $this->language->get('entry_to');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_customer'] = $this->language->get('entry_customer');
        $this->data['button_send'] = $this->language->get('button_send');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_ignore'] = $this->language->get('button_ignore');
        $this->data['button_correct'] = $this->language->get('button_correct');
        $this->data['error_settings'] = $this->language->get('error_settings');
        $this->data['token'] = $this->session->data['token'];
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        $this->data['cancel'] = $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL');
        if ($this->check_old_version()) {
            $this->data['correct'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $this->data['correct'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'], 'SSL');
        }
        $this->load->model('setting/store');
        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->data['button_send'] = $this->language->get('save');

        $this->template = 'sale/sms_sending_settings.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('sale/sms_sending_settings.tpl', $this->data));
    }

    public function send() {

        $this->load->language('sale/sms_sending');
        $this->load->model('sale/sms_sending');
        
        $settings = $this->model_sale_sms_sending->getSettings();
        $proxyApi = $this->getProxyApi($settings);
        
        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['message']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
            $to_info = $this->model_sale_sms_sending->getCustomers($this->request->post['to']);
            
            require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
            $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );
            
            $json = $modelSaleSmsSending->send( $this->request->post['message'], $this->request->post['to'], $to_info, $this->request->post['ignore'], $this->request->post['timesend'], isset($this->request->post['date']) ? $this->request->post['date'] : NULL, $this->request->post['translit_checked'] );
        }
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    public function getForm() {

        $this->load->language('sale/order');
        $this->load->language('sale/return');
        $this->load->model('sale/order');
        
        // return
        $this->load->model('localisation/return_reason');
        $this->data['return_reasons'] = $this->model_localisation_return_reason->getReturnReasons();
        
        $this->load->model('localisation/return_action');
        $this->data['return_actions'] = $this->model_localisation_return_action->getReturnActions();
        
        $this->load->model('localisation/return_status');
        $this->data['return_statuses'] = $this->model_localisation_return_status->getReturnStatuses();
        
        $this->data['newsletter'] = '';

        // Customer Groups
        if ($this->check_old_version()) {
            $this->load->model('sale/customer_group');
            $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
            
            // customer
            $this->load->language('sale/customer');
        } else {
            $this->load->model('customer/customer_group');
            $this->data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
        
            // customer
            $this->load->language('customer/customer');
        }
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        
        $this->data['status'] = true;
        $this->data['approved'] = true;
        $this->data['safe'] = 0;
        
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['entry_safe'] = $this->language->get('entry_safe');
        $this->data['entry_approved'] = $this->language->get('entry_approved');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
        
        // products
        $this->load->language('catalog/product');
        
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        $this->data['entry_download'] = $this->language->get('entry_download');
        $this->data['entry_category'] = $this->language->get('entry_category');
        $this->data['entry_filter'] = $this->language->get('entry_filter');
        $this->data['entry_related'] = $this->language->get('entry_related');
        
        $this->data['help_manufacturer'] = $this->language->get('help_manufacturer');
        $this->data['help_stock_status'] = $this->language->get('help_stock_status');
        $this->data['help_points'] = $this->language->get('help_points');
        $this->data['help_category'] = $this->language->get('help_category');
        $this->data['help_filter'] = $this->language->get('help_filter');
        $this->data['help_download'] = $this->language->get('help_download');
        $this->data['help_related'] = $this->language->get('help_related');
        
		$this->data['entry_model'] = $this->language->get('entry_model');
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_quantity'] = $this->language->get('entry_quantity');
        $this->data['entry_points'] = $this->language->get('entry_points');

        $this->data['manufacturer_id'] = 0;
        $this->data['manufacturer'] = '';
        
        // Categories
        $this->load->model('catalog/category');
        $categories = array();

        $this->data['product_categories'] = array();

        foreach ($categories as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $this->data['product_categories'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                );
            }
        }
        
        $this->load->language('sale/return');
        
        // orders
        $this->data['text_opened'] = $this->language->get('text_opened');
        $this->data['text_unopened'] = $this->language->get('text_unopened');
        
        $this->data['entry_opened'] = $this->language->get('entry_opened');
        $this->data['entry_return_reason'] = $this->language->get('entry_return_reason');
        $this->data['entry_return_action'] = $this->language->get('entry_return_action');
        $this->data['entry_return_status'] = $this->language->get('entry_return_status');

        // order, order status
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_form'] = !isset($this->request->get['order_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_loading'] = $this->language->get('text_loading');
        $this->data['text_order_detail'] = $this->language->get('text_order_detail');

        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_customer'] = $this->language->get('entry_customer');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_comment'] = $this->language->get('entry_comment');
        $this->data['entry_company'] = $this->language->get('entry_company');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_option'] = $this->language->get('entry_option');
        $this->data['entry_quantity'] = $this->language->get('entry_quantity');
        $this->data['entry_to_name'] = $this->language->get('entry_to_name');
        $this->data['entry_to_email'] = $this->language->get('entry_to_email');
        $this->data['entry_from_name'] = $this->language->get('entry_from_name');
        $this->data['entry_from_email'] = $this->language->get('entry_from_email');
        $this->data['entry_theme'] = $this->language->get('entry_theme');
        $this->data['entry_message'] = $this->language->get('entry_message');
        $this->data['entry_amount'] = $this->language->get('entry_amount');
        $this->data['entry_currency'] = $this->language->get('entry_currency');
        $this->data['entry_shipping_method'] = $this->language->get('entry_shipping_method');
        $this->data['entry_payment_method'] = $this->language->get('entry_payment_method');
        $this->data['entry_reward'] = $this->language->get('entry_reward');
        $this->data['entry_order_status'] = $this->language->get('entry_order_status');

        $this->data['column_product'] = $this->language->get('column_product');
        $this->data['column_model'] = $this->language->get('column_model');
        $this->data['column_quantity'] = $this->language->get('column_quantity');
        $this->data['column_price'] = $this->language->get('column_price');
        $this->data['column_total'] = $this->language->get('column_total');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');
        $this->data['button_refresh'] = $this->language->get('button_refresh');
        $this->data['button_apply'] = $this->language->get('button_apply');
        $this->data['button_upload'] = $this->language->get('button_upload');
        $this->data['button_remove'] = $this->language->get('button_remove');
        $this->data['button_ip_add'] = $this->language->get('button_ip_add');
        $this->data['tab_total'] = $this->language->get('tab_total');

        /*$this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );
        
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, true)
        );*/
        
        $url = '';

        $this->data['cancel'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, true);
        $this->data['token'] = $this->session->data['token'];
        
        $this->load->model('sale/sms_sending');
        $rules = $this->model_sale_sms_sending->getOption('rules', '[]');
        $rules = json_decode($rules, 1);

        if (isset($this->request->get['rule_id'])
            AND isset($rules[$this->request->get['rule_id']])) {
            $this->data['rule_id'] = $this->request->get['rule_id'];
            $this->data['store_url'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;

            $this->data['edit_rule'] = $rules[$this->request->get['rule_id']];
            $this->data['event_type'] = $this->data['edit_rule']['event_type'];
            
            $this->data['order_status_id'] = isset($this->data['edit_rule']['order_status_id']) ? $this->data['edit_rule']['order_status_id'] : '';
            $this->data['currency_code'] = isset($this->data['edit_rule']['currency_code']) ? $this->data['edit_rule']['currency_code'] : '';

            $this->data['option_customer_group_id'] = isset($this->data['edit_rule']['option']['customer_group_id']) ? $this->data['edit_rule']['option']['customer_group_id'] : $this->config->get('config_customer_group_id');
            $this->data['option_translit_checked'] = isset($this->data['edit_rule']['option']['translit_checked']) ? $this->data['edit_rule']['option']['translit_checked'] : NULL;
            $this->data['option_timetype'] = isset($this->data['edit_rule']['option']['timetype']) ? $this->data['edit_rule']['option']['timetype']: NULL;
            $this->data['option_date'] = isset($this->data['edit_rule']['option']['date']) ? $this->data['edit_rule']['option']['date'] : '';
            $this->data['option_timesend'] = isset($this->data['edit_rule']['option']['timesend']) ? $this->data['edit_rule']['option']['timesend']: NULL;
            
            $this->data['message'] = $this->data['edit_rule']['message'];
            
            $this->data['rule_store_id'] = isset($this->data['edit_rule']['condition']['store_id']) ? $this->data['edit_rule']['condition']['store_id'] : 0;
            $this->data['rule_store_url'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
            $this->data['rule_payment_country_id'] = isset($this->data['edit_rule']['condition']['payment_country_id']) ? $this->data['edit_rule']['condition']['payment_country_id'] : NULL;
            $this->data['rule_customer_group_id'] = isset($this->data['edit_rule']['condition']['customer_group_id']) ? $this->data['edit_rule']['condition']['customer_group_id'] : NULL;
            $this->data['rule_order_status_id'] = isset($this->data['edit_rule']['condition']['order_status_id']) ? $this->data['edit_rule']['condition']['order_status_id'] : $this->config->get('config_order_status_id');
            $this->data['rule_currency_code'] = isset( $this->data['edit_rule']['condition']['currency_code']) ? $this->data['edit_rule']['condition']['currency_code'] : NULL;
            
            $this->data['rule_model'] = isset($this->data['edit_rule']['condition']['model']) ? $this->data['edit_rule']['condition']['model'] : '';
            $this->data['rule_quantity'] = isset($this->data['edit_rule']['condition']['quantity']) ? $this->data['edit_rule']['condition']['quantity'] : array('type'=>'', 'value'=>'');
            $this->data['rule_price'] = isset($this->data['edit_rule']['condition']['price'])?$this->data['edit_rule']['condition']['price']:array('type'=>'', 'value'=>'');
            $this->data['rule_manufacturer_id'] = isset($this->data['edit_rule']['condition']['manufacturer_id']) ? $this->data['edit_rule']['condition']['manufacturer_id'] : '';

            // manufacturer
            $this->load->model('catalog/manufacturer');
            $this->data['rule_manufacturer'] = '';
            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->data['rule_manufacturer_id']);
            if ($manufacturer_info) {
                $this->data['rule_manufacturer'] = $manufacturer_info['name'];
            }
            
            $product_category = isset($this->data['edit_rule']['condition']['product_category']) ? $this->data['edit_rule']['condition']['product_category'] : array();
            $this->data['rule_product_category'] = array();
            $this->data['product_relateds'] = array();
            // Categories
            $this->load->model('catalog/category');
            foreach ($product_category as $category_id) {
                $category_info = $this->model_catalog_category->getCategory($category_id);
                if ($category_info) {
                    $this->data['rule_product_category'][] = array(
                        'category_id' => $category_info['category_id'],
                        'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                    );
                }
            }
            
            $this->data['rule_product_store'] = isset($this->data['edit_rule']['condition']['product_store']) ? $this->data['edit_rule']['condition']['product_store'] : array();
            $this->data['rule_download'] = isset($this->data['edit_rule']['condition']['download']) ? $this->data['edit_rule']['condition']['download'] : '';
            $this->data['rule_product_download'] = isset($this->data['edit_rule']['condition']['product_download']) ? $this->data['edit_rule']['condition']['product_download'] : array();
            $this->data['rule_related'] = isset($this->data['edit_rule']['condition']['related']) ? $this->data['edit_rule']['condition']['related'] : '';
            $this->data['rule_product_related'] = isset($this->data['edit_rule']['condition']['product_related']) ? $this->data['edit_rule']['condition']['product_related'] : array();
            $this->data['rule_return_reason_id'] = (isset($this->data['edit_rule']['condition']['return_reason_id']) AND $this->data['edit_rule']['condition']['return_reason_id'] !== '') ? (int) $this->data['edit_rule']['condition']['return_reason_id'] : '';
            $this->data['rule_opened'] = isset($this->data['edit_rule']['condition']['opened']) ? $this->data['edit_rule']['condition']['opened'] : '';
            $this->data['rule_return_status_id'] = (isset($this->data['edit_rule']['condition']['return_status_id']) AND $this->data['edit_rule']['condition']['return_status_id'] !== '') ? (int) $this->data['edit_rule']['condition']['return_status_id'] : '';
            $this->data['rule_return_action_id'] = (isset($this->data['edit_rule']['condition']['return_action_id']) AND $this->data['edit_rule']['condition']['return_action_id'] !== '') ? (int) $this->data['edit_rule']['condition']['return_action_id'] : '';
            
            $this->data['rule_newsletter'] = (isset($this->data['edit_rule']['condition']['newsletter']) AND $this->data['edit_rule']['condition']['newsletter'] !== '') ? (int) $this->data['edit_rule']['condition']['newsletter'] : '';
            $this->data['rule_status'] = (isset($this->data['edit_rule']['condition']['status']) AND $this->data['edit_rule']['condition']['status'] !== '') ? (int) $this->data['edit_rule']['condition']['status'] : '';
            $this->data['rule_approved'] = (isset($this->data['edit_rule']['condition']['approved']) AND $this->data['edit_rule']['condition']['approved'] !== '') ? (int) $this->data['edit_rule']['condition']['approved'] : '';
            $this->data['rule_safe'] = (isset($this->data['edit_rule']['condition']['safe']) AND $this->data['edit_rule']['condition']['safe'] !== '') ? (int) $this->data['edit_rule']['condition']['safe'] : '';
            $this->data['error_model'] = '';
            
        } else {
            $this->data['store_id'] = 0;
            $this->data['store_url'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
            $this->data['customer_group_id'] = $this->config->get('config_customer_group_id');
            $this->data['order_status_id'] = $this->config->get('config_order_status_id');
            $this->data['currency_code'] = $this->config->get('config_currency');
            $this->data['rule_product_download'] = array();
            $this->data['rule_product_related'] = array();
            $this->data['event_type'] = '';
            $this->data['message'] = '';
            $this->data['rule_opened'] = '';
            
            $this->data['rule_model'] = '';
            $this->data['rule_quantity'] = array('type'=>'', 'value'=>'');
            $this->data['rule_price'] = array('type'=>'', 'value'=>'');
            $this->data['rule_manufacturer_id'] = '';
            $this->data['rule_product_category'] = array();
            $this->data['rule_product_store'] = array();
            $this->data['product_relateds'] = array();
            $this->data['error_model'] = '';
            $this->data['rule_manufacturer'] = '';
            
        }

        // Stores
        $this->load->model('setting/store');

        $this->data['rule_stores'] = array();

        $this->data['rule_stores'][] = array(
            'store_id' => 0,
            'name' => $this->language->get('text_default')
        );

        $stores = $this->model_setting_store->getStores();
        
        foreach ($stores as $result) {
            $this->data['rule_stores'][] = array(
                'store_id' => $result['store_id'],
                'name' => $result['name']
            );
        }
        
        // Downloads
        $this->load->model('catalog/download');
        $this->data['product_downloads'] = array();
        foreach ($this->data['rule_product_download'] as $download_id) {
            $download_info = $this->model_catalog_download->getDownload($download_id);
            if ($download_info) {
                $this->data['product_downloads'][] = array(
                    'download_id' => $download_info['download_id'],
                    'name'        => $download_info['name']
                );
            }
        }
        
        // Related
        $this->data['product_related'] = array();
        foreach ($this->data['rule_product_related'] as $product_id_rel) {
            $related_info = $this->model_catalog_product->getProduct($product_id_rel);
            if ($related_info) {
                $this->data['product_relateds'][] = array(
                    'product_id' => $related_info['product_id'],
                    'name'       => $related_info['name']
                );
            }
        }

        $this->data['custom_fields'] = array();

        $filter_data = array(
            'sort' => 'cf.sort_order',
            'order' => 'ASC'
        );

        // Customer Groups
        if ($this->check_old_version()) {
            $this->load->model('sale/customer_group');
            $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
            
            // Custom Fields
            $this->load->model('sale/custom_field');
            $custom_fields = $this->model_sale_custom_field->getCustomFields($filter_data);
            foreach ($custom_fields as $custom_field) {
                $this->data['custom_fields'][] = array(
                    'custom_field_id' => $custom_field['custom_field_id'],
                    'custom_field_value' => $this->model_sale_custom_field->getCustomFieldValues($custom_field['custom_field_id']),
                    'name' => $custom_field['name'],
                    'value' => $custom_field['value'],
                    'type' => $custom_field['type'],
                    'location' => $custom_field['location'],
                    'sort_order' => $custom_field['sort_order']
                );
            }
        } else {
            $this->load->model('customer/customer_group');
            $this->data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
            
            // Custom Fields
            $this->load->model('customer/custom_field');
            $custom_fields = $this->model_customer_custom_field->getCustomFields($filter_data);
            foreach ($custom_fields as $custom_field) {
                $this->data['custom_fields'][] = array(
                    'custom_field_id' => $custom_field['custom_field_id'],
                    'custom_field_value' => $this->model_customer_custom_field->getCustomFieldValues($custom_field['custom_field_id']),
                    'name' => $custom_field['name'],
                    'value' => $custom_field['value'],
                    'type' => $custom_field['type'],
                    'location' => $custom_field['location'],
                    'sort_order' => $custom_field['sort_order']
                );
            }
        }  

        



        $this->load->model('localisation/order_status');

        $this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        $this->load->model('localisation/currency');

        $this->data['currencies'] = $this->model_localisation_currency->getCurrencies();

        $this->data['voucher_min'] = $this->config->get('config_voucher_min');

        $this->load->model('sale/voucher_theme');

        $this->data['voucher_themes'] = $this->model_sale_voucher_theme->getVoucherThemes();

        // API login
        $this->data['catalog'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;

        $this->load->model('user/api');

        $api_info = $this->model_user_api->getApi($this->config->get('config_api_id'));

        if ($api_info) {
            $this->data['api_id'] = $api_info['api_id'];
            $this->data['api_key'] = isset($api_info['key'])?$api_info['key']:'';
            $this->data['api_ip'] = $this->request->server['REMOTE_ADDR'];
        } else {
            $this->data['api_id'] = '';
            $this->data['api_key'] = '';
            $this->data['api_ip'] = '';
        }

        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');

        // $this->response->setOutput($this->load->view('sale/order_form', $data));
        $this->response->setOutput($this->load->view('sale/sms_sending_add_rule.tpl', $this->data));
    }

    public function statistic() {
        $this->load->model('sale/sms_sending');
        $this->load->language('sale/sms_sending');
        $this->data['heading_title'] = $this->language->get('heading_statistic_title');
        $this->document->setTitle($this->language->get('heading_statistic_title'));

        $settings = $this->model_sale_sms_sending->getSettings();
        try {
            $proxyApi = $this->getProxyApi($settings);
        } catch(Exception $e) {
        }

        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
        $this->data['error_warning'] = '';
        $this->data['success'] = '';
        $this->data['token'] = $this->session->data['token'];
            
        /*
        $search = array(
            'begindate' => '2014-05-01',
            'enddate' => '2017-05-01',
        );
        $search = json_encode($search);
        $res = $proxyApi->getCampaignListExt(0, 10, 'id', 'desc', $search);
        */
        
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
        $limit = 10;
        $from = ($page - 1)  * $limit;
        
        $res = $proxyApi->getCampaignList($from, $limit, 'desc');
        
        if ( ! empty($res['error'])) {
            $res = array(
                'result' => array(
                    'total' => 0
                )
            );
        }
        
		$pagination = new Pagination();
		$pagination->total = $res['result']['total']-$limit;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('sale/sms_sending/statistic', 'page={page}&token=' . $this->session->data['token']);

		$this->data['last_page'] = floor($res['result']['total'] / $limit);
		$this->data['current_page'] = $page;
		$this->data['pagination'] = $pagination->render();
        
        $this->data['statistic'] = isset($res['result']) ? $res['result'] : NULL;
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->response->setOutput($this->load->view('sale/sms_sending_statistics.tpl', $this->data));
    }
    
    /**
     * $this->model_account_customer->addLoginAttempt($this->request->post['email']);
     * $this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
     * $this->customer->login($this->request->post['email'], $this->request->post['password'])
     * $this->model_account_activity->addActivity('login', $activity_data);
     
        $this->load->model('account/customer');
        $customer_id = $this->model_account_customer->addCustomer($this->request->post);
     */
    public function testrules() {
        
        if (1) {
        $json_rules = '
        {
            "1" : {
                "event_type" : "OnOrderEdit",
                "condition" : {
                    "store_id" : "0",
                    "currency_code" : "USD",
                    "customer_group_id" : "1",
                    "payment_country_id" : "223"
                },
                "option" : {
                    "translit_checked" : "0",
                    "timetype" : "2",
                    "date" : "2017-05-15 14:09",
                    "timesend" : "1"
                },
                "message" : "1 {{customer_id}}\r\n2\r\n3 {{firstname}}\r\n4\r\n5 {{lastname}}",
                "active" : 1
            },
            "2" : {
                "event_type" : "OnOrderDelete",
                "condition" : {
                    "store_id" : "0",
                    "customer_group_id" : "1",
                    "payment_country_id" : ""
                },
                "option" : {
                    "translit" : "on",
                    "translit_checked" : "1",
                    "timetype" : "2",
                    "date" : "2017-05-30 14:41",
                    "timesend" : "1"
                },
                "message" : "11 {{affiliate_id}}\r\n22 {{email}}\r\n33 {{invoice_prefix}}\r\n44\r\n55",
                "active" : 1
            },
            "3" : {
                "event_type" : "OnOrderAdd",
                "condition" : {
                    "store_id" : "0",
                    "currency_code" : "USD",
                    "customer_group_id" : "1",
                    "payment_country_id" : "223"
                },
                "option" : {
                    "translit" : "on",
                    "translit_checked" : "1",
                    "timesend" : "1",
                    "timetype" : "1"
                },
                "message" : "\u041f\u0440\u0438\u0432\u0435\u0442 \u0412\u0430\u0441\u044f, \u0442\u0432\u043e\u0439 \u0430\u0439\u0434\u0438 - {{customer_id}}",
                "active" : 1
            },
            "4" : {
                "event_type" : "OnOrderHistoryAdd",
                "condition" : {
                    "order_status_id" : "5",
                    "store_id" : "0",
                    "customer_group_id" : "1",
                    "payment_country_id" : "223"
                },
                "option" : {
                    "translit" : "on",
                    "translit_checked" : "1",
                    "timesend" : "1",
                    "timetype" : "1"
                },
                "message" : "Complite your ({{customer_id}} {{email}}) order, ye!!! ",
                "active" : 1
            },
            "5" : {
                "event_type" : "OnReturnAdd",
                "condition" : {
                    "return_reason_id" : "4",
                    "opened" : "",
                    "return_status_id" : "3",
                    "return_action_id" : "2"
                },
                "option" : {
                    "customer_group_id" : "",
                    "translit_checked" : "0",
                    "timesend" : "1",
                    "timetype" : "1"
                },
                "message" : "\u041f\u043e \u0437\u0430\u043a\u0430\u0437\u0443 {{order_id}} \u0422\u043e\u0432\u0430\u0440 {{product}} \u0431\u044b\u043b \u0443\u0441\u043f\u0435\u0448\u043d\u043e \u0432\u043e\u0437\u0432\u0440\u0430\u0449\u0435\u043d, \u0434\u0435\u043d\u044c\u0433\u0438 \u0432\u043e\u0437\u0432\u0440\u0430\u0449\u0435\u043d\u044b",
                "active" : 1
            },
            "6" : {
                "event_type" : "OnCustomerAdd",
                "condition" : {
                    "customer_group_id" : "1",
                    "newsletter" : "0",
                    "status" : "1",
                    "approved" : "1",
                    "safe" : "0"
                },
                "option" : {
                    "customer_group_id" : "",
                    "translit_checked" : "0",
                    "timesend" : "1",
                    "timetype" : "1"
                },
                "message" : "\u041f\u043e\u0437\u0434\u0440\u0430\u0432\u043b\u044f\u0435\u043c \r\n\u0412\u044b \u0443\u0441\u043f\u0435\u0448\u043d\u043e \u0437\u0430\u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0438\u0440\u043e\u0432\u0430\u043b\u0438\u0441\u044c \u0432 \u043c\u0430\u0433\u0430\u0437\u0438\u043d\u0435!\r\n",
                "active" : 1
            },
            "7" : {
                "event_type" : "OnProductAdd",
                "condition" : {
                    "quantity" : {
                        "type" : "1",
                        "value" : "2"
                    },
                    "price" : {
                        "type" : "2",
                        "value" : "1000"
                    },
                    "model" : "Test",
                    "manufacturer" : "Nike",
                    "manufacturer_id" : "11",
                    "category" : "",
                    "product_category" : ["59"],
                    "product_store" : ["0"],
                    "download" : "",
                    "product_download" : ["1"],
                    "related" : "",
                    "product_related" : ["41"]
                },
                "option" : {
                    "customer_group_id" : "1",
                    "translit_checked" : "0",
                    "timesend" : "1",
                    "timetype" : "1"
                },
                "message" : "11111111\r\n222222\r\n333",
                "active" : 1
            }
        }';
        }

        $info = array();
        $array_rules = json_decode($json_rules, 1);

        // $allow_events = array('OnCustomerAdd'); // +
        // $allow_events = array('OnProductAdd'); // +
        // $allow_events = array('OnReturnAdd'); // +
        $allow_events = array('OnOrderAdd'); // ? +
        // $allow_events = array('OnReturnEdit'); // ?
        // $allow_events = array('OnOrderEdit'); // ?
        // $allow_events = array('OnOrderDelete'); // ?
        // $allow_events = array('OnOrderHistoryAdd'); // ?
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $send_result = array();
        foreach ($array_rules as $rule) {
            
            if ( ! empty($allow_events)) {
                if ( ! in_array($rule['event_type'], $allow_events))
                    continue;
            }
            
            switch ($rule['event_type']) {
                case 'OnOrderEdit':

                    $order_id = 36;
                    require_once (DIR_SYSTEM .'/../admin/model/sale/order.php');
                    $modelSaleOrder = new ModelSaleOrder( $this->registry );
                    $order = $modelSaleOrder->getOrder($order_id);
                    // $order = $args[1];

                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderEdit', $array_rules);
                    
                    $order_id = 35;
                    $order = $modelSaleOrder->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderEdit', $array_rules);
                    
                    break;
                case 'OnOrderDelete':
                    
                    $order_id = 36; // $args[0];
                    require_once (DIR_SYSTEM .'/../admin/model/sale/order.php');
                    $modelSaleOrder = new ModelSaleOrder( $this->registry );
                    $order = $modelSaleOrder->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderDelete', $array_rules);
                    
                    $order_id = 35; // $args[0];
                    $order = $modelSaleOrder->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderDelete', $array_rules);
                    
                    break;
                case 'OnOrderAdd':
                    
                    $order_id = 36;
                    require_once (DIR_SYSTEM .'/../admin/model/sale/order.php');
                    $modelSaleOrder = new ModelSaleOrder( $this->registry );
                    $order = $modelSaleOrder->getOrder($order_id);
                    // $order = $args[1];
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderAdd', $array_rules);
                    
                    $order_id = 35;
                    $order = $modelSaleOrder->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderAdd', $array_rules);
                    
                    break;
                case 'OnOrderHistoryAdd':
                    
                    $order_id = 36; // $args[0]
                    $this->load->model('checkout/order');
                    // $order = $args[1];
                    $order = $this->model_checkout_order->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderHistoryAdd', $array_rules);
                    
                    $order_id = 35; // $args[0]
                    $order = $this->model_checkout_order->getOrder($order_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderHistoryAdd', $array_rules);
                    
                    break;
                case 'OnProductAdd': // 
                
                    // ERROR 
                    $product_id = 42; // $args[0]
                    require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
                    $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
                    $product = $modelCatalogProduct->getProduct($product_id);
                    
                    // store
                    $this->load->model('setting/store');
                    $product['stores'] = $this->model_setting_store->getStores();
                    $this->load->model('catalog/product');
                    $product['product_store'] = $this->model_catalog_product->getProductStores($product_id);
                    
                    // Categories
                    $this->load->model('catalog/category');
                    $categories = $modelCatalogProduct->getProductCategories($product_id);
                    $product['product_categories'] = array();
                    foreach ($categories as $category_id) {
                        $category_info = $this->model_catalog_category->getCategory($category_id);
                        if ($category_info) {
                            /*$product['product_categories'][] = array(
                                'category_id' => $category_info['category_id'],
                                'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                            );*/
                            $product['product_category'][] = $category_info['category_id'];
                        }
                    }
                    
                    // manufacturer
                    $this->load->model('catalog/manufacturer');
                    $product['manufacturer'] = '';
                    $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product['manufacturer_id']);
                    if ($manufacturer_info) {
                        $product['manufacturer'] = $manufacturer_info['name'];
                    }
                    
                    // Downloads
                    $this->load->model('catalog/download');
                    $product_downloads = $this->model_catalog_product->getProductDownloads($product_id);
                    $product['product_download'] = array();
                    foreach ($product_downloads as $download_id) {
                        $download_info = $this->model_catalog_download->getDownload($download_id);
                        if ($download_info) {
                            /*$product['product_downloads'][] = array(
                                'download_id' => $download_info['download_id'],
                                'name'        => $download_info['name']
                            );*/
                            $product['product_download'][] = $download_info['download_id'];
                        }
                    }
                    
                    // Related
                    $products_rel = $this->model_catalog_product->getProductRelated($product_id);
                    $product['product_related'] = array();
                    foreach ($products_rel as $product_id_rel) {
                        $related_info = $this->model_catalog_product->getProduct($product_id_rel);
                        if ($related_info) {
                            /*$product['product_relateds'][] = array(
                                'product_id' => $related_info['product_id'],
                                'name'       => $related_info['name']
                            );*/
                            $product['product_related'][] = $related_info['product_id'];
                        }
                    }
                    
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeProductRules($product, 'OnProductAdd', $array_rules);
                    
                    
                    /// OK
                    $product_id = 53; // $args[0]
                    require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
                    $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
                    $product = $modelCatalogProduct->getProduct($product_id);
                    
                    // store
                    $this->load->model('setting/store');
                    $product['stores'] = $this->model_setting_store->getStores();
                    $this->load->model('catalog/product');
                    $product['product_store'] = $this->model_catalog_product->getProductStores($product_id);
                    
                    // Categories
                    $this->load->model('catalog/category');
                    $categories = $modelCatalogProduct->getProductCategories($product_id);
                    $product['product_categories'] = array();
                    foreach ($categories as $category_id) {
                        $category_info = $this->model_catalog_category->getCategory($category_id);
                        if ($category_info) {
                            /*$product['product_categories'][] = array(
                                'category_id' => $category_info['category_id'],
                                'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                            );*/
                            $product['product_category'][] = $category_info['category_id'];
                        }
                    }
                    
                    // manufacturer
                    $this->load->model('catalog/manufacturer');
                    $product['manufacturer'] = '';
                    $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product['manufacturer_id']);
                    if ($manufacturer_info) {
                        $product['manufacturer'] = $manufacturer_info['name'];
                    }
                    
                    // Downloads
                    $this->load->model('catalog/download');
                    $product_downloads = $this->model_catalog_product->getProductDownloads($product_id);
                    $product['product_download'] = array();
                    foreach ($product_downloads as $download_id) {
                        $download_info = $this->model_catalog_download->getDownload($download_id);
                        if ($download_info) {
                            /*$product['product_downloads'][] = array(
                                'download_id' => $download_info['download_id'],
                                'name'        => $download_info['name']
                            );*/
                            $product['product_download'][] = $download_info['download_id'];
                        }
                    }
                    
                    // Related
                    $products_rel = $this->model_catalog_product->getProductRelated($product_id);
                    $product['product_related'] = array();
                    foreach ($products_rel as $product_id_rel) {
                        $related_info = $this->model_catalog_product->getProduct($product_id_rel);
                        if ($related_info) {
                            /*$product['product_relateds'][] = array(
                                'product_id' => $related_info['product_id'],
                                'name'       => $related_info['name']
                            );*/
                            $product['product_related'][] = $related_info['product_id'];
                        }
                    }
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeProductRules($product, 'OnProductAdd', $array_rules);
                
                    break;
                case 'OnProductEdit': // 
                    // Apple Cinema 30" - 42
                    // Кросовки - 52
                    $product_id = 52; // $args[0]
                    require_once (DIR_SYSTEM .'/../admin/model/catalog/product.php');
                    $modelCatalogProduct = new ModelCatalogProduct( $this->registry );
                    $product = $modelCatalogProduct->getProduct($product_id);
                    $modelSaleSmsSending->executeProductRules($product, 'OnProductEdit', $array_rules);

                    
                    break;
                case 'OnReturnAdd': // 
                    // ERROR
                    $return_id = 1; // $args[0]
                    require_once (DIR_SYSTEM .'/../admin/model/sale/return.php');
                    $modelSaleReturn = new ModelSaleReturn( $this->registry );
                    $return = $modelSaleReturn->getReturn($return_id);
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeReturnRules($return, 'OnReturnAdd', $array_rules);
                    
                    // OK
                    $return_id = 3; // $args[0]
                    $return = $modelSaleReturn->getReturn($return_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeReturnRules($return, 'OnReturnAdd', $array_rules);
                    
                    break;
                case 'OnCustomerAdd': // 
                    // 1,2,3
                    $customer_id = 2; // $args[0]
                    require_once (DIR_SYSTEM .'/../admin/model/customer/customer.php');
                    $modelCustomerCustomer = new ModelCustomerCustomer( $this->registry );
                    $customer = $modelCustomerCustomer->getCustomer($customer_id);
                    $send_result[$rule['event_type']]['check_error'] = $modelSaleSmsSending->executeCustomerRules($customer, 'OnCustomerAdd', $array_rules);
                    
                    $customer_id = 3; // $args[0]
                    $customer = $modelCustomerCustomer->getCustomer($customer_id);
                    $send_result[$rule['event_type']]['check_success'] = $modelSaleSmsSending->executeCustomerRules($customer, 'OnCustomerAdd', $array_rules);
                    
                    break;
            }
        }

        $info['rules'] = $array_rules;
        $info['eventLog'] = $modelSaleSmsSending->getLogs();
        $info['send_result'] = $send_result;
        
        $json_info = json_encode($info);
        
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput($json_info);
    }
    
	public function clearlog() {
		$this->load->language('sale/sms_sending');

		if ($this->user->hasPermission('modify', 'sale/sms_sending')) {
			$handle = fopen(DIR_LOGS . 'sms_sending.log', 'w+');

			fclose($handle);

			$this->session->data['success'] = $this->language->get('text_success');

            $url = '';
            
			$this->response->redirect($this->url->link('sale/sms_sending/rules', 'token=' . $this->session->data['token'] . $url, true));
		}
	}
    
    /**
     * show rules with table
     */
    public function rules() {
        $this->load->language('sale/sms_sending');
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->document->setTitle($this->language->get('heading_rules_title'));
        
        $this->load->language('sale/order');
        $this->load->model('sale/sms_sending');
        
        $settings = $this->settings;
        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['message']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
        }

        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_rules_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        
        $this->data['admin_link_add_rule'] = $this->url->link('sale/sms_sending/add_rule', 'token=' . $this->session->data['token'], true);
        $this->data['admin_link_rules_delete'] = $this->url->link('sale/sms_sending/rules_delete', 'token=' . $this->session->data['token'], true);
        $this->data['admin_link_rule_enable'] = $this->url->link('sale/sms_sending/rule_enable', 'token=' . $this->session->data['token'], true);
        $this->data['admin_link_rule_disable'] = $this->url->link('sale/sms_sending/rule_disable', 'token=' . $this->session->data['token'], true);
        $this->data['admin_link_clearlog'] = $this->url->link('sale/sms_sending/clearlog', 'token=' . $this->session->data['token'], true);
        
		// Log
		$file = DIR_LOGS . 'sms_sending.log';

		if (file_exists($file)) {
			$this->data['log'] = htmlentities(file_get_contents($file, FILE_USE_INCLUDE_PATH, null));
		} else {
			$this->data['log'] = '';
		}
        
        $rules = $this->model_sale_sms_sending->getOption('rules', '[]');
        $this->data['rules'] = json_decode($rules, 1);
        
        // echo json_encode($this->data['rules']);
        
        $this->load->language('sale/order');
        
        // Stores
        $this->load->model('setting/store');

        $this->data['stores'] = array();

        $this->data['stores'][] = array(
            'store_id' => 0,
            'name' => $this->language->get('text_default')
        );

        $results = $this->model_setting_store->getStores();

        foreach ($results as $result) {
            $this->data['stores'][] = array(
                'store_id' => $result['store_id'],
                'name' => $result['name']
            );
        }
        
        if ($this->check_old_version()) {
            $this->load->model('sale/customer_group');
            $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
        } else {
            $this->load->model('customer/customer_group');
            $this->data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
        }              
        
        $this->load->model('localisation/order_status');

        $this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        $this->load->model('localisation/currency');

        $this->data['currencies'] = $this->model_localisation_currency->getCurrencies();
        
        $this->load->language('sale/order');
        
        
        $this->data['detail_log'] = $this->model_sale_sms_sending->getOption('detail_log', 'N');
        $this->data['admin_link_disable_log'] = $this->url->link('sale/sms_sending/disable_log', 'token=' . $this->session->data['token'], true);
        $this->data['admin_link_enable_log'] = $this->url->link('sale/sms_sending/enable_log', 'token=' . $this->session->data['token'], true);
        
        /////////
        
        // Stores
        $this->load->model('setting/store');
        $rule_stores = array();
        $rule_stores[] = array(
            'store_id' => 0,
            'name' => $this->language->get('text_default')
        );
        $stores = $this->model_setting_store->getStores();
        foreach ($stores as $result) {
            $rule_stores[] = array(
                'store_id' => $result['store_id'],
                'name' => $result['name']
            );
        }

        // Categories
        $this->load->model('catalog/category');
        $this->load->model('catalog/download');
        // manufacturer
        $this->load->model('catalog/manufacturer');
        
        foreach ($this->data['rules'] as $rule_id => $rule) {
            foreach ($rule['condition'] as $type => $condition) {
                switch ($type) {
                    case 'product_store':
                        $detail_condition = array();
                        foreach ($rule_stores as $store) {
                            if (in_array($store['store_id'], $condition)) {
                                $detail_condition[] = $store;
                            }
                        }
                        $this->data['rules'][$rule_id]['condition'][$type] = $detail_condition;
                        break;
                    case 'product_download':
                        $detail_product_downloads = array();
                        foreach ($condition as $download_id) {
                            $download_info = $this->model_catalog_download->getDownload($download_id);
                            if ($download_info) {
                                $detail_product_downloads[] = array(
                                    'download_id' => $download_info['download_id'],
                                    'name'        => $download_info['name']
                                );
                            }
                        }
                        $this->data['rules'][$rule_id]['condition'][$type] = $detail_product_downloads;
                        break;
                    case 'product_related':
                        $detail_product_relateds = array();
                        foreach ($condition as $product_id_rel) {
                            $related_info = $this->model_catalog_product->getProduct($product_id_rel);
                            if ($related_info) {
                                $detail_product_relateds[] = array(
                                    'product_id' => $related_info['product_id'],
                                    'name'       => $related_info['name']
                                );
                            }
                        }
                        $this->data['rules'][$rule_id]['condition'][$type] = $detail_product_relateds;
                        break;
                    case 'product_category':
                        $detail_categories = array();
                        foreach ($condition as $category_id) {
                            $category_info = $this->model_catalog_category->getCategory($category_id);
                            if ($category_info) {
                                $detail_categories[] = array(
                                    'category_id' => $category_info['category_id'],
                                    'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                                );
                            }
                        }
                        $this->data['rules'][$rule_id]['condition'][$type] = $detail_categories;
                        break;
                }
            }
        }
        
        // return
        $this->load->model('localisation/return_reason');
        $this->data['return_reasons'] = $this->model_localisation_return_reason->getReturnReasons();
        
        $this->load->model('localisation/return_action');
        $this->data['return_actions'] = $this->model_localisation_return_action->getReturnActions();
        
        $this->load->model('localisation/return_status');
        $this->data['return_statuses'] = $this->model_localisation_return_status->getReturnStatuses();
        
        // customer
        if ($this->check_old_version()) {
            $this->load->language('sale/customer');
        } else {
            $this->load->language('customer/customer');
        }
        
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['entry_safe'] = $this->language->get('entry_safe');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_safe'] = $this->language->get('entry_safe');
        $this->data['entry_approved'] = $this->language->get('entry_approved');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
        
        $this->data['text_translit'] = $this->language->get('text_translit');
        $this->data['text_datetime'] = $this->language->get('text_datetime');
        $this->data['text_instantly'] = $this->language->get('text_instantly');
        $this->data['text_start_at'] = $this->language->get('text_start_at');
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_customer'] = $this->language->get('entry_customer');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_fax'] = $this->language->get('entry_fax');
        $this->data['entry_comment'] = $this->language->get('entry_comment');
        $this->data['entry_affiliate'] = $this->language->get('entry_affiliate');
        $this->data['entry_address'] = $this->language->get('entry_address');
        $this->data['entry_company'] = $this->language->get('entry_company');
        $this->data['entry_address_1'] = $this->language->get('entry_address_1');
        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
        $this->data['entry_city'] = $this->language->get('entry_city');
        $this->data['entry_postcode'] = $this->language->get('entry_postcode');
        $this->data['entry_zone'] = $this->language->get('entry_zone');
        $this->data['entry_zone_code'] = $this->language->get('entry_zone_code');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_option'] = $this->language->get('entry_option');
        $this->data['entry_quantity'] = $this->language->get('entry_quantity');
        $this->data['entry_to_name'] = $this->language->get('entry_to_name');
        $this->data['entry_to_email'] = $this->language->get('entry_to_email');
        $this->data['entry_from_name'] = $this->language->get('entry_from_name');
        $this->data['entry_from_email'] = $this->language->get('entry_from_email');
        $this->data['entry_theme'] = $this->language->get('entry_theme');
        $this->data['entry_message'] = $this->language->get('entry_message');
        $this->data['entry_amount'] = $this->language->get('entry_amount');
        $this->data['entry_currency'] = $this->language->get('entry_currency');
        $this->data['entry_shipping_method'] = $this->language->get('entry_shipping_method');
        $this->data['entry_payment_method'] = $this->language->get('entry_payment_method');
        $this->data['entry_coupon'] = $this->language->get('entry_coupon');
        $this->data['entry_voucher'] = $this->language->get('entry_voucher');
        $this->data['entry_reward'] = $this->language->get('entry_reward');
        $this->data['entry_order_status'] = $this->language->get('entry_order_status');
        
        $this->load->language('catalog/product');
        $this->data['entry_price'] = $this->language->get('entry_price');
        $this->data['entry_model'] = $this->language->get('entry_model');
        $this->data['entry_category'] = $this->language->get('entry_category');
        $this->data['entry_related'] = $this->language->get('entry_related');
        $this->data['entry_download'] = $this->language->get('entry_download');
        $this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        
        $this->data['token'] = $this->session->data['token'];

        $this->load->language('sale/return');
        
        // orders
        $this->data['text_opened'] = $this->language->get('text_opened');
        $this->data['text_unopened'] = $this->language->get('text_unopened');
        
        $this->data['entry_opened'] = $this->language->get('entry_opened');
        $this->data['entry_return_reason'] = $this->language->get('entry_return_reason');
        $this->data['entry_return_action'] = $this->language->get('entry_return_action');
        $this->data['entry_return_status'] = $this->language->get('entry_return_status');
        
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        
        $this->response->setOutput($this->load->view('sale/sms_sending_rules.tpl', $this->data));
    }
    
    public function enable_log() {
        $json = array();
        $this->load->model('sale/sms_sending');
        $this->data['detail_log'] = $this->model_sale_sms_sending->getOption('detail_log');
        $json['result'] = $this->model_sale_sms_sending->setOption('detail_log', 'Y');
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
        $this->response->redirect($this->url->link('sale/sms_sending/rules', 'token=' . $this->session->data['token'], true));
    }
    
    public function disable_log() {
        $json = array();
        $this->load->model('sale/sms_sending');
        $this->data['detail_log'] = $this->model_sale_sms_sending->getOption('detail_log');
        $json['result'] = $this->model_sale_sms_sending->setOption('detail_log', 'N');
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
        $this->response->redirect($this->url->link('sale/sms_sending/rules', 'token=' . $this->session->data['token'], true));
    }

    /**
     * show rules with table
     */
    public function add_rule() {
        $this->load->language('sale/sms_sending');
        
        $this->document->setTitle($this->language->get('heading_add_rule_title'));
        
        $settings = $this->settings;
        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['message']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
        }
        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
        $this->data['entry_to'] = $this->language->get('entry_to');
        $this->data['text_translit'] = $this->language->get('text_translit');
        $this->data['text_datetime'] = $this->language->get('text_datetime');
        $this->data['text_instantly'] = $this->language->get('text_instantly');
        $this->data['text_start_at'] = $this->language->get('text_start_at');

        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/sms_sending', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['event_types'] = array(
            array('code' => 'OnOrderAdd', 'caption' => 'On Order Add'),
            array('code' => 'OnOrderEdit', 'caption' => 'On Order Edit'),
            array('code' => 'OnOrderDelete', 'caption' => 'On Order Delete'),
            array('code' => 'OnOrderHistoryAdd', 'caption' => 'On Order History Add'),
            array('code' => 'OnReturnAdd', 'caption' => 'On Return Add'),
            array('code' => 'OnCustomerAdd', 'caption' => 'On Customer Add'),
            array('code' => 'OnProductAdd', 'caption' => 'On Product Add'),
            array('code' => 'OnProductEdit', 'caption' => 'On Product Edit'),
        );
                
        $this->getForm();
    }

    /**
     * 
     */
    public function save_rule() {
        $this->load->model('sale/sms_sending');
        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['message']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
            
            if (empty($json['error'])) {            
                $rule = array();
                foreach ($this->request->post as $key => $value) {
                    $rule[$key] = $value;
                }
                // add new active rule
                $rule['active'] = 1;
                $rules = $this->model_sale_sms_sending->getOption('rules', '[]');
                $rules = json_decode($rules, 1);
                // $rules = array();
                $rule_id = isset($this->request->post['rule_id']) ? $this->request->post['rule_id'] : NULL;
                if ( ! is_numeric($rule_id)) {
                    $rules[] = $rule;
                } else {
                    $rules[$rule_id] = $rule;
                }
                $json['result'] = $this->model_sale_sms_sending->setOption('rules', json_encode($rules));
                if ($json['result']) {
                    $json['success'] = 'The rule was successfully added';
                } else {
                    $json['error'] = 'Unknown error';
                }
            }
        }
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /**
     * 
     */
    public function rule_enable() {
        $this->load->model('sale/sms_sending');
        $json = array();
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['modification_id']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
            $modification_id = $this->request->post['modification_id'] - 1;
            if (empty($json['error'])) {        
                $rule = array();
                foreach ($this->request->post as $key => $value) {
                    $rule[$key] = $value;
                }
                $rules = $this->model_sale_sms_sending->getOption('rules', array());
                $rules = json_decode($rules, 1);
                foreach ($rules as $i => $rule) {
                    if ($i == $modification_id) {
                        $rules[$i]['active'] = 1;
                        break;
                    }
                }
                $json['result'] = $this->model_sale_sms_sending->setOption('rules', json_encode($rules));
            }
        }
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    /**
     * 
     */
    public function rule_disable() {
        $this->load->model('sale/sms_sending');
        $json = array();
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $json['error']['warning'] = $this->language->get('error_permission');
            }
            if (!$this->request->post['modification_id']) {
                $json['error']['message'] = $this->language->get('error_message');
            }
            $modification_id = $this->request->post['modification_id'] - 1;
            if (empty($json['error'])) {        
                $rule = array();
                foreach ($this->request->post as $key => $value) {
                    $rule[$key] = $value;
                }
                $rules = $this->model_sale_sms_sending->getOption('rules', array());
                $rules = json_decode($rules, 1);
                foreach ($rules as $i => $rule) {
                    if ($i == $modification_id) {
                        $rules[$i]['active'] = 0;
                        break;
                    }
                }
                $json['result'] = $this->model_sale_sms_sending->setOption('rules', json_encode($rules));
            }
        }
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    public function rules_delete() {
        $this->load->model('sale/sms_sending');
        
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'sale/sms_sending')) {
                $this->session->data['error_warning'] = $this->language->get('error_permission');
            }
            
            if (empty($this->session->data['error'])) {
                $rule = array();
                foreach ($this->request->post as $key => $value) {
                    $rule[$key] = $value;
                }
                $rules = $this->model_sale_sms_sending->getOption('rules', array());
                $rules = json_decode($rules, 1);

                foreach ($this->request->post['selected'] as $i) {
                    if (isset($rules[$i])) {
                        unset($rules[$i]);
                    }
                }
                $this->model_sale_sms_sending->setOption('rules', json_encode($rules));
                // $this->session->data['success'] = $this->language->get('text_success');
            }
        }
        $url = '';
        $this->response->redirect($this->url->link('sale/sms_sending/rules', 'token=' . $this->session->data['token'] . $url, true));
    }

}
?>