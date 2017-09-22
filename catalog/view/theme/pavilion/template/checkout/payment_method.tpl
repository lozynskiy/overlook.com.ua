<div class="section shipping-method">
    <div class="category-description">
        <strong><?php echo $text_payment_method; ?></strong>
    </div>
    <ul class="method-list">
        <?php if ($error_warning) { ?>
            <li>
                <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                </div>
            </li>
        <?php } ?>
        <?php if ($payment_methods) { ?>
            <?php foreach ($payment_methods as $payment_method) { ?>
                <li>
                    <div class="method-name">
                        <?php if ($payment_method['code'] == $code || !$code) { ?>
                            <?php $code = $payment_method['code']; ?>
                            <input id="payment_method_<?php echo $payment_method['code']; ?>" type="radio"
                                   name="payment_method" value="<?php echo $payment_method['code']; ?>"
                                   checked="checked"/>
                        <?php } else { ?>
                            <input id="payment_method_<?php echo $payment_method['code']; ?>" type="radio"
                                   name="payment_method" value="<?php echo $payment_method['code']; ?>"/>
                        <?php } ?>
                        <label for="payment_method_<?php echo $payment_method['code']; ?>">
                            <?php echo $payment_method['title']; ?>
                            <?php if ($payment_method['terms']) { ?>
                                (<?php echo $payment_method['terms']; ?>)
                            <?php } ?>
                        </label>
                        <?php if (isset($payment_method['description'])) { ?>
                            <div class="payment-description"><?php echo $payment_method['description']; ?></div>
                        <?php } ?>
                    </div>
                </li>
            <?php } ?>
        <?php } ?>
        <li>
            <div class="category-description">
                <strong><?php echo $text_comments; ?></strong>
            </div>
            <textarea name="comment" rows="8"><?php echo $comment; ?></textarea>
        </li>
        <?php if ($text_agree) { ?>
        <div class="buttons">
            <label for="agree"><?php echo $text_agree; ?></label>
            <?php if ($agree) { ?>
                <input id="agree" type="checkbox" name="agree" value="1" checked="checked"/>
            <?php } else { ?>
                <input id="agree" type="checkbox" name="agree" value="1"/>
            <?php } ?>
            <br \>
            <input style="display: none;" type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
                   data-loading-text="<?php echo $text_loading; ?>" class="button-1 payment-method-next-step-button"/>
        </div>
    </ul>
</div>
<?php } else { ?>
    <div class="buttons" style="display: none;">
        <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
               data-loading-text="<?php echo $text_loading; ?>" class="button-1 payment-method-next-step-button"/>
    </div>
<?php } ?>
<div class="buttons">
    <input type="button" value="<?php echo $button_continue; ?>"
           id="button-combine-step"
           data-loading-text="<?php echo $text_loading; ?>"
           class="button-1 combine-next-button"/>
</div>