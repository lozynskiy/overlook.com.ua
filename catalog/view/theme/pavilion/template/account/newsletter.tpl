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
            <div class="page account-page customer-info-page">
                <?php echo $content_top; ?>
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="fieldset">
                            <div class="form-fields">
                                <div class="inputs">
                                    <label><?php echo $entry_newsletter; ?></label>
                                    <?php if ($newsletter) { ?>
                                    <ul class="option-list">
                                        <li>
                                            <input id="newsletter_1" type="radio" name="newsletter" value="1" checked="checked"/>
                                            <label for="newsletter_1"><?php echo $text_yes; ?></label>
                                        </li>
                                        <li>
                                            <input id="newsletter_0" type="radio" name="newsletter" value="0"/>
                                            <label for="newsletter_0"><?php echo $text_no; ?></label>
                                        </li>
                                    </ul>
                                    <?php } else { ?>
                                    <ul class="option-list">
                                        <li>
                                            <input id="newsletter_1" type="radio" name="newsletter" value="1"/>
                                            <label for="newsletter_1"><?php echo $text_yes; ?></label>
                                        </li>
                                        <li>
                                            <input id="newsletter_0" type="radio" name="newsletter" value="0" checked="checked"/>
                                            <label for="newsletter_0"><?php echo $text_no; ?></label>
                                        </li>
                                    </ul>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="buttons">
                                <input type="submit" value="<?php echo $button_continue; ?>" class="button-1 save-customer-info-button"/>
                        </div>
                    </form>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>