<div class="master-column-wrapper">
  <div class="col-sm-6">
    <div class="page-title">
    <h4><?php echo $text_new_customer; ?></h4>
    </div>
    <p><?php echo $text_checkout; ?></p>
    <div class="radio">
      <label>

        <input type="radio" name="account" value="register" />

        <?php echo $text_register; ?></label>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="radio">
      <label>

        <input type="radio" name="account" value="guest" checked="checked" />

        <?php echo $text_guest; ?></label>
    </div>
    <?php } ?>
    <div class="topic-block-body">
    <p><?php echo $text_register_account; ?></p>
    </div>
    <div class="buttons">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="button-1" />
    </div>
  </div>
  <div class="col-sm-6">
    <div class="page-title">
    <h4><?php echo $text_returning_customer; ?></h4>
    </div>
    <div class="form-fields">
    <div class="inputs">
      <label for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="inputs">
      <label for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
    <div class="buttons">
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="button-1" />
  </div>
    </div>
  </div>
</div>
