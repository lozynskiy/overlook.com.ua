<?php echo $header; ?>
<div class="master-wrapper-content">
    <div class="breadcrumb">
        <ul>
            <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                <?php if ($cnt + 1 < count($breadcrumbs)) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>">
                            <span><?php echo $breadcrumb['text']; ?></span>
                        </a>
                        <span class="delimiter">/</span>
                    </li>
                <?php } else { ?>
                    <li>
                        <strong class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                    </li>
                <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="master-column-wrapper">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'center-2'; ?>
        <?php } else { ?>
            <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <div class="page account-page customer-info-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="fieldset">
                            <div class="title">
                                <strong><?php echo $text_your_details; ?></strong>
                            </div>
                            <div class="form-fields">
                                <div class="inputs">
                                    <label for="input-firstname"><?php echo $entry_firstname; ?> <span class="required">*</span></label>
                                    <input type="text" name="firstname" value="<?php echo $firstname; ?>"
                                           id="input-firstname"/>
                                    <?php if ($error_firstname) { ?>
                                        <div class="field-validation-error"><?php echo $error_firstname; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-lastname"><?php echo $entry_lastname; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="lastname" value="<?php echo $lastname; ?>"
                                           id="input-lastname"/>
                                    <?php if ($error_lastname) { ?>
                                        <div class="field-validation-error"><?php echo $error_lastname; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-email"><?php echo $entry_email; ?><span class="required">*</span></label>
                                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"/>
                                    <?php if ($error_email) { ?>
                                        <div class="field-validation-error"><?php echo $error_email; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-telephone"><?php echo $entry_telephone; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="telephone" value="<?php echo $telephone; ?>"
                                           id="input-telephone"/>
                                    <?php if ($error_telephone) { ?>
                                        <div class="field-validation-error"><?php echo $error_telephone; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-fax"><?php echo $entry_fax; ?></label>
                                    <input type="text" name="fax" value="<?php echo $fax; ?>" id="input-fax"/>
                                </div>
                                <?php foreach ($custom_fields as $custom_field) { ?>
                                    <?php if ($custom_field['location'] == 'account') { ?>
                                        <?php if ($custom_field['type'] == 'select') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                            id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                            class="form-control">
                                                        <option value=""><?php echo $text_select; ?></option>
                                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                        selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                                            <?php } else { ?>
                                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'radio') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <div>
                                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                            <div class="radio">
                                                                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                    <label>
                                                                        <input type="radio"
                                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                               checked="checked"/>
                                                                        <?php echo $custom_field_value['name']; ?>
                                                                    </label>
                                                                <?php } else { ?>
                                                                    <label>
                                                                        <input type="radio"
                                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                        <?php echo $custom_field_value['name']; ?>
                                                                    </label>
                                                                <?php } ?>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'checkbox') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <div>
                                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                            <div class="checkbox">
                                                                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                                                                    <label>
                                                                        <input type="checkbox"
                                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                               checked="checked"/>
                                                                        <?php echo $custom_field_value['name']; ?>
                                                                    </label>
                                                                <?php } else { ?>
                                                                    <label>
                                                                        <input type="checkbox"
                                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                        <?php echo $custom_field_value['name']; ?>
                                                                    </label>
                                                                <?php } ?>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'text') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="text"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                           value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                           placeholder="<?php echo $custom_field['name']; ?>"
                                                           id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                           class="form-control"/>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'textarea') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea
                                                            name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                            rows="5" placeholder="<?php echo $custom_field['name']; ?>"
                                                            id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                            class="form-control"><?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'file') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <button type="button"
                                                            id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-default"><i
                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                    </button>
                                                    <input type="hidden"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                           value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'date') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <div class="input-group date">
                                                        <input type="text"
                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                               placeholder="<?php echo $custom_field['name']; ?>"
                                                               data-date-format="YYYY-MM-DD"
                                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                               class="form-control"/>
                                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'time') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <div class="input-group time">
                                                        <input type="text"
                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                               placeholder="<?php echo $custom_field['name']; ?>"
                                                               data-date-format="HH:mm"
                                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                               class="form-control"/>
                                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($custom_field['type'] == 'datetime') { ?>
                                            <div class="form-group<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                                 data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                <label class="col-sm-2 control-label"
                                                       for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                <div class="col-sm-10">
                                                    <div class="input-group datetime">
                                                        <input type="text"
                                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                               placeholder="<?php echo $custom_field['name']; ?>"
                                                               data-date-format="YYYY-MM-DD HH:mm"
                                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                               class="form-control"/>
                                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="fieldset">
                            <div class="title">
                                <strong><?php echo $newsletter_title; ?></strong>
                            </div>
                            <div class="form-fields">
                                <div class="inputs">
                                    <label><?php echo $entry_newsletter; ?></label>
                                    <?php if ($newsletter) { ?>
                                        <ul class="option-list">
                                            <li>
                                                <input id="newsletter_1" type="radio" name="newsletter" value="1"
                                                       checked="checked"/>
                                                <label for="newsletter_1"><?php echo $text_yes; ?></label>
                                            </li>
                                            <li>
                                                <input id="newsletter_0" type="radio" name="newsletter" value="0"/>
                                                <label for="newsletter_0"><?php echo $text_no; ?></label>
                                            </li>
                                        </ul>
                                    <?php } else { ?>
                                        <ul class="option-list">
                                            <li>
                                                <input id="newsletter_1" type="radio" name="newsletter" value="1"/>
                                                <label for="newsletter_1"><?php echo $text_yes; ?></label>
                                            </li>
                                            <li>
                                                <input id="newsletter_0" type="radio" name="newsletter" value="0"
                                                       checked="checked"/>
                                                <label for="newsletter_0"><?php echo $text_no; ?></label>
                                            </li>
                                        </ul>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="buttons">
                            <input type="submit" value="<?php echo $button_continue; ?>"
                                   class="button-1 save-customer-info-button"/>
                        </div>
                    </form>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
    // Sort the custom fields
    $('.form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
            $('.form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('.form-group').length) {
            $('.form-group:last').after(this);
        }

        if ($(this).attr('data-sort') == $('.form-group').length) {
            $('.form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('.form-group').length) {
            $('.form-group:first').before(this);
        }
    });
    //--></script>
<script type="text/javascript"><!--
    $('button[id^=\'button-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $(node).parent().find('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });
    //--></script>
<script>
    $(document).ready(function(){
        $("#input-telephone").inputmask(
            "+38 (999) 999 99 99",{
                placeholder:"+38 (___) ___ __ __",
                clearMaskOnLostFocus: true,
                showMaskOnHover: false }
        );
    });
</script>
<?php echo $footer; ?>

