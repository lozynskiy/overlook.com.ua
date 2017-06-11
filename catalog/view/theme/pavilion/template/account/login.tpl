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
            </li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <?php } else { ?>
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                <strong itemprop="name" class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                <meta itemprop="position" content="<?php echo $cnt+1; ?>"/>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
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
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="page login-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="customer-blocks">
                        <div class="new-wrapper register-block">
                            <div class="title active">
                                <strong><?php echo $text_new_customer; ?></strong>
                            </div>
                            <div class="inner-wrapper show">
                                <div class="text">
                                    <p><?php echo $text_register_account; ?></p>
                                </div>
                                <div class="buttons">
                                    <a href="<?php echo $register; ?>"
                                       class="button-1 register-button"><?php echo $text_register; ?></a>
                                </div>
                            </div>
                        </div>
                        <div class="returning-wrapper fieldset">
                            <div class="title">
                                <strong><?php echo $text_returning_customer; ?></strong>
                            </div>
                            <div class="inner-wrapper">
                                <div class="form-fields">
                                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <div class="inputs">
                                            <label for="input-email"><?php echo $entry_email; ?></label>
                                            <input type="text" name="email" value="<?php echo $email; ?>"
                                                   placeholder="<?php echo $entry_email; ?>" id="input-email"/>
                                        </div>
                                        <div class="inputs">
                                            <label for="input-password"><?php echo $entry_password; ?></label>
                                            <input type="password" name="password" value="<?php echo $password; ?>"
                                                   placeholder="<?php echo $entry_password; ?>" id="input-password"/>
                                        </div>
                                        <div class="inputs reversed">
                                            <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                                        </div>
                                        <div class="buttons">
                                            <input type="submit" value="<?php echo $button_login; ?>"
                                                   class="button-1 login-button"/>
                                            <?php if ($redirect) { ?>
                                            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>"/>
                                            <?php } ?>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php echo $content_bottom; ?></div>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>