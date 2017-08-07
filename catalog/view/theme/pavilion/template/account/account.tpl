<?php echo $header; ?>
<!--div class="notAndroid23 customer-pages-body"!-->
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
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
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
            <div class="page account-page customer-info-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="description">
                        <ul class="account-ul">
                            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                            <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                        </ul>
                        <?php if ($credit_cards) { ?>
                            <h2><?php echo $text_credit_card; ?></h2>
                            <ul class="account-ul">
                                <?php foreach ($credit_cards as $credit_card) { ?>
                                    <li>
                                        <a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a>
                                    </li>
                                <?php } ?>
                            </ul>
                        <?php } ?>
                        <h2><?php echo $text_my_orders; ?></h2>
                        <ul class="account-ul">
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                            <?php if ($reward) { ?>
                                <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
                            <?php } ?>
                            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                            <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
                        </ul>
                        <h2><?php echo $text_my_newsletter; ?></h2>
                        <ul class="account-ul">
                            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                        </ul>
                    </div>
                </div>

            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<!--/div!-->
<?php echo $footer; ?> 