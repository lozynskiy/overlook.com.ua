<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <!--meta property="og:title" content="<?php echo $title; ?>"/!-->
    <!--meta property="og:type" content="website"/!-->
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
        <!--meta property="og:image" content="<?php echo $og_image; ?>"/!-->
    <?php } else { ?>
        <!--meta property="og:image" content="<?php echo $logo; ?>"/!-->
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>

    <?php echo $tc_og; ?>

    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/bootstrap.css"/>
    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/stylesheet.css"!-->
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/styles.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/mobile-only.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/480.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/768.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/1000.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/1280.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/tables.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/ajaxCart.css"/>
    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/RichBlog.css"/!-->

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,700"/>
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/owl.carousel.css"/>


    <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
        <link rel="<?php echo $link['rel']; ?>" href="<?php echo $link['href']; ?>"/>
    <?php } ?>


    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/common.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/barrating.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/perfect-scrollbar.jquery.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/owl.carousel.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/analytics.js"></script>


    <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
        <!-- Begin Cookie Consent -->
        <script type="text/javascript">
            window.cookieconsent_options = {
                "message": "We use cookies to ensure you get the best experience on our website",
                "dismiss": "Got it!",
                "learnMore": "More info",
                "link": null,
                "theme": "dark-bottom"
            };
        </script>
        <script type="text/javascript"
                src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/1.0.9/cookieconsent.min.js"></script>
        <!-- End Cookie Consent -->
    <?php } ?>
    <?php if ($ga_status && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
        <script>
            window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
            ga('create', '<?php echo $ua_tracking; ?>', 'auto');
            <?php if ($ga_remarketing == 1) { echo "ga('require', 'displayfeatures');"; } ?>
            ga('require', 'ec');
            ga('send', 'pageview');
        </script>
        <script async src='https://www.google-analytics.com/analytics.js'></script>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div class="header">
    <div class="header-upper" id="top">
        <div class="center">
            <div id="top-links">
                <div class="header-selectors-wrapper">
                    <label><?php echo $text_preferences; ?></label>
                    <div class="header-selectors">
                        <?php echo $currency; ?>
                        <?php echo $language; ?>
                    </div>
                </div>
                <div id="header-links-wrapper" class="header-links-wrapper"><label><?php if ($logged) echo $text_logged; else echo $text_account; ?></label>
                    <div class="header-links">
                        <ul id="header-links">
                            <?php if ($logged) { ?>
                                <li><a class="ico-account"
                                       href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                                </li>
                                <li><a class="ico-logout" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                                </li>
                                </li>
                            <?php } else { ?>
                            <li><a class="ico-register"
                                   href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <li><a class="ico-login modal-login"
                                   href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                                <?php } ?>
                            <li><a class="ico-wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"
                                   title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a>
                            </li>
                            <li><a class="compare" href="<?php echo $compare; ?>" id="compare-total"
                                   title="<?php echo $text_compare; ?>">
                                    <i class="fa fa-exchange "></i><?php echo $text_compare; ?></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-middle">
        <div class="center">
            <div class="header-logo">
                <div id="logo">
                    <?php if ($logo) { ?>
                        <a class="logo" <?php if ($home != $og_url) { ?>href="<?php echo $home; ?>"<?php } ?>>
                            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"
                                 class="img-responsive"/></a>
                    <?php } else { ?>
                        <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
            </div>
            <div class="header-menu-parent">
                <div class="header-menu sublist-wrap categories-in-side-panel">
                    <div class="close-menu">
                        <span>Close</span>
                    </div>
                    <ul class="mega-menu-responsive">
                        <?php if ($use_megamenu) { ?>
                            <?php if ($items) { ?>
                                <?php foreach ($items as $item) { ?>
                                    <?php if ($item['children']) {
                                        $type = isset($item['subtype']) ? $item['subtype'] : 'none';
                                        $type_full = isset($item['type']) ? $item['type'] : ''; ?>
                                        <li <?php if ($item['type'] != "link") {
                                            echo 'class="has-sublist root-category-items"';
                                        } ?>>
                                            <a href="<?php echo $item['href']; ?>"
                                                <?php if ($item['use_target_blank'] == 1) {
                                                    echo ' target="_blank" ';
                                                } ?>
                                                <?php if ($item['type'] == "link") {
                                                    echo 'data-target="link"';
                                                } else {
                                                    echo 'class="with-subcategories"';
                                                } ?>>
                                                <?php if ($item['thumb']) { ?>
                                                    <img class="megamenu-thumb" src="<?php echo $item['thumb']; ?>"
                                                         alt="<?php echo $item['name']; ?>"
                                                         title="<?php echo $item['name']; ?>"/>
                                                <?php } ?><?php echo $item['name']; ?>
                                            </a>
                                            <?php if ($item['type'] != "link") {
                                                echo '<div class="plus-button"></div>';
                                            } ?>
                                            <?php if ($item['type'] == "category") { ?>
                                                <?php if ($item['subtype'] == "full_image") { ?>
                                                    <div class="sublist-wrap categories with-pictures fullWidth boxes-3">
                                                        <div class="sublist">
                                                            <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                                                <?php if ($item['add_html']) { ?>
                                                                    <div class="slider-wrapper">
                                                                        <?php echo $item['add_html']; ?>
                                                                    </div>
                                                                <?php } ?>
                                                                <div class="inner-wrap">
                                                                    <div class="row">
                                                                        <ul class="sublist">
                                                                            <li class="back-button"><span>back</span>
                                                                            </li>
                                                                            <?php foreach ($children as $child) { ?>
                                                                                <li class="box <?php if (count($child['children'])) { ?>has-sublist<?php } ?>">
                                                                                    <a class="with-subcategories"
                                                                                       href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                                    <div class="picture-title-wrap">
                                                                                        <div class="title">
                                                                                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                                        </div>
                                                                                        <div class="picture">
                                                                                            <a href="<?php echo $child['href']; ?>"><img
                                                                                                        src="<?php echo $child['thumb']; ?>"
                                                                                                        alt="<?php echo $child['name']; ?>"
                                                                                                        title="<?php echo $child['name']; ?>"/>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                    <?php if (count($child['children'])) { ?>
                                                                                        <div class="plus-button close"></div>
                                                                                        <div class="sublist-wrap">
                                                                                            <ul class="subcategories sublist">
                                                                                                <li class="back-button">
                                                                                                    <span>back</span>
                                                                                                </li>
                                                                                                <?php foreach ($child['children'] as $subchild) { ?>
                                                                                                    <li>
                                                                                                        <a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
                                                                                                    </li>
                                                                                                <?php } ?>
                                                                                            </ul>
                                                                                        </div>
                                                                                    <?php } ?>
                                                                                </li>
                                                                            <?php } ?>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                            <?php } ?>
                                            <?php if ($item['type'] == "html") { ?>
                                                <div class="sublist-wrap">
                                                    <ul class="sublist">
                                                        <li class="back-button"><span>back</span></li>
                                                        <div class="inner-wrap">
                                                            <?php echo $item['html']; ?>
                                                        </div>
                                                    </ul>
                                                </div>
                                            <?php } ?>
                                            <?php if ($item['type'] == "manufacturer") { ?>
                                                <div class="sublist-wrap categories with-pictures fullWidth boxes-3">
                                                    <div class="sublist">
                                                        <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                                            <?php if ($item['add_html']) { ?>
                                                                <div class="slider-wrapper">
                                                                    <?php echo $item['add_html']; ?>
                                                                </div>
                                                            <?php } ?>
                                                            <div class="inner-wrap">
                                                                <div class="row">
                                                                    <ul class="sublist">
                                                                        <li class="back-button"><span>back</span></li>
                                                                        <?php foreach ($children as $child) { ?>
                                                                            <li class="box">
                                                                                <a class="with-subcategories"
                                                                                   href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                                <div class="picture-title-wrap">
                                                                                    <div class="title">
                                                                                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                                    </div>
                                                                                    <div class="picture">
                                                                                        <a href="<?php echo $child['href']; ?>"><img
                                                                                                    src="<?php echo $child['thumb']; ?>"
                                                                                                    alt=""
                                                                                                    title=""/>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        <?php } ?>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        </li>
                                    <?php } else { ?>
                                        <li>
                                            <a href="<?php echo $item['href']; ?>">
                                                <?php if ($item['thumb']) { ?>
                                                    <img class="megamenu-thumb" src="<?php echo $item['thumb']; ?>"
                                                         alt="<?php echo $item['name']; ?>"
                                                         title="<?php echo $item['name']; ?>"/>
                                                <?php } ?>
                                                <?php echo $item['name']; ?>
                                            </a>
                                        </li>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                        <li>
                            <span id="phone"><i class="fa fa-phone contacts-fa"></i><?php echo $telephone; ?></span>
                        </li>
                        <li>
                            <span id="phone"><i class="fa fa-clock-o"></i><?php echo $open; ?></span>
                        </li>
                    </ul>
                </div>
            </div>
            <?php echo $cart; ?>
        </div>
    </div>
    <?php if ($use_megamenu) { ?>
        <div class="header-lower">
            <div class="center">
                <span class="category-navigation-title"><?php echo $text_category; ?></span>
                <div class="category-navigation-list-wrapper">
                    <div class="close-menu">
                        <span>Close</span>
                    </div>
                    <ul class="category-navigation-list sticky-flyout">

                    </ul>
                </div>
                <?php echo $search; ?>
            </div>
        </div>
    <?php } ?>
    <?php if ($categories && !$use_megamenu) { ?>
        <div class="header-lower">
            <div class="center">
                <span class="category-navigation-title"><?php echo $text_category; ?></span>
                <div id="menu" class="category-navigation-list-wrapper">
                    <ul class="category-navigation-list sticky-flyout">
                        <?php foreach ($categories as $category) { ?>
                            <?php if ($category['children']) { ?>
                                <li class="has-sublist">
                                    <a href="<?php echo $category['href']; ?>" class="with-subcategories">
                                        <span><?php echo $category['name']; ?></span>
                                    </a>
                                    <div class="sublist-wrap categories with-pictures fullWidth boxes-3">
                                        <ul class="sublist">
                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                <?php foreach ($children as $child) { ?>
                                                    <li class="box">
                                                        <?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                                                            <div class="picture-title-wrap">
                                                                <div class="title">
                                                                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                </div>
                                                                <div class="picture">
                                                                    <a href="<?php echo $child['href']; ?>">
                                                                        <img src="<?php echo $child['thumb']; ?>"/>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <?php foreach (array_chunk($child['children_lv3'], ceil(count($child['children_lv3']) / $child['column'])) as $children_lv3) { ?>
                                                                <ul class="subcategories">
                                                                <?php foreach ($children_lv3 as $child_lv3) { ?>
                                                                    <li>
                                                                        <a href="<?php echo $child_lv3['href']; ?>"><span><?php echo $child_lv3['name']; ?></span></a>
                                                                    </li>
                                                                <?php } ?>
                                                            <?php } ?>
                                                            </ul>
                                                        <?php } else { ?>
                                                            <div class="picture-title-wrap">
                                                                <div class="title">
                                                                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                </div>
                                                                <div class="picture">
                                                                    <a href="<?php echo $child['href']; ?>">
                                                                        <img src="<?php echo $child['thumb']; ?>"/>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </li>
                                                <?php } ?>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </li>
                            <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
                <?php echo $search; ?>
            </div>
        </div>
    <?php } ?>
</div>
<div class="overlayOffCanvas"></div>
<div class="responsive-nav-wrapper-parent">
    <div class="responsive-nav-wrapper">
        <div class="menu-title">
            <span>Menu</span>
        </div>
        <div class="shopping-cart-link">
            <span>Shopping cart</span>
        </div>
        <div class="personal-button" id="header-links-opener">
            <span>Personal menu</span>
        </div>
        <div class="filters-button">
            <span>Filters</span>
        </div>
        <div class="preferences-button" id="header-selectors-opener">
            <span>Preferences</span>

        </div>
        <div class="search-wrap">
            <span>Search</span>
        </div>
    </div>
</div>