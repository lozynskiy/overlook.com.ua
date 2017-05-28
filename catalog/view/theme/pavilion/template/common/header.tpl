<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>


    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/style.css" /!-->
    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/themify-icons.css" /!-->

    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/stylesheet.css">
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/stylesheet/megamenu.css"/>
    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/print.css" /!-->

    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/styles.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/mobile-only.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/480.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/768.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/1000.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/1280.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/tables.css"/>
    <!--link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/min-769.css" />
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/min-1200.css" /!-->


    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,700"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/owl.carousel.css"/>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/pavilion/style/perfect-scrollbar.min.css"/>

    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/bootstrap.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/common.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/barrating.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/pavilion/scripts/owl.carousel.min.js"></script>


    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div class="header">
    <nav id="top" class="header-upper">
        <div class="center">
            <div id="top-links">
                <?php echo $currency; ?>
                <?php echo $language; ?>
                <div id="header-links-wrapper" class="header-links-wrapper"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"
                                                     class="dropdown-toggle" data-toggle="dropdown"><label><i
                                    class="fa fa-user"></i> <span
                                    class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span
                                    class="caret"></span></a></label>
                    <ul id="header-links" class="header-links">
                        <?php if ($logged) { ?>
                        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                        <?php } else { ?>
                        <li><a class="ico-register" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                        </li>
                        <li><a class="ico-login modal-login" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                        </li>
                        <li><a class="ico-wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"
                               title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <div class="header-selectors-wrapper">
                    <label>
                        <a href="<?php echo $compare; ?>" id="compare-total" title="<?php echo $text_compare; ?>">
                            <i class="fa fa-exchange "></i>
                            <span class="hidden-xs hidden-sm hidden-md">
                                <?php echo $text_compare; ?>
                            </span>
                        </a>
                    </label>
                </div>
                <!--div class="header-selectors-wrapper">
                    <label>
                    <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
                        <i class="fa fa-shopping-cart"></i>
                    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a>
                    </label>
                </div!-->
            </div>
        </div>
    </nav>
    <header class="header-middle">
        <div class="center">
            <div class="header-logo">
                <div id="logo">
                    <?php if ($logo) { ?>
                    <a class="logo" <?php if ($home != $og_url) { ?>href="<?php echo $home; ?>"<?php } ?>><img
                            src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"
                            class="img-responsive"/></a>
                    <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
            </div>
            <div class="header-menu-parent">
                <div id="contacts" class="col-md-6">
                    <i class="fa fa-phone contacts-fa"></i>
                    <div id="phone">
                        <?php echo $telephone; ?>
                    </div>
                </div>
                <div id="shedule" class="col-md-6">
                    <i class="fa fa-clock-o"></i>
                    <div id="phone">
                        <?php echo $open; ?>
                    </div>
                </div>
            </div>
            <?php echo $cart; ?>
        </div>
    </header>
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
            <div class="preferences-button" id="header-selectors-opener">
                <span>Preferences</span>

            </div>
            <div class="search-wrap">
                <span>Search</span>
            </div>
        </div>
    </div>
    <?php if($use_megamenu) { ?>
    <div class="header-lower">
        <div class="center">
            <nav id="megamenu-menu" class="navbar header-menu">
                <div class="close-menu">
                    <span>Close</span>
                </div>
                <div class="navbar-header" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <button type="button" class="btn btn-navbar navbar-toggle"><i class="fa fa-bars"></i>
                        <span id="category" class="visible-xs"><?php echo $text_megamenu; ?></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse no-padding">
                    <ul class="nav navbar-nav">
                        <?php foreach ($items as $item) { ?>
                        <?php if ($item['children']) {
		                     $type = isset($item['subtype']) ? $item['subtype']: 'none';
		                     $type_full = isset($item['type']) ? $item['type']: '';
		                     ?>
                        <li class="dropdown <?php if($type == " full
                        " || $type_full == "manufacturer"){echo"new-drop";} elseif($type ==
                        "full_image"){echo"new-drop";} elseif($item['type']=="product"){echo"new-drop";} else {echo"";}
                        ?>">
                        <a href="<?php echo $item['href']; ?>" <?php if($item['use_target_blank'] == 1) { echo ' target="_blank" ';} ?> <?php if($item['type'] == "link" ) {echo 'data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>
                        ><?php if($item['thumb']){ ?>
                        <img class="megamenu-thumb" src="<?php echo$item['thumb']; ?>"
                             alt="<?php echo $item['name']; ?>" title="<?php echo $item['name']; ?>"/>
                        <?php } ?><?php echo $item['name']; ?>
                        </a>
                        <a <?php if($item['type'] == "link" ) {echo 'data-target="link" class="megamenu-notoggle-a"';} else {echo 'class="dropdown-toggle dropdown-img megamenu-toggle-a" data-toggle="dropdown"';} ?>
                        ></a>
                        <?php if($item['type']=="category"){ ?>
                        <?php if($item['subtype']=="simple"){ ?>
                        <div class="dropdown-menu megamenu-type-category-simple">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <ul class="list-unstyled megamenu-haschild simple-category">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a><?php if(count($child['children'])){ ?>
                                        <a class="parent-title-toggle"></a><?php } ?>
                                        <?php if(count($child['children'])){ ?>
                                        <ul class="list-unstyled megamenu-ischild megamenu-ischild-simple">
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <li><a class="mm-3-level-link"
                                                   href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                        <?php } ?>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php if($item['type']=="category"){ ?>
                        <?php if($item['subtype']=="full"){ ?>
                        <div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <?php if($item['add_html']){ ?>
                                <div style="" class="menu-add-html">
                                    <?php echo$item['add_html'];?>
                                </div>
                                <?php } ?>
                                <ul class="list-unstyled megamenu-haschild">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                        <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
                                            <?php echo $child['name']; ?>
                                        </a>
                                        <?php if(count($child['children'])){ ?><a class="parent-title-toggle"></a>
                                        <ul class="list-unstyled megamenu-ischild">
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <li><a class="mm-3-level-link"
                                                   href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                        <?php } ?>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php if($item['type']=="category"){ ?>
                        <?php if($item['subtype']=="full_image"){ ?>
                        <div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
                            <div class="dropdown-inner <?php if($item['add_html']){ ?>has-banner<?php } ?>">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <?php if($item['add_html']){ ?>
                                <div style="" class="menu-add-html">
                                    <?php echo$item['add_html'];?>
                                </div>
                                <?php } ?>
                                <ul class="list-unstyled megamenu-haschild">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                        <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
                                            <?php echo $child['name']; ?>
                                        </a>
                                        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img
                                                    src="<?php echo $child['thumb']; ?>"
                                                    alt="<?php echo $child['name']; ?>"
                                                    title="<?php echo $child['name']; ?>"/></a>

                                        <?php if(count($child['children'])){ ?><a class="parent-title-toggle"></a>
                                        <ul class="list-unstyled megamenu-ischild">
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <li><a class="mm-3-level-link"
                                                   href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                        <?php } ?>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php if($item['type']=="html"){ ?>
                        <div class="dropdown-menu megamenu-type-html">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled megamenu-haschild">
                                    <li class="megamenu-parent-block">
                                        <div class="megamenu-html-block">
                                            <?php echo$item['html']; ?>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if($item['type']=="manufacturer"){ ?>
                        <div class="dropdown-menu megamenu-type-manufacturer <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <?php if($item['add_html']){ ?>
                                <div style="" class="menu-add-html">
                                    <?php echo$item['add_html'];?>
                                </div>
                                <?php } ?>
                                <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="megamenu-parent-block">
                                        <a class="megamenu-parent-title"
                                           href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img
                                                    src="<?php echo $child['thumb']; ?>" alt="" title=""/></a>

                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if($item['type']=="information"){ ?>
                        <div class="dropdown-menu megamenu-type-information <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <?php if($item['add_html']){ ?>
                                <div style="" class="menu-add-html">
                                    <?php echo$item['add_html'];?>
                                </div>
                                <?php } ?>
                                <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="info-href"><a
                                                href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if($item['type']=="product"){ ?>
                        <div class="dropdown-menu megamenu-type-product <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                <?php if($item['add_html']){ ?>
                                <div style="" class="menu-add-html">
                                    <?php echo$item['add_html'];?>
                                </div>
                                <?php } ?>
                                <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                    <?php foreach ($children as $child) { ?>
                                    <li class="megamenu-parent-block">
                                        <a class="megamenu-parent-title"
                                           href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                        <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img
                                                    src="<?php echo $child['thumb']; ?>" alt="" title=""/></a>

                                        <div class="dropprice">
                                            <?php if($child['special']){ ?>
                                            <span><?php } ?><?php echo $child['price']; ?><?php if($child['special']){ ?></span><?php } ?><?php echo $child['special']; ?>
                                        </div>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if($item['type']=="auth"){ ?>
                        <div class="dropdown-menu megamenu-type-auth">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled megamenu-haschild">
                                    <li class="megamenu-parent-block">
                                        <div class="megamenu-html-block">
                                            <form action="<?php echo $action; ?>" method="post"
                                                  enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label class="control-label"
                                                           for="input-email"><?php echo $entry_email; ?></label>
                                                    <input type="text" name="email" value=""
                                                           placeholder="<?php echo $entry_email; ?>" id="input-email"
                                                           class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label"
                                                           for="input-password"><?php echo $entry_password; ?></label>
                                                    <input type="password" name="password" value=""
                                                           placeholder="<?php echo $entry_password; ?>"
                                                           id="input-password" class="form-control"/>
                                                    <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                                                    <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                                                </div>
                                                <input type="submit" value="<?php echo $button_login; ?>"
                                                       class="btn btn-primary"/>
                                            </form>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <?php } ?>
                        </li>
                        <?php } else { ?>
                        <li><a href="<?php echo $item['href']; ?>"><?php if($item['thumb']){ ?>
                                <img class="megamenu-thumb" src="<?php echo$item['thumb']; ?>"
                                     alt="<?php echo $item['name']; ?>" title="<?php echo $item['name']; ?>"/>
                                <?php } ?><?php echo $item['name']; ?></a>
                        </li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
                <?php echo $search; ?>
            </nav>
        </div>
    </div>

    <?php } ?>
    <?php if ($categories && !$use_megamenu) { ?>
    <div class="header-lower">
        <div class="center">
            <nav id="menu" class="navbar">
                <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"
                                                data-toggle="dropdown"><?php echo $category['name']; ?></a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                    <ul class="list-unstyled">
                                        <?php foreach ($children as $child) { ?>
                                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                </div>
                                <a href="<?php echo $category['href']; ?>"
                                   class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></div>
                        </li>
                        <?php } else { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <?php } ?>
</div>