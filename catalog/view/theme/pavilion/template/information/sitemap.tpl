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
                        </li>
                    <?php } else { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
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
                            <div class="entity">
                                <div class="entity-title">
                                    <h2>Categories</h2>
                                </div>
                                <div class="entity-body">
                                    <ul>
                                        <?php foreach ($categories as $category_1) { ?>
                                            <li>
                                                <a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
                                            </li>
                                            <?php if ($category_1['children']) { ?>
                                                <?php foreach ($category_1['children'] as $category_2) { ?>
                                                    <li>
                                                    <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                                                    <?php if ($category_2['children']) { ?>
                                                        <?php foreach ($category_2['children'] as $category_3) { ?>
                                                            <li>
                                                                <a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a>
                                                            </li>
                                                        <?php } ?>
                                                    <?php } ?>
                                                    </li>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                                <div class="entity">
                                    <div class="entity-title">
                                        <h2>General</h2>
                                    </div>
                                    <div class="entity-body">
                                        <ul>
                                            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                                                    <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo $history; ?>"><?php echo $text_history; ?></a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
                                                    </li>
                                            </li>
                                            <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
                                            <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
                                            </li>
                                            <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
                                            <li><?php echo $text_information; ?>
                                                    <?php foreach ($informations as $information) { ?>
                                                        <li>
                                                            <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                                                        </li>
                                                    <?php } ?>
                                                    <li>
                                                        <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
                                                    </li>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                    </div>
                    </div>
<hr>
		    <div class="row">
		        <div class="col-sm-6">
		          <?php if (!empty($blog_categories)) { ?>
		          <ul class="list-unstyled">
		          <?php foreach ($blog_categories as $category_1) { ?>
		              <li><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?></a> 
		                <?php if ($category_1['children']) { ?>
		                <ul>
		                <?php foreach ($category_1['children'] as $category_2) { ?>
		                  <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></li>
		                <?php } ?>
		                </ul>
		                <?php } ?>
		              </li>
		              <?php } ?>
		          </ul>
		          <?php } ?>
		        </div>
		        <div class="col-sm-6">
		        <?php if($blogs){ ?>
		          <ul class="list-unstyled">
		            <?php foreach ($blogs as $blog) { ?>
		              <li><a href="<?php echo $blog['href']; ?>" ><?php echo $blog['title']; ?></a></li>
		            <?php } ?>
		          </ul>
		        <?php } ?>
		        </div>
		    </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?></div>
    </div>
<?php echo $footer; ?>