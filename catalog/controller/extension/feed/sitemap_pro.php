<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionFeedSitemapPro extends Controller {
	public function index() {
		if ($this->config->get('sitemap_pro_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';

			$this->load->model('extension/feed/sitemap_pro');
			$this->load->model('tool/image');

			$products = $this->model_extension_feed_sitemap_pro->getProducts();

			foreach ($products as $product) {
				if ($product['image']) {
					$output .= '<url>';
					$output .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<priority>1.0</priority>';
					$output .= '<image:image>';
					$output .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')) . '</image:loc>';
					$output .= '<image:caption>' . htmlspecialchars($product['name']) . '</image:caption>';
					$output .= '<image:title>' . htmlspecialchars($product['name']) . '</image:title>';
					$output .= '</image:image>';
					$output .= '</url>';
					$output .= "\n";
				}
			}

			$this->load->model('catalog/category');

			$output .= $this->getCategories(0);

			$this->load->model('catalog/manufacturer');

			$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

			foreach ($manufacturers as $manufacturer) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.7</priority>';
				$output .= '</url>';
			}

			$this->load->model('catalog/information');

			$informations = $this->model_catalog_information->getInformations();

			foreach ($informations as $information) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.5</priority>';
				$output .= '</url>';
			}
			
			$this->load->model('blog/blog_category');
			$categories_1 = $this->model_blog_blog_category->getBlogCategories(0);
			foreach ($categories_1 as $category_1) {
				// First level
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('blog/category', 'blogpath=' . $category_1['blog_category_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.7</priority>';
				$output .= '</url>';
				$categories_2 = $this->model_blog_blog_category->getBlogCategories($category_1['blog_category_id']);
				foreach ($categories_2 as $category_2) {
					// Second level
					$categories_2 = $this->model_blog_blog_category->getBlogCategories(0);
					$output .= '<url>';
					$output .= '<loc>' . $this->url->link('blog/category', 'blogpath=' . $category_1['blog_category_id'] . '_' . $category_2['blog_category_id']) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<priority>0.7</priority>';
					$output .= '</url>';				
				}
			}

			$this->load->model('blog/blog');
			$blogs = $this->model_blog_blog->getBlogs(array('filter_tag'=>''));
	    	foreach ($blogs as $blog) {
	    		$output .= '<url>';
				$output .= '<loc>' . $this->url->link('blog/blog', 'blog_id=' . $blog['blog_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.5</priority>';
				$output .= '</url>';
			}

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}

	protected function getCategories($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.7</priority>';
			$output .= '</url>';
			//$output .= '\n';
			
			$output .= $this->getCategories($result['category_id'], $new_path);
		}
		
		
		return $output;
	}
}
