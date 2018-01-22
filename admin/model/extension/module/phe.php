<?php
class ModelExtensionModulePHE extends Model {
	public function addTemplate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "email_template SET name = '" . $this->db->escape($data['name']) . "', type = '" . $this->db->escape($data['type']) . "', background = '" . $this->db->escape($data['background']) . "', body = '" . $this->db->escape($data['body']) . "', heading = '" . $this->db->escape($data['heading']) . "', store_id = '" . (int)$data['store_id'] . "', priority = '" . (int)$data['priority'] . "', image = '" . $this->db->escape($data['image']) ."', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', date_added = NOW()");
		
		$template_id = $this->db->getLastId();
		
		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "email_template_description SET email_template_id = '" . (int)$template_id . "', language_id = '" . (int)$language_id . "', subject = '" . $this->db->escape($value['subject']) . "', message = '" . $this->db->escape($value['message']) . "'");
		}
	}
	
	public function editTemplate($template_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "email_template SET name = '" . $this->db->escape($data['name']) . "', type = '" . $this->db->escape($data['type']) . "', background = '" . $this->db->escape($data['background']) . "', body = '" . $this->db->escape($data['body']) . "', heading = '" . $this->db->escape($data['heading']) . "', store_id = '" . (int)$data['store_id'] . "', priority = '" . (int)$data['priority'] . "', image = '" . $this->db->escape($data['image']) ."', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "' WHERE email_template_id = '" . (int)$template_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$template_id . "'");
		
		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "email_template_description SET email_template_id = '" . (int)$template_id . "', language_id = '" . (int)$language_id . "', subject = '" . $this->db->escape($value['subject']) . "', message = '" . $this->db->escape($value['message']) . "'");
		}
	}
	
	public function deleteTemplate($template_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template WHERE email_template_id = '" . (int)$template_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$template_id . "'");
	}
	
	public function getTemplate($template_id) { 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template WHERE email_template_id = '" . (int)$template_id . "'");
		
		if ($query->num_rows) {
			$description = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$template_id . "'");
			
			$description_data = array();
			
			foreach ($description->rows as $description) {
				$description_data[$description['language_id']] = array(
					'subject'		=> $description['subject'],
					'message'		=> $description['message']
				);
			}
			
			return array(
				'email_template_id'	=> $query->row['email_template_id'],
				'name'				=> $query->row['name'],
				'type'				=> $query->row['type'],
				'background'		=> $query->row['background'],
				'body'				=> $query->row['body'],
				'heading'			=> $query->row['heading'],
				'image'				=> $query->row['image'],
				'store_id'			=> $query->row['store_id'],
				'priority'			=> $query->row['priority'],
				'date_start'		=> $query->row['date_start'],
				'date_end'			=> $query->row['date_end'],
				'description'		=> $description_data
			);
		} else {
			return false;
		}
	}
		
	public function getTemplates($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "email_template";
		
		$sort_data = array(
			'name',
			'type',
			'date_start',
			'date_end'
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
		
	public function getTotalTemplates() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "email_template");
		
		return $query->row['total'];
	}	
	
	public function getTemplateForMail($type, $store_id, $language_id = '') {
		if (empty($language_id)) {
			$language_id = $this->config->get('config_language_id');
		}
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template et LEFT JOIN " . DB_PREFIX . "email_template_description etd ON et.email_template_id = etd.email_template_id WHERE type = '" . $this->db->escape($type) . "' AND date_start <= NOW() AND date_end >= NOW() AND language_id = '" . (int)$language_id . "' AND store_id = '" . (int)$store_id . "' ORDER BY priority, date_added LIMIT 1");
		
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
	
	public function getTemplateForEmail($template_id, $language_id = '') {
		if (empty($language_id)) {
			$language_id = $this->config->get('config_language_id');
		}
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template et LEFT JOIN " . DB_PREFIX . "email_template_description etd ON et.email_template_id = etd.email_template_id WHERE et.email_template_id = '" . (int)$template_id . "' AND date_start <= NOW() AND date_end >= NOW() AND language_id = '" . (int)$language_id . "' ORDER BY priority, date_added LIMIT 1");
		
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
}