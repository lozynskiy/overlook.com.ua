<?php echo $header; ?>
<div class="master-wrapper-content">
    <div class="breadcrumb">
        <ul itemscope itemtype="http://schema.org/BreadcrumbList">
            <?php foreach ($breadcrumbs as $cnt=> $breadcrumb) { ?>
            <?php if($cnt==0) { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
                    <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                <span class="delimiter">/</span>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } elseif($cnt+1<count($breadcrumbs)) { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                    <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                <span class="delimiter">/</span>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <?php } else { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="master-column-wrapper">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'center-2'; ?>
        <?php } else { ?>
        <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <div class="page order-details-page">
                <?php echo $content_top; ?>
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="order-overview">
                        <div class="order-number">
                            <strong><?php echo $text_order_id; ?> #<?php echo $order_id; ?></strong>
                        </div>
                        <div class="order-info">
                            <?php if ($invoice_no) { ?>
                            <span><?php echo $text_invoice_no; ?> <?php echo $invoice_no; ?></span><br>
                            <?php } ?>

                            <span><?php echo $text_date_added; ?> <?php echo $date_added; ?></span><br>

                        </div>
                        <div class="order-total">
                            <?php echo end($totals)['title']; ?>: <strong><?php echo end($totals)['text']; ?></strong>
                        </div>
                    </div>

                    <div class="order-details-area">
                        <ul class="billing-info">
                            <li class="title">
                                <?php echo $text_payment_address; ?>
                            </li>
                            <li>
                                <?php echo $payment_address; ?>
                            </li>

                            <?php if ($payment_method) { ?>
                            <li class="title">
                                <?php echo $text_payment; ?>
                            </li>
                            <li>
                                <?php echo $payment_method; ?>
                            </li>
                            <?php } ?>

                        </ul>
                        <ul class="shipping-info">
                            <li class="title">
                                <?php echo $text_shipping_address; ?>
                            </li>
                            <li>
                                <?php echo $payment_address; ?>
                            </li>
                            <?php if ($shipping_method) { ?>
                            <li class="title">
                                <?php echo $text_shipping; ?>
                            </li>
                            <li>
                                <?php echo $shipping_method; ?>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="section products">
                        <div class="table-wrapper">
                            <table class="data-table">
                                <thead>
                                <tr>
                                    <th class="item-count">#</th>
                                    <th class="name"><?php echo $column_name; ?></th>
                                    <th class="text-left"><?php echo $column_model; ?></th>
                                    <th class="quantity"
                                        data-hide="w410, w480, w580"><?php echo $column_quantity; ?></th>
                                    <th class="price" data-hide="w410, w480, w580"><?php echo $column_price; ?></th>
                                    <th class="total" data-hide="w410"><?php echo $column_total; ?></th>
                                    <?php if ($products) { ?>
                                    <th class="action" style="width: 150px" data-hide="w410, w480, w580, w768"><?php echo $column_action; ?></th>
                                    <?php } ?>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td></td>
                                    <td class="product">
                                        <strong><?php echo $product['name']; ?></strong>
                                        <?php foreach ($product['option'] as $option) { ?>
                                        <br/>
                                        <small> - <?php echo $option['name']; ?>
                                            : <?php echo $option['value']; ?></small>
                                        <?php } ?></td>
                                    <td class="model"><?php echo $product['model']; ?></td>
                                    <td class="quantity"><?php echo $product['quantity']; ?></td>
                                    <td class="unit-price"><?php echo $product['price']; ?></td>
                                    <td class="total"><?php echo $product['total']; ?></td>
                                    <td class="action">
                                        <div class="actions">
                                            <?php if ($product['reorder']) { ?>
                                            <input type="button"
                                                   data-toggle="tooltip"
                                                   title="<?php echo $button_reorder; ?>"
                                                   value="<?php echo $button_reorder; ?>"
                                                   class="re-order-button"
                                                   onclick="setLocation('<?php echo $product['reorder']; ?>')"/>
                                            <?php } ?>
                                            <input type="button"
                                                   data-toggle="tooltip"
                                                   title="<?php echo $button_return; ?>"
                                                   value="<?php echo $button_return; ?>"
                                                   class="return-items-button"
                                                   onclick="setLocation('<?php echo $product['return']; ?>')" />
                                        </div>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php foreach ($vouchers as $voucher) { ?>
                                <tr>
                                    <td class="text-left"><?php echo $voucher['description']; ?></td>
                                    <td class="text-left"></td>
                                    <td class="text-right">1</td>
                                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                                    <?php if ($products) { ?>
                                    <td></td>
                                    <?php } ?>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="section totals">
                        <div class="total-info">
                            <table class="cart-total">
                                <tbody>
                                <?php foreach ($totals as $t => $total) { ?>
                                <?php if($t+1<count($totals)) { ?>
                                <tr>
                                    <td class="cart-total-left"><?php echo $total['title']; ?></td>
                                    <td class="cart-total-right"><?php echo $total['text']; ?></td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td class="cart-total-left"><label><?php echo $total['title']; ?></label></td>
                                    <td class="cart-total-right"><strong><?php echo $total['text']; ?></strong></td>
                                </tr>
                                <?php } ?>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php if ($comment) { ?>
                    <div class="section comment">
                        <div class="page-title">
                            <h3><?php echo $text_comment; ?></h3>
                        </div>
                        <div class="table-wrapper">
                    <table class="data-table">
                        <tbody>
                        <tr>
                            <td class="cart-total-left"><?php echo $comment; ?></td>
                        </tr>
                        </tbody>
                    </table>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if ($histories) { ?>
                    <div class="page-title">
                        <h3><?php echo $text_history; ?></h3>
                    </div>
                    <div class="section history">
                        <div class="table-wrapper">
                            <table class="data-table">
                                <thead>
                                <tr>
                                    <td class="cart-total-left"><?php echo $column_date_added; ?></td>
                                    <td class="cart-total-left"><?php echo $column_status; ?></td>
                                    <td class="cart-total-left"><?php echo $column_comment; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($histories) { ?>
                                <?php foreach ($histories as $history) { ?>
                                <tr>
                                    <td class="cart-total-left"><?php echo $history['date_added']; ?></td>
                                    <td class="cart-total-left"><?php echo $history['status']; ?></td>
                                    <td class="cart-total-left"><?php echo $history['comment']; ?></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td colspan="3" class="cart-total-center"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script>$(".products .data-table").footable()</script>
<?php echo $footer; ?>