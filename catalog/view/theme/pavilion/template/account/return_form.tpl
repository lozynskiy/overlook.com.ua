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
            <div class="page account-page return-request-list-page">
                <?php echo $content_top; ?>
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="description"><?php echo $text_description; ?></div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="fieldset">
                            <div class="title">
                                <strong><?php echo $text_order; ?></strong>
                            </div>
                            <div class="form-fields">
                                <div class="inputs">
                                    <label for="input-firstname"><?php echo $entry_firstname; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="firstname" value="<?php echo $firstname; ?>"
                                           id="input-firstname"/>
                                    <?php if ($error_firstname) { ?>
                                    <div class="field-validation-error"><?php echo $error_firstname; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-lastname"><?php echo $entry_lastname; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="lastname" value="<?php echo $lastname; ?>"
                                           id="input-lastname"/>
                                    <?php if ($error_lastname) { ?>
                                    <div class="field-validation-error"><?php echo $error_lastname; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-email"><?php echo $entry_email; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"/>
                                    <?php if ($error_email) { ?>
                                    <div class="field-validation-error"><?php echo $error_email; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-telephone"><?php echo $entry_telephone; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="telephone" value="<?php echo $telephone; ?>"
                                           id="input-telephone"/>
                                    <?php if ($error_telephone) { ?>
                                    <div class="field-validation-error"><?php echo $error_telephone; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-order-id"><?php echo $entry_order_id; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="order_id" value="<?php echo $order_id; ?>"
                                           id="input-order-id"/>
                                    <?php if ($error_order_id) { ?>
                                    <div class="field-validation-error"><?php echo $error_order_id; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-date-ordered"><?php echo $entry_date_ordered; ?></label>
                                    <div class="input-group date">
                                        <input type="text" name="date_ordered"
                                               value="<?php echo $date_ordered; ?>"
                                               placeholder="<?php echo $entry_date_ordered; ?>"
                                               data-date-format="YYYY-MM-DD"
                                               id="input-date-ordered"/>
                                        <span class="input-group-btn">
                                            <button type="button" class="button-1"><i
                                                        class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="fieldset">
                            <div class="title">
                                <strong><?php echo $text_product; ?></strong>
                            </div>
                            <div class="form-fields">
                                <div class="inputs">
                                    <label for="input-product"><?php echo $entry_product; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="product" value="<?php echo $product; ?>"
                                           id="input-product"/>
                                    <?php if ($error_product) { ?>
                                    <div class="field-validation-error"><?php echo $error_product; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-model"><?php echo $entry_model; ?><span
                                                class="required">*</span></label>
                                    <input type="text" name="model" value="<?php echo $model; ?>" id="input-model"/>
                                    <?php if ($error_model) { ?>
                                    <div class="field-validation-error"><?php echo $error_model; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="inputs">
                                    <label for="input-quantity"><?php echo $entry_quantity; ?></label>
                                    <input type="text" name="quantity" value="<?php echo $quantity; ?>"
                                           id="input-quantity"/>
                                </div>
                                <div class="inputs">
                                    <label><?php echo $entry_reason; ?><span
                                                class="required">*</span></label>
                                    <ul class="option-list listed">
                                        <?php foreach ($return_reasons as $return_reason) { ?>
                                        <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                                        <li>
                                            <input id="return_reason_id_<?php echo $return_reason['return_reason_id']; ?>"
                                                   type="radio" name="return_reason_id"
                                                   value="<?php echo $return_reason['return_reason_id']; ?>"
                                                   checked="checked"/>
                                            <label for="return_reason_id_<?php echo $return_reason['return_reason_id']; ?>">
                                                <?php echo $return_reason['name']; ?>
                                            </label>
                                        </li>
                                        <?php } else { ?>
                                        <li>
                                            <input id="return_reason_id_<?php echo $return_reason['return_reason_id']; ?>"
                                                   type="radio" name="return_reason_id"
                                                   value="<?php echo $return_reason['return_reason_id']; ?>"/>
                                            <label for="return_reason_id_<?php echo $return_reason['return_reason_id']; ?>">
                                                <?php echo $return_reason['name']; ?>
                                            </label>
                                        </li>
                                        <?php  } ?>
                                        <?php  } ?>
                                        <?php if ($error_reason) { ?>
                                        <div class="field-validation-error"><?php echo $error_reason; ?></div>
                                        <?php } ?>
                                    </ul>
                                </div>
                                <div class="inputs">
                                    <label><?php echo $entry_opened; ?><span
                                                class="required">*</span></label>
                                    <ul class="option-list">
                                        <li>
                                            <?php if ($opened) { ?>
                                            <input id="opened_1" type="radio" name="opened" value="1" checked="checked"/>
                                            <?php } else { ?>
                                            <input id="opened_1" type="radio" name="opened" value="1"/>
                                            <?php } ?>
                                            <label for="opened_1"><?php echo $text_yes; ?></label>
                                        </li>
                                        <li>
                                            <?php if (!$opened) { ?>
                                            <input id="opened_0" type="radio" name="opened" value="0" checked="checked"/>
                                            <?php } else { ?>
                                            <input id="opened_0" type="radio" name="opened" value="0"/>
                                            <?php } ?>
                                            <label for="opened_0"><?php echo $text_no; ?></label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="inputs">
                                    <label for="input-comment"><?php echo $entry_fault_detail; ?></label>
                                <textarea name="comment" rows="10" id="input-comment"><?php echo $comment; ?></textarea>
                                </div>
                                <?php echo $captcha; ?>
                            </div>
                        </div>
                        <?php if ($text_agree) { ?>
                        <div class="buttons">
                                <?php echo $text_agree; ?>
                                <?php if ($agree) { ?>
                                <input type="checkbox" name="agree" value="1" checked="checked"/>
                                <?php } else { ?>
                                <input type="checkbox" name="agree" value="1"/>
                                <?php } ?>
                                <input type="submit" value="<?php echo $button_submit; ?>" class="button-1"/>
                        </div>
                        <?php } else { ?>
                        <div class="buttons">
                                <input type="submit" value="<?php echo $button_submit; ?>" class="button-1"/>
                        </div>
                        <?php } ?>
                    </form>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer; ?>
