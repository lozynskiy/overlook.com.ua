<div class="order-summary-content">
    <div class="section order-summary">
        <?php if (!isset($redirect)) { ?>
        <div class="table-wrapper">
            <table class="cart footable">
                <thead>
                <tr class="cart-header-row">
                    <th><span class="item-count">#</span></th>
                    <th class="product-picture"><?php echo $column_image; ?></th>
                    <th class="product" data-hide="w410, w480"><?php echo $column_name; ?></th>
                    <th class="quantity" data-hide="w410, w480, w580, w768"><?php echo $column_quantity; ?></th>
                    <th class="unit-price" data-hide="w410, w480, w580, w768"><?php echo $column_price; ?></th>
                    <th class="subtotal"><?php echo $column_total; ?></th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($products as $product) { ?>
                    <tr class="cart-item-row">
                        <td>
                            <span class="footable-toggle"></span>
                            <span class="item-count">1</span>
                        </td>
                        <td class="product-picture"><?php if ($product['thumb']) { ?>
                                <a href="<?php echo $product['href']; ?>"><img
                                            src="<?php echo $product['thumb']; ?>"
                                            alt="<?php echo $product['name']; ?>"
                                            title="<?php echo $product['name']; ?>" class="img-thumbnail"/></a>
                            <?php } ?></td>
                        <td class="product"><a
                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <?php foreach ($product['option'] as $option) { ?>
                                <br/>
                                &nbsp;
                                <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                            <?php } ?>
                            <br/>
                            &nbsp;
                            <small> - <?php echo $column_model; ?>: <?php echo $product['model']; ?></small>
                            <?php if ($product['recurring']) { ?>
                                <br/>
                                <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                                <small><?php echo $product['recurring']; ?></small>
                            <?php } ?></td>
                        <td class="quantity"><?php echo $product['quantity']; ?></td>
                        <td class="unit-price"><?php echo $product['price']; ?></td>
                        <td class="subtotal"><?php echo $product['total']; ?></td>
                    </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td>
                            <span class="footable-toggle"></span>
                            <span class="item-count">1</span>
                        </td>
                        <td class="product-picture"></td>
                        <td class="product"><?php echo $voucher['description']; ?></td>
                        <td class="quantity">1</td>
                        <td class="unit-price"><?php echo $voucher['amount']; ?></td>
                        <td class="subtotal"><?php echo $voucher['amount']; ?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
        <div class="cart-footer">
            <div class="totals">
                <div class="total-info">
                    <table class="cart-total">
                        <?php foreach ($totals as $t => $total) { ?>
                            <?php if ($t + 1 < count($totals)) { ?>
                                <tr>
                                    <td class="cart-total-left"><label><?php echo $total['title']; ?>:</label>
                                    </td>
                                    <td class="cart-total-right"><span
                                                class="value-summary"><?php echo $total['text']; ?></span></td>
                                </tr>
                            <?php } else { ?>
                                <tr class="order-total">
                                    <td class="cart-total-left"><label><?php echo $total['title']; ?>:</label>
                                    </td>
                                    <td class="cart-total-right"><span
                                                class="value-summary"><?php echo $total['text']; ?></span></td>
                                </tr>
                            <?php } ?>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?php echo $payment; ?>
    <?php } else { ?>
        <script type="text/javascript"><!--
            location = '<?php echo $redirect; ?>';
            //--></script>
    <?php } ?>
</div>
<script>
    function foot() {
        $("table.cart").footable()
    }
    setTimeout(foot, 10);
</script>
