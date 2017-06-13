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
            <div class="page order-details-page">
                <?php echo $content_top; ?>
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="order-overview">
                        <div class="order-number">
                            <strong><?php echo $text_return_id; ?> #<?php echo $return_id; ?></strong>
                        </div>
                        <div class="order-info">
                            <span><?php echo $text_date_added; ?> <?php echo $date_added; ?></span><br>
                            <span><?php echo $text_order_id; ?> <?php echo $order_id; ?></span><br>
                            <span><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></span>
                        </div>
                    </div>
                    <div class="section products">
                        <div class="page-title">
                            <h3><?php echo $text_product; ?></h3>
                        </div>
                        <div class="table-wrapper">
                            <table class="data-table">
                                <thead>
                                <tr>
                                    <td><?php echo $column_product; ?></td>
                                    <td><?php echo $column_model; ?></td>
                                    <td><?php echo $column_quantity; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><?php echo $product; ?></td>
                                    <td><?php echo $model; ?></td>
                                    <td><?php echo $quantity; ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="section reason">
                        <div class="page-title">
                            <h3><?php echo $text_reason; ?></h3>
                        </div>
                        <div class="table-wrapper">
                            <table class="data-table">
                                <thead>
                                <tr>
                                    <td><?php echo $column_reason; ?></td>
                                    <td><?php echo $column_opened; ?></td>
                                    <td><?php echo $column_action; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><?php echo $reason; ?></td>
                                    <td><?php echo $opened; ?></td>
                                    <td><?php echo $action; ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php if ($comment) { ?>
                    <div class="section comment">
                        <div class="page-title">
                            <h3><?php echo $text_comment; ?></h3>
                        </div>
                        <div class="table-wrapper">
                            <table class="data-table">
                                <tbody>
                                <tr>
                                    <td class="cart-total-left"><?php echo $comment; ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php } ?>

                    <div class="section history">
                        <div class="page-title">
                            <h3><?php echo $text_history; ?></h3>
                        </div>
                        <div class="table-wrapper">
                            <table class="data-table ">
                                <thead>
                                <tr>
                                    <td class="text-left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
                                    <td class="text-left" style="width: 33.3%;"><?php echo $column_status; ?></td>
                                    <td class="text-left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($histories) { ?>
                                <?php foreach ($histories as $history) { ?>
                                <tr>
                                    <td class="text-left"><?php echo $history['date_added']; ?></td>
                                    <td class="text-left"><?php echo $history['status']; ?></td>
                                    <td class="text-left"><?php echo $history['comment']; ?></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
