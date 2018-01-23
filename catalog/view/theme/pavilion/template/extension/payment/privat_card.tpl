<div class="buttons">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button-1 confirm-order-next-step-button" data-loading-text="<?php echo $text_loading; ?>" />
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=extension/payment/privat_card/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
