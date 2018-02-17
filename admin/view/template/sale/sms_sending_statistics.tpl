<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1>SMS statistics</h1>
            <div class="pull-right">
                <!-- <a href="/admin/index.php?route=extension/modification/refresh&amp;token=<?php echo $token; ?>" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="Refresh"><i class="fa fa-refresh"></i></a> 
                <a href="/admin/index.php?route=extension/modification/clear&amp;token=<?php echo $token; ?>" data-toggle="tooltip" title="" class="btn btn-warning" data-original-title="Clear"><i class="fa fa-eraser"></i></a>
                <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-events').submit() : false;" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>-->
            </div>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <!-- <div class="alert alert-info"><i class="fa fa-info-circle"></i> Whenever you enable / disable or delete a modification you need to click the refresh button to rebuild your modification cache!   <button type="button" class="close" data-dismiss="alert">×</button> -->
        
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>SMS statistics</h3>
            </div>
            <div class="panel-body">

                <form action="/admin/index.php?route=sale/sms_sending/rules_delete&amp;token=<?php echo $token; ?>" method="post" enctype="multipart/form-data" id="form-events">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <td class="text-left">id</td>
                                    <td class="text-left">taskname</td>
                                    <td class="text-left">from</td>
                                    <td class="text-left">body</td>
                                    <td class="text-left">begindate</td>
                                    <td class="text-left">enddate</td>
                                    <td class="text-left">status</td>
                                    <td class="text-left">sent</td>
                                    <td class="text-left">delivered</td>
                                    <td class="text-left">notdelivered</td>
                                    <td class="text-left">price</td>
                                    <td class="text-left">currency</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if ( ! empty($statistic['id'])) {?>
                                    <?php foreach ($statistic['id'] as $i => $id) {?>
                                    <tr>
                                        <td class="text-left"><?php echo $id ?></td>
                                        <td class="text-left"><?php echo $statistic['taskname'][$i] ?></td>
                                        <td class="text-left"><?php echo $statistic['from'][$i] ?></td>
                                        <td class="text-left" style="vertical-align: top;"><pre style="max-width: 500px; max-heigth: 200px"><?php echo $statistic['body'][$i] ?></pre></td>
                                        <td class="text-left" ><?php echo $statistic['begindate'][$i] ?></td>
                                        <td class="text-left" ><?php echo $statistic['enddate'][$i] ?></td>
                                        <td class="text-left" ><?php echo $statistic['status'][$i] ?></td>
                                        <td class="text-left" ><?php echo $statistic['sent'][$i] ?></td>
                                        <td class="text-left" ><?php echo $statistic['delivered'][$i] ?></td>
                                        <td class="text-left" ><?php echo $statistic['notdelivered'][$i] ?></td>
                                        <td class="text-left" ><?php echo round($statistic['price'][$i], 3) ?></td>
                                        <td class="text-left" ><?php echo $statistic['currency'][$i] ?></td>
                                    </tr>
                                    <?php } ?>
                                <?php } else {?>
                                    <tr>
                                        <td class="text-center" colspan="12">No results!</td>
                                    </tr>
                                <?php } ?>

                            </tbody>
                        </table>
                    </div>
                </form>
                <!-- <div class="row">
                  <div class="col-sm-6 text-left"></div>
                  <div class="col-sm-6 text-right">Showing 1 to 2 of 2 (1 Pages)</div>
                </div> -->
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right">Showing 1 to <?php echo $last_page ?> of <?php echo $last_page ?> (<?php echo $last_page ?> Pages)</div>
                </div>
            </div>
        </div>
    </div>
</div>
<style> 
    .highlight { background: #FA6; } 
</style>

<?php echo $footer; ?>