<?php if (count($currencies) > 1) { ?>
<div id="header-links-currency-wrapper" class="header-links-wrapper">
    <label data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_left']; ?></strong>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_right']; ?></strong>
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_currency; ?></span> <i class="fa fa-caret-down"></i></label>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
        <ul id="currency-dropdown" class="header-links">
          <?php foreach ($currencies as $currency) { ?>
          <?php if ($currency['symbol_left']) { ?>
          <li><a class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></li>
          <?php } else { ?>
          <li><a class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
      <input type="hidden" name="code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
</div>
<?php } ?>
