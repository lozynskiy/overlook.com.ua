<div class="accordion-tab">
    <div class="accordion-tab-title">
        <span><?php echo $heading_title; ?></span>
    </div>
    <div class="accordion-tab-content">
        <div class="reward-box">
            <div class="hint"><?php echo $entry_reward; ?></div>
            <div class="coupon-code">
                <input type="text" name="reward" value="<?php echo $reward; ?>" id="input-reward"/>
                <input type="submit" value="<?php echo $button_reward; ?>" id="button-reward"
                       data-loading-text="<?php echo $text_loading; ?>" class="button-2"/>
            </div>
            <script type="text/javascript"><!--
                $('#button-reward').on('click', function () {
                    $.ajax({
                        url: 'index.php?route=extension/total/reward/reward',
                        type: 'post',
                        data: 'reward=' + encodeURIComponent($('input[name=\'reward\']').val()),
                        dataType: 'json',
                        beforeSend: function () {
                            $('#button-reward').button('loading');
                        },
                        complete: function () {
                            $('#button-reward').button('reset');
                        },
                        success: function (json) {
                            $('.alert').remove();

                            if (json['error']) {
                                $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                                $('html, body').animate({scrollTop: 0}, 'slow');
                            }

                            if (json['redirect']) {
                                location = json['redirect'];
                            }
                        }
                    });
                });
                //--></script>
        </div>
    </div>
</div>