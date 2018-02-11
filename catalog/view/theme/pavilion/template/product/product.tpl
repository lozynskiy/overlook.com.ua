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
        <script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "BreadcrumbList",
            "itemListElement": [
                <?php $bi = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
                {
                    "@type": "ListItem",
                    "position": <?php echo $bi; ?>,
                    "item": {
                        "@id": "<?php echo $breadcrumb['href']; ?>",
                        "name": "<?php echo $breadcrumb['text']; ?>"
                    }
                }<?php echo ($bi != count($breadcrumbs)) ? ',' : '' ?>
                <?php $bi++; } ?>
            ]
        }
    </script>
    </div>
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
            <div class="page product-details-page">
                <div class="page-body">
                    <?php echo $content_top; ?>
                    <?php if ($column_left || $column_right) { ?>
                        <?php $class = 'col-sm-6'; ?>
                    <?php } else { ?>
                        <?php $class = 'col-sm-8'; ?>
                    <?php } ?>
                    <div class="product-essential">
                        <div class="gallery">
                            <?php if ($thumb || $images) { ?>
                                <div class="picture-wrapper">
                                    <?php if ($thumb) { ?>
                                            <img id="zoom" class="main-thumbnail"
                                                 data-zoom-image="<?php echo $popup; ?>"
                                                 src="<?php echo $thumb; ?>"
                                                 title="<?php echo $heading_title; ?>"
                                                 alt="<?php echo $heading_title; ?>"/>
                                    <?php } ?>
                                </div>
                                <?php if ($images) { ?>
                                    <div id="image-gallery" class="picture-thumbs in-carousel owl-carousel owl-theme">
                                        <?php if ($thumb) { ?>
                                            <a class="gallery-item"
                                               data-image="<?php echo $thumb; ?>"
                                               data-zoom-image="<?php echo $popup; ?>">
                                                <img src="<?php echo $mini_thumb; ?>"
                                                     title="<?php echo $heading_title; ?>"
                                                     alt="<?php echo $heading_title; ?>"/>
                                            </a>
                                        <?php } ?>
                                        <?php foreach ($images as $image) { ?>
                                            <a class="gallery-item"
                                               data-image="<?php echo $image['image']; ?>"
                                               data-zoom-image="<?php echo $image['popup']; ?>">
                                                <img src="<?php echo $image['thumb']; ?>"
                                                     title="<?php echo $heading_title; ?>"
                                                     alt="<?php echo $heading_title; ?>"/>
                                            </a>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                            <?php } ?>
                        </div>
                        <div class="overview" id="product">

                            <?php if ($manufacturer) { ?>
                                <div class="manufacturers">
                                    <span class="label"><?php echo $text_manufacturer; ?></span>
                                    <span class="value">
                                        <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
                                    </span>
                                </div>
                            <?php } ?>
                            <div class="product-name">
                                <h1><?php echo $heading_title; ?></h1>
                            </div>
                            <?php if ($review_status) { ?>
                                <div class="product-reviews-overview">
                                    <div class="product-review-box">
                                        <div class="rating">
                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                <?php if ($rating < $i) { ?>
                                                    <span class="fa fa-stack"><i
                                                                class="fa fa-star-o fa-stack-1x"></i></span>
                                                <?php } else { ?>
                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                                                class="fa fa-star-o fa-stack-1x"></i></span>
                                                <?php } ?>
                                            <?php } ?>
                                        </div>
                                        <a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('.scrolled').offset().top - 50}, 800);"><?php echo $reviews; ?></a>
                                    </div>
                                </div>
                            <?php } ?>

                            <?php if ($price) { ?>
                                <div class="prices">
                                    <?php if (!$special) { ?>
                                        <div class="product-price">
                                            <?php echo $price; ?>
                                        </div>
                                    <?php } else { ?>
                                        <div class="product-price">
                                            <?php echo $special; ?>
                                        </div>
                                        <div class="old-product-price">
                                            <?php echo $price; ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <div class="additional-details">
                                <?php if ($tax) { ?>
                                    <p><?php echo $text_tax; ?><?php echo $tax; ?></p>
                                <?php } ?>
                                <?php if ($points) { ?>
                                    <p><?php echo $text_points; ?><?php echo $points; ?></p>
                                <?php } ?>
                                <?php if ($discounts) { ?>
                                    <p><hr></p>
                                    <?php foreach ($discounts as $discount) { ?>
                                        <p><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></p>
                                    <?php } ?>
                                <?php } ?>
                                <span class="label"><?php echo $text_model; ?></span><span
                                        class="value"><?php echo $model; ?></span><br/>
                                <?php if ($reward) { ?>
                                    <span class="label"><?php echo $text_reward; ?></span><span
                                            class="value"><?php echo $reward; ?></span><br/>
                                <?php } ?>
                            </div>
                            <?php if(isset($sizechart) && !empty($sizechart)){ ?>
                                <div class="sizechart">
                                    <span class="value">
                                        <a href="#" data-toggle="modal" data-target="#sizeChartModal"><?php echo $text_sizechart; ?></a>
                                    </span>
                                </div>
                            <?php } ?>
                            <div class="attributes">
                                <?php if ($options) { ?>
                                    <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt" for="input-option<?php echo $option['product_option_id']; ?>">
                                                    <?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?>
                                                </label>
                                                <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                        id="input-option<?php echo $option['product_option_id']; ?>">
                                                    <option value=""><?php echo $text_select; ?></option>
                                                    <?php $count = count($option['product_option_value']); ?>
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <option value="<?php echo $option_value['product_option_value_id']; ?>"
                                                            <?php echo (($option_value['selected'] || $count == 1 ) ? 'selected' : ''); ?>
                                                            href="<?php if ($option_value['href']) echo $option_value['href']; ?>">
                                                            <?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <ul class="option-list attribute-squares color-squares"
                                                    id="input-option<?php echo $option['product_option_id']; ?>">
                                                    <?php $count = count($option['product_option_value']); ?>
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <li <?php echo (($option_value['selected'] || $count == 1 ) ? 'class="selected-value"' : '' ); ?>>
                                                                <label>
                                                                    <span class="attribute-square-container text">
                                                                        <?php if ($option_value['href']) { ?><a href="<?php echo $option_value['href']; ?>"><?php } ?>
                                                                            <span class="attribute-square">
                                                                                <?php if ($option_value['image']) { ?>
                                                                                    <img src="<?php echo $option_value['image']; ?>"
                                                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                                         class="img-thumbnail"/>
                                                                                <?php }  else { ?>
                                                                                    <?php echo $option_value['name']; ?>
                                                                                    <?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
                                                                                <?php } ?>
                                                                            </span>
                                                                        <?php echo ($option_value['href'] ? '</a>' : ''); ?>
                                                                    </span>
                                                                    <input type="radio"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"
                                                                           <?php echo (($option_value['selected'] || $count == 1 ) ? 'checked="true"' : ''); ?>/>
                                                                </label>
                                                        </li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"
                                                                       name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                <?php if ($option_value['image']) { ?>
                                                                    <img src="<?php echo $option_value['image']; ?>"
                                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                         class="img-thumbnail"/>
                                                                <?php } ?>
                                                                <?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </label>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <input type="text"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option['value']; ?>"
                                                       placeholder="<?php echo $option['name']; ?>"
                                                       id="input-option<?php echo $option['product_option_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                          rows="5" placeholder="<?php echo $option['name']; ?>"
                                                          id="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['value']; ?></textarea>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <button type="button"
                                                        id="button-upload<?php echo $option['product_option_id']; ?>"
                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                        class="button-1"><i
                                                            class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                </button>
                                                <input type="hidden"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value=""
                                                       id="input-option<?php echo $option['product_option_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <div class="input-group date">
                                                    <input type="text"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option['value']; ?>"
                                                           data-date-format="YYYY-MM-DD"
                                                           id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                    <span class="input-group-btn">
                                                        <button class="button-1" type="button"><i
                                                                    class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <div class="input-group datetime">
                                                    <input type="text"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option['value']; ?>"
                                                           data-date-format="YYYY-MM-DD HH:mm"
                                                           id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                    <span class="input-group-btn">
                                                        <button type="button" class="button-1"><i
                                                                    class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <div class="form-group">
                                                <label class="text-prompt" class="control-label"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?><?php echo($option['required'] ? '<span class="required">*</span>' : ''); ?></label>
                                                <div class="input-group time">
                                                    <input type="text"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option['value']; ?>"
                                                           data-date-format="HH:mm"
                                                           id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                    <span class="input-group-btn">
                                                        <button type="button" class="button-1"><i
                                                                    class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                            <?php if ($config_stock_display) { ?>
                                <div class="availability">
                                    <div class="stock">
                                        <span class="label"><?php echo $text_stock; ?></span>
                                        <span class="value"><?php echo $stock; ?></span>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($recurrings) { ?>
                                <hr>
                                <div class="form-group">
                                    <label class="text-prompt"><?php echo $text_payment_recurring; ?><span
                                                class="required">*</span>
                                    </label>
                                    <select name="recurring_id">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($recurrings as $recurring) { ?>
                                            <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                        <?php } ?>
                                    </select>
                                    <div class="help-block" id="recurring-description"></div>
                                </div>
                            <?php } ?>
                            <div class="add-to-cart">
                                <?php if ($allow_checkout) { ?>
                                    <div class="add-to-cart-panel">
                                        <label class="qty-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                                               id="input-quantity" class="qty-input"/>
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                        <div class="ajax-cart-button-wrapper">
                                            <input type="button" id="button-cart"
                                                   data-loading-text="<?php echo $text_loading; ?>"
                                                   class="button-1 add-to-cart-button"
                                                   value="<?php echo $button_cart; ?>"/>
                                        </div>
                                    </div>
                                <?php } else { ?>
                                    <div class="add-to-cart-panel">
                                        <div class="ajax-cart-button-wrapper">
                                            <input type="button"
                                                   class="button-1 out-of-stock-button"
                                                   value="<?php echo $button_out_of_stock; ?>"/>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                            <div class="overview-buttons">
                                <div class="add-to-wishlist">
                                    <input type="button" data-toggle="tooltip"
                                           class="button-2 add-to-wishlist-button"
                                           title="<?php echo $button_wishlist; ?>"
                                           onclick="GaListAddToWishlist(product, GaList.ProductDetail)"/>
                                </div>
                                <div class="compare-products">
                                    <input type="button" data-toggle="tooltip"
                                           class="button-2 add-to-compare-list-button"
                                           title="<?php echo $button_compare; ?>"
                                           onclick="GaListAddToCompare(product, GaList.ProductDetail)"/>
                                </div>
                            </div>
                            <?php if ($minimum > 1) { ?>
                                <div class="alert alert-info"><i
                                            class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                            <?php } ?>
                            <!--div class="overview-bottom">
                                <div class="product-social-buttons">
                                    <label>Share:</label>
                                    <div class="social-sharing addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>">
                                        <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                                        <a class="addthis_button_tweet"></a>
                                        <a class="addthis_button_pinterest_pinit"></a>
                                        <a class="addthis_counter addthis_pill_style"></a>
                                    </div>
                                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                                </div>
                            </div!-->


                        </div>
                    </div>
                </div>
                <div class="ui-tabs scrolled">
                    <div class="productTabs-header">
                        <ul class="ui-tabs-nav">
                            <?php if (strlen($description) > 0) { ?>
                            <li><a href="#tab-description"
                                                  data-toggle="tab"><?php echo $tab_description; ?></a></li>
                            <?php } ?>
                            <?php if ($attribute_groups) { ?>
                                <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a>
                                </li>
                            <?php } ?>
                            <?php if ($review_status) { ?>
                                <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="productTabs-body tab-content">
                        <?php if (strlen($description) > 0) { ?>
                        <div class="tab-pane ui-tabs-panel" id="tab-description">
                            <div class="full-description">
                                <?php echo $description; ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($attribute_groups) { ?>
                            <div class="tab-pane ui-tabs-panel" id="tab-specification">
                                <div class="product-specs-box">
                                    <div class="table-wrapper">
                                        <table class="data-table">
                                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                                <thead>
                                                <tr>
                                                    <td class="title" colspan="2">
                                                        <strong><?php echo $attribute_group['name']; ?></strong></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                    <tr>
                                                        <td class="spec-name"><?php echo $attribute['name']; ?></td>
                                                        <td class="spec-value"><?php echo $attribute['text']; ?></td>
                                                    </tr>
                                                <?php } ?>
                                                </tbody>
                                            <?php } ?>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                            <div class="tab-pane ui-tabs-panel" id="tab-review">
                                <div class="product-reviews-page">
                                    <form class="write-review" id="form-review">
                                        <div class="product-review-list" id="review"></div>
                                        <div class="title">
                                            <strong><?php echo $text_write; ?></strong>
                                        </div>
                                        <?php if ($review_guest) { ?>
                                            <div class="form-fields">
                                                <div class="inputs">
                                                    <label for="input-name"><?php echo $entry_name; ?></label>
                                                    <input type="text" name="name" value="<?php echo $customer_name; ?>"
                                                           id="input-name" class="review-title"/>
                                                </div>
                                                <div class="inputs">
                                                    <label for="input-review"><?php echo $entry_review; ?></label>
                                                    <textarea name="text" rows="5" id="input-review"
                                                              class="review-text"></textarea>
                                                    <div class="help-block"><?php echo $text_note; ?></div>
                                                </div>
                                                <div class="review-rating">
                                                    <label><?php echo $entry_rating; ?></label>
                                                    <select id="ratingme" name="rating">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#ratingme').barrating({
                                                                theme: 'fontawesome-stars'
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <?php echo $captcha; ?>
                                            <div class="buttons">
                                                <input type="button" id="button-review"
                                                       data-loading-text="<?php echo $text_loading; ?>"
                                                       class="button-1 write-product-review-button"
                                                       value="<?php echo $button_continue; ?>"/>
                                            </div>
                                        <?php } else { ?>
                                            <?php echo $text_login; ?>
                                        <?php } ?>
                                    </form>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>

            </div>
            <?php if ($products) { ?>
                <div class="related-products-grid product-grid">
                    <div class="title"><strong><?php echo $text_related; ?></strong></div>
                    <div class="item-grid owl-carousel">
                        <?php $i = 0; ?>
                        <?php foreach ($products as $product) { ?>
                            <?php if ($column_left && $column_right) { ?>
                                <?php $class = 'col-xs-8 col-sm-6'; ?>
                            <?php } elseif ($column_left || $column_right) { ?>
                                <?php $class = 'col-xs-6 col-md-4'; ?>
                            <?php } else { ?>
                                <?php $class = 'col-xs-6 col-sm-3'; ?>
                            <?php } ?>
                            <div class="item-box">
                                <div class="product-item">
                                    <div class="picture"><a href="<?php echo $product['href']; ?>"><img
                                                    src="<?php echo $product['thumb']; ?>"
                                                    alt="<?php echo $product['name']; ?>"
                                                    title="<?php echo $product['name']; ?>" class="img-responsive"/></a>
                                    </div>
                                    <div class="details">
                                        <div class="product-rating-box">
                                            <div class="rating">
                                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                    <?php if ($product['rating'] < $i) { ?>
                                                        <span class="fa fa-stack"><i
                                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                                    <?php } else { ?>
                                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                                    <?php } ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <h2 class="product-title"><a
                                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </h2>
                                        <div class="add-info">
                                            <?php if ($product['price']) { ?>
                                                <div class="prices">
                                                    <?php if (!$product['special']) { ?>
                                                        <span class="price actual-price"><?php echo $product['price']; ?></span>
                                                    <?php } else { ?>
                                                        <span class="price actual-price"><?php echo $product['special']; ?></span>
                                                        <span class="price old-price"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                            <div class="description"><?php echo $product['description']; ?></div>
                                            <div class="buttons-upper">
                                                <input class="button-2 add-to-wishlist-button" type="button"
                                                       data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                                                       onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></input>
                                                <input class="button-2 add-to-compare-list-button" type="button"
                                                       data-toggle="tooltip" title="<?php echo $button_compare; ?>"
                                                       onclick="compare.add('<?php echo $product['product_id']; ?>');"></input>
                                            </div>
                                            <div class="buttons-lower">
                                                <button class="button-2 product-box-add-to-cart-button" type="button"
                                                        onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                                    <span><?php echo $button_cart; ?></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if (($column_left && $column_right) && (($i + 1) % 2 == 0)) { ?>
                                <div class="clearfix visible-md visible-sm"></div>
                            <?php } elseif (($column_left || $column_right) && (($i + 1) % 3 == 0)) { ?>
                                <div class="clearfix visible-md"></div>
                            <?php } elseif (($i + 1) % 4 == 0) { ?>
                                <div class="clearfix visible-md"></div>
                            <?php } ?>
                            <?php $i++; ?>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>
            <?php if ($tags) { ?>
                <p><?php echo $text_tags; ?>
                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                        <?php if ($i < (count($tags) - 1)) { ?>
                            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                        <?php } else { ?>
                            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                        <?php } ?>
                    <?php } ?>
                </p>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script type="application/ld+json">{
   "@context":"http://schema.org",
   "@type":"Product",
   "url":"<?php echo $breadcrumbs[count($breadcrumbs)-1]['href']; ?>",
        "category":"<?php echo $breadcrumbs[count($breadcrumbs)-2]['text']; ?>",
        "image":"<?php echo $popup; ?>",
        "brand":"<?php echo str_replace('"', '', $manufacturer); ?>",
        "manufacturer":"<?php echo str_replace('"', '', $manufacturer); ?>",
        "model":"<?php echo $model; ?>",
    <?php if($reviews_count > 0)   {?>
        "aggregateRating":{
            "@type":"AggregateRating",
            "ratingValue":"<?php echo $rating; ?>",
            "reviewCount":"<?php echo $reviews_count; ?>"
        },
      <?php } ?>
        "description":"<?php echo str_replace('"', '', strip_tags($description)); ?>",
        "name":"<?php echo $heading_title; ?>",
        "offers":{
            "@type":"Offer",
            "availability":"http://schema.org/<?php echo ($allow_checkout) ? "InStock" : "OutOfStock"; ?>",
            "price":"<?php echo ceil($price_unformated); ?>",
            "priceCurrency":"<?php echo $price_currency; ?>"
        }
        <?php if (isset($microdata_reviews) && $microdata_reviews && $config_product_reviews)  {?>,
            "review":[
         <?php $ri = 1; foreach ($microdata_reviews as $review_item) { ?>
         {
               "@type":"Review",
               "author":"<?php echo $review_item['author']; ?>",
               "datePublished":"<?php echo $review_item['date_added']; ?>",
               "description":"<?php echo $review_item['text']; ?>",
               "reviewRating":{
                  "@type":"Rating",
                  "bestRating":"5",
                  "ratingValue":"<?php echo $review_item['rating']; ?>",
                  "worstRating":"1"
               }
            } <?php if($ri != count($microdata_reviews)) { ?>,<?php } ?><?php $ri++; } ?>
      ] <?php }  ?>

        <?php if (isset($attribute_groups)) { ?>,
         "additionalProperty":[
            <?php $ag = 1; foreach ($attribute_groups as $attribute_group) {?>
                <?php $ai = 1; foreach ($attribute_group['attribute'] as $attribute) {?>
                     {
                     "@type":"PropertyValue",
                     "name":"<?php echo str_replace('"', '', $attribute['name']); ?>",
                     "value":"<?php echo str_replace('"', '', $attribute['text']); ?>"
                  } <?php if($ai != count($attribute_group['attribute'] ) or $ag != count($attribute_groups)) { ?>,<?php } ?>
                    <?php $ai++; } ?>
                <?php $ag++;} ?>
         ]
        <?php } ?>
}</script>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    var product = {
        id: '<?php echo $product_id; ?>',
        name: '<?php echo $heading_title; ?>',
        model: '<?php echo $model; ?>',
        sku: '<?php echo $sku; ?>',
        category: '<?php echo $category; ?>',
        brand: '<?php echo $manufacturer; ?>',
        price: '<?php if (!$special) { ?><?php echo $price_0; ?><?php } else { ?><?php echo $special_0; ?><?php } ?>',
        //qty: $('#input-quantity').val()
    }
    GaProductDetail(product);
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');

                    GaProductAddToCart(product, $('#input-quantity').val())
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--

    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });
    //    $.ajax({
    //        url: 'index.php?route=product/product/review&product_id=<?php //echo $product_id; ?>//',
    //        type: 'post',
    //        dataType: 'html',
    //        async: true,
    //        success: function (html) {
    //            $('#review').html(html);
    //        }
    //    })

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    //    $(document).ready(function () {
    //        $('.thumbnails').magnificPopup({
    //            type: 'image',
    //            delegate: 'a',
    //            gallery: {
    //                enabled: true
    //            }
    //        });
    //    });

    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })
    $(document).ready(function () {
        $('#image-gallery').owlCarousel({
            loop: false,
            nav: false,
            dots: false,
            navText: ['<i class="fa fa-chevron-left fa-1x"></i>', '<i class="fa fa-chevron-right fa-1x"></i>'],
            responsiveClass: true,
            responsive: {
                0: {
                    nav: false,
                    margin: 5,
                    items: 3
                },
                480: {
                    nav: false,
                    margin: 5,
                    items: 4
                },
                992: {
                    nav: false,
                    margin: 5,
                    items: 5
                }
            }
        });
    });
    $(document).ready(function () {
        $('.item-grid').owlCarousel({
            loop: false,
            nav: true,
            dots: false,
            navText: ['<i class="fa fa-chevron-left fa-1x"></i>', '<i class="fa fa-chevron-right fa-1x"></i>'],
            responsiveClass: true,
            responsive: {
                0: {
                    margin: 10,
                    items: 2,
                    nav: true
                },
                460: {
                    margin: 10,
                    items: 3,
                    nav: true
                },
                745: {
                    margin: 10,
                    items: 4,
                    nav: true
                },
                1000: {
                    margin: 15,
                    items: 5,
                    nav: true
                }
            }
        });
    });
    $("#zoom").elevateZoom({
        gallery:'image-gallery',
        cursor: 'pointer',
        galleryActiveClass: 'active',
        imageCrossfade: true,
        zoomWindowPosition: "product",
        zoomWindowWidth: $("#product").outerWidth(),
        zoomWindowHeight: $("#product").outerHeight(),
        borderSize: 2
    });
    $("#zoom").on("click", function() {
        var ez = $('#zoom').data('elevateZoom');
        $.fancybox(ez.getGalleryList());
        return false;
    });
    $('#image-gallery a:first').addClass('active');

    //--></script>
<script type="text/javascript">
    $('.attributes select').change(function(){
        var link = $(this).find('option:selected').attr('href')
        if (typeof link != 'undefined'){
            if (link.length > 0) window.location = link;
        }
    })
    $(document).ready(function () {
        $('.attributes .option-list').delegate('input', 'click', function () {
            $(this).closest('.option-list').find('li').removeClass('selected-value');
            $(this).closest('li').addClass('selected-value');
        });
    });
    $('.ui-tabs ul li:first').addClass('active');
    $('.tab-content .ui-tabs-panel:first').addClass('active');
</script>
<?php if(isset($sizechart) && !empty($sizechart)){ ?>
<div id="sizeChartModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <span class="modal-title"><?php echo $text_sizechart; ?></span>
            </div>
            <div class="modal-body">
                <?php echo html_entity_decode($sizechart['description'], ENT_QUOTES, 'UTF-8'); ?>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<?php echo $footer; ?>
