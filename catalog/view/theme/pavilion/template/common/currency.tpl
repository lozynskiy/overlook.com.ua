<?php if (count($currencies) > 1) { ?>
<div id="header-links-currency-wrapper" class="currency-selector">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency" >
        <select id="currency-dropdown">
          <?php foreach ($currencies as $currency) { ?>

          <?php if ($currency['symbol_left']) { ?>
            <?php if ($currency['code'] == $code) { ?>
                <option value="<?php echo $currency['code']; ?>" selected="selected"><a><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></option>
            <?php } else { ?>
                <option value="<?php echo $currency['code']; ?>"><a><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></option>
            <?php } ?>
          <?php } else { ?>
            <?php if ($currency['code'] == $code) { ?>
                <option value="<?php echo $currency['code']; ?>" selected="selected"><a><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></option>
            <?php } else { ?>
                <option value="<?php echo $currency['code']; ?>"><a><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></option>
            <?php } ?>
          <?php } ?>

          <?php } ?>
        </select>
      <input type="hidden" name="code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
</div>
<?php } ?>
