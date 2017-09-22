<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-coupon" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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

			<?php if ($success) { ?>
    		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      			<button type="button" class="close" data-dismiss="alert">&times;</button>
    		</div>
    		<?php } ?>
			
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-coupon" class="form-horizontal">
          
			<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_signup; ?>
            	<button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label" for="google_analytics_store">Store</label>
            <div class="col-sm-10">
              <select name="google_analytics_store" id="google_analytics_store" class="form-control">
              	<?php if (count($stores)) { ?>
              		<option value="">Select one</option>
              		<?php foreach ($stores as $store) { ?>
                    	<option value="<?php echo $store['store_id']; ?>"><?php echo $store['store_name']; ?></option>
                    <?php } ?>
              	<?php } ?>
              </select>
            </div>
			</div>
            <div class="form-group">
            <label class="col-sm-2 control-label" for="google_analytics_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
            	<select name="google_analytics_status" id="google_analytics_status" class="form-control">
					<option value="">Select...</option>
                	<option value="1"><?php echo $text_enabled; ?></option>
                	<option value="0"><?php echo $text_disabled; ?></option>
            	</select>
            </div>
            </div>
          	<div class="form-group">
          		<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_ga_exclude_admin; ?>"><?php echo $entry_ga_exclude_admin; ?></span></label>
          		<div class="col-sm-10">
          			<select name="google_analytics_exclude_admin" id="google_analytics_exclude_admin" class="form-control">
						<option value="">Select...</option>
                		<option value="1"><?php echo $text_no_track; ?></option>
                		<option value="0"><?php echo $text_track; ?></option>
              		</select>
          		</div>
          	</div>
          	<div class="form-group">
          		<label class="col-sm-2 control-label" for="google_analytics_property_id"><span data-toggle="tooltip" title="<?php echo $help_ua_tracking; ?>"><?php echo $entry_ua_tracking; ?></span></label>
          		<div class="col-sm-10">
                  <input type="text" id="google_analytics_property_id" name="google_analytics_property_id" value="" class="form-control" />
                </div>
          	</div>
          	<div class="form-group">
          		<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_ga_remarketing; ?>"><?php echo $entry_ga_remarketing; ?></span></label>
          		<div class="col-sm-10">
          			<select name="google_analytics_remarketing" id="google_analytics_remarketing" class="form-control">
						<option value="">Select...</option>
                		<option value="1"><?php echo $text_enabled; ?></option>
                		<option value="0"><?php echo $text_disabled; ?></option>
              		</select>
          		</div>
          	</div>
			<div class="form-group">
          		<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_ga_cookie; ?>"><?php echo $entry_ga_cookie; ?></span></label>
          		<div class="col-sm-10">
          			<select name="google_analytics_cookie" id="google_analytics_cookie" class="form-control">
						<option value="">Select...</option>
                		<option value="1"><?php echo $text_enabled; ?></option>
                		<option value="0"><?php echo $text_disabled; ?></option>
              		</select>
          		</div>
          	</div>
          	<div class="form-group">
          		<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_ga_adwords; ?>"><?php echo $entry_ga_adwords; ?></span></label>
          		<div class="col-sm-10">
          			<select name="google_analytics_adwords" id="google_analytics_adwords" class="form-control show-adwords">
						<option value="">Select...</option>
                		<option value="1"><?php echo $text_enabled; ?></option>
                		<option value="0"><?php echo $text_disabled; ?></option>
              		</select>
          		</div>
          	</div>
          	<div class="form-group adwords-visible">
          		<label class="col-sm-2 control-label" for="google_analytics_conversion_id"><span data-toggle="tooltip" title="<?php echo $help_ga_conversion_id; ?>"><?php echo $entry_ga_conversion_id; ?></span></label>
          		<div class="col-sm-10">
                	<input type="text" id="google_analytics_conversion_id" name="google_analytics_conversion_id" class="form-control" />
                </div>
          	</div>
          	<div class="form-group adwords-visible">
          		<label class="col-sm-2 control-label" for="google_analytics_label"><span data-toggle="tooltip" title="<?php echo $help_ga_label; ?>"><?php echo $entry_ga_label; ?></span></label>
          		<div class="col-sm-10">
                	<input type="text" id="google_analytics_label" name="google_analytics_label" class="form-control" />
                </div>
          	</div>
























        </form>
      </div>
    </div>
  </div>
</div>

			<script type="text/javascript">
				$('#google_analytics_store').change(function() {
    				$.ajax({
    					url:'index.php?route=extension/analytics/google_analytics/getSettings&token=<?php echo $token; ?>',
    					type:'POST',
    					data: 'store_id=' + encodeURIComponent($('#google_analytics_store').val()),
    					dataType: 'json',
    					beforeSend: function() {
							$('#google_analytics_status').val('');
                			$('#google_analytics_exclude_admin').val('');
                			$('#google_analytics_property_id').val('');
                			$('#google_analytics_remarketing').val('');
                			$('#google_analytics_cookie').val('');
                			$('#google_analytics_adwords').val('');
                			$('#google_analytics_conversion_id').val('');
                			$('#google_analytics_label').val('');
						},
    					success : function(json) {
    						if (json) {
    		    				$('#google_analytics_status').val(json.google_analytics_status);
                				$('#google_analytics_exclude_admin').val(json.google_analytics_exclude_admin);
                				$('#google_analytics_property_id').val(json.google_analytics_property_id);
                				$('#google_analytics_remarketing').val(json.google_analytics_remarketing);
                				$('#google_analytics_cookie').val(json.google_analytics_cookie);
                				$('#google_analytics_adwords').val(json.google_analytics_adwords);
                				$('#google_analytics_conversion_id').val(json.google_analytics_conversion_id);
                				$('#google_analytics_label').val(json.google_analytics_label);
                			}
    					},
    					complete : function() {
    						if ($('#google_analytics_adwords').val() == 1) {
    		    				$(".adwords-visible").show();
                			} else {
                				$(".adwords-visible").hide();
                			}
                			
                			if ($('#google_analytics_store').val() == '') {
    		    				$('#google_analytics_status').val('');
                				$('#google_analytics_exclude_admin').val('');
                				$('#google_analytics_property_id').val('');
                				$('#google_analytics_remarketing').val('');
                				$('#google_analytics_cookie').val('');
                				$('#google_analytics_adwords').val('');
                				$('#google_analytics_conversion_id').val('');
                				$('#google_analytics_label').val('');
                			}
    					}
    				});
				});
				
				$("#google_analytics_adwords").change(function() {
					if ((this).value == 1) {
						$(".adwords-visible").show();
					} else {
						$(".adwords-visible").hide();
					}
				});
			</script>
			
<?php echo $footer; ?>
