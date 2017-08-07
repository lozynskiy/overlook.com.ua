<?php echo $header; ?>
    <div class="master-wrapper-content">
        <div class="breadcrumb">
            <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                    <?php if ($cnt == 0) { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
                                <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                            <span class="delimiter">/</span>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li>
                    <?php } elseif ($cnt + 1 < count($breadcrumbs)) { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                                <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                            <span class="delimiter">/</span>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <?php } else { ?>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                            <meta itemprop="position" content="<?php echo $cnt + 1; ?>"/>
                        </li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>
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
                <div class="page account-page change-password-page">
                    <div class="page-title">
                        <h1><?php echo $heading_title; ?></h1>
                    </div>
                    <div class="page-body">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="fieldset">
                                <div class="form-fields">
                                    <div class="inputs">
                                        <label for="input-password"><?php echo $entry_password; ?><span
                                                    class="required">*</span></label>
                                        <input type="password" name="password" value="<?php echo $password; ?>"
                                               id="input-password"/>
                                        <?php if ($error_password) { ?>
                                            <div class="field-validation-error"><?php echo $error_password; ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="inputs">
                                        <label for="input-confirm"><?php echo $entry_confirm; ?><span
                                                    class="required">*</span></label>
                                        <input type="password" name="confirm" value="<?php echo $confirm; ?>"
                                               id="input-confirm"/>
                                        <?php if ($error_confirm) { ?>
                                            <div class="field-validation-error"><?php echo $error_confirm; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="buttons">
                                <input type="submit" value="<?php echo $button_continue; ?>"
                                       class="button-1 change-password-button"/>
                            </div>
                        </form>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
<?php echo $footer; ?>