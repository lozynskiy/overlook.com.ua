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
    <div class="master-column-wrapper">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'center-2'; ?>
        <?php } else { ?>
            <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="page blogpost-page">
                <div class="page-body">
                    <div class="post">
                        <div class="page-title">
                            <h1><?php echo $heading_title; ?></h1>
                        </div>
                        <?php if ($post_author_status) { ?>
                            <div class="post-autor">
                                <span><i class="fa fa-user"></i><?php echo $author; ?></span>
                            </div>
                        <?php } ?>
                        <?php if ($post_date_added_status) { ?>
                            <div class="post-date"><i class="fa fa-clock-o"></i><?php echo $date_added_full; ?></div>
                        <?php } ?>

                        <?php if ($post_comments_count_status) { ?>
                            <a class="read-comments"><i class="fa fa-comment"></i><?php echo $comment_total; ?></a>
                        <?php } ?>

                        <?php if ($post_page_view_status) { ?>
                            <a class="read-comments"><i class="fa fa-eye"></i><?php echo $new_read_counter_value; ?>
                            </a>
                        <?php } ?>



                        <?php if ($main_thumb && $blogsetting_post_thumb) { ?>
                            <div class="rich-blog-image">
                                <img src="<?php echo $blogsetting_post_thumb; ?>"
                                     alt="<?php echo $heading_title; ?>"
                                     title="<?php echo $heading_title; ?>"/>
                            </div>
                        <?php } ?>
                        <div class="post-body"><?php echo $description; ?></div>

                        <?php if ($tags) { ?>
                            <div class="tags">
                                <label><?php echo $text_tags; ?></label>
                                <ul>
                                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                        <?php if ($i < (count($tags) - 1)) { ?>
                                            <li>
                                                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                            </li>
                                        <?php } else { ?>
                                            <li>
                                                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                            </li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="post-footer">
                        <div class="post-actions">
                            <div class="share-post">
                                <?php if ($share_status) { ?>
                                    <label>Share:</label>
                                    <ul id="share-buttons addthis_toolbox">
                                        <li class="facebook"><a class="addthis_button_facebook"><i
                                                        class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a class="addthis_button_twitter"><i
                                                        class="fa fa-twitter"></i></a></li>
                                        <li class="google"><a class="addthis_button_google_plusone_share"><i
                                                        class="fa fa-google-plus"></i></a></li>
                                        <li class="linkedin"><a class="addthis_button_compact"><i
                                                        class="fa fa-navicon"></i></a></li>
                                    </ul>
                                    <script type="text/javascript"
                                            src="http://s7.addthis.com/js/300/addthis_widget.js"></script>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <!-- Related Products -->
                    <?php if ($products) { ?>
                        <div class="comment-list">
                            <div class="title">
                                <strong><?php echo $text_related_products; ?></strong>
                            </div>
                            <div class="comment">
                                <div class="product-grid">
                                    <div class="item-grid">
                                        <?php foreach ($products as $product) { ?>
                                            <div class="item-box">
                                                <div class="product-item">
                                                    <div class="picture"><a href="<?php echo $product['href']; ?>"><img
                                                                    src="<?php echo $product['thumb']; ?>"
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"
                                                                    class="img-responsive"/></a>
                                                    </div>
                                                    <div class="details">
                                                        <div class="product-rating-box">
                                                            <div class="rating">
                                                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                    <?php if ($product['rating'] < $i) { ?>
                                                                        <span class="fa fa-stack"><i
                                                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                                                    <?php } else { ?>
                                                                        <span class="fa fa-stack"><i
                                                                                    class="fa fa-star fa-stack-2x"></i><i
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
                                                                <input class="button-2 add-to-wishlist-button"
                                                                       type="button"
                                                                       data-toggle="tooltip"
                                                                       title="<?php echo $button_wishlist; ?>"
                                                                       onclick="wishlist.add('<?php echo $product['product_id']; ?>');"/>
                                                                <input class="button-2 add-to-compare-list-button"
                                                                       type="button"
                                                                       data-toggle="tooltip"
                                                                       title="<?php echo $button_compare; ?>"
                                                                       onclick="compare.add('<?php echo $product['product_id']; ?>');"/>
                                                            </div>
                                                            <div class="buttons-lower">
                                                                <div class="ajax-cart-button-wrapper">
                                                                    <input id="productQuantity<?php echo $product['product_id']; ?>"
                                                                           type="text" class="productQuantityTextBox"
                                                                           value="<?php echo $product['minimum']; ?>">
                                                                    <button class="button-2 product-box-add-to-cart-button"
                                                                            type="button"
                                                                            onclick="cart.add('<?php echo $product['product_id']; ?>', $('#productQuantity<?php echo $product['product_id']; ?>').val());">
                                                                        <span><?php echo $button_cart; ?></span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <!-- Related Products End -->
                    <?php if ($related_blogs) { ?>
                        <div class="comment-list">
                            <div class="title">
                                <strong><?php echo $text_related_blog; ?></strong>
                            </div>
                            <div class="comment page blog-page">
                            <?php foreach ($related_blogs as $blog) { ?>
                                <div class="post">
                                    <div class="post-head">
                                        <?php if ($blog['image']) { ?>
                                            <div class="rich-blog-image">
                                                <a href="<?php echo $blog['href']; ?>"><img
                                                            src="<?php echo $blog['image']; ?>"
                                                            alt="<?php echo $blog['title']; ?>"
                                                            title="<?php echo $blog['title']; ?>"/></a>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="post-body">
                                        <?php if ($date_added_status) { ?>
                                            <span class="post-date"><i class="fa fa-clock-o"></i><?php echo $blog['date_added_full']; ?></span>
                                        <?php } ?>
                                        <?php if ($comments_count_status) { ?>
                                            <a class="read-comments"><i class="fa fa-comment"></i><?php echo $blog['comment_total']; ?></a>
                                        <?php } ?>

                                        <?php if ($page_view_status) { ?>
                                            <a class="read-comments"><i class="fa fa-eye"></i><?php echo $blog['count_read']; ?>
                                            </a>
                                        <?php } ?>
                                        <div class="post-autor">
                                            <span><i class="fa fa-user"></i><?php echo $blog['author']; ?></span>
                                        </div>
                                        <a class="post-title" href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a>
                                        <div class="post-preview">
                                            <p><?php echo $blog['short_description']; ?></p>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                    <!-- Related Blog End -->

                    <!-- Comment Area start -->
                    <?php if ($allow_comment){ ?>
                    <div class="comment-list">
                        <div class="title">
                            <strong><?php echo $text_comments; ?></strong>
                        </div>
                        <div class="comments">
                            <div id="comment"></div>
                        </div>
                    </div>
                    <div class="fieldset new-comment">
                        <div class="title">
                            <strong><?php echo $text_write_comment; ?></strong>
                        </div>
                        <div class="notifications">
                        </div>
                        <form id="comment_form">
                            <div class="form-fields">
                                <div class="inputs">
                                    <label for="input-name"><?php echo $entry_name; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name"/>
                                </div>
                                <div class="inputs">
                                    <label for="input-email"><?php echo $entry_email; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="email" value="<?php echo $customer_email; ?>" id="input-email"/>
                                </div>

                                <div class="inputs">
                                    <label for="input-review"><?php echo $entry_comment; ?><span
                                                class="required">*</span></label>
                                    <textarea name="comment" rows="5" id="input-comment"></textarea>
                                </div>

                                <div class="buttons">
                                    <button type="button" id="button-comment"
                                            class="button-1 blog-post-add-comment-button"><?php echo $button_send; ?></button>
                                </div>
                            </div>
                    </div>
                </div>
                </form>
            </div>
        <?php } ?>
        </div>
        <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
</div>
</div>
<script type="text/javascript"><!--

    $('#comment').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();
        $("html,body").animate({scrollTop: (($("#comment").offset().top) - 50)}, 500);
        $('#comment').fadeOut(100);

        $('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>&page=' + $(this).text());
        $('#comment').fadeIn(100);

    });

    $('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
    //--></script>

<script type="text/javascript"><!--

    $('#button-comment').on('click', function () {
        $.ajax({
            url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#comment_form").serialize(),

            complete: function () {
                $('#button-comment').button('reset');

                $("html,body").animate({scrollTop: (($(".notifications").offset().top) - 50)}, 500);
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('.notifications').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('.notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('input[name=\'email\']').val('');
                    $('textarea[name=\'comment\']').val('');
                }
                $("html,body").animate({scrollTop: (($(".notifications").offset().top) - 50)}, 500);
            }
        });
    });
    //-->
</script>
<?php echo $footer; ?> 