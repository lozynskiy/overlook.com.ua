<?php
class ModelCatalogSizechart extends Model {
	public function addSizechart($data) {

		$this->load->model('localisation/language');
		$language_info = $this->model_localisation_language->getLanguageByCode($this->config->get('config_language'));

        $front_language_id = $language_info['language_id'];
		$data['name'] = $data['sizechart_description'][$front_language_id ]['name'];
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "sizechart SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$sizechart_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sizechart SET image = '" . $this->db->escape($data['image']) . "' WHERE sizechart_id = '" . (int)$sizechart_id . "'");
		}

		foreach ($data['sizechart_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "sizechart_description SET sizechart_id = '" . (int)$sizechart_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['sizechart_store'])) {
			foreach ($data['sizechart_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "sizechart_to_store SET sizechart_id = '" . (int)$sizechart_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->cache->delete('sizechart');

		return $sizechart_id;
	}

	public function editSizechart($sizechart_id, $data) {
		
		$this->load->model('localisation/language');
		$language_info = $this->model_localisation_language->getLanguageByCode($this->config->get('config_language'));
        $front_language_id = $language_info['language_id'];
		$data['name'] = $data['sizechart_description'][$front_language_id ]['name'];

		$this->db->query("UPDATE " . DB_PREFIX . "sizechart SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sizechart SET image = '" . $this->db->escape($data['image']) . "' WHERE sizechart_id = '" . (int)$sizechart_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "sizechart_description WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		foreach ($data['sizechart_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "sizechart_description SET sizechart_id = '" . (int)$sizechart_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "sizechart_to_store WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		if (isset($data['sizechart_store'])) {
			foreach ($data['sizechart_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "sizechart_to_store SET sizechart_id = '" . (int)$sizechart_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->cache->delete('sizechart');
	}

	public function deleteSizechart($sizechart_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "sizechart WHERE sizechart_id = '" . (int)$sizechart_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sizechart_to_store WHERE sizechart_id = '" . (int)$sizechart_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sizechart_description WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		$this->cache->delete('sizechart');
	}

	public function getSizechart($sizechart_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "sizechart WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		return $query->row;
	}

	public function getSizechartDescriptions($sizechart_id) {
		$sizechart_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sizechart_description WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		foreach ($query->rows as $result) {
			$sizechart_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description']
			);
		}

		return $sizechart_description_data;
	}

	public function getSizecharts($data = array()) {
		//$sql = "SELECT * FROM " . DB_PREFIX . "sizechart";

		$sql = "SELECT c.sizechart_id, md.name, c.sort_order FROM " . DB_PREFIX . "sizechart c LEFT JOIN " . DB_PREFIX . "sizechart_description md ON (c.sizechart_id = md.sizechart_id) WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "'";



		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getSizechartStores($sizechart_id) {
		$sizechart_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sizechart_to_store WHERE sizechart_id = '" . (int)$sizechart_id . "'");

		foreach ($query->rows as $result) {
			$sizechart_store_data[] = $result['store_id'];
		}

		return $sizechart_store_data;
	}

	public function getTotalSizecharts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sizechart");

		return $query->row['total'];
	}

    public function getTotalProductsBySizechartId($sizechart_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sizechart_to_product WHERE sizechart_id = '" . (int)$sizechart_id . "'");

        return $query->row['total'];
    }

    public function getSizechartByProductId($product_id) {
        $query = $this->db->query("SELECT sizechart_id FROM " . DB_PREFIX . "sizechart_to_product WHERE product_id = '" . (int)$product_id . "' LIMIT 1");

        return $query->row;
    }
}
