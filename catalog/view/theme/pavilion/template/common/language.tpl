<?php if (count($languages) > 1) { ?>
<div id="header-links-wrapper" class="language-selector">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
   <ul  id="language-dropdown" class="language-list-style">
      <?php foreach ($languages as $language) { ?>
      <li><a class="language-select" name="<?php echo $language['code']; ?>">
              <img data-toggle="tooltip" src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
              <?php echo $language['name']; ?>
          </a>
      </li>
      <?php } ?>
    </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
