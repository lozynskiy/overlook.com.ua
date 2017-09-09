<?php

class ControllerExtensionModuleMinify extends Controller
{

    private $error = array();

    public function install()
    {
        $this->load->model('extension/event');
        $this->model_extension_event->addEvent(
            'minify-home', 'catalog/controller/common/home/after', 'extension/module/minify/minify'
        );
        $this->model_extension_event->addEvent(
            'minify-product', 'catalog/controller/product/product/after', 'extension/module/minify/minify'
        );
        $this->model_extension_event->addEvent(
            'minify-category', 'catalog/controller/product/category/after', 'extension/module/minify/minify'
        );
    }

    public function uninstall()
    {
        $this->load->model('extension/event');
        $this->model_extension_event->deleteEvent('minify-home');
        $this->model_extension_event->deleteEvent('minify-product');
        $this->model_extension_event->deleteEvent('minify-category');
    }

    public function index()
    {
        $data = $this->load->language('extension/module/minify');
        $this->document->setTitle($this->language->get('heading_title'));

        $url = '';

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/minify', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['token'] = $this->session->data['token'];

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/minify', $data));
    }

    public function clear()
    {
        $this->load->language('extension/module/minify');

        $json = array();

        if (!$this->validate()) {
            $json['error'] = $this->language->get('error_permission');
        } else {

            if ($this->config->get('config_theme') == 'theme_default') {
                $theme = $this->config->get('theme_default_directory');
            } else {
                $theme = $this->config->get('config_theme');
            }

            $minify_folder = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/' . $theme . '/minify/';

            $patterns = array(
                $minify_folder . '*.css',
                $minify_folder . '*.js',
                DIR_CACHE . '*.css.*',
                DIR_CACHE . '*.js.*'
            );

            foreach ($patterns as $pattern) {

                foreach (glob($pattern) as $file) {
                    unlink($file);
                }
            }

            $json['success'] = true;

        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    protected function validate() {
        if (!$this->user->hasPermission('access', 'extension/module/minify')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}