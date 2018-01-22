<?php
class ModelExtensionModulePhe extends Model {
	public function getTemplate($type) { 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template et LEFT JOIN " . DB_PREFIX . "email_template_description etd ON et.email_template_id = etd.email_template_id WHERE type = '" . $this->db->escape($type) . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "' AND date_start <= NOW() AND date_end >= NOW() AND language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY priority, date_added LIMIT 1");

		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
}