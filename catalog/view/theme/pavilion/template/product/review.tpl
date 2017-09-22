<?php if ($reviews) { ?>
    <div class="title">
        <strong><?php echo $text_reviews; ?></strong>
    </div>
    <?php foreach ($reviews as $review) { ?>
        <div class="product-review-item">
            <div class="review-item-head">
                <div class="product-review-box">
                    <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($review['rating'] < $i) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                            class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="review-text"><?php echo $review['text']; ?></div>
            <div class="review-info">
                <span class="user"><strong><?php echo $review['author']; ?></strong></span>
                <span class="separator">|</span>
                <span class="date"><strong><?php echo $review['date_added']; ?></strong></span>
            </div>

        </div>
    <?php } ?>
    <div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
    <p><?php echo $text_no_reviews; ?></p>
<?php } ?>
