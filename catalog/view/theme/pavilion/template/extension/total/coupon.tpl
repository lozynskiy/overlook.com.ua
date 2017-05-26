<div class="accordion-tab coupon-codes">
  <div class="accordion-tab-title">
    <strong><a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $heading_title; ?> <i class="fa fa-caret-down"></i></a></strong>
  </div>
  <div id="collapse-coupon" class="accordion-tab-content collapse">
    <div class="coupon-box">
      <div class="hint"><?php echo $entry_coupon; ?></div>
      <div class="coupon-code">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="discount-coupon-code" />
        <input type="submit" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="button-2 apply-discount-coupon-code-button" />
      </div>
      <script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
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
