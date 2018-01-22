<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a href="<?php echo $insert; ?>" title="<?php echo $button_insert; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-plus"></i></a>
        <button type="submit" form="form" onclick="$('#form').attr('action', '<?php echo $send_copy; ?>');" data-toggle="tooltip" title="<?php echo $button_email; ?>" class="btn btn-primary"><i class="fa fa-envelope-o"></i></button>
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-list" data-toggle="tab"><?php echo $tab_list; ?></a></li>
            <!--<li><a href="#tab-license" data-toggle="tab">License</a></li>
            <li><a href="#tab-about" data-toggle="tab">About</a></li>-->
          </ul>
		  <div class="tab-content">
            <div class="tab-pane active" id="tab-list">
			  <table class="table table-bordered table-hover">
				<thead>
				<tr>
				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
				  <td class="text-left"><?php if ($sort == 'name') { ?>
					<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
					<?php } ?></td>
				  <td class="text-left"><?php if ($sort == 'type') { ?>
					<a href="<?php echo $sort_type; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_type; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_type; ?>"><?php echo $column_type; ?></a>
					<?php } ?></td>
				  <td class="text-left"><?php echo $column_store; ?></td>
				  <td class="text-left"><?php echo $column_priority; ?></td>
				  <td class="text-right"><?php if ($sort == 'date_start') { ?>
					<a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
					<?php } ?></td>
				  <td class="text-right"><?php if ($sort == 'date_end') { ?>
					<a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
					<?php } ?></td>
				  <td class="text-right"><?php echo $column_action; ?></td>
				</tr>
				</thead>
				<tbody>
				<?php if ($templates) { ?>
				  <?php foreach ($templates as $template) { ?>
					<tr>
					  <td style="text-align: center;"><?php if ($template['selected']) { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $template['email_template_id']; ?>" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $template['email_template_id']; ?>" />
						<?php } ?></td>
					  <td class="text-left"><?php echo $template['name']; ?></td>
					  <td class="text-left"><?php echo $template['type']; ?></td>
					  <td class="text-left"><?php echo $template['store']; ?></td>
					  <td class="text-left"><?php echo $template['priority']; ?></td>
					  <td class="text-right"><?php echo $template['date_start']; ?></td>
					  <td class="text-right"><?php echo $template['date_end']; ?></td>
					  <td class="text-right"><?php foreach ($template['action'] as $action) { ?>
						[ <a href="<?php echo $action['link']; ?>"><?php echo $action['name']; ?></a> ]<br />
						<?php } ?>
					</tr>
				  <?php } ?>
				<?php } else { ?>
				  <tr>
					<td class="center" colspan="6"><?php echo $text_no_results; ?></td>
				  </tr>
				<?php } ?>
				</tbody>
				</table>
			</div>
		  </div>
		</form>
      </div>
    </div>
	
  </div>
</div>
<?php echo $footer; ?>