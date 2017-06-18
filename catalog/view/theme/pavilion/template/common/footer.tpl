<footer class="footer">
		<div class="footer-upper">
                <div class="center">
                         <div class="newsletter" id="static-subscribe-wrapper-footer">
				<div class="title">
			<strong><?php echo $text_subscribe; ?></strong>
				</div>
				<div class="newsletter-subscribe">
                            <form id="static-subscribe-form-footer" class="newsletter-email">
                                    <input id="newsletter" class="newsletter-subscribe-text input-text required-entry validate-email" placeholder="<?php echo $text_subscribe_email; ?>" title="<?php echo $text_subscribe_email; ?>" type="text" name="email">
                                    <button class="button-1 newsletter-subscribe-button" id="static-subscribe-button-footer" title="<?php echo $text_subscribe_email; ?>" type="submit"></button>
                            </form> 
				</div>
                            <script type="text/javascript">
							function masked(element, status) {
							  if (status == true) {
							    $('<div/>')
							    .attr({ 'class':'masked' })
							    .prependTo(element);
							    $('<div class="masked_loading" />').insertAfter($('.masked'));
							  } else {
							    $('.masked').remove();
							    $('.masked_loading').remove();
							  }
							}
							$('#static-subscribe-button-footer').on('click', function(e) {
								e.preventDefault();
							  
							  masked('#static-subscribe-form-footer', true);
							  
							  $.ajax({
							    type: 'post',
							    url:  'index.php?route=extension/module/static_subscribe/make_subscribe',
							    dataType: 'json',
							    data: $('#static-subscribe-form-footer').serialize(),
							    success: function(json) {
							      if (json['error']) {
							        masked('#static-subscribe-form-footer', false);
							        $('#static-subscribe-form-footer .alert-danger').remove();
							        $('#static-subscribe-form-footer').after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
							      }
							      if (json['output']) {
							        masked('#static-subscribe-form-footer', false);
							        $('#static-subscribe-form-footer').html('<div class="output-message" style="color: #fff;">'+json['output']+'</div>');
							      }
							    }
							  });
							 return false;
							});
							</script>
                            </div>
                            <ul class="social-sharing">
            			<li class="facebook"><a href="" target="_blank"></a></li>
				<li class="youtube"><a href="" target="_blank"></a></li>
            			<li class="google"><a href="" target="_blank"></a></li>
            			<li class="twitter"><a href="" target="_blank"></a></li>
            			<!--li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li>
            			<li><a href="" target="_blank"></a></li!-->
                            </ul>
                        </div>				
	</div>
            <div class="footer-middle">
            <div class="center">
                    <?php if ($informations) { ?>
        	    <div class="footer-block">
                            <strong class="title"><?php echo $text_information; ?></strong>
                            <ul class="list">
                              <?php foreach ($informations as $information) { ?>
                                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                    <div class="footer-block">
                        <strong class="title"><?php echo $text_service; ?></strong>
                        <ul class="list">
                          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        </ul>
                    </div>
                    <div class="footer-block">
                        <strong class="title"><?php echo $text_extra; ?></strong>
                        <ul class="list">
                          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                        </ul>
                    </div>
                    <div class="footer-block">
                        <strong class="title"><?php echo $text_account; ?></strong>
                        <ul class="list">
                          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                        </ul>
                    </div>
                       <div class="footer-block quick-contact">
                            <strong class="title"><?php echo $text_contactus; ?></strong>
                            	<ul class="list">
                                    <li class="address"><span><?php echo $address; ?></span></li>
                                    <li class="email"><span><?php echo $email; ?></span></li>
                                    <li class="phone"><span><?php echo $telephone; ?></span></li>
				    <!--li><span><?php echo $open; ?></span></li>
                                    <li><span> </span></li>
                                    <li><span> </span></li!-->
        			</ul>
                        </div>		
                </div>				
	</div>
  <div class="footer-lower">
	<div class="center">
    <div class="footer-powered-by">
    <p><?php echo $powered; ?></p>
  </div>
        <p id="goToTop">
	       <a href="#top"><span class="main-color1"></span></a>
        </p>
</div>
        <script type="text/javascript">
    	$(document).ready(function(){
    		$("#goToTop").hide();
    		$(function () {
    			$(window).scroll(function () {
    				if ($(this).scrollTop() > 450) {
    					$('#goToTop').fadeIn();
    				} else {
    					$('#goToTop').fadeOut();
    				}
    			});
    			$('#goToTop').click(function () {
    				$('body,html').animate({
    					scrollTop: 0
    				}, 600);
    				return false;
    			});
    		});
    	});
        </script>
</div>
</footer>
</body></html>