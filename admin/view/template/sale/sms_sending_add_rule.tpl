<?php echo $header; ?>
<style>
@font-face {
    font-family: 'Glyphicons Halflings';
    src: url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.eot');
    src: url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('/admin/view/javascript/bootstrap/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
}
</style>
<?php echo $column_left; ?>
            
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="index.php?route=sale/sms_sending/rules&amp;token=<?php echo $token; ?>" class="btn btn-default"><i class="fa fa-reply"></i> Rules</a></div>
      <h1>Add rule of sending SMS</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Add rule of sending SMS</h3>
      </div>
      <div class="panel-body">
        <form id="send-sms-rule" class="form-horizontal">
          
        <?php if (isset($rule_id)) :?>
            <input type="hidden" name="rule_id" value="<?php echo $rule_id; ?>" />
        <?php endif; ?>
        
          <ul id="order" class="nav nav-tabs nav-justified">
            <li class="disabled active"><a href="#tab-event" data-toggle="tab">1. Event Details</a></li>
            <li class="disabled"><a href="#tab-condition" data-toggle="tab">2. Condition</a></li>
            <li class="disabled"><a href="#tab-message-option" data-toggle="tab">3. Message Option</a></li>
            <li class="disabled"><a href="#tab-message" data-toggle="tab">4. Message</a></li>
            <li class="disabled"><a href="#tab-total" data-toggle="tab">5. Totals</a></li>
          </ul>
          
          <div class="tab-content">
            <div class="tab-pane active" id="tab-event">
              
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-event-type">Event Type</label>
                <div class="col-sm-10">
                  <select onchange="setCondition(this)" name="event_type" id="input-event-type" class="form-control">
                    <?php foreach ($event_types as $data) {?>
                        <option <?php if ($event_type == $data['code']) {?>selected="selected"<?php } ?> value="<?php echo $data['code'] ?>"><?php echo $data['caption'] ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
                            
              <div class="text-right">
                <button type="button" onclick="$('a[href=\'#tab-condition\']').tab('show');"  id="button-customer" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Continue</button>
              </div>
            </div>
            
            <div class="tab-pane" id="tab-condition">
                
            <?php if ('RETURN') {?>
                
            <?php ################## RETURN ############### ?>

              <div class="form-group condition OnReturnAdd">
                <label class="col-sm-2 control-label" for="input-return-reason"><?php echo $entry_return_reason; ?></label>
                <div class="col-sm-10">
                  <select name="condition[return_reason_id]" id="input-return-reason" class="form-control">
                    <option value="" selected="selected">-</option>
                    <?php foreach ($return_reasons as $return_reason) { ?>
                        <?php if (isset($rule_return_reason_id) AND $return_reason['return_reason_id'] == $rule_return_reason_id) { ?>
                        <option value="<?php echo $return_reason['return_reason_id']; ?>" selected="selected"><?php echo $return_reason['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              
              <div class="form-group condition OnReturnAdd">
                <label class="col-sm-2 control-label" for="input-opened"><?php echo $entry_opened; ?></label>
                <div class="col-sm-10">
                  <select name="condition[opened]" id="input-opened" class="form-control">
                    <option value="">-</option>
                    <option <?php if ($rule_opened==='1') {?>selected="selected"<?php } ?> value="1"><?php echo $text_opened; ?></option>
                    <option <?php if ($rule_opened==='0') {?>selected="selected"<?php } ?> value="0"><?php echo $text_unopened; ?></option>
                  </select>
                </div>
              </div>

              <div class="form-group condition OnReturnAdd">
                <label class="col-sm-2 control-label" for="input-return-status"><?php echo $entry_return_status; ?></label>
                <div class="col-sm-10">
                  <select name="condition[return_status_id]" id="input-return-status" class="form-control">
                    <option value="" selected="selected">-</option>
                    <?php foreach ($return_statuses as $return_status) { ?>
                        <?php if (isset($rule_return_status_id) AND $return_status['return_status_id'] == $rule_return_status_id) { ?>
                        <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group condition OnReturnAdd">
                <label class="col-sm-2 control-label" for="input-return-action"><?php echo $entry_return_action; ?></label>
                <div class="col-sm-10">
                  <select name="condition[return_action_id]" id="input-return-action" class="form-control">
                    <option value="0">-</option>
                    <?php foreach ($return_actions as $return_action) { ?>
                        <?php if (isset($rule_return_action_id) AND $return_action['return_action_id'] == $rule_return_action_id) { ?>
                        <option value="<?php echo $return_action['return_action_id']; ?>" selected="selected"> <?php echo $return_action['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $return_action['return_action_id']; ?>"><?php echo $return_action['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>

            <?php ################## RETURN ############### ?>
            
            <?php } ?>

            <?php if ('CUSTOMER') {?>
            
            <?php ################## CUSTOMER ############### ?>

            <div class="form-group condition OnCustomerAdd">
              <label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
              <div class="col-sm-10">
                <select name="condition[customer_group_id]" id="input-customer-group" class="form-control">
                  <option value="" selected="selected">-</option>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                      <?php if (isset($rule_customer_group_id) AND $customer_group['customer_group_id'] == $rule_customer_group_id) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                      <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>

            <div class="form-group condition OnCustomerAdd">
              <label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_newsletter; ?></label>
              <div class="col-sm-10">
                <select name="condition[newsletter]" id="input-newsletter" class="form-control">
                  <option value="" selected="selected">-</option>
                  <?php if ($rule_newsletter === 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } elseif ($rule_newsletter === 0) { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <?php /*<div class="form-group condition OnCustomerAdd">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-10">
                <select name="condition[status]" id="input-status" class="form-control">
                  <option value="" selected="selected">-</option>
                  <?php if ($status) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div> */ ?>
            <div class="form-group condition OnCustomerAdd">
              <label class="col-sm-2 control-label" for="input-approved"><?php echo $entry_approved; ?></label>
              <div class="col-sm-10">
                <select name="condition[approved]" id="input-approved" class="form-control">
                  <option value="" selected="selected">-</option>
                  <?php if ($rule_approved === 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                      <option value="0"><?php echo $text_no; ?></option>
                  <?php } elseif ($rule_approved === 0) { ?>
                      <option value="1"><?php echo $text_yes; ?></option>
                      <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group condition OnCustomerAdd">
              <label class="col-sm-2 control-label" for="input-safe"><?php echo $entry_safe; ?></label>
              <div class="col-sm-10">
                <select name="condition[safe]" id="input-safe" class="form-control">
                  <option value="" selected="selected">-</option>
                  <?php if ($rule_safe === 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                      <option value="0"><?php echo $text_no; ?></option>
                  <?php } elseif ($rule_safe === 0) { ?>
                      <option value="1"><?php echo $text_yes; ?></option>
                      <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>

            <?php ################## CUSTOMER ############### ?>
            
            <?php } ?>

            <?php if ('PRODUCT') {?>
            
            <?php ################# PRODUCT ############# ?>

              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-2">
                  <select name="condition[quantity][type]" id="input-return-action" class="form-control">
                    <option <?php if ($rule_quantity['type'] == 1) {?> selected="selected" <?php } ?> value="1">>=</option>
                    <option <?php if ($rule_quantity['type'] == 2) {?> selected="selected" <?php } ?> value="2"><=</option>
                    <option <?php if ($rule_quantity['type'] == 3) {?> selected="selected" <?php } ?> value="3">==</option>
                  </select>
                </div>
                <div class="col-sm-8">
                    <input type="text" name="condition[quantity][value]" value="<?php echo $rule_quantity['value']; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>

              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-2">
                  <select name="condition[price][type]" id="input-return-action" class="form-control">
                    <option <?php if ($rule_price['type']) {?> selected="selected" <?php } ?> value="1">>=</option>
                    <option <?php if ($rule_price['type'] == 2) {?> selected="selected" <?php } ?> value="2"><=</option>
                    <option <?php if ($rule_price['type'] == 3) {?> selected="selected" <?php } ?> value="3">==</option>
                  </select>
                </div>
                <div class="col-sm-8">
                  <input type="text" name="condition[price][value]" value="<?php echo $rule_price['value']; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              
              <?php /*
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_reward; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <tr>
                      <td class="text-left"><?php echo $customer_group['name']; ?></td>
                      <td class="text-right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div> */?>
              
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[model]" value="<?php echo $rule_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>

              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[manufacturer]" value="<?php echo $rule_manufacturer; ?>" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                  <input type="hidden" name="condition[manufacturer_id]" value="<?php echo $rule_manufacturer_id; ?>" />
                </div>
              </div>
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[category]" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($rule_product_category as $product_category) { ?>
                    <div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
                      <input type="hidden" name="condition[product_category][]" value="<?php echo $product_category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php /*
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_filters as $product_filter) { ?>
                    <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                      <input type="hidden" name="condition[product_filter][]" value="<?php echo $product_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              */ ?>
              
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php /*<div class="checkbox">
                      <label>
                        <?php if (in_array(0, $rule_product_store)) { ?>
                            <input type="checkbox" name="condition[product_store][]" value="0" checked="checked" />
                            <?php echo $text_default; ?>
                        <?php } else { ?>
                            <input type="checkbox" name="condition[product_store][]" value="0" />
                            <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div> */?>
                    <?php foreach ($rule_stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $rule_product_store)) { ?>
                            <input type="checkbox" name="condition[product_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                            <?php echo $store['name']; ?>
                        <?php } else { ?>
                            <input type="checkbox" name="condition[product_store][]" value="<?php echo $store['store_id']; ?>" />
                            <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[download]" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_downloads as $product_download) { ?>
                    <div id="product-download<?php echo $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                      <input type="hidden" name="condition[product_download][]" value="<?php echo $product_download['download_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group condition OnProductAdd OnProductEdit">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[related]" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                      <input type="hidden" name="condition[product_related][]" value="<?php echo $product_related['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>

            <?php ################# PRODUCT ############# ?>
            
            <?php } ?>
            
            <?php if ('PRODUCT') {?>

            <?php ################# ORDER ############# ?>
              
            <div class="form-group condition OnOrderHistoryAdd">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
              <div class="col-sm-10">
                <select name="condition[order_status_id]" id="input-order-status" class="form-control">
                  <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if (isset($rule_order_status_id) AND $order_status['order_status_id'] == $rule_order_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
              
              <!-- ////////////////// -->
              
              <?php foreach ($custom_fields as $custom_field) { ?>
              <?php if ($custom_field['location'] == 'account') { ?>
              <?php if ($custom_field['type'] == 'select') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <select name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'radio') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div class="radio">
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                      <label>
                        <input type="radio" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="radio" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } ?>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'checkbox') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div class="checkbox">
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                      <label>
                        <input type="checkbox" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="checkbox" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } ?>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              <?php /*if ($custom_field['type'] == 'text') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'textarea') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <textarea name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'file') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                  <input type="hidden" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'date') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <div class="input-group date">
                    <input type="text" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'time') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <div class="input-group time">
                    <input type="text" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <?php } ?>
              <?php if ($custom_field['type'] == 'datetime') { ?>
              <div class="form-group condition custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
                <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                <div class="col-sm-10">
                  <div class="input-group datetime">
                    <input type="text" name="condition[custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <?php }*/ ?>
              <?php } ?>
              <?php } ?>
              
              <!-- ////////////////// -->
              
              
              <div class="form-group condition OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                <label class="col-sm-2 control-label" for="input-store"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <select name="condition[store_id]" id="input-store" class="form-control">
                    <?php foreach ($rule_stores as $store) { ?>
                        <?php if (isset($rule_store_id) AND $store['store_id'] == $rule_store_id) { ?>
                        <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group condition OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                <label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
                <div class="col-sm-10">
                  <select name="condition[currency_code]" id="input-currency" class="form-control">
                    <?php foreach ($currencies as $currency) { ?>
                        <?php if (isset($rule_currency_code) AND $currency['code'] == $rule_currency_code) { ?>
                            <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group condition OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                <label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
                <div class="col-sm-10">
                  <select name="condition[customer_group_id]" id="input-customer-group" class="form-control">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if (isset($rule_customer_group_id) AND $customer_group['customer_group_id'] == $rule_customer_group_id) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <!-- <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-store">Product</label>
                <div class="col-sm-10">
                  <select name="store_id" id="input-store" class="form-control">
                    <option value="0" selected="selected">On Order Add</option>
                    <option value="1" selected="selected">On Order Edit</option>
                    <option value="2" selected="selected">On Order Delete</option>
                  </select>
                </div>
              </div> -->
              <div class="form-group condition OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                <label class="col-sm-2 control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <select name="condition[payment_country_id]" id="input-payment-country" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                        <?php if (isset($rule_payment_country_id) AND $country['country_id'] == $rule_payment_country_id) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php /* <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store">Shipping Method</label>
                <div class="col-sm-10">
                  <select name="store_id" id="input-store" class="form-control">
                    <option value="0" selected="selected">On Order Add</option>
                    <option value="1" selected="selected">On Order Edit</option>
                    <option value="2" selected="selected">On Order Delete</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store">Payment Method</label>
                <div class="col-sm-10">
                  <select name="store_id" id="input-store" class="form-control">
                    <option value="0" selected="selected">On Order Add</option>
                    <option value="1" selected="selected">On Order Edit</option>
                    <option value="2" selected="selected">On Order Delete</option>
                  </select>
                </div>
              </div> -->
              
              <!--
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-shipping-method"><?php echo $entry_shipping_method; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <select name="shipping_method" id="input-shipping-method" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php if ($shipping_code) { ?>
                        <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
                        <?php } ?>
                      </select>
                      <span class="input-group-btn">
                      <button type="button" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-payment-method"><?php echo $entry_payment_method; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <select name="payment_method" id="input-payment-method" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php if ($payment_code) { ?>
                        <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
                        <?php } ?>
                      </select>
                      <span class="input-group-btn">
                      <button type="button" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                */ ?>
                            
              <div class="text-right">
                <div class="col-sm-6 text-left">
                  <button type="button" onclick="$('a[href=\'#tab-event\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div class="col-sm-6 text-right">
                    <button type="button" onclick="$('a[href=\'#tab-message-option\']').tab('show');"  id="button-customer" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Continue</button>
                </div>
              </div>
            </div>
            
            <?php } ?>
            
            <div class="tab-pane" id="tab-message-option">
              
                <div class="form-group option-customer-group-id">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_customer_group; ?></label>
                  <div class="col-sm-10">
                  <select name="option[customer_group_id]" id="input-customer-group" class="form-control">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if (isset($rule_customer_group_id) AND $customer_group['customer_group_id'] == $rule_customer_group_id) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                  </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_translit; ?></label>
                  <div class="col-sm-10">
                    <input class="form-control" class="form-control" <?php if( ! empty($option_translit_checked)) { ?>checked="checked"<?php } ?> id="translit" type="checkbox" name="option[translit]" onClick="document.getElementById('translit_checked').value = this.checked ? 1 : 0;"/>
                    <input type="hidden" name="option[translit_checked]" id="translit_checked" <?php if( ! empty($option_translit_checked)) { ?>value="1"<?php } else {?> value="0"<?php } ?> />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_start_at; ?></label>
                  <div class="col-sm-10">
                    <input id="custom" type="radio" value="2" onclick="en()" name="option[timetype]" <?php if ( ! empty($option_date)) {?>checked="checked"<?php } ?>></input>
                    <input class="form-control date" type="text" id="date" name="option[date]" <?php if (empty($option_date)) {?>disabled="disabled"<?php } ?> value="<?php echo (isset($option_date) ? $option_date : ''); ?>">
                    <input type="hidden" id="timesend" name="option[timesend]" value="1">
                  </div>
                </div>
                
                <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_instantly; ?></label>
              <div class="col-sm-10">
                <input class="form-control" name="option[timetype]" id="imm" onclick="dis()" value="1" type="radio" <?php if (empty($option_date)) {?>checked="checked"<?php } ?>>
              </div>
            </div>
              
              
              <div class="row">
                <div class="col-sm-6 text-left">
                  <button type="button" onclick="$('a[href=\'#tab-condition\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div class="col-sm-6 text-right">
                  <button type="button"  onclick="$('a[href=\'#tab-message\']').tab('show');" id="button-shipping-address" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Continue</button>
                </div>
              </div>
            </div>
            
            <div class="tab-pane" id="tab-message">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <td class="text-left">Field Name</td>
                      <td class="text-left">Description</td>
                      <td>Action</td>
                    </tr>
                  </thead>
                  <tbody id="cart">
                    <tr>
                    
                      <!-- <td class="text-center" colspan="6">No results!</td> -->
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">order_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('order_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">invoice_prefix</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('invoice_prefix'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">store_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('store_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">store_name</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('store_name'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">store_url</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('store_url'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">customer_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">customer_group_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer_group_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">firstname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('firstname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">lastname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">email</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('email'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">telephone</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('telephone'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">fax</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('fax'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_firstname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_firstname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_lastname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_company</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_company'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_address_1</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_address_1'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_address_2</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_address_2'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_postcode</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_postcode'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_zone</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_zone'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_zone_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_zone_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_country</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_country'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_country_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_country_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_method</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_method'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">payment_code</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('payment_code'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_firstname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_firstname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_lastname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_company</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_company'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_address_1</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_address_1'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_address_2</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_address_2'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_city</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_city'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_postcode</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_postcode'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_zone</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_zone'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_zone_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_zone_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_country</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_country'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_method</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_method'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">shipping_code</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('shipping_code'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <!--
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">products.name</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('products.name'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">products.model</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('products.model'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">products.quantity</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('products.quantity'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">products.price</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('products.price'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">products.total</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('products.total'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        -->
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">total</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('total'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">comment</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('comment'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">affiliate_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('affiliate_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">commission</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('commission'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnOrderAdd OnOrderEdit OnOrderDelete OnOrderHistoryAdd">
                          <td class="text-left">currency_code</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('currency_code'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnReturnAdd">
                          <td class="text-left">return_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('return_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>                        
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">order_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('order_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">date_ordered</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('date_ordered'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">customer</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">customer_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">firstname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('firstname OnOrderHistoryAdd'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">lastname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('invoice_prefix'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">email</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">telephone</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">product</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('product'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">product_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('product_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">model</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('model'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">quantity</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('quantity'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">return_reason_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('return_reason_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">opened</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('opened'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnReturnAdd">
                          <td class="text-left">comment</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('comment'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">customer_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>                        
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">customer_group_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('customer_group_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">firstname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('firstname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">lastname</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('lastname'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">email</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('email'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">telephone</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('telephone'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">fax</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('fax'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">password</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('password'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">newsletter</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('newsletter'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">status</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('status'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">approved</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('approved'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnCustomerAdd">
                          <td class="text-left">safe</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('safe'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">product_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('product_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>  
                        <!--<tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">product_description.name</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('product_description.name'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">product_description.description</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('product_description.description'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>-->
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">model</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('model'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">location</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('location'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">price</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('price'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">quantity</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('quantity'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">minimum</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('minimum'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">stock_status_id</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('stock_status_id'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">length</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('length'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">width</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('width'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">height</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('height'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>
                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">weight</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('weight'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">status</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('status'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">manufacturer</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('manufacturer'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">category</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('category'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        <tr class="fields OnProductAdd OnProductEdit">
                          <td class="text-left">filter</td>
                          <td class="text-left">....</td>
                          <td><button type="button"  onclick="fieldAdd('filter'); return false;" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Add</button></td>
                        </tr>

                        
                    </tr>
                  </tbody>
               </table>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-shipping-firstname">Message</label>
                <div class="col-sm-10">
                  <textarea name="message" rows="5" id="input-message" class="form-control"><?php echo $message ?></textarea>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-6 text-left">
                  <button type="button" onclick="$('a[href=\'#tab-message-option\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div class="col-sm-6 text-right">
                  <button type="button"  onclick="ShowTotal(); $('a[href=\'#tab-total\']').tab('show');" id="button-shipping-address" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Continue</button>
                </div>
              </div>
            </div>
            
            <div class="tab-pane" id="tab-total">
              <fieldset>
                <legend>Order Details</legend>
                  <table class="table table-bordered">
                  <tbody id="cart">
                    <tr>
                      <!-- <td class="text-center" colspan="6">No results!</td> -->
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status">Event Type</label></td>
                          <td id="total_event_type" class="text-left">
                              
                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label></td>
                          <td id="total_order_statuses" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_store; ?></label></td>
                          <td id="total_stores" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_currency; ?></label></td>
                          <td id="total_currencies" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-customer-group"><?php echo $entry_customer_group; ?></label></td>
                          <td id="total_customer_groups" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-country"><?php echo $entry_country; ?></label></td>
                          <td id="total_countries" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-translit"><?php echo $text_translit; ?></label></td>
                          <td id="total_translit" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status"><?php echo $text_start_at; ?></label></td>
                          <td id="total_start_at" class="text-left">

                          </td>
                        </tr>
                        <tr>
                          <td class="text-left"><label class="col-sm-2 control-label" for="input-order-status">Message</label></td>
                          <td class="text-left">
                              <pre id="total_message" ></pre>
                          </td>
                        </tr>
                  </tbody>
               </table>
              </fieldset>
              <div class="row">
                <div class="col-sm-6 text-left">
                  <button type="button" onclick="$('a[href=\'#tab-message\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div class="col-sm-6 text-right">
                  <button type="button" id="button-refresh" data-toggle="tooltip" title="" data-loading-text="Loading..." class="btn btn-warning" data-original-title="Refresh"><i class="fa fa-refresh"></i></button>
                  <button type="button" id="button-save" class="btn btn-primary"><i class="fa fa-check-circle"></i> Save</button>
                </div>
              </div>
            </div>
          
          </div>
          
        </form>
      </div>
    </div>
  </div>
</div>
  <script type="text/javascript"><!--
// Disable the tabs
$('#order a[data-toggle=\'tab\']').on('click', function(e) {
	return false;
});
function dis(){
    $('#date').attr('disabled', 'disabled');
}
function en(){
    $('#date').removeAttr('disabled');
    create_calendar();
}
function create_calendar() {
    $('.date').datetimepicker({
        locale: 'ru',
        format: 'YYYY-MM-DD HH:mm', // :ss
        initialDate: true,
        pickTime: true
    });
}
function setCondition(select) {
    var value = $(select).find(':selected').val();
  
/*
    $('.OnOrderHistoryAddCond').hide();
    $('.OnOrderHistoryAddCond').find('select, input, textarea').prop({disabled: true});
    $('.OnOrderAdd').hide();
    $('.OnOrderAdd').find('select, input, textarea').prop({disabled: true});
*/

    $('.condition').hide();
    $('.condition').find('select, input, textarea').prop({disabled: true});
    
    $('.fields').hide();
    $('.fields').find('select, input, textarea').prop({disabled: true});

    $('.' + value).show();
    $('.' + value).find('select, input, textarea').prop({disabled: false});
    
    if (value == 'OnProductAdd' || value == 'OnProductEdit') {
        $('.option-customer-group-id').show();
    } else {
        $('.option-customer-group-id').hide();
    }
    
}

setCondition($('#input-event-type'));

function ShowTotal() {
    var order_statuses = <?php echo json_encode($order_statuses)?>,
        stores = <?php echo json_encode($rule_stores)?>,
        currencies = <?php echo json_encode($currencies)?>,
        customer_groups = <?php echo json_encode($customer_groups)?>,
        countries = <?php echo json_encode($countries)?>,
        i,
        order_status_id = $('#input-order-status').val(),
        store_id = $('#input-store').val(),
        currency_code = $('#input-currency').val(),
        customer_group_id = $('#input-customer-group').val(),
        payment_country_id = $('#input-payment-country').val(),
        status,
        store,
        currency,
        customer_group,
        country,
        translit = $('#translit').is(':checked'),
        timetype = $('[name="option\\[timetype\\]"]:checked').val(); // 2 - date, 1 - Immediately
        
        if (order_status_id) {
            for (i=0;i<order_statuses.length;i++){
                status = order_statuses[i];
                if (status['order_status_id'] == order_status_id){
                    $('#total_order_statuses').html(status['name']);
                    break;
                }
            }
        }

        if (store_id) {
            for (i=0;i<stores.length;i++){
                store = stores[i];
                if (store['store_id'] == store_id){
                    $('#total_stores').html(store['name']);
                    break;
                }
            }
        }

        if (currency_code) {
            for (var code in currencies){
                if (currency_code === code){
                    $('#total_currencies').html(currencies[code]['title']);
                    break;
                }
            }
        }

        if (customer_group_id) {
            for (i=0;i<customer_groups.length;i++){
                customer_group = customer_groups[i];
                if (customer_group['customer_group_id'] == customer_group_id){
                    $('#total_customer_groups').html(customer_group['name']);
                    break;
                }
            }
        }

        if (payment_country_id) {
            for (i=0;i<countries.length;i++){
                country = countries[i];
                if (country['country_id'] == payment_country_id){
                    $('#total_countries').html(country['name']);
                    break;
                }
            }
        }
        
        $('#total_translit').html(translit ? 'On' : 'Off');
        $('#total_start_at').html(timetype == '2' ? $('#date').val() : '<?php echo $text_instantly; ?>');
        
        $('#total_event_type').html($('#input-event-type option:selected').text())
        $('#total_message').html($("#input-message").val())
}

$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
/*
var token = '';

// Login to the API
$.ajax({
	url: '<?php echo $catalog; ?>index.php?route=api/login',
	type: 'post',
	data: 'key=<?php echo $api_key; ?>',
	dataType: 'json',
	crossDomain: true,
	success: function(json) {
        $('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}

            if (json['error']['ip']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

		if (json['token']) {
			token = json['token'];

            $('select[name=\'currency\']').trigger('change');
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});
*/

/*
// Currency
$('select[name=\'currency\']').on('change', function() {
	$.ajax({
		url: '<?php echo $catalog; ?>index.php?route=api/currency&token=' + token + '&store_id=' + $('select[name=\'store_id\'] option:selected').val(),
		type: 'post',
		data: 'currency=' + $('select[name=\'currency\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('select[name=\'currency\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Highlight any found errors
				$('select[name=\'currency\']').closest('.form-group').addClass('has-error');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


// Customer
$('input[name=\'customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $_GET['token']?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					customer_id: '0',
					customer_group_id: '1',
					name: ' --- None --- ',
					customer_group: '',
					firstname: '',
					lastname: '',
					email: '',
					telephone: '',
					fax: '',
					custom_field: [],
					address: []
				});

				response($.map(json, function(item) {
					return {
						category: item['customer_group'],
						label: item['name'],
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],
						firstname: item['firstname'],
						lastname: item['lastname'],
						email: item['email'],
						telephone: item['telephone'],
						fax: item['fax'],
						custom_field: item['custom_field'],
						address: item['address']
					}
				}));
			}
		});
	},
	'select': function(item) {
		// Reset all custom fields
		$('#tab-customer input[type=\'text\'], #tab-customer textarea').not('#tab-customer input[name=\'customer\'], #tab-customer input[name=\'customer_id\']').val('');
		$('#tab-customer select option').not($('#tab-customer select[name=\'store_id\'] option, #tab-customer select[name=\'currency\'] option')).removeAttr('selected');
		$('#tab-customer input[type=\'checkbox\'], #tab-customer input[type=\'radio\']').removeAttr('checked');

		$('#tab-customer input[name=\'customer\']').val(item['label']);
		$('#tab-customer input[name=\'customer_id\']').val(item['value']);
		$('#tab-customer select[name=\'customer_group_id\']').val(item['customer_group_id']);
		$('#tab-customer input[name=\'firstname\']').val(item['firstname']);
		$('#tab-customer input[name=\'lastname\']').val(item['lastname']);
		$('#tab-customer input[name=\'email\']').val(item['email']);
		$('#tab-customer input[name=\'telephone\']').val(item['telephone']);
		$('#tab-customer input[name=\'fax\']').val(item['fax']);

		for (i in item.custom_field) {
			$('#tab-customer select[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#tab-customer textarea[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#tab-customer input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(item.custom_field[i]);
			$('#tab-customer input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(item.custom_field[i]);
			$('#tab-customer input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + item.custom_field[i] + '\']').prop('checked', true);

			if (item.custom_field[i] instanceof Array) {
				for (j = 0; j < item.custom_field[i].length; j++) {
					$('#tab-customer input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + item.custom_field[i][j] + '\']').prop('checked', true);
				}
			}
		}

		$('select[name=\'customer_group_id\']').trigger('change');

		html = '<option value="0"> --- None --- </option>';

		for (i in  item['address']) {
			html += '<option value="' + item['address'][i]['address_id'] + '">' + item['address'][i]['firstname'] + ' ' + item['address'][i]['lastname'] + ', ' + item['address'][i]['address_1'] + ', ' + item['address'][i]['city'] + ', ' + item['address'][i]['country'] + '</option>';
		}

		$('select[name=\'payment_address\']').html(html);
		$('select[name=\'shipping_address\']').html(html);

		$('select[name=\'payment_address\']').trigger('change');
		$('select[name=\'shipping_address\']').trigger('change');
	}
});*/

/*
// Custom Fields
$('select[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/customfield&token=<?php echo $_GET['token']?>&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('.custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('.custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'customer_group_id\']').trigger('change');


$('#tab-product input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $_GET['token']?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id'],
						model: item['model'],
						option: item['option'],
						price: item['price']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#tab-product input[name=\'product\']').val(item['label']);
		$('#tab-product input[name=\'product_id\']').val(item['value']);

		if (item['option'] != '') {
 			html  = '<fieldset>';
            html += '  <legend>Choose Option(s)</legend>';

			for (i = 0; i < item['option'].length; i++) {
				option = item['option'][i];

				if (option['type'] == 'select') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""> --- Please Select --- </option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'radio') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""> --- Please Select --- </option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'checkbox') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <div id="input-option' + option['product_option_id'] + '">';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<div class="checkbox">';

						html += '  <label><input type="checkbox" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" /> ' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '  </label>';
						html += '</div>';
					}

					html += '    </div>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'image') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""> --- Please Select --- </option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'text') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" class="form-control" /></div>';
					html += '</div>';
				}

				if (option['type'] == 'textarea') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><textarea name="option[' + option['product_option_id'] + ']" rows="5" id="input-option' + option['product_option_id'] + '" class="form-control">' + option['value'] + '</textarea></div>';
					html += '</div>';
				}

				if (option['type'] == 'file') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <button type="button" id="button-upload' + option['product_option_id'] + '" data-loading-text="Loading..." class="btn btn-default"><i class="fa fa-upload"></i> Upload</button>';
					html += '    <input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" />';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'date') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group date"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'datetime') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group datetime"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'time') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group time"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}
			}

			html += '</fieldset>';

			$('#option').html(html);

			$('.date').datetimepicker({
				pickTime: false
			});

			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});

			$('.time').datetimepicker({
				pickDate: false
			});
		} else {
			$('#option').html('');
		}
	}
});


$('#button-product-add').on('click', function() {
	$.ajax({
		url: '/index.php?route=api/cart/add&token=' + token + '&store_id=' + $('select[name=\'store_id\'] option:selected').val(),
		type: 'post',
		data: $('#tab-product input[name=\'product_id\'], #tab-product input[name=\'quantity\'], #tab-product input[name^=\'option\'][type=\'text\'], #tab-product input[name^=\'option\'][type=\'hidden\'], #tab-product input[name^=\'option\'][type=\'radio\']:checked, #tab-product input[name^=\'option\'][type=\'checkbox\']:checked, #tab-product select[name^=\'option\'], #tab-product textarea[name^=\'option\']'),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-product-add').button('loading');
		},
		complete: function() {
			$('#button-product-add').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							$(element).parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							$(element).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['store']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['store'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parentsUntil('.form-group').parent().addClass('has-error');
			} else {
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
*/


// Shipping Method
/*$('#button-shipping-method').on('click', function() {
	$.ajax({
		url: '/index.php?route=api/shipping/method&token=' + token + '&store_id=' + $('select[name=\'store_id\'] option:selected').val(),
		type: 'post',
		data: 'shipping_method=' + $('select[name=\'shipping_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-shipping-method').button('loading');
		},
		complete: function() {
			$('#button-shipping-method').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Highlight any found errors
				$('select[name=\'shipping_method\']').closest('.form-group').addClass('has-error');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Payment Method
$('#button-payment-method').on('click', function() {
	$.ajax({
		url: '/index.php?route=api/payment/method&token=' + token + '&store_id=' + $('select[name=\'store_id\'] option:selected').val(),
		type: 'post',
		data: 'payment_method=' + $('select[name=\'payment_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-payment-method').button('loading');
		},
		complete: function() {
			$('#button-payment-method').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Highlight any found errors
				$('select[name=\'payment_method\']').closest('.form-group').addClass('has-error');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
*/

/*
// Affiliate
$('input[name=\'affiliate\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $_GET['token']?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					affiliate_id: 0,
					name: ' --- None --- '
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['affiliate_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'affiliate\']').val(item['label']);
		$('input[name=\'affiliate_id\']').val(item['value']);
	}
});

*/

// Checkout
$('#button-save').on('click', function() {
	var url = 'index.php?route=sale/sms_sending/save_rule&token=<?php echo $token; ?>&store_id=' + $('select[name=\'store_id\'] option:selected').val();

	$.ajax({
		url: url,
		type: 'post',
		data: $('#send-sms-rule').serialize(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-save').button('loading');
		},
		complete: function() {
			$('#button-save').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                // Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
            }

			if (json['order_id']) {
				$('input[name=\'order_id\']').val(json['order_id']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});



/*
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});*/

//--></script> 
  <script type="text/javascript">
// Sort the custom fields
$('#tab-customer .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-customer .form-group').length) {
		$('#tab-customer .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#tab-customer .form-group').length) {
		$('#tab-customer .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#tab-customer .form-group').length) {
		$('#tab-customer .form-group:first').before(this);
	}
});

// Sort the custom fields
$('#tab-payment .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-payment .form-group').length) {
		$('#tab-payment .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#tab-payment .form-group').length) {
		$('#tab-payment .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#tab-payment .form-group').length) {
		$('#tab-payment .form-group:first').before(this);
	}
});

$('#tab-shipping .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-shipping .form-group').length) {
		$('#tab-shipping .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#tab-shipping .form-group').length) {
		$('#tab-shipping .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#tab-shipping .form-group').length) {
		$('#tab-shipping .form-group:first').before(this);
	}
});

function fieldAdd(text) {
    insertAtCaret('input-message', text);
}

function insertAtCaret(areaId,text) {
    text = '{{' + text + '}}';
    var txtarea = document.getElementById(areaId);
    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? 
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") { 
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        strPos = range.text.length;
    }
    else if (br == "ff") strPos = txtarea.selectionStart;

    var front = (txtarea.value).substring(0,strPos);  
    var back = (txtarea.value).substring(strPos,txtarea.value.length); 
    txtarea.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") { 
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        range.moveStart ('character', strPos);
        range.moveEnd ('character', 0);
        range.select();
    }
    else if (br == "ff") {
        txtarea.selectionStart = strPos;
        txtarea.selectionEnd = strPos;
        txtarea.focus();
    }
    txtarea.scrollTop = scrollPos;
}

</script>
            
            
  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'condition\[manufacturer\]\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'condition\[manufacturer\]\']').val(item['label']);
		$('input[name=\'condition\[manufacturer_id\]\']').val(item['value']);
	}
});

// Category
$('input[name=\'condition\[category\]\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'condition\[category\]\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="condition[product_category][]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="condition[product_filter][]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Downloads
$('input[name=\'condition\[download\]\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['download_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'condition\[download\]\']').val('');

		$('#product-download' + item['value']).remove();

		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="condition[product_download][]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'condition\[related\]\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'condition\[related\]\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="condition[product_related][]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

//--></script>

<?php echo $footer; ?>