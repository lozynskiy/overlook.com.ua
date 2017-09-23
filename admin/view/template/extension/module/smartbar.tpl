<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-smartbar" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary save-changes"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_version; ?></h1>
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
            <?php if (!empty($success)) { ?>
                <div class="alert alert-success autoSlideUp"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <script>$('.autoSlideUp').delay(3000).fadeOut(600, function(){ $(this).show().css({'visibility':'hidden'}); }).slideUp(600);</script>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-smartbar" class="form-horizontal">
                        <ul class="nav nav-tabs">
                            <li><a href="#tab-settings" data-toggle="tab"><i class="fa fa-gear"></i> <?php echo $tab_settings; ?></a></li>
                            <!--li><a href="#tab-support" data-toggle="tab"><i class="fa fa-question-circle"></i> <?php echo $tab_support; ?></a></li!-->
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" id="tab-settings">
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                        <?php if ($error_name) { ?>
                                        <div class="text-danger"><?php echo $error_name; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                    <div class="col-sm-10">
                                        <select name="status" id="input-status" class="form-control">
                                            <option value="1" <?php if (!empty($status)) { echo 'selected="selected"'; } ?>><?php echo $text_enabled; ?></option>
                                            <option value="0" <?php if (empty($status)) { echo 'selected="selected"'; } ?>><?php echo $text_disabled; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-position"><?php echo $entry_position; ?></label>
                                    <div class="col-sm-10">
                                        <select name="position" id="input-position" class="form-control">
                                            <option value="top" <?php if (!empty($position) && $position == 'top') { echo 'selected="selected"'; } ?>><?php echo $text_top; ?></option>
                                            <option value="bottom" <?php if (!empty($position) && $position == 'bottom') { echo 'selected="selected"'; } ?>><?php echo $text_bottom; ?></option>
                                            <option value="both" <?php if (!empty($position) && $position == 'both') { echo 'selected="selected"'; } ?>><?php echo $text_both; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>
                                    <div class="col-sm-10">
                                        <select name="effect" id="input-effect" class="form-control">
                                            <option value="appear" <?php if (!empty($effect) && $effect == 'appear') { echo 'selected="selected"'; } ?>><?php echo $text_appear; ?></option>
                                            <option value="slide_down" <?php if (!empty($effect) && $effect == 'slide_down') { echo 'selected="selected"'; } ?>><?php echo $text_slide_down; ?></option>
                                            <option value="fade_in" <?php if (!empty($effect) && $effect == 'fade_in') { echo 'selected="selected"'; } ?>><?php echo $text_fade_in; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $placeholder_width; ?>" id="input-width" class="form-control" />
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-time-interval">
                                        <span data-toggle="tooltip" data-original-title="<?php echo $help_close_button; ?>"><?php echo $entry_add_close_button; ?></span>
                                    </label>
                                    <div class="col-sm-10">
                                        <select name="add_close_btn" id="select-close-btn" class="form-control">
                                            <option value="enable" <?php if (!empty($add_close_btn) && $add_close_btn == 'enable') { echo 'selected="selected"'; } ?>><?php echo $entry_text_yes; ?></option>
                                            <option value="disabled" <?php if (!empty($add_close_btn) && $add_close_btn == 'disabled') { echo 'selected="selected"'; } ?>><?php echo $entry_text_no; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row" id="close_btn_show">
                                 <br>
                                    <label class="col-sm-2 control-label" for="select-closebtn-position">
                                        <?php echo $entry_close_button_position; ?>
                                    </label>
                                    <div class="col-sm-10" style="margin-bottom: 17px;">
                                        <select name="close_btn_position" id="select-closebtn-position" class="form-control">
                                            <option value="right" <?php if (!empty($add_close_btn) && $add_close_btn == 'right') { echo 'selected="selected"'; } ?>><?php echo $entry_text_right; ?></option>
                                            <option value="left" <?php if (!empty($add_close_btn) && $add_close_btn == 'left') { echo 'selected="selected"'; } ?>><?php echo $entry_text_left; ?></option>
                                        </select>
                                    </div>
                                    
                                    <label class="col-sm-2 control-label" for="select-closebtn-position">
                                        <span data-toggle="tooltip" data-original-title="<?php echo $help_repeat_conditions; ?>"><?php echo $entry_repeat_conditions; ?></span>
                                    </label>
                                    <div class="col-sm-10">
                                        <select name="repeat_conditions" id="select-repeat_conditions" class="form-control">
                                            <option value="0" <?php if (!empty($repeat_conditions) && $repeat_conditions == '0') { echo 'selected="selected"'; } ?>><?php echo $entry_show_always; ?></option>
                                            <option value="1" <?php if (!empty($repeat_conditions) && $repeat_conditions == '1') { echo 'selected="selected"'; } ?>><?php echo $entry_show_again; ?></option>
                                        </select>

                                        <div id="daysPicker" style="display: none;">
                                            <br>
                                            <div class="input-group">
                                               <input type="number" min="1" class="form-control" name="repeat_after_days" value="<?php echo $repeat_after_days ?>">
                                               <span class="input-group-addon">days</span>
                                            </div>
                                         </div>
                                    </div> 
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-date-interval">
                                        <span data-toggle="tooltip" data-original-title="<?php echo $help_date_text; ?>"><?php echo $entry_date_interval; ?></span>
                                    </label>
                                    <div class="col-sm-10">
                                        <select name="date_interval" id="input-date-interval" class="form-control">
                                            <option value="enable" <?php if (!empty($date_interval) && $date_interval == 'enable') { echo 'selected="selected"'; } ?>><?php echo $text_enabled; ?></option>
                                            <option value="disabled" <?php if (!empty($date_interval) && $date_interval == 'disabled') { echo 'selected="selected"'; } ?>><?php echo $text_disabled; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row" id="date_input">
                                <br>
                                    <label class="col-sm-2 control-label" for="input-start-date">
                                       <?php echo $entry_start_date; ?>
                                    </label>
                                    <div class="col-sm-10" style="margin-bottom: 17px;">
                                        <input type="text" name="start_date" value="<?php echo $start_date; ?>" id="input-start-date" class="form-control date" data-date-format="YYYY-MM-DD" />
                                    </div>
                                    <label class="col-sm-2 control-label" for="input-end-date">
                                       <?php echo $entry_end_date; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" name="end_date" value="<?php echo $end_date; ?>" id="input-end-date" class="form-control date" data-date-format="YYYY-MM-DD" />
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-time-interval">
                                        <span data-toggle="tooltip" data-original-title="<?php echo $help_time_text; ?>"><?php echo $entry_time_interval; ?></span>
                                    </label>
                                    <div class="col-sm-10">
                                        <select name="time_interval" id="input-date-interval" class="form-control">
                                            <option value="enable" <?php if (!empty($time_interval) && $time_interval == 'enable') { echo 'selected="selected"'; } ?>><?php echo $text_enabled; ?></option>
                                            <option value="disabled" <?php if (!empty($time_interval) && $time_interval == 'disabled') { echo 'selected="selected"'; } ?>><?php echo $text_disabled; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row" id="time_input">
                                <br>
                                    <label class="col-sm-2 control-label" for="input-start-date">
                                       <?php echo $entry_start_time; ?>
                                    </label>
                                    <div class="col-sm-10" style="margin-bottom: 17px;">
                                        <input type="text" name="start_time" value="<?php echo $start_time; ?>" id="input-start-time" data-format="hh:mm:ss" class="form-control time"  />
                                    </div>
                                    <br>
                                    <label class="col-sm-2 control-label" for="input-end-date">
                                        <?php echo $entry_end_time; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" name="end_time" value="<?php echo $end_time; ?>" id="input-end-time" data-format="hh:mm:ss" class="form-control time"  />
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                                    <div class="col-sm-10">
                                        <div id="cp_color" class="input-group colorpicker-component">
                                            <span class="input-group-addon"><i class="colorpicker_box_color"></i></span>
                                            <input type="text" name="color" value="<?php echo $color; ?>" placeholder="<?php echo $placeholder_color; ?>" id="input-color" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label"><?php echo $entry_bgcolor; ?></label>
                                    <div class="col-sm-10">
                                        <div id="cp_bgcolor" class="input-group colorpicker-component">
                                            <span class="input-group-addon"><i class="colorpicker_box_color"></i></span>
                                            <input type="text" name="bgcolor" value="<?php echo $bgcolor; ?>" placeholder="<?php echo $placeholder_bgcolor; ?>" id="input-bgcolor" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="textarea-css"><?php echo $entry_css; ?></label>
                                    <div class="col-sm-10">
                                        <textarea name="css" id="textarea-css" class="form-control min-height-textarea"><?php echo $css; ?></textarea>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
                                    <div class="col-sm-10">
                                        <ul class="nav nav-tabs">
                                            <?php foreach ($languages as $language) : ?>
                                            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                            <?php endforeach; ?>
                                        </ul>
                                        <div class="tab-content">
                                            <?php foreach ($languages as $language) : ?>
                                            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                                <textarea name="text[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $placeholder_text; ?>" id="input-text" class="form-control summernote"><?php echo !empty($text[$language['language_id']]) ? $text[$language['language_id']] : ''; ?></textarea>
                                            </div>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--div class="tab-pane" id="tab-support">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $license_your_license; ?></h3>
                                            </div>
                                            <div class="panel-body panel-margin">
                                                <?php if (empty($smartbar_licensed_on)) : ?>
                                                <div class="form-group">
                                                    <label for="moduleLicense"><?php echo $license_enter_code; ?></label>
                                                    <div class="licenseAlerts"></div>
                                                    <div class="licenseDiv"></div>
                                                    <input type="text" class="licenseCodeBox form-control" placeholder="<?php echo $license_placeholder; ?>" value="<?php echo !empty($license_code) ? $license_code : ''; ?>" />
                                                </div>
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-success btnActivateLicense"><i class="icon-ok"></i> <?php echo $license_activate; ?></button>
                                                </div>
                                                
                                                <?php
                                                $hostname = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '' ;
                                                $hostname = strstr($hostname, 'http://') === false ? 'http://' . $hostname : $hostname;
                                                ?>
                                                <script type="text/javascript">
                                                var domain = '<?php echo base64_encode($hostname); ?>';
                                                var domainraw = '<?php echo $hostname; ?>';
                                                var timenow = <?php echo time(); ?>;
                                                var MID = 'AVENFKEUL8';
                                                </script>
                                                <script type="text/javascript" src="view/javascript/val.js"></script>
                                                <?php endif; ?>
                                                <?php if (!empty($smartbar_licensed_on)): ?>
                                                <input name="cHRpbWl6YXRpb24ef4fe" type="hidden" value="<?php echo base64_encode(json_encode($smartbar_license)); ?>" />
                                                <input name="OaXRyb1BhY2sgLSBDb21" type="hidden" value="<?php echo $smartbar_licensed_on; ?>" />
                                                <div class="row">
                                                    <label class="license_label"><?php echo $license_holder; ?></label>
                                                    <span class="license_info"><?php echo $smartbar_license['customerName']; ?></span>
                                                    
                                                    <label class="license_label"><?php echo $license_registered_domains; ?></label>
                                                    <ul class="license_info">
                                                        <?php foreach ($smartbar_license['licenseDomainsUsed'] as $domain): ?>
                                                        <li><i class="fa fa-check"></i>&nbsp;<?php echo $domain; ?></li>
                                                        <?php endforeach; ?>
                                                    </ul>
                                                    <label class="license_label"><?php echo $license_expires; ?></label>
                                                    <span class="license_info"><?php echo date("F j, Y", strtotime($smartbar_license['licenseExpireDate'])); ?></span>
                                                    <div class="alert alert-success center"><?php echo $license_valid; ?></div>
                                                </div>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div!-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
  $('.nav-tabs > li:first-child a').tab('show');

  $('.summernote').summernote({height: 200});

  var colorpicker_change = function(input, box, color) {
    if (input !== false) {
      $(input).val(color);
    }

    $(box).css('background-color', color);
  }

  $('#cp_color').ColorPicker({
    color: $('#cp_color').find('input').val(),
    onChange : function(hsb, hex, rgb) {
      colorpicker_change($('#cp_color').find('input'), $('#cp_color').find('.colorpicker_box_color'), '#' + hex);
    } 
  });

  $('#cp_bgcolor').ColorPicker({
    color: $('#cp_bgcolor').find('input').val(),
    onChange : function(hsb, hex, rgb) {
      colorpicker_change($('#cp_bgcolor').find('input'), $('#cp_bgcolor').find('.colorpicker_box_color'), '#' + hex);
    }
  });

  <?php if (!empty($color)) : ?>
    colorpicker_change($('#cp_color').find('input'), $('#cp_color').find('.colorpicker_box_color'), '<?php echo $color; ?>');
  <?php endif; ?>

  <?php if (!empty($bgcolor)) : ?>
    colorpicker_change($('#cp_bgcolor').find('input'), $('#cp_bgcolor').find('.colorpicker_box_color'), '<?php echo $bgcolor; ?>');
  <?php endif; ?>

  $('#cp_color, #cp_bgcolor').find('input').change(function() {
    colorpicker_change(false, $(this).closest('.colorpicker-component').find('.colorpicker_box_color'), $(this).val());
  });

  $('input, textarea').focus(function() {
    $('#cp_color, #cp_bgcolor').ColorPickerHide();
    $(this).trigger('click'); 
  })

  $('.date').datetimepicker({
    pickTime: false
  });
  $('.time').datetimepicker({
    pickDate: false
  });

  $('.save-changes').click(function(e) {
    if ($('.note-editor.codeview').length > 0) {
      $('.btn-codeview').trigger('click');
    }
  });

showHideStuff($('select[name="time_interval"]'),$('#time_input'), 'enable');
showHideStuff($('select[name="date_interval"]'),$('#date_input'), 'enable');
showHideStuff($('select[name="add_close_btn"]'),$('#close_btn_show'), 'enable');
showHideStuff($('select[name="repeat_conditions"]'),$('#daysPicker'), '1');

function showHideStuff($typeSelector, $toggleArea, $selectStatus) {    
    if ($typeSelector.val() === $selectStatus) {
        $toggleArea.show(); 
    } else {
        $toggleArea.hide(); 
    }
    $typeSelector.change(function(){
        if ($typeSelector.val() === $selectStatus) {
            $toggleArea.show(300); 
        }
        else {
            $toggleArea.hide(300); 
        }
    });
}
</script>
<?php echo $footer; ?>