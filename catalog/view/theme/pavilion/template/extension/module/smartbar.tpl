<div data-position="<?php echo $position; ?>" data-effect="<?php echo $effect; ?>" class="smartbar_template" style="display: none;">
	<div class="smartbar_wrapper smartbar_<?php echo $css_id; ?>" id="<?php echo $css_id; ?>" style="display: none;">
		<span class="smartbar-close-btn" id="close_btn_<?php echo $css_id; ?>"  style="display:none">
			<i class="fa fa-times" aria-hidden="true" style="color:white;"></i>
		</span>
	  <div class="container">
	        <div class="smartbar">
	        	<?php echo $text; ?>
	        </div>
	  </div>
	</div>
	<style type="text/css">
		<?php if (!empty($width)) : ?>
			@media (min-width: 1200px) {
			  #<?php echo $css_id; ?> .container {
			    width: <?php echo $width; ?>;
			  }
			}
		<?php endif; ?>

		<?php if (!empty($bgcolor)) : ?>
			#<?php echo $css_id; ?> {
				background-color : <?php echo $bgcolor; ?>;
			}
		<?php endif; ?>

		<?php if (!empty($color)) : ?>
			#<?php echo $css_id; ?> .smartbar * {
				color : <?php echo $color; ?>;
			}
		<?php endif; ?>
	</style>
	<?php if (!empty($css)) : ?>
		<style type="text/css">
			<?php echo $css; ?>
		</style>
	<?php endif; ?>
</div>
<script>
	$(window).load(function() {
		$( document).on( "click", "#close_btn_<?php echo $css_id; ?>", function() {	
			$('.smartbar_<?php echo $css_id; ?>').fadeOut('fast');
			<?php if ($repeat_conditions) {?>
				createCookie('<?php echo $css_id; ?>', true, '<?php echo $repeat_after_days; ?>');
			<?php } ?>
		});
	});				
</script>
<script>
	<?php if ($add_close_btn)  { ?>
		$('#close_btn_<?php echo $css_id; ?>').show();
		<?php if ($close_btn_position == 'right') { ?>
			$('#close_btn_<?php echo $css_id; ?>').removeClass('smartbar-close-left');
			$('#close_btn_<?php echo $css_id; ?>').addClass('smartbar-close-right');
		<?php } ?>
		<?php if ($close_btn_position == 'left') { ?>
			$('#close_btn_<?php echo $css_id; ?>').removeClass('smartbar-close-right');
			$('#close_btn_<?php echo $css_id; ?>').addClass('smartbar-close-left');
		<?php } ?>
	<?php } ?>	
	function createCookie(name, value, days) {
		
	    var expires;

	    if (days) {
	        var date = new Date();
	        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	        expires = "; expires=" + date.toGMTString();
	    } else {
	        expires = "";
	    }
	    document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
	}
</script>
