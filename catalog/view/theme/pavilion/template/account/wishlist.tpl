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
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
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
                <?php echo $content_top; ?>
                <div class="page wishlist-page">
                    <div class="page-title">
                        <h2><?php echo $heading_title; ?></h2>
                    </div>
                    <div class="page-body">
                        <div class="wishlist-content">
                            <?php if ($products) { ?>
                                <div class="table-wrapper">
                                    <table class="cart">
                                        <thead>
                                        <tr>
                                            <th class="item-count">#</th>
                                            <th class="product-picture"><?php echo $column_image; ?></th>
                                            <th class="product" data-hide="w410, w480"><?php echo $column_name; ?></th>
                                            <th class="model"
                                                data-hide="w410, w480, w580"><?php echo $column_model; ?></th>
                                            <th class="stock"
                                                data-hide="w410, w480, w580"><?php echo $column_stock; ?></th>
                                            <th class="unit-price"><?php echo $column_price; ?></th>
                                            <th class="action"
                                                data-hide="w410, w480, w580, w768"><?php echo $column_action; ?></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($products as $product) { ?>
                                            <tr class="cart-item-row">
                                                <td></td>
                                                <td class="product-picture"><?php if ($product['thumb']) { ?>
                                                        <a href="<?php echo $product['href']; ?>"><img
                                                                    src="<?php echo $product['thumb']; ?>"
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"/></a>
                                                    <?php } ?></td>
                                                <td class="product"><a
                                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                </td>
                                                <td class="model"><?php echo $product['model']; ?></td>
                                                <td class="stock"><?php echo $product['stock']; ?></td>
                                                <td class="unit-price"><?php if ($product['price']) { ?>
                                                        <div class="price">
                                                            <?php if (!$product['special']) { ?>
                                                                <?php echo $product['price']; ?>
                                                            <?php } else { ?>
                                                                <b><?php echo $product['special']; ?></b>
                                                                <s><?php echo $product['price']; ?></s>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>
                                                </td>
                                                <td class="action">
                                                    <div class="actions">
                                                        <input type="button"
                                                               data-toggle="tooltip"
                                                               title="<?php echo $button_cart; ?>"
                                                               class="button-2 add-to-cart-button"
                                                               onclick="cart.add('<?php echo $product['product_id']; ?>');"/>
                                                        <input type="button"
                                                               data-toggle="tooltip"
                                                               title="<?php echo $button_remove; ?>"
                                                               class="button-2 remove-button"
                                                               onclick="setLocation('<?php echo $product['remove']; ?>')"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php } else { ?>
                                <div class="no-data"><?php echo $text_empty; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
    <script>$(".wishlist-content .cart").footable()</script>
<?php echo $footer; ?>