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
      <div class="page password-recovery-page">
        <div class="page-title">
          <h1><?php echo $heading_title; ?></h1>
        </div>
        <div class="page-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <p class="tooltip"><?php echo $text_email; ?></p>
        <div class="fieldset">
          <div class="form-fields">
          <div class="inputs">
            <label for="input-email"><?php echo $entry_email; ?><span class="required">*</span></label>
            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
          </div>
        </div>
        </div>
        <div class="buttons">
            <input type="submit" value="<?php echo $button_continue; ?>" class="button-1 password-recovery-button" />
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