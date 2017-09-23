<?php

class ModelExtensionModuleSmartbar extends Model {
	public function getLanguages() {
		$this->load->model('localisation/language');

		return array_map(array($this, 'language_flag'), $this->model_localisation_language->getLanguages());
	}

	private function language_flag($language) {
		$language['image'] = version_compare(VERSION, '2.2', '>=') ? 'language/' . $language['code'] . '/'. $language['code'] . '.png' : 'view/image/flags/' . $language['image'];
		return $language;
	}
}