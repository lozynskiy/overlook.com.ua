<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product_option_group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-option-group" class="form-horizontal">
          <div class="tab-content">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-options"><?php echo $entry_option; ?></label>
                  <div class="col-sm-10">
                      <select name="option_id" id="input-options" class="form-control">
                          <option value=""></option>
                          <?php foreach ($group_products_options as $group_products_option) { ?>
                              <?php if ($option_id == $group_products_option['option_id']) { ?>
                                  <option value="<?php echo $group_products_option['option_id']; ?>" selected="selected"><?php echo $group_products_option['name']; ?></option>
                              <?php } else { ?>
                                  <option value="<?php echo $group_products_option['option_id']; ?>"><?php echo $group_products_option['name']; ?></option>
                              <?php } ?>
                          <?php } ?>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
                  <div class="col-sm-10">
                      <input type="text" name="group_product" value="" placeholder="<?php echo $entry_product; ?>" id="input-group-product" class="form-control" />
                      <div id="group-product" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($group_products as $group_product) { ?>
                              <div id="group-product<?php echo $group_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $group_product['name']; ?>
                                  <input type="hidden" name="group_product[]" value="<?php echo $group_product['product_id']; ?>" />
                              </div>
                          <?php } ?>
                      </div>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                      <select name="status" id="input-status" class="form-control">
                          <?php if ($status) { ?>
                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                              <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                              <option value="1"><?php echo $text_enabled; ?></option>
                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                      </select>
                  </div>
              </div>
        </form>
      </div>
    </div>
  </div>
    <script>
        $('input[name=\'group_product\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['name'] + ' ' + item['model'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'group_product\']').val('');

                $('#group-product' + item['value']).remove();

                $('#group-product').append('<div id="group-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="group_product[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#group-product').delegate('.fa-minus-circle', 'click', function() {
            $(this).parent().remove();
        });
    </script>
</div>
</div>
<?php echo $footer; ?>
