<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-template-edit" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<div class="buttons">
		        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-template-edit" class="form-horizontal">

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
						<input type="text" class="form-control" value="<?php echo $template_name; ?>" name="template_name"/>
						</div>
					</div>
                    <ul class="nav nav-tabs" id="language">
                        <?php $i=0; foreach ($languages as $language) { ?>
                            <?php if ($i) $class=''; else $class= 'class="active"'; ?>
                            <li <?php echo $class; ?>><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php $i++; } ?>
                    </ul>
						<div class="tab-content">
							<?php $i=0; foreach ($languages as $language) { ?>
							<?php if ($i) $class=''; else $class= 'active'; ?>
							<div class="tab-pane <?php echo $class; ?>" id="language<?php echo $language['language_id']; ?>">
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_comment; ?></label>
									<div class="col-sm-10">
										<textarea rows="7" name="template_comment[<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($template_comment[$language['language_id']]['template_comment']) ? $template_comment[$language['language_id']]['template_comment'] : ''; ?></textarea>
<br>
<?php echo $text_comment_help;?>
									</div>
								</div>
							</div>
							<?php $i++; } ?>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
