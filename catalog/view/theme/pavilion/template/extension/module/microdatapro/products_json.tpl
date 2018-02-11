<?php ?>
<?php $pi = 1; foreach($microdata_products as $product){ ?>
    {
        "@type": "Product",
        "position": <?php echo $pi; ?>,
        "image": "<?php echo $product['thumb']; ?>",
        "url": "<?php echo $product['href']; ?>",
        "name": "<?php echo $product['name']; ?>",
        "description": "<?php echo $product['microdata_description']; ?>",
        "offers": {
            "@type": "Offer",
            "price": "<?php echo $product['microdata_price']; ?>",
            "priceCurrency": "<?php echo $microdata_code; ?>"
        }
    }<?php if($pi != count($microdata_products)){ ?>,<?php } ?><?php $pi++; } ?>