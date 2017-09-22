<?php
$_['heading_title']    = 'Google Analytics';

// Text
$_['text_extension']   = 'Статистика';
$_['text_success']	   = 'Настройки модуля Google Analytics успешно обновлены';
$_['text_signup']      = 'Авторизуйтесь на сайте <a href="http://www.google.com/analytics/" target="_blank"><u>Google Analytics</u></a>, создайте "Новый Ресурс" и скопируйте "Код отслеживания" в поле ниже:';
$_['text_default']     = 'По умолчанию';
$_['text_edit']        = 'Редактирование Google Analytics';

$_['text_analytics']	= 'Google Analytics Expert';
//$_['text_success']	    = 'Success: You have modified Google Analytics Expert settings for %s!';
//$_['text_edit']         = 'Edit Google Analytics Expert';
//$_['text_signup']       = 'Please read the <a href="view/template/analytics/documentation/index.html" target="_blank"><u>installation guide</u></a> and <a href="view/template/analytics/documentation/index.html#!/faqs" target="_blank"><u>FAQs</u></a> before contacting for <a href="view/template/analytics/documentation/index.html#!/help_contact" target="_blank"><u>support</u></a>. You are using Google Analytics Expert version 6.0.3.';
$_['text_enabled']		= 'Enabled';
//$_['text_disabled']		= 'Disabled';
$_['text_exclude']		= 'Exclude';
$_['text_include']    	= 'Include';
$_['text_no_track']    	= 'Do Not Track';
$_['text_track']    	= 'Track';

// Entry
$_['entry_code']       = 'Код отслеживания';
$_['entry_status']     = 'Статус';
$_['entry_ga_exclude_admin']    = 'Track Admin Visits';
$_['entry_ga_conversion_id']    = 'AdWords Conversion ID';
$_['entry_ga_remarketing']      = 'Display Advertising';
$_['entry_ga_cookie']      		= 'EU Cookie Popup';
$_['entry_ga_adwords']      	= 'AdWords Conversion Data';
$_['entry_ga_label']      		= 'AdWords Conversion Label';
$_['entry_ua_tracking']      	= 'Analytics Property ID';
			
// Error
$_['error_permission'] = 'У вас нет прав для управления этим модулем!';
$_['error_code']	   = 'Необходимо указать код!';
$_['error_ga_property_id']      = 'You must enter your Google Analytics Properry ID to track your data!';
$_['error_ga_conversion_id']    = 'You have enabled AdWords conversion tracking but have not entered Conversion ID details!';
$_['error_ga_label']            = 'You have enabled AdWords conversion tracking but have not entered Conversion Label details!';
$_['error_ga_exclude_admin']    = 'You have not selected an option for Track Admin Visits!';
$_['error_ga_remarketing']    	= 'You have not selected an option for Display Advertising!';
$_['error_ga_cookie']    		= 'You have not selected an option for EU Cookie Popup!';
$_['error_ga_status']    		= 'You have not selected an option for Status!';
$_['error_ga_store']    		= 'You have not selected a store!';
$_['error_empty']    			= 'You must set each dropdown option!';

// Help
$_['help_ga_exclude_admin']		       = 'Choose if you want front-end site activity being sent to Google Analytics when logged in to the back-end as admin. This covers all data sent to GA.';
$_['help_ga_conversion_id']		       = 'If using AdWords, you can get this from the conversion code for the conversion you have set up in your adwords account';
$_['help_ga_remarketing']		       = 'Set to Enabled if you have Remarketing campaigns enabled in a Google AdWords account that is linked to your Google Analytics account that you wish to track, or if you wish to take advantage of Demographics and Interests reporting.';
$_['help_ga_cookie']		       	   = 'Set to Enabled if you are in the EU and wish to meet the requirements of the EU Cookie Law, which was enforced on 26th May 2012.';
$_['help_ga_adwords']		       	   = 'Set to Enabled if you use Google Adwords and would like to track conversion data for your account';
$_['help_ga_label']		      		   = 'If using AdWords, you can get this from the conversion code for the conversion you have set up in your adwords account';
$_['help_ua_tracking']		       	   = 'Your unique analytics property ID. Example: UA-12345678-1';