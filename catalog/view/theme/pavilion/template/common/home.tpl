<?php echo $header; ?>
<div class="master-wrapper-content">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'center-2'; ?>
    <?php } else { ?>
    <?php $class = 'center-1'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>

        <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>