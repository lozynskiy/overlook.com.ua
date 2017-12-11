<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$this->user = new Cart\User($this->registry);
		// Analytics
		$this->load->model('extension/extension');

        $this->load->model('tool/image');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();
		$data['tc_og'] = $this->document->getTc_og();
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->customer->getFirstName());
        $data['text_customer'] = $this->customer->getFirstName();
		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_megamenu'] = $this->language->get('text_megamenu');
        $data['text_preferences'] = $this->language->get('text_preferences');

        $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
        $data['button_compare'] = $this->language->get('button_compare');

        $data['compare'] = $this->url->link('product/compare');
        
		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['open'] = $this->config->get('config_open');
		
		$data['ga_exclude_admin'] = $this->config->get('google_analytics_exclude_admin');
		$data['ua_tracking'] = $this->config->get('google_analytics_property_id');
		$data['ga_status'] = $this->config->get('google_analytics_status');
		$data['ga_remarketing'] = $this->config->get('google_analytics_remarketing');
		$data['ga_cookie'] = $this->config->get('google_analytics_cookie');
		$data['user_logged'] = $this->user->isLogged();
		$data['template'] = $this->config->get('config_template');

        //$data['minifyed_js'] = $this->cache->get('minifyed_js');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategoriesTopMenu($category['category_id']);

				foreach ($children as $child) {

                    // Menu3rdLevel>>>
                    $children_lv3_data = array();

                    $children_lv3 = $this->model_catalog_category->getCategoriesTopMenu($child['category_id']);

                    foreach ($children_lv3 as $child_lv3) {
                        $filter_data_lv3 = array(
                            'filter_category_id'  => $child_lv3['category_id'],
                            'filter_sub_category' => true
                        );

                        $children_lv3_data[] = array(
                            'name'  => $child_lv3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_lv3) . ')' : ''),
                            'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv3['category_id'])
                        );
                    }
                    // <<<Menu3rdLevel

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

                    if (isset($child['image']) && $child['image'] !="") {
                        $cat_image = $this->model_tool_image->resize($child['image'], 203, 120);
                    } else {
                        $cat_image = $this->model_tool_image->resize("noimages2.png", 203, 120);
                    }

					$children_data[] = array(
                        'thumb'    => $cat_image,
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        // Menu3rdLevel>>>
                        'children_lv3' => $children_lv3_data,
                        'column'   => $child['column'] ? $child['column'] : 1,
                        // <<<Menu3rdLevel
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);

			}
		}

	    $data['register'] = $this->url->link('account/register', '', 'SSL');
        $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');    
        $data['text_forgotten'] = $this->language->get('text_forgotten'); 
      
        if ($this->config->get('megamenu_status')=="1") {
          $this->language->load('extension/module/megamenu');
          $this->load->model('extension/module/megamenu');
          $this->load->model('catalog/category');
          $this->load->model('catalog/product');

          $data['heading_title'] = $this->language->get('heading_title');   
      
          $data['items'] = array();

          $menu_items = $this->cache->get('megamenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'));
              
          if (!$menu_items) {
            $tmp_items= $this->model_extension_module_megamenu->getItems();

            if (count($tmp_items))  {
              foreach($tmp_items as $item) {
                if($item['menu_type']=="category")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseCategory($item);
                }
                if($item['menu_type']=="html")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseHtml($item);
                }
                if($item['menu_type']=="link")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseLink($item);
                }
                if($item['menu_type']=="manufacturer")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseManufacturer($item);
                }
                if($item['menu_type']=="information") {
                  $menu_items[]=$this->model_extension_module_megamenu->parseInformation($item);
                }
                if($item['menu_type']=="product") {
                  $menu_items[]=$this->model_extension_module_megamenu->parseProduct($item);
                } 
                if($item['menu_type']=="auth" && !$this->customer->isLogged())  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseAuth($item);
                } 
              }
            }

            $this->cache->set('megamenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'), $menu_items);
          }

          $data['items'] = $menu_items;
        
          //auth
          $this->load->language('account/login');
          $this->load->language('extension/module/megamenu');
          $data['entry_email'] = $this->language->get('entry_email');
          $data['entry_password'] = $this->language->get('entry_password');
          $data['text_register'] = $this->language->get('text_register');
          $data['menu_title'] = $this->language->get('menu_title');
          
          $data['button_login'] = $this->language->get('button_login');
          $data['action'] = $this->url->link('account/login', '', 'SSL');
          $data['email'] = "";
          $data['register'] = $this->url->link('account/register', '', 'SSL');
          $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
          $data['use_megamenu']=true;
          $data['language'] = $this->load->controller('common/language');
        } else {
          $data['use_megamenu']=false;
          $data['language'] = $this->load->controller('common/language');
        }
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
