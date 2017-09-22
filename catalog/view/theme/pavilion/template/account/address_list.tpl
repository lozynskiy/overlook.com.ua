<?php echo $header; ?>
    <div class="master-wrapper-content">
        <div class="breadcrumb">
            <ul>
                <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                    <?php if ($cnt + 1 < count($breadcrumbs)) { ?>
                        <li>
                            <a href="<?php echo $breadcrumb['href']; ?>">
                                <span><?php echo $breadcrumb['text']; ?></span>
                            </a>
                            <span class="delimiter">/</span>
                        </li>
                    <?php } else { ?>
                        <li>
                            <strong class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                        </li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
        <?php } ?>
        <?php if ($error_warning) { ?>
            <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            </div>
        <?php } ?>
        <div class="master-column-wrapper">
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
                <div class="page account-page address-list-page">
                    <div class="page-title">
                        <h1><?php echo $text_address_book; ?></h1>
                    </div>
                    <div class="page-body">
                        <?php if ($addresses) { ?>
                            <div class="address-list">
                                <?php foreach ($addresses as $result) { ?>
                                    <div class="section address-item">
                                        <ul class="info">
                                            <?php echo $result['address']; ?>
                                        </ul>
                                        <div class="buttons">
                                            <input onclick="setLocation('<?php echo $result['update']; ?>')"
                                                   class="button-2 edit-address-button">
                                            <?php echo $button_edit; ?>
                                            </input>
                                            <input onclick="setLocation('<?php echo $result['delete']; ?>')"
                                                   class="button-2 delete-address-button">
                                            <?php echo $button_delete; ?>
                                            </input>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        <?php } else { ?>
                            <div class="no-data"><?php echo $text_empty; ?></div>
                        <?php } ?>
                        <div class="add-button">
                            <a href="<?php echo $add; ?>"
                               class="button-1 add-address-button"><?php echo $button_new_address; ?></a>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?></div>
    </div>
<?php echo $footer; ?>