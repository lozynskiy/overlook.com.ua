<div class="accordion-tab gift-cards">
  <div class="accordion-tab-title">
    <span><?php echo $heading_title; ?></span>
  </div>
  <div class="accordion-tab-content">
    <div class="giftcard-box">
      <div class="hint"><?php echo $entry_voucher; ?></div>
      <div class="coupon-code">
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" id="input-voucher" class="gift-card-coupon-code" />
        <input type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher" data-loading-text="<?php echo $text_loading; ?>"  class="button-2 apply-gift-card-coupon-code-button" />
        </div>
      <script type="text/javascript"><!--
$('#button-voucher').on('click', function() {
  $.ajax({
    url: 'index.php?route=extension/total/voucher/voucher',
    type: 'post',
    data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-voucher').button('loading');
    },
    complete: function() {
      $('#button-voucher').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['error']) {
        $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('html, body').animate({ scrollTop: 0 }, 'slow');
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
