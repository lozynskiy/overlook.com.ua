<div id="cart" class="flyout-cart-wrapper">
    <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="cart-trigger">
        <span id="cart-total"><?php echo $text_items; ?></span>
    </button>
    <ul class="mini-shopping-cart">
        <?php if ($products || $vouchers) { ?>
        <li class="count"><?php echo $text_items; ?></li>
        <li class="items">
            <?php foreach ($products as $product) { ?>
            <div class="item">
                <div class="picture"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                   alt="<?php echo $product['name']; ?>"
                                                                   title="<?php echo $product['name']; ?>"
                                                                   class="img-thumbnail"/></a>
                    <?php } ?>
                </div>
                <div class="product">
                    <div class="name">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </div>
                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <div class="attributes">
                        <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
                        <br/>
                    </div>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                    <div class="attributes">
                        <?php echo $text_recurring; ?>: <?php echo $product['recurring']; ?>
                        <br/>
                    </div>
                    <?php } ?>
                    <div class="price">
                        <label><?php echo $product['quantity']; ?></label>
                        <span>x</span>
                        <strong><?php echo $product['total']; ?></strong>
                    </div>
                </div>
                <div class="product-delete">
                    <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"
                            title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <div class="item">
                <div class="picture"></div>
                <div class="product">
                    <div class="name"><?php echo $voucher['description']; ?></div>
                    <div class="price">
                        <label>1</label>
                        <span>x</span>
                        <strong><?php echo $voucher['amount']; ?></strong>
                    </div>
                    <div class="product-delete">
                        <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"
                                title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></button>
                    </div>
                </div>
            </div>
            <?php } ?>
        </li>
        <li class="totals">
            <table>
                <?php foreach ($totals as $total) { ?>
                <tr>
                    <td class="text-right"><?php echo $total['title']; ?></td>
                    <td class="text-right"><strong><?php echo $total['text']; ?></strong></td>
                </tr>
                <?php } ?>
            </table>
        </li>
        <li class="buttons">
            <input type="button" value="<?php echo $text_cart; ?>" class="button-1 cart-button"
                   onclick="setLocation('<?php echo $cart; ?>')">
        </li>
        <?php } else { ?>
        <li class="empty-cart">
            <?php echo $text_empty; ?>
        </li>
        <?php } ?>
    </ul>
</div>
