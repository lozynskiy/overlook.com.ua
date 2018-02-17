<?php echo $header; ?>
    <style>
    tr.disable {
        background-color: rgba(243, 177, 177, 0.62);
    }
    tr.enable {
        background-color: rgba(181, 202, 190, 0.81);
    }
    </style>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
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
            <div class="pull-right">
                <?php if ($detail_log=='N') {?>
                    <a href="<?php echo $admin_link_enable_log ?>" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="Enable detail log">
                        <i class="fa fa-pencil-square-o"></i>
                    </a>
                <?php } else { ?>
                    <a href="<?php echo $admin_link_disable_log ?>" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Disable detail log">
                        <i class="fa fa-pencil-square-o"></i>
                    </a> 
                <?php } ?>
                <a href="<?php echo $admin_link_add_rule ?>" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="Add">
                    <i class="fa fa-plus-circle"></i>
                </a> 
                <!-- <a href="<?php echo DIR_APPLICATION ?>index.php?route=extension/modification/clear&amp;token=<?php echo $token; ?>" data-toggle="tooltip" title="" class="btn btn-warning" data-original-title="Clear"><i class="fa fa-eraser"></i></a>-->
                <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-events').submit() : false;" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
            </div>
            <h1>Rules of sending SMS</h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
            

        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-info"><i class="fa fa-info-circle"></i> You can view the log of sent messages and rules' functioning on the tab. <button type="button" class="close" data-dismiss="alert">×</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Rules of sending SMS</h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-general" data-toggle="tab">General</a></li>
                    <li><a href="#tab-log" data-toggle="tab">Log</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-general">
                        <form action="<?php echo $admin_link_rules_delete; ?>" method="post" enctype="multipart/form-data" id="form-events">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" style="vertical-align: top">
                                    <thead>
                                        <tr>
                                            <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                                            <td class="text-left">                        
                                                Event Type
                                            </td>
                                            <td class="text-left">                        
                                                Condition
                                            </td>
                                            <td class="text-left">                        
                                                Options
                                            </td>
                                            <td class="text-left">                        
                                                Message
                                            </td>
                                            <td class="text-left">                        
                                                Status
                                            </td>
                                            <td class="text-right">Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if ( ! empty($rules)) {?>
                                            <?php foreach ($rules as $i => $rule) {?>
                                            <tr <?php if (empty($rule['active'])) { ?> class="disable" <?php } else {?>class="enable" <?php } ?>>
                                                <td class="text-center">                        
                                                    <input type="checkbox" name="selected[]" value="<?php echo $i; ?>">
                                                </td>
                                                <td class="text-left"><?php echo $rule['event_type']?></td>
                                                <td class="text-left" style="vertical-align: top">

                                                    <table class="table table-bordered">
                                                      <tbody id="cart">
                                                            <?php if ( ! empty($rule['condition']['quantity']['value'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_quantity; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['quantity']['type'] == 1) {?>
                                                                    >=
                                                                <?php } elseif ($rule['condition']['quantity']['type'] == 2) {?>
                                                                    <=
                                                                <?php } elseif ($rule['condition']['quantity']['type'] == 3) {?>
                                                                    ==
                                                                <?php } ?>
                                                                <?php echo $rule['condition']['quantity']['value']; ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if ( ! empty($rule['condition']['price']['value'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_price; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['price']['type'] == 1) {?>
                                                                    >=
                                                                <?php } elseif ($rule['condition']['price']['type'] == 2) {?>
                                                                    <=
                                                                <?php } elseif ($rule['condition']['price']['type'] == 3) {?>
                                                                    ==
                                                                <?php } ?>
                                                                <?php echo $rule['condition']['price']['value']; ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if ( ! empty($rule['condition']['model'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_model; ?></label></td>
                                                              <td class="text-left">
                                                                <?php echo $rule['condition']['model']; ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['product_category'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_category; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($rule['condition']['product_category'] as $product_category) { ?>
                                                                    <?php echo $product_category['name'] ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['product_related'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_related; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($rule['condition']['product_related'] as $product_related) { ?>
                                                                    <?php echo $product_related['name'] ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['product_download'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_download; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($rule['condition']['product_download'] as $product_download) { ?>
                                                                    <?php echo $product_download['name'] ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['manufacturer'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label"><?php echo $entry_manufacturer; ?></label></td>
                                                              <td class="text-left">
                                                                <?php echo $rule['condition']['manufacturer'] ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>

                                                            <?php if (isset($rule['condition']['order_status_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_order_status; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($order_statuses as $status) {?>
                                                                    <?php if ($status['order_status_id'] == $rule['condition']['order_status_id']) {?>
                                                                        <?php echo $status['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['store_id']) 
                                                                      OR isset($rule['condition']['product_store'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_store; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if (isset($rule['condition']['store_id'])) { ?>
                                                                    <?php foreach ($stores as $store) {?>
                                                                        <?php if ($store['store_id'] == $rule['condition']['store_id']) {?>
                                                                            <?php echo $store['name'] ?>
                                                                            <?php break;?>
                                                                        <?php } ?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                                <?php if (isset($rule['condition']['product_store'])) { ?>
                                                                    <?php foreach ($rule['condition']['product_store'] as $store) {?>
                                                                            <?php echo $store['name'] ?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['currency_code'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_currency; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($currencies as $currency) {?>
                                                                    <?php if ($currency['code'] === $rule['condition']['currency_code']) {?>
                                                                        <?php echo $currency['title'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['customer_group_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_customer_group; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($customer_groups as $customer_group) {?>
                                                                    <?php if ($customer_group['customer_group_id'] == $rule['condition']['customer_group_id']) {?>
                                                                        <?php echo $customer_group['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            <?php if (isset($rule['condition']['payment_country_id']) AND ! empty($rule['condition']['payment_country_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_country; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($countries as $country) {?>
                                                                    <?php if ($country['country_id'] == $rule['condition']['payment_country_id']) {?>
                                                                        <?php echo $country['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if ( ! empty($rule['condition']['return_reason_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_return_reason; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($return_reasons as $return_reason) {?>
                                                                    <?php if ($return_reason['return_reason_id'] == $rule['condition']['return_reason_id']) {?>
                                                                        <?php echo $return_reason['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if ( ! empty($rule['condition']['return_reason_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_return_status; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($return_statuses as $return_status) {?>
                                                                    <?php if ($return_status['return_status_id'] == $rule['condition']['return_status_id']) {?>
                                                                        <?php echo $return_status['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if ( ! empty($rule['condition']['return_action_id'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_return_action; ?></label></td>
                                                              <td class="text-left">
                                                                <?php foreach ($return_actions as $return_action) {?>
                                                                    <?php if ($return_action['return_action_id'] == $rule['condition']['return_action_id']) {?>
                                                                        <?php echo $return_action['name'] ?>
                                                                        <?php break;?>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if (isset($rule['condition']['opened'])) { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_opened; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['opened'] == '1') {?>
                                                                    <?php echo $text_opened; ?>
                                                                <?php } ?>
                                                                <?php if ($rule['condition']['opened'] == '0') {?>
                                                                    <?php echo $text_unopened; ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if (isset($rule['condition']['newsletter']) AND $rule['condition']['newsletter'] !== '') { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_newsletter; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['newsletter']) {?>
                                                                    <?php echo $text_enabled; ?>
                                                                <?php } else {?>
                                                                    <?php echo $text_disabled; ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                            <?php if (isset($rule['condition']['approved']) AND $rule['condition']['approved'] !== '') { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_approved; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['approved']) {?>
                                                                    <?php echo $text_yes; ?>
                                                                <?php } else {?>
                                                                    <?php echo $text_no; ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>

                                                            <?php if (isset($rule['condition']['safe']) AND $rule['condition']['safe'] !== '') { ?>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $entry_safe; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ($rule['condition']['safe']) {?>
                                                                    <?php echo $text_yes; ?>
                                                                <?php } else {?>
                                                                    <?php echo $text_no; ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <?php } ?>
                                                            
                                                      </tbody>
                                                   </table>
                                                </td>
                                                <td class="text-left" style="vertical-align: top">
                                                    <table class="table table-bordered">
                                                      <tbody id="cart">
                                                        <tr>
                                                          <!-- <td class="text-center" colspan="6">No results!</td> -->
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $text_translit; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ( ! empty($rule['option']['translit_checked'])) { ?>
                                                                    on
                                                                <?php } else {?>
                                                                    off
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                            <tr>
                                                              <td class="text-left"><label class="col-sm-2 control-label" ><?php echo $text_start_at; ?></label></td>
                                                              <td class="text-left">
                                                                <?php if ( ! empty($rule['option']['date'])) { ?>
                                                                    <?php echo $rule['option']['date'] ?>
                                                                <?php } else {?> 
                                                                    <?php echo $text_instantly ?>
                                                                <?php } ?>
                                                              </td>
                                                            </tr>
                                                      </tbody>
                                                   </table>
                                                </td>
                                                <td class="text-left" style="vertical-align: top"><pre><?php echo $rule['message']?></pre></td>
                                                <td class="text-left">
                                                    <?php if (empty($rule['active'])) {?>
                                                        Disabled
                                                    <?php } else {?>
                                                        Enabled
                                                    <?php } ?>
                                                </td>
                                                <td class="text-right">
                                                    <a href="#" data-modification_id="<?php echo ($i+1)?>" data-href="<?php echo $admin_link_add_rule ?>&amp;rule_id=<?php echo $i ?>" data-toggle="tooltip" title="Edit" class="btn btn-success btn-edit" data-original-title="Edit"><i class="fa fa-edit"></i></a>
                                                    <?php if (empty($rule['active'])) {?>
                                                        <a href="#" data-modification_id="<?php echo ($i+1)?>" data-href="<?php echo $admin_link_rule_enable ?>&amp;token=<?php echo $token; ?>&amp;" data-toggle="tooltip" title="" class="btn btn-success btn-disable" data-original-title="Enable"><i class="fa fa-plus-circle"></i></a>
                                                    <?php } else { ?>
                                                        <a href="#" data-modification_id="<?php echo ($i+1)?>" data-href="<?php echo $admin_link_rule_disable ?>&amp;token=<?php echo $token; ?>&amp;" data-toggle="tooltip" title="" class="btn btn-danger btn-disable" data-original-title="Disable"><i class="fa fa-minus-circle"></i></a>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <?php } ?>
                                        <?php } else {?>
                                            <tr>
                                                <td class="text-center" colspan="6">No results!</td>
                                            </tr>
                                        <?php } ?>

                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="tab-log">
                        <p>
                            <textarea wrap="off" rows="15" class="form-control"><?php echo $log; ?></textarea>
                        </p>
                        <div class="text-right"><a href="<?php echo $admin_link_clearlog ?>" class="btn btn-danger"><i class="fa fa-eraser"></i> Clear</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--
<link href="view/javascript/dtpicker/jquery.simple-dtpicker.css" type="text/css" rel="stylesheet" />
<script src="view/javascript/common.js" type="text/javascript"></script>
<script src="view/javascript/dtpicker/jquery.simple-dtpicker.js" type="text/javascript"></script>
-->
<!--script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('message', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
</script-->

<style> 
    .highlight { background: #FA6; } 
</style>
<script src="<?php echo HTTP_SERVER; ?>view/javascript/jquery/jquery-ui/jquery-ui.min.js " type="text/javascript"></script>

<script type="text/javascript">
    
    function disable_event(url, modification_id) {
        $.ajax({
            url: url,
            type: 'post',
            data: {modification_id:modification_id},
            dataType: 'json',
            crossDomain: true,
            beforeSend: function () {
                $('#button-save').button('loading');
            },
            complete: function () {
                $('#button-save').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['error']) {
                    $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                if (json['success']) {
                    $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    // Refresh products, vouchers and totals
                    $('#button-refresh').trigger('click');
                }
                window.location.reload(true)
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        
    }
    
    $(function(){
        // Checkout
        $('.btn-disable').on('click', function () {
            disable_event($(this).data('href'), $(this).data('modification_id'));
            return false;
        });
        $('.btn-edit').on('click', function(event) {
            event.preventDefault()
            window.open($(this).data('href'));
        })
    })
    
</script>

<?php echo $footer; ?>