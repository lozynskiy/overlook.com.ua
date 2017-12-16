<?php echo $header; ?>
    <div class="master-wrapper-content">
        <div class="breadcrumb">
            <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                    <?php if ($cnt == 0) { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
                                <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                            <span class="delimiter">/</span>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li>
                    <?php } elseif ($cnt + 1 < count($breadcrumbs)) { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                                <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                            <span class="delimiter">/</span>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <?php } else { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>
        <div class="master-column-wrapper"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'center-2'; ?>
            <?php } else { ?>
                <?php $class = 'center-1'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>">
                <?php echo $content_top; ?>
                <div class="page checkout-page">
                    <div class="page-title">
                        <h1><?php echo $heading_title; ?></h1>
                    </div>
                    <div class="page-body checkout-data">
                        <div class="section order-completed">
                            <?php if (isset($orderDetails)) { ?>
                            <div class="details">
                                <table class="order-completed-info">
                                    <tbody>
                                    <tr>
                                        <td><strong><?php echo $text_order_id; ?></strong></td>
                                        <td><strong><?php echo $orderDetails['order_id']; ?></strong></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $text_order_total; ?></strong></td>
                                        <td><?php echo $orderDetails['order_total']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $text_order_shipping_method; ?></strong></td>
                                        <td><?php echo $orderDetails['shipping_method']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $text_order_payment_method; ?></strong></td>
                                        <td><?php echo $orderDetails['payment_method']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $text_order_address; ?></strong></td>
                                        <td><?php echo $orderDetails['payment_city']; ?>, <?php echo $orderDetails['payment_address_1']; ?></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <?php } ?>
                            <div class="details">
                            <?php echo $text_message; ?>
                            </div>
                            <div class="buttons">
                                <a href="<?php echo $continue; ?>"
                                   class="button-1 order-completed-continue-button"><?php echo $button_continue; ?></a>
                            </div>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
<?php if (isset($orderDetails) && isset($data['order_id']) && (isset($route) && $route == 'checkout/success' || $route == 'checkout/success/index' || $route == 'quickcheckout/success') && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { ?>
    <script type="text/javascript">
        if (typeof ga != 'undefined') {
            ga('set', 'currencyCode', '<?php echo $currency; ?>');

            <?php foreach($orderProduct as $product) { ?>
            ga('ec:addProduct', {
                'id': '<?php echo $product['product_id']; ?>',
                'name': '<?php echo $product['name']; ?>',
                'model': '<?php echo $product['model']; ?>',
                'sku': '<?php echo $product['sku']; ?>',
                'category': '<?php echo $product['category']; ?>',
                'brand': '<?php echo $product['manufacturer']; ?>',
                'price': '<?php echo $product['price']; ?>',
                'quantity': '<?php echo $product['quantity']; ?>'
            });
            <?php } ?>

            ga('ec:setAction', 'purchase', {
                'id': '<?php echo $orderDetails['order_id']; ?>',
                'affiliation': '<?php echo $orderDetails['store_name']; ?>',
                'revenue': '<?php echo $orderDetails['total']; ?>',
                'tax': '<?php if ($orderDetails['order_tax'] == '') {
                    echo 0;
                } else {
                    echo $orderDetails['order_tax'];
                } ?>',
                'shipping': '<?php echo $orderDetails['shipping_total']; ?>'
            });
            ga('send', 'event', 'Ecommerce', 'Purchase', 'Checkout');
        }
    </script>
    <?php if ($ga_adwords == 1) { ?>
        <script type="text/javascript">
            var google_conversion_id = <?php echo $ga_conversion_id; ?>;
            var google_conversion_language = "<?php echo $language; ?>";
            var google_conversion_format = "3";
            var google_conversion_color = "777";
            var google_conversion_label = "<?php echo $ga_label; ?>";
            var google_conversion_value = <?php echo round(($orderDetails['total'] - $orderDetails['order_tax']), 2); ?>;
            var google_conversion_currency = "<?php echo $currency; ?>";
            var google_remarketing_only = false;
        </script>
        <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
        <noscript>
            <div style="display:none;visibility:hidden">
                <img height="1" width="1" style="border-style:none;" alt=""
                     src="//www.googleadservices.com/pagead/conversion/<?php echo $ga_conversion_id; ?>/?<?php if (isset($orderDetails)) {
                         echo "value=" . round(($orderDetails['total'] - $orderDetails['order_tax']), 2);
                     } ?>&amp;currency_code=<?php echo $currency; ?>&amp;label=<?php echo $ga_label; ?>&amp;guid=ON&amp;script=0"/>
            </div>
        </noscript>
    <?php } ?>

<?php } ?>
<?php echo $footer; ?>