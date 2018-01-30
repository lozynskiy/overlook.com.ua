<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product_option_group').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
          <div class="well">
              <div class="row">
                  <div class="col-sm-4">
                      <div class="form-group">
                          <label class="control-label" for="input-name"><?php echo $entry_product; ?></label>
                          <input type="text" name="filter_product" value="<?php echo $filter_product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-name" class="form-control" />
                      </div>
                  </div>
                  <div class="col-sm-4">
                      <div class="form-group">
                          <label class="control-label" for="input-option"><?php echo $entry_option; ?></label>
                          <select name="filter_option" id="input-option" class="form-control">
                              <option value="*"></option>
                              <?php foreach ($options as $option) { ?>
                                  <?php if ($option['option_id'] == $filter_option) { ?>
                                      <option value="<?php echo $option['option_id']; ?>" selected="true"><?php echo $option['name']; ?></option>
                                  <?php } else {?>
                                      <option value="<?php echo $option['option_id']; ?>"><?php echo $option['name']; ?></option>
                                  <?php } ?>
                              <?php } ?>
                          </select>
                      </div>
                  </div>
                  <div class="col-sm-4">
                      <div class="form-group">
                          <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                      </div>
                  </div>
              </div>
          </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product-option-group">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'products') { ?>
                    <a href="<?php echo $sort_products; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_products; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_products; ?>"><?php echo $column_products; ?></a>
                    <?php } ?></td>
                    <td class="text-right"><?php if ($sort == 'option') { ?>
                            <a href="<?php echo $sort_option; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_option; ?></a>
                        <?php } else { ?>
                            <a href="<?php echo $sort_option; ?>"><?php echo $column_option; ?></a>
                        <?php } ?>
                    </td>
                  <td class="text-right"><?php if ($sort == 'status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
                  </td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($product_option_groups) { ?>
                <?php foreach ($product_option_groups as $product_option_group) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($product_option_group['product_option_group_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product_option_group['product_option_group_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product_option_group['product_option_group_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo str_replace(',','<br/>',$product_option_group['products']); ?></td>
                  <td class="text-right"><?php echo $product_option_group['option']; ?></td>
                  <td class="text-right"><?php echo ($product_option_group['status'] == 1 ? $text_enabled : $text_disabled) ; ?></td>
                  <td class="text-right"><a href="<?php echo $product_option_group['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
    <script type="text/javascript"><!--
        $('#button-filter').on('click', function() {
            var url = 'index.php?route=catalog/product_option_group&token=<?php echo $token; ?>';

            var filter_product = $('input[name=\'filter_product\']').val();

            if (filter_product) {
                url += '&filter_product=' + encodeURIComponent(filter_product);
            }

            var filter_option = $('select[name=\'filter_option\']').val();

            if (filter_option != '*') {
                url += '&filter_option=' + encodeURIComponent(filter_option);
            }

//            var filter_status = $('select[name=\'filter_status\']').val();
//
//            if (filter_status != '*') {
//                url += '&filter_status=' + encodeURIComponent(filter_status);
//            }

            location = url;
        });
        //--></script>
</div>
<?php echo $footer; ?>