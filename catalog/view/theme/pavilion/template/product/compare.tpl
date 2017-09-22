<?php echo $header; ?>
<div class="master-wrapper-content">
    <div class="breadcrumb">
        <ul>
            <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                <?php if ($cnt + 1 < count($breadcrumbs)) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>">
                            <span><?php echo $breadcrumb['text']; ?></span>
                        </a>
                        <span class="delimiter">/</span>
                    </li>
                <?php } else { ?>
                    <li>
                        <strong class="current-item"><?php echo $breadcrumb['text']; ?></strong>
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
            <div class="page compare-products-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="table-wrapper">
                        <?php if ($products) { ?>

                            <?php if (count($products) == 1) { ?>
                                <?php $width = '90%'; ?>
                            <?php } elseif (count($products) == 2) { ?>
                                <?php $width = '45%'; ?>
                            <?php } elseif (count($products) == 3) { ?>
                                <?php $width = '30%'; ?>
                            <?php } elseif (count($products) >= 4) { ?>
                                <?php $width = '22.5%'; ?>
                            <?php } ?>

                            <table class="compare-products-table">
                                <thead>
                                <tr>
                                    <td colspan="<?php echo count($products) + 1; ?>">
                                        <strong><?php echo $text_product; ?></strong>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="product-name">
                                    <td><label><?php echo $text_name; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>">
                                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </td>
                                    <?php } ?>
                                </tr>
                                <tr class="product-picture">
                                    <td><label><?php echo $text_image; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php if ($product['thumb']) { ?>
                                                <a class="picture" href="<?php echo $product['href']; ?>">
                                                    <img src="<?php echo $product['thumb']; ?>"
                                                         alt="<?php echo $product['name']; ?>"
                                                         title="<?php echo $product['name']; ?>"/>
                                                </a>
                                            <?php } ?>
                                        </td>
                                    <?php } ?>
                                </tr>
                                <tr class="product-price">
                                    <td><label><?php echo $text_price; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>">
                                            <?php if ($product['price']) { ?>
                                                <?php if (!$product['special']) { ?>
                                                    <?php echo $product['price']; ?>
                                                <?php } else { ?>
                                                    <?php echo $product['special']; ?>
                                                    <s><?php echo $product['price']; ?></s>
                                                <?php } ?>
                                            <?php } ?>
                                        </td>
                                    <?php } ?>
                                </tr>
                                <tr class="product-model">
                                    <td><label><?php echo $text_model; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['model']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr class="product-manufacturer">
                                    <td><label><?php echo $text_manufacturer; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['manufacturer']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr class="product-stock">
                                    <td><label><?php echo $text_availability; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['availability']; ?></td>
                                    <?php } ?>
                                </tr>
                                <?php if ($review_status) { ?>
                                    <tr class="specification">
                                        <td><label><?php echo $text_rating; ?></label></td>
                                        <?php foreach ($products as $product) { ?>
                                            <td class="rating" style="width: <?php echo $width; ?>">
                                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                    <?php if ($product['rating'] < $i) { ?>
                                                        <span class="fa fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                    </span>
                                                    <?php } else { ?>
                                                        <span class="fa fa-stack">
                                        <i class="fa fa-star fa-stack-1x"></i>
                                        <i class="fa fa-star-o fa-stack-2x"></i>
                                    </span>
                                                    <?php } ?>
                                                <?php } ?>
                                                <br/>
                                                <?php echo $product['reviews']; ?>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                <?php } ?>
                                <tr class="specification">
                                    <td><label><?php echo $text_summary; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['description']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr class="specification">
                                    <td><label><?php echo $text_weight; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['weight']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr class="specification">
                                    <td><label><?php echo $text_dimension; ?></label></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>"><?php echo $product['length']; ?>
                                            x <?php echo $product['width']; ?> x <?php echo $product['height']; ?>
                                        </td>
                                    <?php } ?>
                                </tr>
                                </tbody>
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                    <tr>
                                        <td colspan="<?php echo count($products) + 1; ?>">
                                            <strong><?php echo $attribute_group['name']; ?></strong>
                                        </td>
                                    </tr>
                                    </thead>
                                    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                        <tbody>
                                        <tr class="specification">
                                            <td><label><?php echo $attribute['name']; ?></label></td>
                                            <?php foreach ($products as $product) { ?>
                                                <?php if (isset($product['attribute'][$key])) { ?>
                                                    <td style="width: <?php echo $width; ?>">
                                                        <?php echo $product['attribute'][$key]; ?>
                                                    </td>
                                                <?php } else { ?>
                                                    <td style="width: <?php echo $width; ?>"></td>
                                                <?php } ?>
                                            <?php } ?>
                                        </tr>
                                        </tbody>
                                    <?php } ?>
                                <?php } ?>
                                <tr class="specification">
                                    <td class="empty"></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td style="width: <?php echo $width; ?>">
                                            <input type="button" class="button-2 add-to-cart-button"
                                                   title="<?php echo $button_cart; ?>"
                                                   onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"/>
                                            <input onclick="setLocation('<?php echo $product['remove']; ?>')"
                                                   class="button-2 remove-button"
                                                   title="<?php echo $button_remove; ?>"/>
                                        </td>
                                    <?php } ?>
                                </tr>
                            </table>


                            <table class="compare-products-table-mobile data-table">
                                <thead>
                                <tr>
                                    <th><span class="item-count">#</span></th>
                                    <th class="empty" data-hide="w410, w480, w580, w768"></th>
                                    <th><?php echo $text_image; ?></th>
                                    <th class="product-name"><?php echo $text_name; ?></th>
                                    <th data-hide="w410, w480, w580"><?php echo $text_price; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_model; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_manufacturer; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_availability; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_rating; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_summary; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_weight; ?></th>
                                    <th data-hide="w410, w480, w580, w768, w980"><?php echo $text_dimension; ?></th>

                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                        <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                            <th data-hide="w410, w480, w580, w768, w980"><?php echo $attribute['name']; ?></th>
                                        <?php } ?>
                                    <?php } ?>

                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td>
                                            <span class="item-count">1</span>
                                        </td>
                                        <td>
                                            <input type="button" class="button-2 add-to-cart-button"
                                                   title="<?php echo $button_cart; ?>"
                                                   onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"/>
                                            <input onclick="setLocation('<?php echo $product['remove']; ?>')"
                                                   class="button-2 remove-button"
                                                   title="<?php echo $button_remove; ?>"/>
                                        </td>
                                        <td>
                                            <img src="<?php echo $product['thumb']; ?>"
                                                 alt="<?php echo $product['name']; ?>"
                                                 title="<?php echo $product['name']; ?>"/>
                                        </td>
                                        <td>
                                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </td>
                                        <td>
                                            <?php if ($product['price']) { ?>
                                                <?php if (!$product['special']) { ?>
                                                    <?php echo $product['price']; ?>
                                                <?php } else { ?>
                                                    <?php echo $product['special']; ?>
                                                    <s><?php echo $product['price']; ?></s>
                                                <?php } ?>
                                            <?php } ?>
                                        </td>
                                        <td><?php echo $product['model']; ?></td>
                                        <td><?php echo $product['manufacturer']; ?></td>
                                        <td><?php echo $product['availability']; ?></td>
                                        <td>
                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                <?php if ($product['rating'] < $i) { ?>
                                                    <span class="fa fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                    </span>
                                                <?php } else { ?>
                                                    <span class="fa fa-stack">
                                        <i class="fa fa-star fa-stack-1x"></i>
                                        <i class="fa fa-star-o fa-stack-2x"></i>
                                    </span>
                                                <?php } ?>
                                            <?php } ?>
                                            <br/>
                                            <?php echo $product['reviews']; ?>
                                        </td>
                                        <td><?php echo $product['description']; ?></td>
                                        <td><?php echo $product['weight']; ?></td>
                                        <td><?php echo $product['length']; ?> x <?php echo $product['width']; ?>
                                            x <?php echo $product['height']; ?></td>

                                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>

                                                <?php if (isset($product['attribute'][$key])) { ?>
                                                    <td><?php echo $product['attribute'][$key]; ?></td>
                                                <?php } else { ?>
                                                    <td></td>
                                                <?php } ?>

                                            <?php } ?>
                                        <?php } ?>

                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>

                        <?php } else { ?>
                            <div class="no-data"><?php echo $text_empty; ?></div>
                            <div class="buttons">
                                <a href="<?php echo $continue; ?>"
                                   class="button-1"><?php echo $button_continue; ?>
                                </a>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script>$(".compare-products-table-mobile").footable()</script>
<?php echo $footer; ?>
