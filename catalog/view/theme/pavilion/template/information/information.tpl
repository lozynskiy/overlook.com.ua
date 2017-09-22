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
        <div class="master-column-wrapper"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'center-2'; ?>
            <?php } else { ?>
                <?php $class = 'center-1'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
                <div class="page topic-page">
                    <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                    </div>
                    <div class="page-body">
                        <div class="section order-completed">
                    <?php echo $description; ?>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?></div>
    </div>
<?php echo $footer; ?>