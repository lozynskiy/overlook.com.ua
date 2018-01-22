<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-style" data-toggle="tab"><?php echo $tab_style; ?></a></li>
            <li><a href="#tab-preview" data-toggle="tab"><?php echo $tab_preview; ?></a></li>
          </ul>
		  <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
			  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
				<div class="col-sm-10">
				  <select name="type" id="input-type" class="form-control">
					<?php if ($type == 'register') { ?>
					<option value="register" selected="selected"><?php echo $text_register; ?></option>
					<?php } else { ?>
					<option value="register"><?php echo $text_register; ?></option>
					<?php } ?>
					<?php if ($type == 'affiliate') { ?>
					<option value="affiliate" selected="selected"><?php echo $text_affiliate; ?></option>
					<?php } else { ?>
					<option value="affiliate"><?php echo $text_affiliate; ?></option>
					<?php } ?>
					<?php if ($type == 'order') { ?>
					<option value="order" selected="selected"><?php echo $text_order; ?></option>
					<?php } else { ?>
					<option value="order"><?php echo $text_order; ?></option>
					<?php } ?>
					<?php if ($type == 'contact') { ?>
					<option value="contact" selected="selected"><?php echo $text_contact; ?></option>
					<?php } else { ?>
					<option value="contact"><?php echo $text_contact; ?></option>
					<?php } ?>
					<?php if ($type == 'forgotten') { ?>
					<option value="forgotten" selected="selected"><?php echo $text_forgotten; ?></option>
					<?php } else { ?>
					<option value="forgotten"><?php echo $text_forgotten; ?></option>
					<?php } ?>
					<?php if ($type == 'reward') { ?>
					<option value="reward" selected="selected"><?php echo $text_reward; ?></option>
					<?php } else { ?>
					<option value="reward"><?php echo $text_reward; ?></option>
					<?php } ?>
					<?php if ($type == 'account_approve') { ?>
					<option value="account_approve" selected="selected"><?php echo $text_account_approve; ?></option>
					<?php } else { ?>
					<option value="account_approve"><?php echo $text_account_approve; ?></option>
					<?php } ?>
					<?php if ($type == 'account_transaction') { ?>
					<option value="account_transaction" selected="selected"><?php echo $text_account_transaction; ?></option>
					<?php } else { ?>
					<option value="account_transaction"><?php echo $text_account_transaction; ?></option>
					<?php } ?>
					<?php if ($type == 'affiliate_approve') { ?>
					<option value="affiliate_approve" selected="selected"><?php echo $text_affiliate_approve; ?></option>
					<?php } else { ?>
					<option value="affiliate_approve"><?php echo $text_affiliate_approve; ?></option>
					<?php } ?>
					<?php if ($type == 'affiliate_transaction') { ?>
					<option value="affiliate_transaction" selected="selected"><?php echo $text_affiliate_transaction; ?></option>
					<?php } else { ?>
					<option value="affiliate_transaction"><?php echo $text_affiliate_transaction; ?></option>
					<?php } ?>
					<?php if ($type == 'gift_voucher') { ?>
					<option value="gift_voucher" selected="selected"><?php echo $text_gift_voucher; ?></option>
					<?php } else { ?>
					<option value="gift_voucher"><?php echo $text_gift_voucher; ?></option>
					<?php } ?>
					<?php foreach ($return_statuses as $return_status) { ?>
					<?php if ('return_' . $return_status['return_status_id'] == $type) { ?>
					  <option value="return_<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $text_return; ?> <?php echo $return_status['name']; ?></option>
					<?php } else { ?>
					  <option value="return_<?php echo $return_status['return_status_id']; ?>"><?php echo $text_return; ?> <?php echo $return_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $type) { ?>
					  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $text_status; ?> <?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $text_status; ?> <?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-priority"><?php echo $entry_priority; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="priority" value="<?php echo $priority; ?>" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="date_start" value="<?php echo $date_start; ?>" data-format="YYYY-MM-DD" class="form-control date" />
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="date_end" value="<?php echo $date_end; ?>" data-format="YYYY-MM-DD" class="form-control date" />
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store"><?php echo $entry_store; ?></label>
				<div class="col-sm-10">
				  <select name="store_id" class="form-control">
					<?php if (!$store_id) { ?>
					<option value="0" selected="selected"><?php echo $text_default; ?></option>
					<?php } else { ?>
					<option value="0"><?php echo $text_default; ?></option>
					<?php } ?>
					<?php foreach ($stores as $store) { ?>
					  <?php if ($store_id == $store['store_id']) { ?>
					  <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
					 <?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <ul id="languages" class="nav nav-tabs">
				<?php foreach ($languages as $language) { ?>
				<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
				<?php } ?>
			  </ul>
			  <div class="tab-content">
				<?php foreach ($languages as $language) { ?>
				  <div id="language<?php echo $language['language_id']; ?>" class="tab-pane">
					<div class="form-group required">
					  <label class="col-sm-2 control-label" for="input-subject-<?php echo $language['language_id']; ?>"><?php echo $entry_subject; ?></label>
					  <div class="col-sm-10">
						<input type="text" name="description[<?php echo $language['language_id']; ?>][subject]" value="<?php echo isset($description[$language['language_id']]['subject']) ? $description[$language['language_id']]['subject'] : ''; ?>" id="input-subject-<?php echo $language['language_id']; ?>" class="form-control" /></td>
					  </div>
					</div>
					<div class="form-group required">
					  <label class="col-sm-2 control-label" for="input-description-<?php echo $language['language_id']; ?>"><?php echo $entry_message; ?></label>
					  <div class="col-sm-10">
						<textarea class="summernote" name="description[<?php echo $language['language_id']; ?>][message]" id="input-description-<?php echo $language['language_id']; ?>"><?php echo isset($description[$language['language_id']]['message']) ? $description[$language['language_id']]['message'] : ''; ?></textarea></td>
					  </div>
					</div>
				  </div>
				<?php } ?>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $text_code; ?></label>
				<div class="col-sm-10">
				  <div id="code"></div>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-style">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="background" value="<?php echo $background; ?>" id="input-background" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-heading"><?php echo $entry_heading; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="heading" value="<?php echo $heading; ?>" id="input-heading" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-body"><?php echo $entry_body; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="body" value="<?php echo $body; ?>" id="input-body" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
				<div class="col-sm-10">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $no_image; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-preview">
                <?php echo $t_message; ?>
			</div>
		  </div>
		</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'type\']').on('change', function() {
	var html = '';
	
	var value = $('select[name=\'type\']').val();
	
	if (value == 'register') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Телефон - {telephone}</td>';
		html += '    <td>Пароль - {password}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'affiliate') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Телефон - {telephone}</td>';
		html += '    <td>Пароль - {password}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'order') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Номер заказа - {order_id}</td>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Телефон - {telephone}</td>';
		html += '  </tr>';
		html += '  <tr>';
		html += '    <td>Дата добавления - {date_added}</td>';
		html += '    <td>Способ оплаты - {payment_method}</td>';
		html += '    <td>Способ доставки - {shipping_method}</td>';
		html += '    <td>IP адрес - {ip}</td>';
		html += '    <td>Комментарии - {comment_table}</td>';
		html += '  </tr>';
		html += '  <tr>';
		html += '    <td>Адрес плательщика - {payment_address}</td>';
		html += '    <td>Адрес доставки - {shipping_address}</td>';
		html += '    <td>Товары - {product_table}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'contact') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Сообщение - {enquiry}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'forgotten') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Пароль - {password}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'reward') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Баллы - {points}</td>';
		html += '    <td>Всего баллов - {total_points}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'account_approve') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'account_transaction') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Кредиты - {credits}</td>';
		html += '    <td>Всего кредитов - {total_credits}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'affiliate_approve') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'affiliate_transaction') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Комиссия - {commission}</td>';
		html += '    <td>Всего комиссии - {total_commission}</td>';
		html += '  </tr>';
		html += '</table>';
	} else if (value == 'gift_voucher') {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Кому - {to_name}</td>';
		html += '    <td>от кого - {from_name}</td>';
		html += '    <td>На Email - {to_email}</td>';
		html += '    <td>Сумма - {amount}</td>';
		html += '    <td>Код - {code}</td>';
		html += '  </tr>';
		html += '  <tr>';
		html += '    <td colspan="2">Сертификат - {voucher_theme}</td>';
		html += '    <td>Сообщение - {message}</td>';
		html += '  </tr>';
		html += '</table>';
	} else {
		html += '<table class="form">';
		html += '  <tr>';
		html += '    <td>Номер заказа - {order_id}</td>';
		html += '    <td>Имя клиента - {firstname}</td>';
		html += '    <td>Фамилия клиента - {lastname}</td>';
		html += '    <td>Email - {email}</td>';
		html += '    <td>Телефон - {telephone}</td>';
		html += '  <tr>';
		html += '    <td>Комментарий - {comment}</td>';
		html += '    <td colspan="2">Номер возврата - {return_id}</td>';
		html += '  </tr>';
		html += '</table>';
	}

	$('#code').html(html);
});

$('select[name=\'type\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('#languages a:first').tab('show');



$('input[name=\'background\']').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val('#' + hex);
		$(el).ColorPickerHide();
		$('#t-header').css('background', '#' + hex);
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('input[name=\'background\']').val('#' + hex);
		$('#t-header').css('background', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});

$('input[name=\'heading\']').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val('#' + hex);
		$(el).ColorPickerHide();
		$('#t-heading').css('color', '#' + hex);
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('input[name=\'heading\']').val('#' + hex);
		$('#t-heading').css('color', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});

$('input[name=\'body\']').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val('#' + hex);
		$(el).ColorPickerHide();
		$('#t-body').css('background', '#' + hex);
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('input[name=\'body\']').val('#' + hex);
		$('#t-body').css('background', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
//--></script> 
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<?php echo $footer; ?>