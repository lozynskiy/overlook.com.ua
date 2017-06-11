<div class="block block-account-navigation">
    <div class="title">
        <strong>My account</strong>
    </div>
    <div class="listbox">
        <ul class="list">
            <?php if (!$logged) { ?>
            <li><a href="<?php echo $login; ?>" class="inactive fa fa-lock"><span><?php echo $text_login; ?></span></a></li>
            <li><a href="<?php echo $register; ?>" class="inactive fa fa-pencil"><span><?php echo $text_register; ?></span></a></li>
            <li><a href="<?php echo $forgotten; ?>" class="inactive fa fa-unlock"><span><?php echo $text_forgotten; ?></span></a></li>
            <?php } ?>
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>" class="inactive fa fa-info"><span><?php echo $text_account; ?></span></a></li>
            <li><a href="<?php echo $edit; ?>" class="inactive fa fa-gears"><span><?php echo $text_edit; ?></span></a></li>
            <li><a href="<?php echo $password; ?>" class="inactive fa fa-unlock"><span><?php echo $text_password; ?></span></a></li>
            <li><a href="<?php echo $address; ?>" class="inactive fa fa-address-book"><span><?php echo $text_address; ?></span></a></li>
            <?php } ?>
            <li><a href="<?php echo $wishlist; ?>" class="inactive fa fa-heart"><span><?php echo $text_wishlist; ?></span></a></li>
            <?php if ($logged) { ?>
            <li><a href="<?php echo $order; ?>" class="inactive fa fa-shopping-basket"><span><?php echo $text_order; ?></span></a></li>
            <li><a href="<?php echo $download; ?>" class="inactive fa fa-download"><span><?php echo $text_download; ?></span></a></li>
            <li><a href="<?php echo $recurring; ?>" class="inactive fa fa-credit-card"><span><?php echo $text_recurring; ?></span></a></li>
            <li><a href="<?php echo $reward; ?>" class="inactive fa fa-star"><span><?php echo $text_reward; ?></span></a></li>
            <li><a href="<?php echo $return; ?>" class="inactive fa fa-retweet"><span><?php echo $text_return; ?></span></a></li>
            <li><a href="<?php echo $transaction; ?>" class="inactive fa fa-credit-card"><span><?php echo $text_transaction; ?></span></a></li>
            <li><a href="<?php echo $newsletter; ?>" class="inactive fa fa-envelope"><span><?php echo $text_newsletter; ?></span></a></li>
            <li><a href="<?php echo $logout; ?>" class="inactive fa fa-lock"><span><?php echo $text_logout; ?></span></a></li>
            <?php } ?>
        </ul>
    </div>
</div>