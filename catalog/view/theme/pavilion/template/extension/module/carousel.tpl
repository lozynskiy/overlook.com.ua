<div id="carousel<?php echo $module; ?>" class="owl-carousel owl-theme">
  <?php foreach ($banners as $banner) { ?>
  <div class="item text-center">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 6,
	dots:true,
	autoplayTimeout: 3000,
	autoplay: true,
	lazyLoad:true,
        loop:false,
        navRewind:true,
        margin:10,
	loop:true
});
--></script>