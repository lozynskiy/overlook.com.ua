<?php echo $header; ?>
<div class="container">
  <div class="breadcrumb">
    <ul itemscope itemtype="http://schema.org/BreadcrumbList">
      <?php foreach ($breadcrumbs as $cnt=> $breadcrumb) { ?>
      <?php if($cnt==0) { ?>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
          <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
        <span class="delimiter">/</span>
        <meta itemprop="position" content="<?php echo $cnt+1; ?>" />
      </li>
      <?php } elseif($cnt+1<count($breadcrumbs)) { ?>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
          <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
        <span class="delimiter">/</span>
        <meta itemprop="position" content="<?php echo $cnt+1; ?>" />
      </li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
      <?php } else { ?>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
        <meta itemprop="position" content="<?php echo $cnt+1; ?>" />
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
      <div class="page search-page">
      <?php echo $content_top; ?>
      <div class="page-title">
        <h1><?php echo $heading_title; ?></h1>
      </div>
          <div class="page-body">
              <div class="search-input">
                  <div class="fieldset">
                      <div class="form-fields">
                          <div class="basic-search">
                              <div class="inputs">
                                  <label for="input-search"><?php echo $entry_search; ?></label>
                                  <input type="text" name="search" value="<?php echo $search; ?>"
                                         placeholder="<?php echo $text_keyword; ?>" id="input-search"
                                         class="search-text valid"/>
                              </div>
                              <div class="advanced-search">
                                  <div class="inputs">
                                      <label><?php echo $text_select_category; ?></label>
                                      <select name="category_id">
                                          <option value="0"><?php echo $text_category; ?></option>
                                          <?php foreach ($categories as $category_1) { ?>
                                          <?php if ($category_1['category_id'] == $category_id) { ?>
                                          <option value="<?php echo $category_1['category_id']; ?>"
                                                  selected="selected"><?php echo $category_1['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                          <?php } ?>
                                          <?php foreach ($category_1['children'] as $category_2) { ?>
                                          <?php if ($category_2['category_id'] == $category_id) { ?>
                                          <option value="<?php echo $category_2['category_id']; ?>" selected="selected">
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $category_2['category_id']; ?>"><?php echo $category_1['name']; ?> >> <?php echo $category_2['name']; ?></option>
                                          <?php } ?>
                                          <?php foreach ($category_2['children'] as $category_3) { ?>
                                          <?php if ($category_3['category_id'] == $category_id) { ?>
                                          <option value="<?php echo $category_3['category_id']; ?>" selected="selected">
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $category_3['category_id']; ?>"><?php echo $category_1['name']; ?> >> <?php echo $category_2['name']; ?> >> <?php echo $category_3['name']; ?></option>
                                          <?php } ?>
                                          <?php } ?>
                                          <?php } ?>
                                          <?php } ?>
                                      </select>
                                  </div>
                                  <div class="inputs">
                                      <?php if ($sub_category) { ?>
                                      <input type="checkbox" name="sub_category" value="1" checked="checked"/>
                                      <?php } else { ?>
                                      <input type="checkbox" name="sub_category" value="1"/>
                                      <?php } ?>
                                      <label><?php echo $text_sub_category; ?></label>
                                  </div>
                                  <div class="inputs">
                                      <?php if ($description) { ?>
                                      <input type="checkbox" name="description" value="1" id="description"
                                             checked="checked"/>
                                      <?php } else { ?>
                                      <input type="checkbox" name="description" value="1" id="description"/>
                                      <?php } ?>
                                      <label><?php echo $entry_description; ?></label>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="buttons">
                      <input type="button" value="<?php echo $button_search; ?>" id="button-search"
                             class="button-1 search-button"/>
                  </div>
              </div>
      <?php if ($products) { ?>
              <div class="product-selectors">
                  <div class="product-viewmode">
                      <a type="button" id="list-view" class="viewmode-icon list" data-toggle="tooltip" title="<?php echo $button_list; ?>"></a>
                      <a type="button" id="grid-view" class="viewmode-icon grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"></a>
                  </div>
                  <!--div class="col-md-3 col-sm-6">
                    <div class="form-group">
                      <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
                    </div>
                  </div!-->
                  <div class="product-sorting">
                      <span><?php echo $text_sort; ?></span>
                      <select id="input-sort" class="sortOptionsDropDown" onchange="location = this.value;">
                          <?php foreach ($sorts as $sorts) { ?>
                          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                          <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                          <?php } ?>
                          <?php } ?>
                      </select>
                  </div>
                  <div class="product-page-size">
                      <span><?php echo $text_limit; ?></span>
                      <select id="input-limit" class="productsPageSizeDropDown" onchange="location = this.value;">
                          <?php foreach ($limits as $limits) { ?>
                          <?php if ($limits['value'] == $limit) { ?>
                          <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                          <?php } ?>
                          <?php } ?>
                      </select>
                  </div>
              </div>
        <div class="product-grid">
          <div class="item-grid">
        <?php foreach ($products as $product) { ?>
              <div class="item-box">
                  <div class="product-item">
                      <div class="picture"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                      <div class="details">
                          <div class="product-rating-box">
                              <div class="rating">
                                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                                  <?php if ($product['rating'] < $i) { ?>
                                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                  <?php } else { ?>
                                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                  <?php } ?>
                                  <?php } ?>
                              </div>
                          </div>
                          <h2 class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
                          <div class="add-info">
                              <?php if ($product['price']) { ?>
                              <div class="prices">
                                  <?php if (!$product['special']) { ?>
                                  <span class="price actual-price"><?php echo $product['price']; ?></span>
                                  <?php } else { ?>
                                  <span class="price actual-price"><?php echo $product['special']; ?></span> <span class="price old-price"><?php echo $product['price']; ?></span>
                                  <?php } ?>
                                  <?php if ($product['tax']) { ?>
                                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                  <?php } ?>
                              </div>
                              <?php } ?>
                              <div class="description"><?php echo $product['description']; ?></div>
                              <div class="buttons-upper">
                                  <input class="button-2 add-to-wishlist-button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></input>
                                  <input class="button-2 add-to-compare-list-button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></input>
                              </div>
                              <div class="buttons-lower">
                                  <button class="button-2 product-box-add-to-cart-button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
        <?php } ?>
      </div>
        </div>
          <div class="pager">
              <?php echo $pagination; ?>
              <p><?php echo $results; ?></p>
          </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?>
      </div>
    </div>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>