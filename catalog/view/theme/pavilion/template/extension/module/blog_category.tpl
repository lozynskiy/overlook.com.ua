<div class="rich-blog-body">
<div class="block">
    <!--h3><?php echo $heading_title_category; ?></h3!-->
    <div class="title">
        <strong><?php echo $heading_title_category; ?></strong>
    </div>
    <?php if (!empty($categories)) { ?>
        <div class="listbox">
        <ul class="list">
            <?php foreach ($categories as $category_1) { ?>
                <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
                    <li class="category"><a href="<?php echo $category_1['href']; ?>" ><span><?php echo $category_1['name']; ?></span></a>
                <?php } else { ?>
                    <li class="category"><a href="<?php echo $category_1['href']; ?>" ><span><?php echo $category_1['name']; ?></span></a>
                <?php } ?>
                <?php if ($category_1['children']) { ?>
                    <ul>
                        <?php foreach ($category_1['children'] as $category_2) { ?>
                            <li class="open active"><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                            </li>
                        <?php } ?>
                    </ul>
                <?php } ?>
                </li>
            <?php } ?>
        </ul>
        </div>
    <?php } ?>
</div>
</div>
<script>
    $('.blog-category li').bind().click(function (e) {
        $(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(500)
            .end().siblings().find('>ul').slideUp().parent().removeClass("open");
        e.stopPropagation();
    });
    $('.blog-category li a').click(function (e) {
        e.stopPropagation();
    });
</script>