<div class="section shipping-method">
    <div class="category-description">
        <p><?php echo $text_shipping_method; ?></p>
    </div>
    <ul class="method-list">
        <?php if ($error_warning) { ?>
        <li>
            <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            </div>
        </li>
        <?php } ?>
        <?php if ($shipping_methods) { ?>
        <li>
            <?php foreach ($shipping_methods as $shipping_method) { ?>
            <?php if (!$shipping_method['error']) { ?>
            <?php foreach ($shipping_method['quote'] as $quote) { ?>
            <div class="method-name">
                <?php if ($quote['code'] == $code || !$code) { ?>
                <?php $code = $quote['code']; ?>
                <input id="shipping_method_<?php echo $quote['code']; ?>" type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked"/>
                <?php } else { ?>
                <input id="shipping_method_<?php echo $quote['code']; ?>" type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"/>
                <?php } ?>
                <!--label for="shipping_method_<?php echo $quote['code']; ?>">
                    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
                </label!-->
                <label for="shipping_method_<?php echo $quote['code']; ?>">
                    <?php echo $shipping_method['title']; ?> (<?php echo $quote['text']; ?>)
                </label>
            </div>
            <?php if (isset($quote['description'])) { ?>
            <div class="method-description"><?php echo $quote['description']; ?></div>
            <?php } ?>

            <?php } ?>
            <?php } else { ?>
        <li>
            <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
        </li>
        <?php } ?>
        <?php } ?>
        </li>
        <?php } ?>
        <li>
            <strong><?php echo $text_comments; ?></strong>
            <textarea name="comment" rows="8"><?php echo $comment; ?></textarea>
        </li>
    </ul>
</div>
<div class="buttons">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method"
           data-loading-text="<?php echo $text_loading; ?>" class="button-1 shipping-method-next-step-button"/>
</div>

