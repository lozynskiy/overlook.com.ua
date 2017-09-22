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
            <div id="content" class="<?php echo $class; ?>">
                <?php echo $content_top; ?>
                <div class="page sitemap-page">
                    <div class="page-title">
                        <h1><?php echo $heading_title; ?></h1>
                    </div>
                    <div class="page-body">
                        <div class="entity-wrapper">
                        <?php if ($categories) { ?>
                            <div class="entity">
                                <div class="entity-title">
                                    <h2><?php echo $text_index; ?></h2>
                                </div>
                                <div class="entity-body">
                                    <ul id="categories">
                                <?php foreach ($categories as $category) { ?>
                                    <li><a href="#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                                    </ul>
                                </div>
                            </div>
                            <?php foreach ($categories as $category) { ?>
                            <div class="entity">
                                <div class="entity-title">
                                    <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
                                </div>
                                <div class="entity-body">
                                <?php if ($category['manufacturer']) { ?>
                                    <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
                                        <ul>
                                            <?php foreach ($manufacturers as $manufacturer) { ?>
                                                <li><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        <?php } else { ?>
                            <p><?php echo $text_empty; ?></p>
                            <div class="buttons">
                                <a href="<?php echo $continue; ?>"
                                                           class="button-1"><?php echo $button_continue; ?></a>
                            </div>
                        <?php } ?>
                    </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?></div>
    </div>
<script>
    $("#categories a").click(function(e) {
        e.stopPropagation();
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $($(this).attr("href")).offset().top - 70
        }, 800);
    });
</script>
<?php echo $footer; ?>