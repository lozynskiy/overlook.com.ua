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
                <?php echo $content_top; ?>
                <div class="page account-page downloadable-products-page">
                    <div class="page-title">
                        <h2><?php echo $heading_title; ?></h2>
                    </div>
                    <div class="page-body">
                        <?php if ($downloads) { ?>
                            <div class="table-wrapper">
                                <table class="data-table">
                                    <thead>
                                    <tr>
                                        <th class="item-count">#</th>
                                        <th class="order" data-hide="w410, w480"><?php echo $column_order_id; ?></th>
                                        <th class="product"><?php echo $column_name; ?></th>
                                        <th class="product-size"><?php echo $column_size; ?></th>
                                        <th class="date"
                                            data-hide="w410, w480, w580"><?php echo $column_date_added; ?></th>
                                        <th class="download" data-hide="w410"><?php echo $text_download; ?></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($downloads as $download) { ?>
                                        <tr>
                                            <td class="item-count"></td>
                                            <td class="order"><?php echo $download['order_id']; ?></td>
                                            <td class="product"><?php echo $download['name']; ?></td>
                                            <td class="product-size"><?php echo $download['size']; ?></td>
                                            <td class="date"><?php echo $download['date_added']; ?></td>
                                            <td class="download">
                                                <a href="<?php echo $download['href']; ?>" data-toggle="tooltip"
                                                   title="<?php echo $button_download; ?>"></a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pager">
                                <?php echo $pagination; ?>
                                <?php echo $results; ?>
                            </div>
                        <?php } else { ?>
                            <div class="no-data"><?php echo $text_empty; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
    <script>$(".data-table").footable()</script>
<?php echo $footer; ?>