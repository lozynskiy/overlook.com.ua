<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <!-- Header-->
        <div class="page-header">
            <div class="container-fluid">
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <!-- /Header-->
        <!-- Content -->
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $cache_del; ?></h3>
                </div>
                <div class="panel-body">
                    <div class="alert alert-warning" role="alert">
                        <?php echo $minify_note; ?>
                    </div>
                    <div class="alert alert-success alert-cahce" role="alert" style="display:none;"><?php echo $minify_alert; ?></div>

                    <div><button class="btn btn-danger cache-clear"><span class="cache-icon"><i class="fa fa-trash-o"></i></span> <?php echo $cache_del; ?></button></div>
                </div>
            </div>
        </div>
        <!-- /Content -->
    </div>
<script type="text/javascript">
    $(document).ready(function() {
        $('.cache-clear').on('click', function() {
            var button = this;
            $('.alert-cahce').hide();

            $.ajax({
                url: 'index.php?route=extension/module/minify/clear&token=<?php echo $token ?>',
                type: 'get',
                dataType: 'json',
                beforeSend: function() {
                    $('.cache-icon').html('<i class="fa fa-spinner"></i>');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                },
                success: function(json) {
                    if (json['success']) {
                        $('.cache-icon').html('<i class="fa fa-trash-o"></i>');
                        $('.alert-cahce').show();
                    }
                }
            });
        });
    });
</script>
<?php echo $footer; ?>