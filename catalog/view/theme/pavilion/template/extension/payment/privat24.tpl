<form action="<?php echo $action; ?>" method="post">
            <input type="hidden" name="amt" value="<?php echo $amt; ?>"/>
            <input type="hidden" name="ccy" value="<?php echo $ccy; ?>" />
            <input type="hidden" name="merchant" value="<?php echo $merchant; ?>" />
            <input type="hidden" name="order" value="<?php echo $order; ?>" />
            <input type="hidden" name="details" value="<?php echo $details; ?>" />
            <input type="hidden" name="ext_details" value="" />
            <input type="hidden" name="pay_way" value="privat24" />
            <input type="hidden" name="return_url" value="<?php echo $return_url; ?>" />
            <input type="hidden" name="server_url" value="<?php echo $server_url; ?>" />
    <div class="buttons">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button-1 confirm-order-next-step-button" data-loading-text="<?php echo $text_loading; ?>" />
    </div>
</form>
