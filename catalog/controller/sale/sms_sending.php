<?php
/**
    error_reporting(0);
    ini_set('error_reporting', 0);
    ini_set('display_errors', 0);

    ini_set('xdebug.var_display_max_children', 128); // def 128
    ini_set('xdebug.var_display_max_data', 512); // def 512
    ini_set('xdebug.var_display_max_depth', 7); // def 3
 */
class ControllerSaleSmsSending extends Controller {
    
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
     * 2.0 > OC < 2.2
     * post.order.history.add
     */
    public function postOrderHistoryAdd($order_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $this->load->model('checkout/order');
        $order = $this->model_checkout_order->getOrder($order_id);
        
        $modelSaleSmsSending->executeOrderRules($order, 'OnOrderHistoryAdd');
    }
    
    /**
     * OC > 2.2
     */
    public function addOrderHistory($route, $args) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $this->load->model('checkout/order');
        $order = $this->model_checkout_order->getOrder($args[0]);
        
        $modelSaleSmsSending->executeOrderRules($order, 'OnOrderHistoryAdd');
    }
    
    /**
     * 2.0 > OC < 2.2
     * post.order.add
     */
    public function postOrderAdd($order_id) {// var_dump($order_id);exit;
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );
        
        $this->load->model('checkout/order');
        $order = $this->model_checkout_order->getOrder($order_id);
        // var_dump($order);
        $order['order_id'] = $order_id;
        $send_result = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderAdd');
    }
    
    /**
     * OC > 2.2
     */
    public function addOrder($route, $args, $order_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $order = $args[0];
        $order['order_id'] = $order_id;
        $send_result = $modelSaleSmsSending->executeOrderRules($order, 'OnOrderAdd');
    }
    
    /**
     * OC > 2.2
     */
    public function editOrder($route, $args) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $modelSaleSmsSending->executeOrderRules($args[1], 'OnOrderEdit');
    }
    
    /**
     * 2.0 > OC < 2.2
     * post.order.edit
     */
    public function postOrderEdit($order_id) {
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );
        
        $this->load->model('checkout/order');
        $order = $this->model_checkout_order->getOrder($order_id);

        $modelSaleSmsSending->executeOrderRules($order, 'OnOrderEdit');
    }

    /**
     * OC > 2.2
     */
    public function addCustomer($route, $args, $customer_id) {
        $customer = $args[0];
        $customer['customer_id'] = $customer_id;
        
        require_once (DIR_SYSTEM .'/../admin/model/sale/sms_sending.php');
        $modelSaleSmsSending = new ModelSaleSmsSending( $this->registry );

        $send_result = $modelSaleSmsSending->executeCustomerRules($customer, 'OnCustomerAdd');
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
}
?>