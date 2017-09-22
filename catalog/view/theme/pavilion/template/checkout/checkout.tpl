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
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
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
            <div class="page checkout-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body checkout-data">
                    <div class="panel-group opc" id="accordion">
                        <div id="opc-option" class="tab-section allow" style="display:none">
                            <div class="panel-heading step-title accordion-tab-title">
                                <h4 class="panel-title"><?php echo $text_checkout_option; ?></h4>
                            </div>
                            <div class="step accordion-tab-content" id="collapse-checkout-option">
                                <div class="panel-body"></div>
                            </div>
                        </div>
                        <div id="opc-account" class="tab-section accordion-tab">
                            <div class="panel-heading step-title accordion-tab-title">
                                <h4 class="panel-title"><?php echo $text_checkout_contact_information; ?></h4>
                            </div>
                            <div class="step accordion-tab-content" id="collapse-payment-address">
                                <div class="panel-body"></div>
                            </div>
                        </div>
                        <!--Combine block!-->
                        <div id="opc-combine-step" class="tab-section accordion-tab">
                            <div class="panel-heading step-title accordion-tab-title">
                                <h4 class="panel-title"><?php echo $text_checkout_payment_shipping_method; ?></h4>
                            </div>
                            <div class="accordion-tab-content">
                                <div class="step">
                                    <div id="collapse-shipping-method">
                                        <div class="panel-body"></div>
                                    </div>
                                    <div id="collapse-payment-method">
                                        <div class="panel-body"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Combine block!-->
                        <div id="opc-confirm_order" class="tab-section accordion-tab">
                            <div class="panel-heading step-title accordion-tab-title">
                                <h4 class="panel-title"><?php echo $text_checkout_confirm_order; ?></h4>
                            </div>
                            <div class="step accordion-tab-content" id="collapse-checkout-confirm">
                                <div class="panel-body"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
    <?php if (!$logged) { ?>
    $(document).ready(function () {
        $.ajax({
            url: 'index.php?route=checkout/login',
            dataType: 'html',
            success: function (html) {
                $('#collapse-checkout-option .panel-body').html(html);

                $('#collapse-checkout-option').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_option; ?> <i class="fa fa-caret-down"></i>');

                $('#button-account').trigger('click');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    });
    <?php } else { ?>
    $(document).ready(function () {
        $.ajax({
            url: 'index.php?route=checkout/payment_address',
            dataType: 'html',
            success: function (html) {
                $('#collapse-payment-address .panel-body').html(html);

                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_contact_information; ?> <i class="fa fa-caret-down"></i>');

                $('#opc-account').addClass('allow').children('.accordion-tab-title').trigger('click');
                if (typeof ga != 'undefined') {
                    <?php foreach ($products as $product) { ?>
                    ga('ec:addProduct', {
                        'id': '<?php echo $product['product_id']; ?>',
                        'name': '<?php echo $product['name']; ?>',
                        'model': '<?php echo $product['model']; ?>',
                        'sku': '<?php echo $product['sku']; ?>',
                        'category': '<?php echo $product['category']; ?>',
                        'brand': '<?php echo $product['manufacturer']; ?>',
                        'price': '<?php echo $product['price']; ?>',
                        'quantity': '<?php echo $product['quantity']; ?>'
                    });
                    <?php } ?>
                    ga('ec:setAction', 'checkout', {'step': 1});
                    ga('send', 'pageview', '/checkout/contact-information');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    <?php } ?>

    // Checkout
    $(document).delegate('#button-account', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
            dataType: 'html',
            beforeSend: function () {
                $('#button-account').button('loading');
            },
            complete: function () {
                $('#button-account').button('reset');

                $('#opc-account').addClass('allow').children('.accordion-tab-title').trigger('click');
            },
            success: function (html) {
                $('.alert, .text-danger').remove();

                $('#collapse-payment-address .panel-body').html(html);

                if ($('input[name=\'account\']:checked').val() == 'register') {
                    $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i>');
                } else {
                    $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_contact_information; ?> <i class="fa fa-caret-down"></i>');
                }
                if (typeof ga != 'undefined') {
                    <?php foreach ($products as $product) { ?>
                    ga('ec:addProduct', {
                        'id': '<?php echo $product['product_id']; ?>',
                        'name': '<?php echo $product['name']; ?>',
                        'model': '<?php echo $product['model']; ?>',
                        'sku': '<?php echo $product['sku']; ?>',
                        'category': '<?php echo $product['category']; ?>',
                        'brand': '<?php echo $product['manufacturer']; ?>',
                        'price': '<?php echo $product['price']; ?>',
                        'quantity': '<?php echo $product['quantity']; ?>'
                    });
                    <?php } ?>
                    ga('ec:setAction', 'checkout', {'step': 1});
                    ga('send', 'pageview', '/checkout/contact-information');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Register
    $(document).delegate('#button-register', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/register/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-register').button('loading');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    $('#button-register').button('reset');

                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }
                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    function load_shipping_payment_method() {
        $.ajax({
            url: 'index.php?route=checkout/payment_method',
            dataType: 'html',
            success: function (html) {
                $('#collapse-payment-method .panel-body').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        $.ajax({
            url: 'index.php?route=checkout/shipping_method',
            dataType: 'html',
            success: function (html) {
                $('#collapse-shipping-method .panel-body').html(html);

                $('#opc-combine-step').find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_shipping_method; ?> <i class="fa fa-caret-down"></i>');

                $('#opc-combine-step').addClass('allow').children('.accordion-tab-title').trigger('click');
                if (typeof ga != 'undefined') {
                    <?php foreach ($products as $product) { ?>
                    ga('ec:addProduct', {
                        'id': '<?php echo $product['product_id']; ?>',
                        'name': '<?php echo $product['name']; ?>',
                        'model': '<?php echo $product['model']; ?>',
                        'sku': '<?php echo $product['sku']; ?>',
                        'category': '<?php echo $product['category']; ?>',
                        'brand': '<?php echo $product['manufacturer']; ?>',
                        'price': '<?php echo $product['price']; ?>',
                        'quantity': '<?php echo $product['quantity']; ?>'
                    });
                    <?php } ?>
                    ga('ec:setAction', 'checkout', {'step': 2});
                    ga('send', 'pageview', '/checkout/shipping-payment-method');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        $('#button-guest').button('reset');
        $('#button-payment-address').button('reset');
    }

    // Payment Address
    $(document).delegate('#button-payment-address', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/payment_address/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-payment-address').button('loading');
            },
            complete: function () {
                $('#button-payment-address').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                } else {
                    load_shipping_payment_method();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Guest
    $(document).delegate('#button-guest', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/guest/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-guest').button('loading');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.has-error').removeClass('has-error');

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    $('#button-guest').button('reset');

                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }
                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');

                } else {
                    var register = $('#collapse-payment-address input[name=\'agree\']:checked').prop('value');

                    if (register) {
                        $.ajax({
                            url: 'index.php?route=checkout/register/save',
                            type: 'post',
                            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address textarea, #collapse-payment-address select'),
                            dataType: 'json',
                            success: function (json) {
                                $('.alert, .text-danger').remove();
                                $('.form-group').removeClass('has-error');

                                if (json['redirect']) {
                                    location = json['redirect'];
                                } else if (json['error']) {
                                    $('#button-guest').button('reset');

                                    if (json['error']['warning']) {
                                        $('#enter-password').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                    }
                                    for (i in json['error']) {
                                        var element = $('#input-payment-' + i.replace('_', '-'));

                                        if ($(element).parent().hasClass('input-group')) {
                                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                                        } else {
                                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                                        }
                                    }
                                    // Highlight any found errors
                                    $('.text-danger').parent().addClass('has-error');
                                } else {
                                    load_shipping_payment_method();
                                }
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    } else {
                        load_shipping_payment_method();
                    }
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });


    $(document).delegate('#button-combine-step', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/shipping_method/save',
            type: 'post',
            data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-shipping-method textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-combine-step').button('loading');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {

                    $('#button-combine-step').button('reset');

                    if (json['error']['warning']) {
                        $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/payment_method/save',
                        type: 'post',
                        data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'),
                        dataType: 'json',
                        success: function (json) {
                            $('.alert, .text-danger').remove();

                            if (json['redirect']) {
                                location = json['redirect'];
                            } else if (json['error']) {

                                $('#button-combine-step').button('reset');

                                if (json['error']['warning']) {
                                    $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                }
                            } else {
                                $.ajax({
                                    url: 'index.php?route=checkout/confirm',
                                    dataType: 'html',
                                    complete: function () {
                                        $('#button-combine-step').button('reset');
                                    },
                                    success: function (html) {
                                        $('#collapse-checkout-confirm .panel-body').html(html);

                                        $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm_order; ?> <i class="fa fa-caret-down"></i>');

                                        $('#opc-confirm_order').addClass('allow').children('.accordion-tab-title').trigger('click');
                                        if (typeof ga != 'undefined') {
                                            ga('ec:setAction', 'checkout_option', {
                                                'step': 2,
                                                'option': "'" + $('#collapse-shipping-method input[type=\'radio\']').val() +" + "+ $('#collapse-payment-method input[type=\'radio\']').val() + "'"
                                            });
                                            ga('send', 'event', 'Checkout', 'Option', {
                                                hitCallback: createFunctionWithTimeout(function () {
                                                    <?php foreach ($products as $product) { ?>
                                                    ga('ec:addProduct', {
                                                        'id': '<?php echo $product['product_id']; ?>',
                                                        'name': '<?php echo $product['name']; ?>',
                                                        'model': '<?php echo $product['model']; ?>',
                                                        'sku': '<?php echo $product['sku']; ?>',
                                                        'category': '<?php echo $product['category']; ?>',
                                                        'brand': '<?php echo $product['manufacturer']; ?>',
                                                        'price': '<?php echo $product['price']; ?>',
                                                        'quantity': '<?php echo $product['quantity']; ?>'
                                                    });
                                                    <?php } ?>
                                                    ga('ec:setAction', 'checkout', {'step': 3});
                                                    ga('send', 'pageview', '/checkout/confirm-order');
                                                })
                                            });
                                        }

                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<?php echo $footer; ?>
