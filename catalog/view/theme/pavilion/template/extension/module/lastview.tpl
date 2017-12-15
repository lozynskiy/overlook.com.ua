<div class="related-products-grid product-grid">
    <div class="title"><strong><?php echo $heading_title; ?></strong></div>
    <div class="row lastview owl-carousel owl-theme">
        <?php foreach ($products as $p => $product) { ?>
            <div class="item-box">
                <div class="product-item">
                    <script>
                        var lastview<?php echo $product['product_id']; ?> = {
                            id: '<?php echo $product['product_id']; ?>',
                            name: '<?php echo $product['name']; ?>',
                            model: '<?php echo $product['model']; ?>',
                            sku: '<?php echo $product['sku']; ?>',
                            brand: '<?php echo $product['manufacturer']; ?>',
                            category: '<?php echo $product['category']; ?>',
                            position: <?php echo $p; ?>
                        }
                    </script>
                    <div class="picture"><a onclick="GaListLink(lastview<?php echo $product['product_id']; ?>, GaList.Lastview); return false;"
                                    href="<?php echo $product['href']; ?>"><img
                                    src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                    title="<?php echo $product['name']; ?>" class="img-responsive"/></a></div>
                    <div class="details">
                        <div class="product-rating-box">
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($product['rating'] < $i) { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } else { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <h2 class="product-title"><a onclick="GaListLink(lastview<?php echo $product['product_id']; ?>, GaList.Lastview); return false;"
                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
                        <div class="add-info">
                            <?php if ($product['price']) { ?>
                                <div class="prices">
                                    <?php if (!$product['special']) { ?>
                                        <span class="price actual-price"><?php echo $product['price']; ?></span>
                                    <?php } else { ?>
                                        <span class="price actual-price"><?php echo $product['special']; ?></span> <span
                                                class="price old-price"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                        <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <div class="description"><?php echo $product['description']; ?></div>
                            <div class="buttons-upper">
                                <input class="button-2 add-to-wishlist-button" type="button" data-toggle="tooltip"
                                       title="<?php echo $button_wishlist; ?>"
                                       onclick="GaListAddToWishlist(lastview<?php echo $product['product_id']; ?>, GaList.Lastview)">
                                <input class="button-2 add-to-compare-list-button" type="button" data-toggle="tooltip"
                                       title="<?php echo $button_compare; ?>"
                                       onclick="GaListAddToCompare(lastview<?php echo $product['product_id']; ?>, GaList.Lastview)">
                            </div>
                            <div class="buttons-lower">
                                <button class="button-2 product-box-add-to-cart-button" type="button"
                                        onclick="GaListAddToCart(lastview<?php echo $product['product_id']; ?>, GaList.Lastview, 1)">
                                    <span><?php echo $button_cart; ?></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
    <script>
        if (typeof ga != 'undefined') {
            <?php foreach ($products as $p => $product) { ?>
            ga('ec:addImpression', {
                'id': '<?php echo $product['product_id']; ?>',
                'name': '<?php echo $product['name']; ?>',
                'model': '<?php echo $product['model']; ?>',
                'sku': '<?php echo $product['sku']; ?>',
                'category': '<?php echo $product['category']; ?>',
                'brand': '<?php echo $product['manufacturer']; ?>',
                'list': GaList.Lastview,
                'position': <?php echo $p; ?>
            });
            <?php } ?>
            ga('send', 'event', 'Ecommerce', 'Impression', GaList.Lastview, {'nonInteraction': 1});
        }
    </script>
    <script>
        $(document).ready(function () {
            $('.lastview.owl-carousel').owlCarousel({
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
    </script>
</div>
