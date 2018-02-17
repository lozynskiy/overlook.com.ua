<?php

/**
    ini_set('xdebug.var_display_max_children', 228); // def: 128
    ini_set('xdebug.var_display_max_data', 50000); // // def: 512
    ini_set('xdebug.var_display_max_depth', 7); // def: 3
 */
class ModelSaleSmsSending extends Model {
    
	public function __construct($registry) {
		parent::__construct($registry);
        $this->log = $this->getOption('detail_log', 'N') == 'Y';
	}
    
    private function getProxyApi($settings) {
        if ( ! isset($settings['private_key']) || ! isset($settings['public_key']) || ! isset($settings['sender_name']) || $settings['private_key'] == '' || $settings['public_key'] == '' || $settings['sender_name'] == '') {
            // $this->data['error_warning'] = $this->language->get('error_warning'); // TODO move output to controller
            return false;
        }
        require_once (DIR_SYSTEM .'/../admin/libs/ProxyApi.php');
        $proxyApi = new ProxyApi;
        $proxyApi->connect($settings['private_key'], $settings['public_key']);
        return $proxyApi;
    }
    
    public function translit($str) {
        if ($str) {
            $cirilica = array("а", "б", "в", "г", "д", "е", "ё", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ъ", "ы", "э", "_", "А", "Б", "В", "Г", "Д", "Е", "Ё", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ъ", "Ы", "Э", "_", "ж", "ц", "ч", "ш", "щ", "ь", "ю", "я", "Ж", "Ц", "Ч", "Ш", "Щ", "Ь", "Ю", "Я");
            $latinica = array("a", "b", "v", "g", "d", "e", "e", "z", "i", "y", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "h", "", "i", "e", "_", "A", "B", "V", "G", "D", "E", "E", "Z", "I", "Y", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "F", "H", "", "I", "E", "I", "zh", "ts", "ch", "sh", "shch", "", "yu", "ya", "ZH", "TS", "CH", "SH", "SHCH", " ", "YU", "YA");
            return str_replace($cirilica, $latinica, $str);
        } else {
            return '';
        }
    }
    
    /*public $replaceList = array(
        'invoice_prefix',
        'store_id',
    );*/
    
	/**
	 * Gets a value from an array using a dot separated path.
	 *
	 *     // Get the value of $array['foo']['bar']
	 *     $value = Arr::path($array, 'foo.bar');
	 *
	 * Using a wildcard "*" will search intermediate arrays and return an array.
	 *
	 *     // Get the values of "color" in theme
	 *     $colors = Arr::path($array, 'theme.*.color');
	 *
	 *     // Using an array of keys
	 *     $colors = Arr::path($array, array('theme', '*', 'color'));
	 *
	 * @param   array   $array      array to search
	 * @param   mixed   $path       key path string (delimiter separated) or array of keys
	 * @param   mixed   $default    default value if the path is not set
	 * @param   string  $delimiter  key path delimiter
	 * @return  mixed
	 */
	public function array_path($array, $path, $default = NULL, $delimiter = NULL) {
		if ( ! is_array($array)) {
			// This is not an array!
			return $default;
		}

		if (is_array($path)) {
			// The path has already been separated into keys
			$keys = $path;
		} else {
			if (array_key_exists($path, $array)) {
				// No need to do extra processing
				return $array[$path];
			}

			if ($delimiter === NULL) {
				// Use the default delimiter
				$delimiter = Arr::$delimiter;
			}

			// Remove starting delimiters and spaces
			$path = ltrim($path, "{$delimiter} ");

			// Remove ending delimiters, spaces, and wildcards
			$path = rtrim($path, "{$delimiter} *");

			// Split the keys by delimiter
			$keys = explode($delimiter, $path);
		}

		do {
			$key = array_shift($keys);

			if (ctype_digit($key)) {
				// Make the key an integer
				$key = (int) $key;
			}

			if (isset($array[$key])) {
				if ($keys) {
					if (Arr::is_array($array[$key])) {
						// Dig down into the next part of the path
						$array = $array[$key];
					} else {
						// Unable to dig deeper
						break;
					}
				} else {
					// Found the path requested
					return $array[$key];
				}
			} elseif ($key === '*') {
				// Handle wildcards

				$values = array();
				foreach ($array as $arr) {
					if ($value = Arr::path($arr, implode('.', $keys))) {
						$values[] = $value;
					}
				}

				if ($values) {
					// Found the values requested
					return $values;
				} else {
					// Unable to dig deeper
					break;
				}
			} else {
				// Unable to dig deeper
				break;
			}
		} while ($keys);

		// Unable to find the value requested
		return $default;
	}
    
    public function array_extract($array, $path, $delimiter = ',') {
        $result = array();
        foreach ($array as $item) {
            $result[] = $this->array_path($item, $path);
        }
        return implode($delimiter, $result);
    }
    
    public function replaceMessage($message, $order) {
        $replace = array();
        foreach ($order as $fname => $value) {
            if (is_string($value) OR is_numeric($value)) {
                $replace['{{' . $fname . '}}'] = $value;
            } elseif (is_array($value)) {
                // strpos($fname, '.')!==FALSE
                // list($_fname, $path) = explode('.', $fname);
                // $replace['{{' . $fname . '}}'] = $this->array_extract($array, $fname);
            }
        }
        if ($this->log) {
            $this->eventLog[__METHOD__][] = compact('message', 'replace');
        }
        return strtr($message, $replace);
    }
    
    public $eventLog = array();
    
    public $log = 1;
    
    public function getLogs() {
        if ($this->log)
            return $this->eventLog;
    }    
    
    public function check_old_version() {
        list($v1,$v2) = explode('.', VERSION);
        $v1 = (int) $v1;
        $v2 = (int) $v2;
        if ($v1 >= 2 AND $v2 >= 0 AND $v2 < 2) { // 2.0 - 2.1 // https://github.com/opencart/opencart/wiki/Events-(script-notifications)-2.0.x.x-&-2.1.x.x
            return true;
        } else {// >= 2.2 // https://github.com/opencart/opencart/wiki/Events-(script-notifications)-2.2.x.x
            return false;
        }
        return false;
    }
    
    public function checkOrderRule($rule, $order) {
        $result = array();
        
        switch ($rule['event_type']) {
            case 'OnOrderAdd':
                $conditionFields = array('store_id', 'currency_code', 'payment_country_id');
                if ( ! $this->check_old_version()) {
                    $conditionFields[] = 'customer_group_id';
                }
                break;
            case 'OnOrderEdit':
                $conditionFields = array('store_id', 'payment_country_id');
                if ( ! $this->check_old_version()) {
                    $conditionFields[] = 'customer_group_id';
                }
                break;
            case 'OnOrderDelete':
                $conditionFields = array('store_id', 'payment_country_id');
                if ( ! $this->check_old_version()) {
                    $conditionFields[] = 'customer_group_id';
                }
                break;
            case 'OnOrderHistoryAdd':
                $conditionFields = array('store_id', 'order_status_id', 'currency_code', 'payment_country_id');
                if ( ! $this->check_old_version()) {
                    $conditionFields[] = 'customer_group_id';
                }
                break;
            case 'OnProductAdd':
            
                /**
                  'quantity' => 
                    array (size=2)
                      'type' => string '1' (length=1)
                      'value' => string '1' (length=1)
                  'price' => 
                    array (size=2)
                      'type' => string '1' (length=1)
                      'value' => string '2000' (length=4)
                  'model' => string 'u2' (length=2)
                  'manufacturer' => string 'Nike' (length=4)
                  'manufacturer_id' => string '11' (length=2)
                  'category' => string '' (length=0)
                  'product_category' => 
                    array (size=1)
                      0 => string '59' (length=2)
                  'product_store' => 
                    array (size=1)
                      0 => string '0' (length=1)
                  'download' => string '' (length=0)
                  'related' => string '' (length=0)
                 */
            
                $conditionFields = array('quantity', 'price', 'model', 'manufacturer', 'manufacturer_id', 'category', 'product_category', 'product_store', 'download', 'related');
                break;
        }
        foreach ($conditionFields as $fname) {
            if ( ! array_key_exists($fname, $rule['condition']))
                continue;
            $result[$fname] = (array_key_exists($fname, $order) AND array_key_exists($fname, $rule['condition']) AND $rule['condition'][$fname] !== '') ? $order[$fname] == $rule['condition'][$fname] : ($rule['condition'][$fname] !== '' ? FALSE : TRUE);
        }
        if ($this->log) {
            $this->eventLog[__METHOD__][] = compact('rule', 'order', 'result');
        }
        return ! in_array(FALSE, $result, TRUE);
        
    }
    
    public function executeOrderRules($order, $event, $rules = NULL) {
        
        if (empty($rules)) {
            $rules = $this->getOption('rules', array());
            $rules = json_decode($rules, 1);
        }
        $res = array();
        foreach ($rules as $rule) {
            if (empty($rule['active'])
                OR $rule['event_type'] !== $event)
                continue;
                
            $res = $this->checkOrderRule($rule, $order );
            if ($res) {
                // send sms
                $message = $this->replaceMessage($rule['message'], $order);
                
                $ignore = array_key_exists('ignore', $rule['option']) ? $rule['option']['ignore'] : '1';
                $timesend = array_key_exists('timesend', $rule['option']) ? $rule['option']['timesend'] : 1;
                $date = array_key_exists('date', $rule['option']) ? $rule['option']['date'] : NULL;
                $translit_checked = array_key_exists('translit_checked', $rule['option']) ? $rule['option']['translit_checked'] : 0;

                $to = 'opencart-order-' . $order['firstname'] . $order['customer_id'];
                $to_info = array($order);
                $res = $this->send( $message, $to, $to_info, $ignore, $timesend, $date, $translit_checked );
            }
        }
        $res['log'] = $this->getLogs();
        
        // Log
        $smsSendingLog = new Log('sms_sending.log');
        $smsSendingLog->write(print_r($res, 1)); // implode("\n", $res)
        
        return $res;
    }
    
    public function checkCustomerRule($rule, $customer) {
        $result = array();
        switch ($rule['event_type']) {
            case 'OnCustomerAdd':
                $conditionFields = array('customer_group_id', 'newsletter', 'approved', 'safe'); // , 'status', 'language_id'
                break;
        }
        foreach ($conditionFields as $fname) {
            if ( ! array_key_exists($fname, $rule['condition']))
                continue; 
            $result[$fname] = (array_key_exists($fname, $customer) AND array_key_exists($fname, $rule['condition']) AND $rule['condition'][$fname] !== '') ? $customer[$fname] == $rule['condition'][$fname] : ($rule['condition'][$fname] !== '' ? FALSE : TRUE);
        }
        if ($this->log) {
            $this->eventLog[__METHOD__][] = compact('rule', 'customer', 'result');
        }
        return ! in_array(FALSE, $result, TRUE);
    }
    
    /**
        array (size=5)
              'event_type' => string 'OnCustomerAdd' (length=13)
              'condition' => 
                array (size=5)
                  'customer_group_id' => string '1' (length=1)
                  'newsletter' => string '0' (length=1)
                  'status' => string '1' (length=1)
                  'approved' => string '1' (length=1)
                  'safe' => string '0' (length=1)
              'option' => 
                array (size=4)
                  'customer_group_id' => string '' (length=0)
                  'translit_checked' => string '0' (length=1)
                  'timesend' => string '1' (length=1)
                  'timetype' => string '1' (length=1)
              'message' => string 'РџРѕР·РґСЂР°РІР»СЏРµРј 
        Р’С‹ СѓСЃРїРµС€РЅРѕ Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°Р»РёСЃСЊ РІ РјР°РіР°Р·РёРЅРµ!
        ' (length=104)
              'active' => int 1
              
    
        "customer_group_id" : "1",
        "firstname" : "333333333",
        "lastname" : "333333333",
        "email" : "test3@test.test",
        "telephone" : "3333333333333",
        "fax" : "",
        "password" : "333333333",
        "confirm" : "333333333",
        "newsletter" : "0",
        "status" : "1",
        "approved" : "1",
        "safe" : "0"
     */
    public function executeCustomerRules($customer, $event, $rules = NULL) {
        
        if (empty($rules)) {
            $rules = $this->getOption('rules', array());
            $rules = json_decode($rules, 1);
        }
        $res = array();
        foreach ($rules as $rule) {
            if (empty($rule['active'])
                OR $rule['event_type'] !== $event)
                continue;

            $res = $this->checkCustomerRule($rule, $customer );
            if ($res) {
                // send sms
                $message = $this->replaceMessage($rule['message'], $customer);
                
                $ignore = array_key_exists('ignore', $rule['option']) ? $rule['option']['ignore'] : '1';
                $timesend = array_key_exists('timesend', $rule['option']) ? $rule['option']['timesend'] : 1;
                $date = array_key_exists('date', $rule['option']) ? $rule['option']['date'] : NULL;
                $translit_checked = array_key_exists('translit_checked', $rule['option']) ? $rule['option']['translit_checked'] : 0;

                $to = 'opencart-order-' . $customer['firstname'] . $customer['lastname']. $customer['telephone'];
                $to_info = array($customer);
                $res = $this->send( $message, $to, $to_info, $ignore, $timesend, $date, $translit_checked );
            }
        }
        $res['log'] = $this->getLogs();
        
        // Log
        $smsSendingLog = new Log('sms_sending.log');
        $smsSendingLog->write(print_r($res, 1)); // implode("\n", $res)
        
        return $res;
    }
    
    public function checkProductRule($rule, $product) {
        $result = array();
        switch ($rule['event_type']) {
            case 'OnProductAdd':
            case 'OnProductEdit':
                /**
                 'condition' => 
                    array (size=10)
                      'quantity' => 
                        array (size=2)
                          'type' => string '1' (length=1)
                          'value' => string '1' (length=1)
                      'price' => 
                        array (size=2)
                          'type' => string '1' (length=1)
                          'value' => string '2000' (length=4)
                      'model' => string 'u2' (length=2)
                      'manufacturer' => string 'Nike' (length=4)
                      'manufacturer_id' => string '11' (length=2)
                      'category' => string '' (length=0)
                      'product_category' => 
                        array (size=1)
                          0 => string '59' (length=2)
                      'product_store' => 
                        array (size=1)
                          0 => string '0' (length=1)
                      'download' => string '' (length=0)
                      'related' => string '' (length=0)
                 */
                $conditionFields = array('quantity', 'price', 'model', 'manufacturer_id', 'product_store', 'product_category', 'product_download', 'product_related');
                break;
        }
        foreach ($conditionFields as $fname) {
            if ( ! array_key_exists($fname, $rule['condition']))
                continue;         
            if (array_key_exists($fname, $product) 
                AND array_key_exists($fname, $rule['condition'])) {
                $value = FALSE;
                switch ($fname) {
                    case 'product_store':
                    case 'product_category':
                    case 'product_download':
                    case 'product_related':
                            $_value = array();
                            foreach ($rule['condition'][$fname] as $cat_id) {
                                $_value[] = in_array($cat_id, $product[$fname]);
                            }
                            $value = ! in_array(FALSE, $_value, TRUE);
                        break;
                    case 'price':
                    case 'quantity':
                        if ($rule['condition'][$fname]['value'] !== '') {
                            switch ($rule['condition'][$fname]['type']) {
                                case 1:
                                    $value = $product[$fname] >= $rule['condition'][$fname]['value'];
                                    break;
                                case 2:
                                    $value = $product[$fname] <= $rule['condition'][$fname]['value'];
                                    break;
                                case 3:
                                    $value = $product[$fname] == $rule['condition'][$fname]['value'];
                                    break;
                            }
                        } else {
                            $value = TRUE;
                        }
                        break;
                    default:
                        $value = $rule['condition'][$fname] === '' ? TRUE : $product[$fname] == $rule['condition'][$fname];
                        break;
                }
                $result[$fname] =  $value;
            } else {
                $result[$fname] =  TRUE;
            }
        }
        if ($this->log) {
            $this->eventLog[__METHOD__][] = compact('rule', 'product', 'result');
        }
        return ! in_array(FALSE, $result, TRUE);
    }
    
    public $checkLog;
    
    /** 
     *
        array (size=5)
          'event_type' => string 'OnProductAdd' (length=12)
          'condition' => 
            array (size=10)
              'quantity' => 
                array (size=2)
                  'type' => string '1' (length=1)
                  'value' => string '1' (length=1)
              'price' => 
                array (size=2)
                  'type' => string '1' (length=1)
                  'value' => string '2000' (length=4)
              'model' => string 'u2' (length=2)
              'manufacturer' => string 'Nike' (length=4)
              'manufacturer_id' => string '11' (length=2)
              'category' => string '' (length=0)
              'product_category' => 
                array (size=1)
                  0 => string '59' (length=2)
              'product_store' => 
                array (size=1)
                  0 => string '0' (length=1)
              'download' => string '' (length=0)
              'related' => string '' (length=0)
          'option' => 
            array (size=4)
              'customer_group_id' => string '1' (length=1)
              'translit_checked' => string '0' (length=1)
              'timesend' => string '1' (length=1)
              'timetype' => string '1' (length=1)
          'message' => string 'РЈСЂР° РЈСЂР° ' (length=14)
          'active' => int 1
              
        
			"product_description" : {
				"1" : {
					"name" : "\u0421\u0430\u043f\u043e\u0433\u0438 ",
					"description" : "&lt;p&gt;\u0421\u043a\u043e\u0440\u043e\u0445\u043e\u0434\u044b \u0443\u043b\u0443\u0447\u0448\u0435\u043d\u043d\u044b\u0435&lt;\/p&gt;",
					"meta_title" : "boots",
					"meta_description" : "boots Meta Tag Description",
					"meta_keyword" : "boots Meta Tag Keywords",
					"tag" : "boots"
				}
			},
			"model" : "U13",
			"sku" : "",
			"upc" : "",
			"ean" : "",
			"jan" : "",
			"isbn" : "",
			"mpn" : "",
			"location" : "Ukr",
			"price" : "1000",
			"tax_class_id" : "9",
			"quantity" : "30",
			"minimum" : "1",
			"subtract" : "1",
			"stock_status_id" : "6",
			"shipping" : "1",
			"keyword" : "",
			"date_available" : "2017-05-15",
			"length" : "30",
			"width" : "15",
			"height" : "30",
			"length_class_id" : "1",
			"weight" : "0.5",
			"weight_class_id" : "1",
			"status" : "1",
			"sort_order" : "1",
			"manufacturer" : "Apple",
			"manufacturer_id" : "8",
			"category" : "",
            "product_category" : ["59"],
			"filter" : "",
			"product_store" : ["0"],
			"download" : "",
			"related" : "",
			"product_attribute" : [{
					"name" : "Speed",
					"attribute_id" : "",
					"product_attribute_description" : {
						"1" : {
							"text" : "110 miles\/h"
						}
					}
				}
			],
			"option" : "Test",
			"product_option" : [{
					"product_option_id" : "",
					"name" : "Date",
					"option_id" : "8",
					"type" : "date",
					"required" : "0",
					"value" : "2017-05-16"
				}
			],
			"image" : "",
			"product_image" : [{
					"image" : "",
					"sort_order" : ""
				}
			],
			"points" : "9999",
			"product_reward" : {
				"1" : {
					"points" : "20"
				}
			},
			"product_layout" : [""]
		}
     */
    public function executeProductRules($product, $event, $rules = NULL) {
        if (empty($rules)) {
            $rules = $this->getOption('rules', array());
            $rules = json_decode($rules, 1);
        }
        $res = array();
        foreach ($rules as $rule) {
            if (empty($rule['active'])
                OR $rule['event_type'] !== $event)
                continue;

            $res = $this->checkProductRule($rule, $product );
            if ($res) {
                // send sms
                $message = $this->replaceMessage($rule['message'], $product);
                
                $ignore = array_key_exists('ignore', $rule['option']) ? $rule['option']['ignore'] : '1';
                $timesend = array_key_exists('timesend', $rule['option']) ? $rule['option']['timesend'] : 1;
                $date = array_key_exists('date', $rule['option']) ? $rule['option']['date'] : NULL;
                $translit_checked = array_key_exists('translit_checked', $rule['option']) ? $rule['option']['translit_checked'] : 0;

                if ($rule['option']['customer_group_id'] === '') {
                    return;
                }

                // unique addressbook name
                $to = 'opencart-order-' . $product['model'] . time();                
                $to_info = $this->getCustomers($rule['option']['customer_group_id']);
                $res = $this->send( $message, $to, $to_info, $ignore, $timesend, $date, $translit_checked );
            }
        }
        
        $res['log'] = $this->getLogs();
        
        // Log
        $smsSendingLog = new Log('sms_sending.log');
        $smsSendingLog->write(print_r($res, 1)); // implode("\n", $res)

        return $res;
    }
    
    public function checkReturnRule($rule, $return) {
        $result = array();
        switch ($rule['event_type']) {
            case 'OnReturnAdd':
                $conditionFields = array('return_reason_id', 'opened', 'return_status_id', 'return_action_id');
                break;
        }
        foreach ($conditionFields as $fname) {
            if ( ! array_key_exists($fname, $rule['condition']))
                continue;            
            $result[$fname] = (array_key_exists($fname, $return) AND array_key_exists($fname, $rule['condition']) AND $rule['condition'][$fname] !== '') ? $return[$fname] == $rule['condition'][$fname] : ($rule['condition'][$fname] !== '' ? FALSE : TRUE);
        }
        if ($this->log) {
            $this->eventLog[__METHOD__][] = compact('rule', 'return', 'result');
        }
        return ! in_array(FALSE, $result, TRUE);
    }
    
    /**
     * @param array $order - example: 
     * array (size=71)
        "order_id" : "35",
        "date_ordered" : "",
        "customer" : "1111111 1111111",
        "customer_id" : "1",
        "firstname" : "1111111",
        "lastname" : "1111111",
        "email" : "test@test.test",
        "telephone" : "+380933637995",
        "product" : "iMac",
        "product_id" : "41",
        "model" : "Product 14",
        "quantity" : "1",
        "return_reason_id" : "1",
        "opened" : "0",
        "comment" : "\u0444\u0438\u0433\u043d\u044f \u0430 \u043d\u0435 \u043c\u043e\u043d\u0438\u0442\u043e\u0440",
        "return_action_id" : "2",
        "return_status_id" : "2"
      ...
     *
     * $rules - array of rules example: 
     * 
      'event_type' => string 'OnReturnAdd' (length=11)
      'condition' => 
        array (size=4)
          'return_reason_id' => string '4' (length=1)
          'opened' => string '' (length=0)
          'return_status_id' => string '3' (length=1)
          'return_action_id' => string '2' (length=1)
      'option' => 
        array (size=4)
          'customer_group_id' => string '' (length=0)
          'translit_checked' => string '0' (length=1)
          'timesend' => string '1' (length=1)
          'timetype' => string '1' (length=1)
      'message' => string 'РџРѕ Р·Р°РєР°Р·Сѓ {{order_id}} РўРѕРІР°СЂ {{product}} Р±С‹Р» СѓСЃРїРµС€РЅРѕ РІРѕР·РІСЂР°С‰РµРЅ, РґРµРЅСЊРіРё РІРѕР·РІСЂР°С‰РµРЅС‹' (length=129)
      'active' => int 1
     *
     * @param string $needle - example: OnOrderDelete, OnOrderEdit, OnOrderAdd, OnOrderHistoryAdd
     */
    public function executeReturnRules($return, $event, $rules = NULL) {
        
        if (empty($rules)) {
            $rules = $this->getOption('rules', array());
            $rules = json_decode($rules, 1);
        }
        $res = array();
        foreach ($rules as $rule) {
            if (empty($rule['active'])
                OR $rule['event_type'] !== $event)
                continue;

            $res = $this->checkReturnRule($rule, $return );
            if ($res) {
                // send sms
                $message = $this->replaceMessage($rule['message'], $return);
                
                $ignore = array_key_exists('ignore', $rule['option']) ? $rule['option']['ignore'] : '1';
                $timesend = array_key_exists('timesend', $rule['option']) ? $rule['option']['timesend'] : 1;
                $date = array_key_exists('date', $rule['option']) ? $rule['option']['date'] : NULL;
                $translit_checked = array_key_exists('translit_checked', $rule['option']) ? $rule['option']['translit_checked'] : 0;

                $to = 'opencart-order-' . $return['firstname'] . $return['lastname']. $return['telephone'];
                $to_info = array($return);
                $res = $this->send( $message, $to, $to_info, $ignore, $timesend, $date, $translit_checked );
            }
        }
        $res['log'] = $this->getLogs();
        
        // Log
        $smsSendingLog = new Log('sms_sending.log');
        $smsSendingLog->write(print_r($res, 1)); // implode("\n", $res)

        return $res;
    }
    
    public $test = 0;
    
    /**
     *
     */
    public function send($message, $to, $to_info, $ignore = '1', $timesend = '1', $date = NULL, $translit_checked = 0) {
        
        if ($this->test)
            return compact('message', 'to', 'to_info', 'ignore', 'timesend', 'date', 'translit_checked');
        
        $this->load->language('sale/sms_sending');
        $settings = $this->getSettings();
        $proxyApi = $this->getProxyApi($settings);

        $json = array();        
        $error_format = '';
        if (!$to_info) {
            $json['error']['customers'] = $this->language->get('error_customers');
        } else {
            if ($ignore == '0') {
                foreach ($to_info as $result) {
                    if (!preg_match("/[3][8][0][0-9]{9}$/i", $result['telephone'])) {
                        $error_format .= trim($result['firstname'] . ' ' . $result['lastname']) . ' - ' . $result['telephone'] . "</br>";
                    }
                }
                if ($error_format != '') {
                    $json['error']['format'] = $this->language->get('error_phones') . $error_format;
                }
            }
        }

        if (empty($json)) {

            if (isset($date)) {
                $timesend = $date;
            } else {
                $timesend = '';
            }
            
            if ($translit_checked == 1) {
                $message = iconv("UTF-8", "UTF-8//IGNORE", $this->translit($message));
            }
            
            //addAddressbook by order id
            $res = $proxyApi->addAddressbook($to);

            //Проверяем успешность операции
            if (isset($res["error"])) {
                $json['error']['message'] = $this->language->get('error') . $res["error"];
            } else {
                //Получаем ИД книги
                $book_id = $res["result"]["addressbook_id"];
            }

            if (isset($book_id)) {
                //addPhoneToAddressBook
                foreach ($to_info as $info) {
                    $res = $proxyApi->addPhoneToAddressBook($book_id, $info['telephone'], trim($info['firstname'] . ' ' . $info['lastname']));
                    if (isset($res["error"])) {
                        $json['error']['message'] = $this->language->get('error') . $res["code"] . "<br>";
                    }
                }

                // sender text list_id datetime batch batchinterval sms_lifetime control_phone
                $res = $proxyApi->createCampaign($settings["sender_name"], $message, $book_id, $timesend, 0, 0, 0);

                if (isset($res["error"])) {
                    $json['error']['message'] = $this->language->get('error') . $res["error"] . "<br>";
                } else {
                    $campaign_id = $res["result"]["id"];
                }

                if (isset($campaign_id)) {
                    $res = $proxyApi->getCampaignInfo($campaign_id);
                    if (isset($res["error"])) {
                        $json['error']['message'] = $this->language->get('error') . $res["error"] . "<br>";
                    } else {
                        $campinf_status_code = $res["result"]['status'];
                        $campinf_status = array(
                            $this->language->get('campin_status_queued_sending'),
                            $this->language->get('campin_status_not_enough_funds'),
                            $this->language->get('campin_status_in_progress'),
                            $this->language->get('campin_status_Sent'),
                            $this->language->get('campin_status_no_valid_numbers'),
                            $this->language->get('campin_status_partially_sent'),
                            $this->language->get('campin_status_spam'),
                            $this->language->get('campin_status_incorrect_sender_id'),
                            $this->language->get('campin_status_paused'),
                            $this->language->get('campin_status_scheduled'),
                            $this->language->get('campin_status_premoderation'),
                        );
                        if (array_key_exists($campinf_status_code, $campinf_status)) {
                            $status = $campinf_status[$campinf_status_code];
                            $json['success'] = sprintf($this->language->get('text_success'), $status);
                            //$this->data['success'] = sprintf($this->language->get('text_success'), $this->data['campinf_status']);
                        }
                    }
                }
                $res = $proxyApi->delAddressbook($book_id);
            }
        }
        return $json;
    }

    public function setSettings($sender_name, $public_key, $private_key) {
        $this->db->query("UPDATE  `" . DB_PREFIX . "epochta_settings` 
            SET  
                `value` =  '" . $this->db->escape($public_key) . "' 
            WHERE  `" . DB_PREFIX . "epochta_settings`.`code` =  'public_key' 
            LIMIT 1;");

        $this->db->query("UPDATE  `" . DB_PREFIX . "epochta_settings` 
            SET  
                `value` =  '" . $this->db->escape($private_key) . "'
            WHERE  `" . DB_PREFIX . "epochta_settings`.`code` =  'private_key' 
            LIMIT 1;");
        
        return $this->db->query("UPDATE  `" . DB_PREFIX . "epochta_settings` 
            SET  
                `value` =  '" . $this->db->escape($sender_name) . "'
            WHERE  `" . DB_PREFIX . "epochta_settings`.`code` =  'sender_name' 
            LIMIT 1;");
    }

    public function getSettings() {
        $info = array();
        $query = $this->db->query("SELECT * FROM `oc_epochta_settings` WHERE  `code` = 'sender_name'");
        $info['sender_name'] = ! empty($query->row['value']) ? $query->row['value'] : NULL ;
        $query = $this->db->query("SELECT * FROM `oc_epochta_settings` WHERE  `code` = 'public_key'");
        $info['public_key'] = ! empty($query->row['value']) ? $query->row['value'] : NULL ;
        $query = $this->db->query("SELECT * FROM `oc_epochta_settings` WHERE  `code` = 'private_key'");
        $info['private_key'] = ! empty($query->row['value']) ? $query->row['value'] : NULL ;
        return $info;
    }
    
    public function setOption($code, $value) {
        $check = $this->getOption($code);
        if ( ! isset($check)) {
            return $this->db->query("INSERT INTO `".DB_PREFIX."epochta_settings` 
                (`code`, `value`) VALUES
                ('".$this->db->escape($code)."', '".$this->db->escape($value)."')");
        }
        return $this->db->query("UPDATE  `" . DB_PREFIX . "epochta_settings` 
            SET  
                `value` =  '" . $this->db->escape($value) . "'
            WHERE  `" . DB_PREFIX . "epochta_settings`.`code` =  '".$this->db->escape($code)."' 
            LIMIT 1;");
    }
    
    public function getOption($code, $default=NULL) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "epochta_settings` WHERE  `code` = '".$this->db->escape($code)."'");
        return ! empty($query->row) ? $query->row['value'] : $default ;
    }

    public function getCustomerGroups() {
        $sql = "SELECT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int) $this->config->get('config_language_id') . "'  ORDER BY cg.sort_order, cgd.name";
        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function getCustomers($customer_group_id) {
        $sql = "SELECT *, CONCAT(firstname, ' ',lastname) FROM " . DB_PREFIX . "customer WHERE  customer_group_id = '" . (int) $customer_group_id . "' ORDER BY firstname";
        $query = $this->db->query($sql);
        return $query->rows;
    }

}

?>
