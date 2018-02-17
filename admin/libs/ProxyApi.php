<?php

class ProxyApi {
    
    private $api_gateway;
    private $api_stat;
    private $api_account;
    private $api_addressbook;
    
    public function connect($privateKey,$publicKey) {
        if ( ! empty($privateKey) AND ! empty($publicKey)) {
            require_once (DIR_SYSTEM .'/../admin/libs/config.php');
            require_once (DIR_SYSTEM .'/../admin/libs/Addressbook.php');
            require_once (DIR_SYSTEM .'/../admin/libs/Exceptions.php');
            require_once (DIR_SYSTEM .'/../admin/libs/Account.php');
            require_once (DIR_SYSTEM .'/../admin/libs/Stat.php');
            
            $this->api_gateway = new APISMS($privateKey,$publicKey, 'http://atompark.com/api/sms/');
            $this->api_stat = new Stat($this->api_gateway);
            $this->api_account = new Account($this->api_gateway);
            $this->api_addressbook = new Addressbook($this->api_gateway);
        } else 
            throw new Exceptions('Error api connect, check settings');
    }

    // API
    
    public function getUserBalance($currency = null) {
        return $this->api_account->getUserBalance($currency);
    }
    
    public function addAddressbook($name, $description = NULL) {
        return $this->api_addressbook->addAddressbook($name);
    }
    
     public function addPhoneToAddressBook($book_id, $telephone, $variables) {
        return $this->api_addressbook->addPhoneToAddressBook($book_id, $telephone, $variables);
    }
    
     public function createCampaign($senderName, $message, $book_id, $timesend) {
        return $this->api_stat->createCampaign($senderName, $message, $book_id, $timesend, 0, 0, 0);
    }
    
     public function getCampaignInfo($campaign_id) {
        return $this->api_stat->getCampaignInfo($campaign_id);
    }
    
     public function delAddressbook($book_id) {
        return $this->api_addressbook->delAddressbook($book_id);
    }

    public function getCampaignList($from, $offset, $direction) {
        return $this->api_stat->getCampaignList($from, $offset, $direction);
    }
    
    public function getCampaignListExt($from, $limit, $orderfield, $direction, $search) {
        return $this->api_stat->getCampaignListExt($from, $limit, $orderfield, $direction, $search);
    }
    
}

?>
