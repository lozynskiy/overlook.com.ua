<div class="section shipping-method">
    <div class="category-description">
        <strong><?php echo $text_shipping_method; ?></strong>
    </div>
    <ul class="method-list">
        <?php if ($error_warning) { ?>
            <li>
                <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                </div>
            </li>
        <?php } ?>
        <?php if ($shipping_methods) { ?>
            <?php foreach ($shipping_methods as $shipping_method) { ?>
                <?php if (!$shipping_method['error']) { ?>
                    <?php foreach ($shipping_method['quote'] as $quote) { ?>
                        <li>

                            <div class="method-name">
                                <?php if (isset($quote['logo']) and $quote['logo'] != '') { ?>
                                    <div class="shipping-logo">
                                        <label for="shipping_method_<?php echo $quote['code']; ?>">
                                            <img src="<?php echo $quote['logo']; ?>"/>
                                        </label>
                                    </div>
                                <?php } ?>
                                <div class="shipping-details">
                                    <?php if ($quote['code'] == $code || !$code) { ?>
                                        <?php $code = $quote['code']; ?>
                                        <input id="shipping_method_<?php echo $quote['code']; ?>" type="radio"
                                               name="shipping_method" value="<?php echo $quote['code']; ?>"
                                               checked="checked"/>
                                    <?php } else { ?>
                                        <input id="shipping_method_<?php echo $quote['code']; ?>" type="radio"
                                               name="shipping_method" value="<?php echo $quote['code']; ?>"/>
                                    <?php } ?>
                                    <label for="shipping_method_<?php echo $quote['code']; ?>">
                                        <?php echo $quote['title']; ?>
                                    </label>
                                    <!--label for="shipping_method_<?php echo $quote['code']; ?>">
                                    <?php echo $shipping_method['title']; ?> (<?php echo $quote['text']; ?>)
                                    </label!-->
                                    <?php if (isset($quote['description'])) { ?>
                                        <div class="method-description"><?php echo $quote['description']; ?></div>
                                    <?php } ?>
                                    <?php if (isset($quote['desc'])) { ?>
                                        <div class="method-description"><?php echo $quote['desc'] ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                        </li>
                    <?php } ?>
                <?php } else { ?>
                    <li>
                        <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                    </li>
                <?php } ?>
            <?php } ?>

        <?php } ?>
        <li style="display: none;">
            <strong><?php echo $text_comments; ?></strong>
            <textarea name="comment" rows="8"><?php echo $comment; ?></textarea>
        </li>
    </ul>
</div>
<div class="buttons" style="display: none;">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method"
           data-loading-text="<?php echo $text_loading; ?>" class="button-1 shipping-method-next-step-button"/>
</div>

