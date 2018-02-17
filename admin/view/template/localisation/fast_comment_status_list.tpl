<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		<div class="pull-right">
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
    <?php if (isset($error_warning)) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
    <?php } ?>
    <?php if (isset($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
    <?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
		</div>
		<div class="panel-body">
			<form method="post" enctype="multipart/form-data" id="form_list" action="<?php echo $action_delete; ?>">
				<button onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form_list').submit() : false;" class="btn btn-danger" title="" data-toggle="tooltip" type="button" data-original-title="<?php echo $text_delete; ?>"><i class="fa fa-trash-o"></i></button>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width:1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
								<td class="text-left"><?php echo $column_name; ?></td>
								<td class="text-right"><?php echo $column_action; ?></td>
							</tr>
						</thead>
						<tbody>
						<?php if ($fast_templates) { ?>
						<?php foreach ($fast_templates as $template) { ?>
							<tr>
								<td class="text-center">
								<?php if (in_array($template['fast_comment_id'], $selected)) { ?>

									<input type="checkbox" name="selected[]" value="<?php echo $template['fast_comment_id']; ?>" checked="checked" />
									<?php } else { ?>
									<input type="checkbox" name="selected[]" value="<?php echo $template['fast_comment_id']; ?>" />
									<?php } ?>
								</td>
								<td class="text-left"><?php echo $template['name']; ?></td>
								<td class="text-right">
									<a href="<?php echo $template['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info"><i class="fa fa-pencil"></i></a>
								</td>
							</tr>

							<?php } ?>
						<?php } else { ?>
							<tr>
								<td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td class="text-right" colspan="3"><a href="<?php echo $add_action; ?>" class="btn btn-primary"><i class="fa fa-plus"></i> <?php echo $button_add; ?></a></td>
							</tr>
						
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</div>
  </div>
</div>
<?php echo $footer; ?>
