<?php
class ControllerCatalogProductOptionGroup extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/product_option_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product_option_group');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/product_option_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product_option_group');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_product_option_group->addProductOptionGroup($this->request->post);

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

			$this->response->redirect($this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/product_option_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product_option_group');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_product_option_group->editProductOptionGroup($this->request->get['product_option_group_id'], $this->request->post);

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

			$this->response->redirect($this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {

		$this->load->language('catalog/product_option_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product_option_group');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $product_option_group_id) {
				$this->model_catalog_product_option_group->deleteProductOptionGroup($product_option_group_id);
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

			$this->response->redirect($this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

    /**
     *
     */
    protected function getList() {

        if (isset($this->request->get['filter_product'])) {
            $filter_product = $this->request->get['filter_product'];
        } else {
            $filter_product = null;
        }

        if (isset($this->request->get['filter_option'])) {
            $filter_option = $this->request->get['filter_option'];
        } else {
            $filter_option = null;
        }

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'products';
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/product_option_group/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/product_option_group/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['product_option_groups'] = array();

		$filter_data = array(
            'filter_product'    => $filter_product,
            'filter_option'     => $filter_option,
			'sort'              => $sort,
			'order'             => $order,
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin')
		);

		$product_option_group_total = $this->model_catalog_product_option_group->getTotalProductOptionGroups();

		$results = $this->model_catalog_product_option_group->getProductOptionGroups($filter_data);

		foreach ($results as $result) {
			$data['product_option_groups'][] = array(
				'product_option_group_id'   => $result['product_option_group_id'],
				'products'                  => $result['products'],
				'status'                    => $result['status'],
                'option'                    => $result['option'],
				'edit'                      => $this->url->link('catalog/product_option_group/edit', 'token=' . $this->session->data['token'] . '&product_option_group_id=' . $result['product_option_group_id'] . $url, true)
			);
		}

		$data['options'] = $this->model_catalog_product_option_group->getProductOptionGroupOptions();

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_option'] = $this->language->get('entry_option');

        $data['button_filter'] = $this->language->get('button_filter');

		$data['column_products'] = $this->language->get('column_products');
		$data['column_status'] = $this->language->get('column_status');
        $data['column_option'] = $this->language->get('column_option');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_products'] = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . '&sort=products' . $url, true);
		$data['sort_status'] = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);
        $data['sort_option'] = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . '&sort=option' . $url, true);
        $data['sort_product_option_group_id'] = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . '&sort=product_option_group_id' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_option_group_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_option_group_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_option_group_total - $this->config->get('config_limit_admin'))) ? $product_option_group_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_option_group_total, ceil($product_option_group_total / $this->config->get('config_limit_admin')));

        $data['filter_product'] = $filter_product;
        $data['filter_option'] = $filter_option;

		$data['sort'] = $sort;
		$data['order'] = $order;

        $data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/product_option_group_list', $data));
	}

	protected function getForm() {
    //CKEditor
    if ($this->config->get('config_editor_default')) {
        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
    } else {
        $this->document->addScript('view/javascript/summernote/summernote.js');
        $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
        $this->document->addScript('view/javascript/summernote/opencart.js');
        $this->document->addStyle('view/javascript/summernote/summernote.css');
    }

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['product_option_group_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['help_product'] = $this->language->get('help_product');
		$data['entry_option'] = $this->language->get('entry_option');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['product_option_group_id'])) {
			$data['action'] = $this->url->link('catalog/product_option_group/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/product_option_group/edit', 'token=' . $this->session->data['token'] . '&product_option_group_id=' . $this->request->get['product_option_group_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/product_option_group', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['product_option_group_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$product_option_group_info = $this->model_catalog_product_option_group->getProductOptionGroup($this->request->get['product_option_group_id']);
		}

        if (isset($this->request->post['product_option_group_id'])) {
            $data['product_option_group_id'] = $this->request->post['product_option_group_id'];
        } elseif (!empty($product_option_group_info)) {
            $data['product_option_group_id'] = $this->request->get['product_option_group_id'];
        } else {
            $data['product_option_group_id'] = 0;
        }

        $data['group_products'] = $this->model_catalog_product_option_group->getProductOptionGroupProducts($data['product_option_group_id']);

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($product_option_group_info)) {
            $data['status'] = $product_option_group_info['status'];
        } else {
            $data['status'] = true;
        }

        if (isset($this->request->post['option_id'])) {
            $data['option_id'] = $this->request->post['option_id'];
        } elseif (!empty($product_option_group_info)) {
            $data['option_id'] = $product_option_group_info['option_id'];
        } else {
            $data['option_id'] = true;
        }

        $data['group_products_options'] = $this->model_catalog_product_option_group->getProductOptionGroupOptions();

        $data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/product_option_group_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/product_option_group')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		/*foreach ($this->request->post['product_option_group_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 64)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}*/

		/*if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['product_option_group_id']) && $url_alias_info['query'] != 'product_option_group_id=' . $this->request->get['product_option_group_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['product_option_group_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
		}*/

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/product_option_group')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/product_option_group');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_product_option_group->getProductOptionGroups($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'product_option_group_id' => $result['product_option_group_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}