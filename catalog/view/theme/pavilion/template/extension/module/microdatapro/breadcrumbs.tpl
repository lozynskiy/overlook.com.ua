<?php ?>
<?php if ($microdata_breadcrumbs) { ?>
    <?php if ($config_item_breadcrumb) { ?>
            <script type="application/ld+json">
            {
                "@context": "http://schema.org",
                "@type": "BreadcrumbList",
                "itemListElement": [
                    <?php $bi = 1; foreach ($microdata_breadcrumbs as $breadcrumb) { ?>
                    {
                        "@type": "ListItem",
                        "position": <?php echo $bi; ?>,
                        "item": {
                            "@id": "<?php echo $breadcrumb['href']; ?>",
                            "name": "<?php echo $breadcrumb['text']; ?>"
                        }
                    }<?php if ($bi != count($microdata_breadcrumbs)) { ?>,<?php } ?><?php $bi++;} ?>
                ]
            }
            </script>
    <?php } ?>
<?php } ?>