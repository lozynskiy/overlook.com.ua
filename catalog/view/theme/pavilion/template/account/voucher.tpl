<?php echo $header; ?>
<div class="master-wrapper-content">
    <div class="breadcrumb">
        <ul itemscope itemtype="http://schema.org/BreadcrumbList">
            <?php foreach ($breadcrumbs as $cnt=> $breadcrumb) { ?>
            <?php if($cnt==0) { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
                    <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                <span class="delimiter">/</span>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } elseif($cnt+1<count($breadcrumbs)) { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                    <span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
                <span class="delimiter">/</span>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } else { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
            <div class="page account-page">
                <?php echo $content_top; ?>
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="description"><?php echo $text_description; ?></div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="fieldset">
                            <div class="form-fields">
                                <div class="inputs">
                                    <label for="input-to-name"><?php echo $entry_to_name; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="to_name" value="<?php echo $to_name; ?>"
                                           id="input-to-name"/>
                                    <?php if ($error_to_name) { ?>
                                    <div class="field-validation-error"><?php echo $error_to_name; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-to-email"><?php echo $entry_to_email; ?><span
                                                class="required">*</span></label>
                                        <input type="text" name="to_email" value="<?php echo $to_email; ?>"
                                               id="input-to-email"/>
                                        <?php if ($error_to_email) { ?>
                                        <div class="field-validation-error"><?php echo $error_to_email; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-from-name"><?php echo $entry_from_name; ?><span
                                                class="required">*</span></label>
                                        <input type="text" name="from_name" value="<?php echo $from_name; ?>"
                                               id="input-from-name"/>
                                        <?php if ($error_from_name) { ?>
                                        <div class="field-validation-error"><?php echo $error_from_name; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-from-email"><?php echo $entry_from_email; ?><span
                                                class="required">*</span></label>
                                        <input type="text" name="from_email" value="<?php echo $from_email; ?>"
                                               id="input-from-email"/>
                                        <?php if ($error_from_email) { ?>
                                        <div class="field-validation-error"><?php echo $error_from_email; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label><?php echo $entry_theme; ?><span
                                                class="required">*</span></label>
                                    <ul class="option-list listed">
                                        <?php foreach ($voucher_themes as $voucher_theme) { ?>
                                        <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                                        <li>
                                            <input id="voucher_theme_id_<?php echo $voucher_theme['voucher_theme_id']; ?>" type="radio" name="voucher_theme_id"
                                                       value="<?php echo $voucher_theme['voucher_theme_id']; ?>"
                                                       checked="checked"/>
                                            <label for="voucher_theme_id_<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                        </li>
                                        <?php } else { ?>
                                        <li>
                                            <input id="voucher_theme_id_<?php echo $voucher_theme['voucher_theme_id']; ?>" type="radio" name="voucher_theme_id"
                                                       value="<?php echo $voucher_theme['voucher_theme_id']; ?>"/>
                                            <label for="voucher_theme_id_<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                        </li>
                                        <?php } ?>
                                        <?php } ?>
                                        <?php if ($error_theme) { ?>
                                        <div class="field-validation-error"><?php echo $error_theme; ?></div>
                                        <?php } ?>
                                    </ul>
                                </div>
                                <div class="inputs">
                                    <label for="input-message"><span
                                                data-toggle="tooltip"
                                                title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>
                                <textarea name="message" cols="40" rows="5" id="input-message"><?php echo $message; ?></textarea>
                                </div>
                                <div class="inputs">
                                    <label for="input-amount"><span data-toggle="tooltip"
                                                                    title="<?php echo $help_amount; ?>"><?php echo $entry_amount; ?></span><span
                                                class="required">*</span></label>
                                        <input type="text" name="amount" value="<?php echo $amount; ?>"
                                               id="input-amount" size="5"/>
                                        <?php if ($error_amount) { ?>
                                        <div class="field-validation-error"><?php echo $error_amount; ?></div>
                                        <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="buttons">
                                    <?php if ($agree) { ?>
                                    <input id="termsofservice" type="checkbox" name="agree" value="1" checked="checked"/>
                                    <?php } else { ?>
                                    <input id="termsofservice" type="checkbox" name="agree" value="1"/>
                                    <?php } ?>
                                    <label for="termsofservice"><?php echo $text_agree; ?></label>
                            <input type="submit" value="<?php echo $button_continue; ?>"
                                   class="button-1"/>
                        </div>
                    </form>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>