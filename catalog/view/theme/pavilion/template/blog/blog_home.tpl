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
            <div class="page blog-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <?php if ($description) { ?>
                        <div class="main_description">
                            <?php echo $description; ?>
                        </div>
                    <?php } ?>
                    <?php if ($blogs) { ?>
                        <!--div class="blog_grid_holder column-<?php echo $list_columns; ?>"!-->
                        <div class="blog-posts">
                            <?php $firstblog = true; ?>
                            <?php foreach ($blogs as $blog) { ?>
                                <?php if ($firstblog == true) { ?>
                                    <?php $firstblog = false; ?>
                                    <div class="first-blog-post">
                                        <div class="post">
                                            <?php if ($blog['image']) { ?>
                                                <div class="post-head">
                                                    <div class="rich-blog-image">
                                                            <a href="<?php echo $blog['href']; ?>"><img
                                                                        src="<?php echo $blog['image']; ?>"
                                                                        alt="<?php echo $blog['title']; ?>"
                                                                        title="<?php echo $blog['title']; ?>"/></a>
                                                    </div>
                                                </div>
                                            <?php } ?>

                                            <div class="post-body">
                                                <div class="post-autor">
                                                    <span><i class="fa fa-user"></i><?php echo $blog['author']; ?></span>
                                                </div>
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

                                                <a class="post-title" href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a>

                                                <div class="post-preview">
                                                    <p><?php echo $blog['short_description']; ?></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>

                            <?php } ?>
                            <?php $firstblog = true; ?>
                            <div class="blog-posts-list">
                                <?php foreach ($blogs as $blog) { ?>
                                    <?php if ($firstblog == true) { ?>
                                        <?php $firstblog = false; ?>
                                    <?php } else { ?>
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
                                <?php } ?>
                            </div>
                        </div>
                        <div class="pager">
                            <?php echo $pagination; ?>
                            <?php echo $results; ?>
                        </div>
                    <?php } else { ?>
                        <div><?php echo $text_no_results; ?></div>
                    <?php } ?>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 