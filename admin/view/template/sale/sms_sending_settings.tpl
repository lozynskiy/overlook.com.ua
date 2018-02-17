<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
        <h1><?php echo $heading_title; ?></h1>
        <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
        </ul>
        <div class="pull-right">
            <a id="button-send" onclick="send('index.php?route=sale/sms_sending/settings&token=<?php echo $token; ?>');" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title=""><i style="font-family: 'Open Sans', sans-serif" class="fa"><?php echo $button_send; ?></i></a>
        </div>
    </div>
  </div>
  <div class="container-fluid" id="alert-box">
    <?php if ( ! empty($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <?php if ( ! empty($error)) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default">
      <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?> </h3>
            <div class="panel-body">
            
                <fieldset>
                  <form class="form-horizontal" id="mail">
                    <input type="hidden" id="ignore" name="ignore" value="0"/>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-order-status"><?php echo $sms_alias_label; ?></label>
                      <div class="col-sm-10">
                        <input class="form-control" type="text" id="sender_name" name="sender_name" value="<?php echo $sender_name; ?>"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-order-status"><?php echo $public_key_label; ?></label>
                      <div class="col-sm-10">
                        <input class="form-control" type="text" id="public_key" name="public_key" value="<?php echo $public_key; ?>"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-order-status"><?php echo $private_key_label; ?></label>
                      <div class="col-sm-10">
                        <input class="form-control" type="text" id="private_key" name="private_key" value="<?php echo $private_key; ?>"/>
                      </div>
                    </div>
                  </form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
</div>

<style> 
.highlight { background: #FA6; } 
</style>

<script>
function send(url) { 
      
	$.ajax({
		url: url,
		type: 'post',
		data: $('input'),		
		dataType: 'json',
		beforeSend: function() {
			$('#button-send').attr('disabled', true);
			$('#button-send').before('<span class="wait"><img src="view/image/loading.gif" alt="" />&nbsp;</span>');
		},
		complete: function() {
			$('#button-send').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			$('.success, .warning, .alert, .groups').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
                    $('#alert-box').prepend('<div class="alert alert-danger" style="display: none;"><i class="fa fa-exclamation-circle"></i>' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					$('.alert').fadeIn('slow');
				}
			} else {
                $('#ignore').val('0');
            }

            if (json['success']) {
                $('#alert-box').prepend('<div class="alert alert-success" style="display: none;"><i class="fa fa-check-circle"></i>' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                $('.alert').fadeIn('slow');
            }
		}
	});
}
//--></script>

<?php echo $footer; ?>
