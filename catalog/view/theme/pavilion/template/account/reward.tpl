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
                <div class="page account-page reward-points-page">
                    <div class="page-title">
                        <h1><?php echo $heading_title; ?></h1>
                    </div>
                    <div class="page-body">
                        <div class="reward-points-overview">
                            <?php echo $text_total; ?> <b><?php echo $total; ?></b>.
                        </div>
                        <div class="section reward-points-history">
                            <?php if ($rewards) { ?>
                                <div class="table-wrapper">
                                    <table class="data-table">
                                        <thead>
                                        <tr>
                                            <th class="item-count">#</th>
                                            <th class="date"
                                                data-hide="w410, w480"><?php echo $column_date_added; ?></th>
                                            <th class="message"><?php echo $column_description; ?></th>
                                            <th class="points-balance"><?php echo $column_points; ?></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($rewards as $reward) { ?>
                                            <tr>
                                                <td class="item-count"></td>
                                                <td class="date"><?php echo $reward['date_added']; ?></td>
                                                <td class="message"><?php if ($reward['order_id']) { ?>
                                                        <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
                                                    <?php } else { ?>
                                                        <?php echo $reward['description']; ?>
                                                    <?php } ?>
                                                </td>
                                                <td class="points-balance"><?php echo $reward['points']; ?></td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php } else { ?>
                                <div class="no-data">
                                    <?php echo $text_empty; ?>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="pager">
                            <?php echo $pagination; ?>
                            <?php echo $results; ?>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
    <script>$(".data-table").footable()</script>
<?php echo $footer; ?>