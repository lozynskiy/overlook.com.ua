<div class="rich-blog-homepage">
    <div class="title">
        <strong><?php echo $heading_title_latest; ?></strong>
    </div>
<!--    <h3><a class="all" href="--><?php //echo $blog_show_all; ?><!--">--><?php //echo $text_show_all; ?><!-- <i-->
<!--                    class="fa  fa-long-arrow-right"></i></a>--><?php //echo $heading_title_latest; ?><!--</h3>-->
    <?php if (!empty($posts)) { ?>
        <div class="blog-posts owl-carousel owl-theme">
            <?php foreach ($posts as $blog) { ?>
                <div class="blog-post">
                    <?php if ($blog['image'] && $thumb) { ?>
                        <div class="post-picture">
                            <a href="<?php echo $blog['href']; ?>">
                                <img src="<?php echo $blog['image']; ?>"
                                                                        alt="<?php echo $blog['title']; ?>"
                                                                        title="<?php echo $blog['title']; ?>"/>
                            </a>
                        </div>
                    <?php } ?>
                    <div class="post-details">
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
<!--                    <div class="post-autor">-->
<!--                        <span><i class="fa fa-user"></i>--><?php //echo $blog['author']; ?><!--</span>-->
<!--                   </div>-->
                        <a class="post-title" href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a>

                        <?php if (!$characters == '0') { ?>
                            <div class="post-preview">
                                <p><?php echo $blog['description']; ?></p>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <script>
        $(document).ready(function () {
            $('.blog-posts.owl-carousel').owlCarousel({
                loop: false,
                nav: true,
                dots: false,
                navText: ['<i class="fa fa-chevron-left fa-1x"></i>', '<i class="fa fa-chevron-right fa-1x"></i>'],
                responsiveClass: true,
                responsive: {
                    0: {
                        margin: 10,
                        items: 1,
                        nav: true
                    },
                    460: {
                        margin: 10,
                        items: 2,
                        nav: true
                    },
                    745: {
                        margin: 10,
                        items: 3,
                        nav: true
                    },
                    1000: {
                        margin: 15,
                        items: 4,
                        nav: true
                    }
                }
            });
        });
    </script>
</div>

<?php if ($carousel) { ?>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.blog_grid_holder.carousel-1.<?php echo $module; ?>').owlCarousel({
                itemsCustom: [[0, 1], [500, 2], [767, <?php echo $columns;?>]],
                pagination: false,
                navigation: true,
                navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
                slideSpeed: 500
            });
        });
    </script>
<?php } ?>