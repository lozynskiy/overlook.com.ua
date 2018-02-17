<?php echo $header; ?>
<style>
@font-face {
    font-family: 'Glyphicons Halflings';
    src: url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.eot');
    src: url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
}
</style>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
        <div class="pull-right">
            <button id="button-send" onclick="send('index.php?route=sale/sms_sending/send&token=<?php echo $token; ?>');" class="btn btn-primary"><i style="" class="fa fa-plus-circle"></i> <?php echo $button_send; ?></button>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title=""><i style="font-family: 'Open Sans', sans-serif" class="fa"><?php echo $button_cancel; ?></i></a>
            <a href="<?php echo $settings_link; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title=""><i style="font-family: 'Open Sans', sans-serif" class="fa"><?php echo $settings_label; ?></i></a>
        </div>
        <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ( ! empty($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <?php if ( ! empty($error_warning)) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <a href="<?php echo $settings_link; ?>" class="button"><?php echo $settings_label; ?></a>
    <?php } else { ?>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
        </div>
      </div>
      <div class="panel-body">
      
        <fieldset>
          <form class="form-horizontal" id="mail">
            <input type="hidden" id="ignore" name="ignore" value="0"/>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_alias; ?></label>
              <div class="col-sm-10"> <?php echo $alias; ?> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_balance; ?></label>
              <div class="col-sm-10"> <?php echo $balance; ?> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_to; ?></label>
              <div class="col-sm-10">

                <select id="to" name="to" class="form-control">
                    <?php if ($customer_groups) { ?>
                    <?php foreach ($customer_groups as $customer_group) { ?>    
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>                
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_message; ?></label>
              <div class="col-sm-10">
                <span id="counter"></span></br>
                <textarea class="form-control" id="message" name="message"></textarea></br>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_translit; ?></label>
              <div class="col-sm-10">
                <input class="form-control" id="translit" type="checkbox" name="translit" onClick="document.getElementById('translit_checked').value = this.checked ? 1 : 0;"/>
                <input type="hidden" name="translit_checked" id="translit_checked" value="0" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_datetime; ?></label>
              <div class="col-sm-10">
                <input name="timetype" id="imm" checked="checked" onclick="dis()" value="1" type="radio">
                <label for="imm"><?php echo $text_instantly; ?></label>
                <input id="custom" type="radio" value="2" onclick="en()" name="timetype">
                <label for="custom"><?php echo $text_start_at; ?></label>
                <!-- <input type="text" id="date" name="date" disabled="disabled" value=""> -->
                <input type="hidden" id="timesend" name="timesend" value="1">
                
                <div class="input-group date">
                  <input type="text" id="date" name="date" disabled="disabled" value="<?php echo date('Y-m-d H:i:s'); ?>" placeholder="<?php echo $text_start_at; ?>" class="form-control date" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                </div>
              </div>
            </div>
          </form>
        </fieldset>
      
      <?/*<hr/>
    
        <table id="mail" class="form">
          <tr>
            <td><?php echo $text_alias; ?></td>
            <td><?php echo $alias; ?></td>
          </tr>
          <tr>
            <td><?php echo $text_balance; ?></td>
            <td><?php echo $balance; ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_to; ?></td>
            <td><select id="to" name="to">
                <?php if ($customer_groups) { ?>
                <?php foreach ($customer_groups as $customer_group) { ?>    
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_message; ?></td>
            <td><span id="counter"></span></br>
                <textarea id="message" name="message"></textarea></br>
                <input id="translit" type="checkbox" name="translit" onClick="document.getElementById('translit_checked').value = this.checked ? 1 : 0;"/>
                <label for="translit" style="margin-top:-12px;"><?php echo $text_translit; ?></label>
                <input type="hidden" name="translit_checked" id="translit_checked" value="0" />
            </td>
          </tr>
          <tr>
            <td><?php echo $text_datetime; ?></td>
            <td>
                <input name="timetype" id="imm" checked="checked" onclick="dis()" value="1" type="radio">
                <label for="imm"><?php echo $text_instantly; ?></label>
                <input id="custom" type="radio" value="2" onclick="en()" name="timetype">
                <label for="custom"><?php echo $text_start_at; ?></label>
                <input type="text" id="date" name="date" disabled="disabled" value="">
                <input type="hidden" id="timesend" name="timesend" value="1">
                <script type="text/javascript">
                    $(function(){
                        $('*[name=date]').appendDtpicker();
                    });
                </script>
            </td>
          </tr>
        </table> */ ?>
    </div>
  </div>
  <?php } ?>
</div>

<!--
<link href="view/javascript/dtpicker/jquery.simple-dtpicker.css" type="text/css" rel="stylesheet" />
<script src="view/javascript/common.js" type="text/javascript"></script>
<script src="view/javascript/dtpicker/jquery.simple-dtpicker.js" type="text/javascript"></script>
-->
<!--script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('message', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
</script-->

<style> 
.highlight { background: #FA6; } 
</style>

<script type="text/javascript">

function create_calendar() {
    $('.date').datetimepicker({
        locale: 'ru',
        format: 'YYYY-MM-DD HH:mm:ss',
        initialDate: true,
        pickTime: true
    });
}

function dis(){
    $('#date').attr('disabled', 'disabled');
}
function en(){
    $('#date').removeAttr('disabled');
    create_calendar();
}

function send(url) { 
    $('textarea[name="message"]').val();
    if (document.getElementById('imm').checked) {
        $('input[name="timesend"]').val('1');
    } else if (document.getElementById('custom').checked) {
        $('input[name="timesend"]').val('2');
    }

    $.ajax({
        url: url,
        type: 'post',
        // data: $('select, input, textarea'),
        data: $('select, input, textarea').serializeArray(),
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
            $('.success, .warning, .error, .groups').remove();
            if (json['error']) { 
                if (json['error']['warning']) {
                    // $('.box').before('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
                    $('.panel-default').before('<div class="alert alert-danger" style="display: none;"><i class="fa fa-exclamation-circle"></i>' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            
                    $('.alert-danger').fadeIn('slow');
                }
                if (json['error']['message']) {
                    $('textarea[name=\'message\']').parent().append('<span class="error">' + json['error']['message'] + '</span>');
                }              
                if (json['error']['customers']) {
                    $('select[name=\'to\']').after('<span class="error">' + json['error']['customers'] + '</span>');
                }
                if (json['error']['format']) {
                    $('select[name=\'to\']').after('<div class="groups"><span class="error">' + json['error']['format'] + '</span>\n\
                                                                        <a href="<?php echo $correct; ?>" class="button"><?php echo $button_correct; ?></a>\n\
                                                                        <a onclick="document.getElementById(\'ignore\').value = \'1\';$(\'.groups\').remove();" class="button"><?php echo $button_ignore; ?></a></div>');
                }
            } else {
                $('#ignore').val('0');
            }
                        
            if (json['next']) {
                if (json['success']) {
                    $('.panel-default').before('<div class="alert alert-success" style="display: none;"><i class="fa fa-check-circle"></i>' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('.alert-success').fadeIn('slow');
                    send(json['next']);
                }		
            } else {
                if (json['success']) {
                    
                    $('.panel-default').before('<div class="alert alert-success" style="display: none;"><i class="fa fa-check-circle"></i>' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('.alert-success').fadeIn('slow');
                }					
            }				
        }
    });
}

$(function(){
    // $('*[name=date]').appendDtpicker();
    
    $("#counter").html("<?php echo $text_message; ?> (0 <?php echo $text_symbols; ?>, 1 SMS)"); 
    $('#message').keyup(function count(){
        var string = $("#message").val();
        var number = $('#message').val().length;
        if( string.search(/[А-яЁё]/) === -1 ){
            var sms = [~~(((number-1)/160)+1)];
        }
        else{
            var sms = [~~(((number-1)/70)+1)];
        }
        $("#counter").html("<?php echo $text_message; ?> ("+number+"<?php echo $text_symbols; ?>, "+sms+" SMS)"); //Текст SMS (0 символов, 1 SMS):
    }); 
          
    $('select[name=\'to\']').bind('change', function() {
        $('#ignore').val('0');
    });

    $('select[name=\'to\']').trigger('change');
});
//--></script>

<?php echo $footer; ?>