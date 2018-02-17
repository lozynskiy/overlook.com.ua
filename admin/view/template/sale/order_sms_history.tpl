<?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
<?php } ?>
<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
<?php } ?>

<table class="table table-bordered">
  <thead>
    <tr>
      <td class="left"><b><?php echo $column_date_sms; ?></b></td>
      <td class="left"><b><?php echo $column_text_sms; ?></b></td>
      <td class="left"><b><?php echo $column_order_status; ?></b></td>
      <td class="left"><b><?php echo $column_sms_status; ?></b></td>
    </tr>
  </thead>
  <tbody>
    <?php if ($sms_histories) { ?>
    <?php foreach ($sms_histories as $sms_history) { ?>
    <tr>
      <td class="left"><?php echo $sms_history['date_added']; ?></td>
      <td class="left"><?php echo $sms_history['comment']; ?></td>
      <td class="left"><?php echo $sms_history['status']; ?></td>
      <td class="left"><b><?php echo $sms_history['sms_status']; ?></b></td>
    </tr>
    <?php } ?>
    <?php } else { ?>
    <tr>
      <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
    </tr>
    <?php } ?>
  </tbody>
</table>
<div class="pagination"><?php echo $pagination; ?></div>