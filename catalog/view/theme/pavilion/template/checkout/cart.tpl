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
            </li>
            <?php } else { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
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
    <div class="master-column-wrapper"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'center-2'; ?>
        <?php } else { ?>
        <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="page shopping-cart-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?>
                        <?php if ($weight) { ?>
                        &nbsp;(<?php echo $weight; ?>)
                        <?php } ?>
                    </h1>
                </div>
                <div class="page-body">
                    <div class="order-summary-content">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="table-wrapper">
                                <table class="cart">
                                    <thead>
                                    <tr class="cart-header-row">
                                        <th><span class="item-count">#</span></th>
                                        <th class="remove-from-cart"
                                            data-hide="w410, w480, w580"><?php echo $button_remove; ?></th>
                                        <th class="product-picture"><?php echo $column_image; ?></th>
                                        <th class="product" data-hide="w410, w480"><?php echo $column_name; ?></th>
                                        <th class="quantity"
                                            data-hide="w410, w480, w580, w768"><?php echo $column_quantity; ?></th>
                                        <th class="unit-price"
                                            data-hide="w410, w480, w580, w768"><?php echo $column_price; ?></th>
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
                                        <td class="remove-from-cart">
                                            <div type="button" data-toggle="tooltip"
                                                 title="<?php echo $button_remove; ?>"
                                                 class="button2 remove-button"
                                                 onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                                            </div>
                                        </td>
                                        <td class="product-picture"><?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>"><img
                                                        src="<?php echo $product['thumb']; ?>"
                                                        alt="<?php echo $product['name']; ?>"
                                                        title="<?php echo $product['name']; ?>" class="img-thumbnail"/></a>
                                            <?php } ?></td>
                                        <td class="product">
                                            <a class="product-name"
                                               href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            <?php if (!$product['stock']) { ?>
                                            <span class="text-danger">***</span>
                                            <?php } ?>
                                            <div class="attributes">
                                                <?php if ($product['option']) { ?>
                                                <?php foreach ($product['option'] as $option) { ?>
                                                <br/>
                                                <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
                                                <?php } ?>
                                                <?php } ?>

                                                <?php if ($product['reward']) { ?>
                                                <br/>
                                                <?php echo $product['reward']; ?>
                                                <?php } ?>

                                                <?php if ($product['recurring']) { ?>
                                                <br/>
                                                <span><?php echo $text_recurring_item; ?></span>: <?php echo $product['recurring']; ?>
                                                <?php } ?>

                                                <br/>
                                                <?php echo $column_model; ?>: <?php echo $product['model']; ?>
                                            </div>
                                        </td>
                                        <td class="quantity">
                                            <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]"
                                                   value="<?php echo $product['quantity']; ?>" size="1"
                                                   class="qty-input"/>
                                        </td>
                                        <td class="unit-price "><span
                                                    class="product-unit-price"><?php echo $product['price']; ?></span>
                                        </td>
                                        <td class="subtotal"><span
                                                    class="product-subtotal"><?php echo $product['total']; ?></span>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                    <?php foreach ($vouchers as $voucher) { ?>
                                    <tr>
                                        <td>
                                            <span class="footable-toggle"></span>
                                            <span class="item-count">1</span>
                                        </td>
                                        <td class="remove-from-cart">
                                            <div type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                    class="remove-from-cart-button fa fa-remove"
                                                    onclick="voucher.remove('<?php echo $voucher['key']; ?>');">
                                            </div>
                                        </td>
                                        <td class="product-picture"></td>
                                        <td class="product"><?php echo $voucher['description']; ?></td>
                                        <td class="quantity">
                                                <input type="text" name="" value="1" size="1" disabled="disabled"
                                                       class="qty-input"/>
                                        </td>
                                        <td class="unit-price"><span
                                                    class="product-unit-price"><?php echo $voucher['amount']; ?></span>
                                        </td>
                                        <td class="subtotal"><span
                                                    class="product-subtotal"><?php echo $voucher['amount']; ?></span>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="cart-options">
                                <div class="common-buttons">
                                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>"
                                            class="button-2 update-cart-button"><?php echo $button_update; ?></button>
                                    <input type="button" onclick="setLocation('<?php echo $continue; ?>')"
                                           data-toggle="tooltip" title="<?php echo $button_shopping; ?>"
                                           class="button-2 continue-shopping-button"
                                           value="<?php echo $button_shopping; ?>"/>
                                </div>
                            </div>
                        </form>

                        <?php if ($modules) { ?>
                        <h2><?php echo $text_next; ?></h2>
                        <p><?php echo $text_next_choice; ?></p>
                        <?php } ?>
                        <div class="cart-footer">
                            <div class="cart-collaterals">
                                <?php if ($modules) { ?>
                                <?php foreach ($modules as $module) { ?>
                                <?php echo $module; ?>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <div class="totals">
                                <div class="total-info">
                                    <table class="cart-total">
                                        <?php foreach ($totals as $t => $total) { ?>
                                        <?php if($t+1<count($totals)) { ?>
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
                                <div class="checkout-buttons">
                                    <a href="<?php echo $checkout; ?>"
                                       class="button-1 checkout-button"><?php echo $button_checkout; ?></a>
                                </div>
                            </div>
                        </div>
                        <!--div class="buttons clearfix">
                          <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
                        </div!-->
                        <?php echo $content_bottom; ?></div>
                    <?php echo $column_right; ?></div>
            </div>
        </div>
    </div>
</div>
<script>$(".order-summary-content .cart").footable()</script>
<?php echo $footer; ?>
