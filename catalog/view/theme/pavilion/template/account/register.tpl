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
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="master-column-wrapper"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'center-2'; ?>
        <?php } else { ?>
            <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <div class="page registration-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <p class="alert"><?php echo $text_account_already; ?></p>
                <div class="page-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                          class="form-horizontal">
                        <fieldset id="account">
                            <div class="fieldset">
                                <div class="title">
                                    <strong><?php echo $text_your_details; ?></strong>
                                </div>
                                <div class="form-fields">
                                    <div class="inputs"
                                         style="display: <?php echo(count($customer_groups) > 1 ? 'none' : 'none'); ?>;">
                                        <label><?php echo $entry_customer_group; ?>
                                            <span class="required">*</span>
                                        </label>
                                        <?php foreach ($customer_groups as $customer_group) { ?>
                                            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                                                <div class="option-list">
                                                    <input id="customer-group-<?php echo $customer_group['customer_group_id']; ?>"
                                                           type="radio" name="customer_group_id"
                                                           value="<?php echo $customer_group['customer_group_id']; ?>"
                                                           checked="checked"/>
                                                    <label for="customer-group-<?php echo $customer_group['customer_group_id']; ?>">
                                                        <?php echo $customer_group['name']; ?>
                                                    </label>
                                                </div>
                                            <?php } else { ?>
                                                <div class="option-list">
                                                    <input id="customer-group-<?php echo $customer_group['customer_group_id']; ?>"
                                                           type="radio" name="customer_group_id"
                                                           value="<?php echo $customer_group['customer_group_id']; ?>"/>
                                                    <label for="customer-group-<?php echo $customer_group['customer_group_id']; ?>">
                                                        <?php echo $customer_group['name']; ?></label>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>

                                    </div>
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
                                    <div class="inputs" style="display:none">
                                        <label for="input-fax"><?php echo $entry_fax; ?></label>
                                        <input type="text" name="fax" value="<?php echo $fax; ?>" id="input-fax"/>
                                    </div>
                                    <?php foreach ($custom_fields as $custom_field) { ?>
                                        <?php if ($custom_field['location'] == 'account') { ?>
                                            <?php if ($custom_field['type'] == 'select') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                class="form-control">
                                                            <option value=""><?php echo $text_select; ?></option>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                            selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                                                <?php } else { ?>
                                                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="field-validation-error"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'radio') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <div class="radio">
                                                                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                        <label>
                                                                            <input type="radio"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                                   checked="checked"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } else { ?>
                                                                        <label>
                                                                            <input type="radio"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } ?>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'checkbox') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <div class="checkbox">
                                                                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                                                                        <label>
                                                                            <input type="checkbox"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                                   checked="checked"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } else { ?>
                                                                        <label>
                                                                            <input type="checkbox"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } ?>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'text') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text"
                                                               name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                               placeholder="<?php echo $custom_field['name']; ?>"
                                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                               class="form-control"/>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                        <textarea
                                                name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                rows="5" placeholder="<?php echo $custom_field['name']; ?>"
                                                id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                class="form-control"><?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'file') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <button type="button"
                                                                id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                class="btn btn-default"><i
                                                                    class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                        </button>
                                                        <input type="hidden"
                                                               name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'date') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group date">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="YYYY-MM-DD"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'time') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group time">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="HH:mm"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group datetime">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset id="address">
                            <div class="fieldset">
                                <div class="title">
                                    <strong><?php echo $text_your_address; ?></strong>
                                </div>
                                <div class="form-fields">
                                    <div class="inputs" style="display:none">
                                        <label for="input-company"><?php echo $entry_company; ?></label>
                                        <input type="text" name="company" value="<?php echo $company; ?>"
                                               id="input-company"/>
                                    </div>
                                    <div class="inputs">
                                        <label for="input-address-1"><?php echo $entry_address_1; ?><span
                                                    class="required">*</span></label>
                                        <input type="text" name="address_1" value="<?php echo $address_1; ?>"
                                               id="input-address-1"/>
                                        <?php if ($error_address_1) { ?>
                                            <div class="field-validation-error"><?php echo $error_address_1; ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="inputs" style="display:none">
                                        <label for="input-address-2"><?php echo $entry_address_2; ?></label>
                                        <input type="text" name="address_2" value="<?php echo $address_2; ?>"
                                               id="input-address-2"/>
                                    </div>
                                    <div class="inputs">
                                        <label for="input-city"><?php echo $entry_city; ?><span
                                                    class="required">*</span></label>
                                        <input type="text" name="city" value="<?php echo $city; ?>" id="input-city"/>
                                        <?php if ($error_city) { ?>
                                            <div class="field-validation-error"><?php echo $error_city; ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="inputs" style="display:none">
                                        <label for="input-postcode"><?php echo $entry_postcode; ?><span
                                                    class="required">*</span></label>
                                        <input type="text" name="postcode" value="<?php echo $postcode; ?>"
                                               id="input-postcode"/>
                                        <?php if ($error_postcode) { ?>
                                            <div class="field-validation-error"><?php echo $error_postcode; ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="inputs" style="display:none">
                                        <label for="input-country"><?php echo $entry_country; ?><span
                                                    class="required">*</span></label>
                                        <select name="country_id" id="input-country">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($countries as $country) { ?>
                                                <?php if ($country['country_id'] == $country_id) { ?>
                                                    <option value="<?php echo $country['country_id']; ?>"
                                                            selected="selected"><?php echo $country['name']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                        <?php if ($error_country) { ?>
                                            <div class="field-validation-error"><?php echo $error_country; ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="inputs">
                                        <label for="input-zone"><?php echo $entry_zone; ?><span
                                                    class="required">*</span></label>
                                        <select name="zone_id" id="input-zone">
                                        </select>
                                        <?php if ($error_zone) { ?>
                                            <div class="field-validation-error"><?php echo $error_zone; ?></div>
                                        <?php } ?>
                                    </div>
                                    <?php foreach ($custom_fields as $custom_field) { ?>
                                        <?php if ($custom_field['location'] == 'address') { ?>
                                            <?php if ($custom_field['type'] == 'select') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                class="form-control">
                                                            <option value=""><?php echo $text_select; ?></option>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                            selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                                                <?php } else { ?>
                                                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'radio') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <div class="radio">
                                                                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                                                        <label>
                                                                            <input type="radio"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                                   checked="checked"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } else { ?>
                                                                        <label>
                                                                            <input type="radio"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } ?>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'checkbox') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div>
                                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                                <div class="checkbox">
                                                                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                                                                        <label>
                                                                            <input type="checkbox"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                                                   checked="checked"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } else { ?>
                                                                        <label>
                                                                            <input type="checkbox"
                                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]"
                                                                                   value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                                            <?php echo $custom_field_value['name']; ?>
                                                                        </label>
                                                                    <?php } ?>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'text') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text"
                                                               name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                               placeholder="<?php echo $custom_field['name']; ?>"
                                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                               class="form-control"/>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                        <textarea
                                                name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                rows="5" placeholder="<?php echo $custom_field['name']; ?>"
                                                id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                class="form-control"><?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'file') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <button type="button"
                                                                id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                class="btn btn-default"><i
                                                                    class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                        </button>
                                                        <input type="hidden"
                                                               name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                               value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'date') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group date">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="YYYY-MM-DD"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'time') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group time">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="HH:mm"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                                <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                     class="form-group custom-field"
                                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group datetime">
                                                            <input type="text"
                                                                   name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]"
                                                                   value="<?php echo(isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                                   placeholder="<?php echo $custom_field['name']; ?>"
                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                                   class="form-control"/>
                                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <div class="fieldset">
                                <div class="title">
                                    <strong><?php echo $text_your_password; ?></strong>
                                </div>
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
                        </fieldset>
                        <fieldset>
                            <div class="fieldset">
                                <div class="title">
                                    <strong><?php echo $text_newsletter; ?></strong>
                                </div>
                                <div class="form-fields">
                                    <div class="inputs">
                                        <label><?php echo $entry_newsletter; ?></label>
                                        <?php if ($newsletter) { ?>
                                            <ul class="option-list">
                                                <li>
                                                    <input id="newsletter-yes" type="radio" name="newsletter" value="1"
                                                           checked="checked"/>
                                                    <label for="newsletter-yes"><?php echo $text_yes; ?></label>
                                                </li>
                                                <li>
                                                    <input id="newsletter-no" type="radio" name="newsletter" value="0"/>
                                                    <label for="newsletter-no"><?php echo $text_no; ?></label>
                                                </li>
                                            </ul>
                                        <?php } else { ?>
                                            <ul class="option-list">
                                                <li>
                                                    <input id="newsletter-yes" type="radio" name="newsletter"
                                                           value="1"/>
                                                    <label for="newsletter-yes"><?php echo $text_yes; ?></label>
                                                </li>
                                                <li>
                                                    <input id="newsletter-no" type="radio" name="newsletter" value="0"
                                                           checked="checked"/>
                                                    <label for="newsletter-no"><?php echo $text_no; ?></label>
                                                </li>
                                            </ul>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <?php echo $captcha; ?>
                        <?php if ($text_agree) { ?>
                            <div class="buttons">
                                <p>
                                    <label for="agree"><?php echo $text_agree; ?></label>
                                    <?php if ($agree) { ?>
                                        <input id="agree" type="checkbox" name="agree" value="1" checked="checked"/>
                                    <?php } else { ?>
                                        <input id="agree" type="checkbox" name="agree" value="1"/>
                                    <?php } ?>
                                </p>
                                <br>
                                <input type="submit" value="<?php echo $button_continue; ?>"
                                       class="button-1 register-next-step-button"/>
                            </div>
                        <?php } else { ?>
                            <div class="buttons">
                                <input type="submit" value="<?php echo $button_continue; ?>"
                                       class="button-1 register-next-step-button"/>
                            </div>
                        <?php } ?>
                    </form>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
    // Sort the custom fields
    $('#account .form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
            $('#account .form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('#account .form-group').length) {
            $('#account .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') == $('#account .form-group').length) {
            $('#account .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('#account .form-group').length) {
            $('#account .form-group:first').before(this);
        }
    });

    $('#address .form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
            $('#address .form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('#address .form-group').length) {
            $('#address .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') == $('#address .form-group').length) {
            $('#address .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('#address .form-group').length) {
            $('#address .form-group:first').before(this);
        }
    });

    $('input[name=\'customer_group_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
            dataType: 'json',
            success: function (json) {
                $('.custom-field').hide();
                $('.custom-field').removeClass('required');

                for (i = 0; i < json.length; i++) {
                    custom_field = json[i];

                    $('#custom-field' + custom_field['custom_field_id']).show();

                    if (custom_field['required']) {
                        $('#custom-field' + custom_field['custom_field_id']).addClass('required');
                    }
                }


            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('input[name=\'customer_group_id\']:checked').trigger('change');
    //--></script>
<script type="text/javascript"><!--
    $('button[id^=\'button-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $(node).parent().find('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
<script type="text/javascript"><!--
    $('select[name=\'country_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function () {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function () {
                $('.fa-spin').remove();
            },
            success: function (json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] && json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script>
<script>
    $(document).ready(function(){
        $("#input-telephone").inputmask(
            "+38 (999) 999 99 99",{
                placeholder:"+38 (___) ___ __ __",
                clearMaskOnLostFocus: true,
                showMaskOnHover: false }
        );
    });
</script>
<?php echo $footer; ?>
