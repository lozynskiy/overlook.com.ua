<div class="section shipping-method">
    <ul class="method-list">
        <?php if ($error_warning) { ?>
        <li>
            <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        </li>
        <?php } ?>
        <?php if ($payment_methods) { ?>
        <li>
            <label><?php echo $text_payment_method; ?></label>
            <?php foreach ($payment_methods as $payment_method) { ?>
            <div class="radio">
                <?php if ($payment_method['code'] == $code || !$code) { ?>
                <?php $code = $payment_method['code']; ?>
                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>"
                       checked="checked"/>
                <?php } else { ?>
                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>"/>
                <?php } ?>
                <label>
                    <?php echo $payment_method['title']; ?>
                    <?php if ($payment_method['terms']) { ?>
                    (<?php echo $payment_method['terms']; ?>)
                    <?php } ?>
                    <?php if (isset($payment_method['description'])) { ?>
                    <br/>
                    <small><?php echo $payment_method['description']; ?></small>
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
            <?php } ?>
        </li>
        <li>
            <strong><?php echo $text_comments; ?></strong>
            <textarea name="comment" rows="8"><?php echo $comment; ?></textarea>
        </li>
        <?php if ($text_agree) { ?>
        <div class="buttons">
            <p><?php echo $text_agree; ?>
            <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked"/>
            <?php } else { ?>
            <input type="checkbox" name="agree" value="1"/>
            <?php } ?></p>
            <br \>
            <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
                   data-loading-text="<?php echo $text_loading; ?>" class="button-1 payment-method-next-step-button"/>
        </div>
    </ul>
</div>
<?php } else { ?>
<div class="buttons">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
           data-loading-text="<?php echo $text_loading; ?>" class="button-1 payment-method-next-step-button"/>
</div>
<?php } ?>
