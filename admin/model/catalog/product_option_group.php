<?php
class ModelCatalogProductOptionGroup extends Model {
	public function addProductOptionGroup($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_group SET option_id = '" . (int)$data['option_id'] . "', status = '" . (int)$data['status'] . "'");

		$product_option_group_id = $this->db->getLastId();

		if (isset($data['group_product'])) {
			foreach ($data['group_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_group_to_product SET product_option_group_id = '" . (int)$product_option_group_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		$this->cache->delete('product_option_group');

		return $product_option_group_id;
	}

	public function editProductOptionGroup($product_option_group_id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "product_option_group SET option_id = '" . (int)$data['option_id'] . "', status = '" . (int)$data['status'] . "' WHERE product_option_group_id = '" . (int)$product_option_group_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_group_to_product WHERE product_option_group_id = '" . (int)$product_option_group_id . "'");

        if (isset($data['group_product'])) {
            foreach ($data['group_product'] as $product_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_group_to_product SET product_option_group_id = '" . (int)$product_option_group_id . "', product_id = '" . (int)$product_id . "'");
            }
        }

		$this->cache->delete('product_option_group');
	}

	public function deleteProductOptionGroup($product_option_group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_group WHERE product_option_group_id = '" . (int)$product_option_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_group_to_product WHERE product_option_group_id = '" . (int)$product_option_group_id . "'");

		$this->cache->delete('product_option_group');
	}

	public function getProductOptionGroup($product_option_group_id) {

		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product_option_group WHERE product_option_group_id = '" . (int)$product_option_group_id . "'");

		return $query->row;
	}

	public function getProductOptionGroupProducts($product_option_group_id) {

		$product_option_group_products = array();

		$query = $this->db->query("SELECT pog2p.product_id, CONCAT(pd.name,' ',p.model) as name FROM " . DB_PREFIX . "product_option_group_to_product  pog2p JOIN " . DB_PREFIX . "product p on p.product_id = pog2p.product_id JOIN " . DB_PREFIX . "product_description pd on pd.product_id = pog2p.product_id WHERE product_option_group_id = '" . (int)$product_option_group_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $result) {
			$product_option_group_products[] = array(
				'product_id'             => $result['product_id'],
                'name'                   => $result['name']
			);
		}

		return $product_option_group_products;
	}

    public function getProductOptionGroupOptions() {
        $product_option_group_options = array();

        $query = $this->db->query("SELECT d.option_id, d.name FROM oc_option o JOIN oc_option_description d on d.option_id = o.option_id WHERE (o.type = 'radio' or o.type = 'select') AND d.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        foreach ($query->rows as $result) {
            $product_option_group_options[] = array(
                'option_id'             => $result['option_id'],
                'name'                  => $result['name']
            );
        }

        return $product_option_group_options;
    }

	public function getProductOptionGroups($data = array()) {

        $language_id = (int)$this->config->get('config_language_id');

		$sql = "SELECT * FROM (SELECT pog.*, GROUP_CONCAT(CONCAT(pd.name, ' ', p.model)) products, od.name as option FROM " . DB_PREFIX . "product_option_group pog JOIN " . DB_PREFIX . "product_option_group_to_product pog2p on pog2p.product_option_group_id = pog.product_option_group_id JOIN " . DB_PREFIX . "product p on p.product_id = pog2p.product_id JOIN " . DB_PREFIX . "product_description pd on pd.product_id = pog2p.product_id JOIN " . DB_PREFIX . "option_description od on od.option_id = pog.option_id WHERE od.language_id = '" . $language_id . "' AND pd.language_id = '" . $language_id . "' GROUP BY pog.product_option_group_id ) g WHERE product_option_group_id > 0 ";

		if (!empty($data['filter_product'])) {
			$sql .= "AND products LIKE '%" . $this->db->escape($data['filter_product']) . "%'";
		}

        if (!empty($data['filter_option'])) {
            $sql .= "AND option_id = '" . (int)$data['filter_option'] . "'";
        }

		$sort_data = array(
			'product_option_group_id',
            'products',
            'status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY product_option_group_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalProductOptionGroups($data = array()) {

        $language_id = (int)$this->config->get('config_language_id');

        $sql = "SELECT COUNT(*) as total FROM (SELECT pog.*, GROUP_CONCAT(CONCAT(pd.name, ' ', p.model)) products, od.name as option FROM " . DB_PREFIX . "product_option_group pog JOIN " . DB_PREFIX . "product_option_group_to_product pog2p on pog2p.product_option_group_id = pog.product_option_group_id JOIN " . DB_PREFIX . "product p on p.product_id = pog2p.product_id JOIN " . DB_PREFIX . "product_description pd on pd.product_id = pog2p.product_id JOIN " . DB_PREFIX . "option_description od on od.option_id = pog.option_id WHERE od.language_id = '" . $language_id . "' AND pd.language_id = '" . $language_id . "' GROUP BY pog.product_option_group_id ) g WHERE product_option_group_id > 0 ";

        if (!empty($data['filter_product'])) {
            $sql .= "AND products LIKE '%" . $this->db->escape($data['filter_product']) . "%'";
        }

        if (!empty($data['filter_option'])) {
            $sql .= "AND option_id = '" . (int)$data['filter_option'] . "'";
        }

        $query = $this->db->query($sql);

		return $query->row['total'];
	}
}
