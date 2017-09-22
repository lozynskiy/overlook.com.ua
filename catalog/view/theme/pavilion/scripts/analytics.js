var GaEvent = {
    AddToCart: 'Add to Cart',
    AddToCompare: 'Add to Compare',
    AddToWishList: 'Add to Wishlist',
    RemoveFromCart: 'Remove from Cart',
    Link: 'Link'
}

var GaList = {
    Featured: 'Featured',
    Special: 'Special',
    Latest: 'Latest',
    Lastview: 'Lastview',
    Bestseller: 'Bestseller',
    ProductDetail: 'Product Detail',
    CategoryPage: 'Category Page',
    SearchResult: 'Search Result',
    SpecialPage: 'Special Page'
}

var GaAction = {
    detail: 'detail',
    click: 'click',
    add: 'add',
    remove: 'remove',
    checkout: 'checkout',
    checkout_option: 'checkout_option',
    purchase: 'purchase',
    refund: 'refund',
    promo_click: 'promo_click'
}

function createFunctionWithTimeout(callback, opt_timeout) {
    var called = false;

    function fn() {
        if (!called) {
            called = true;
            callback();
        }
    }

    setTimeout(fn, opt_timeout || 500);
    return fn;
}

function GaProductAddToCart(product, quantity) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
            //'variant': product.variant,
            'price': product.price,
            'quantity': quantity
        });
        ga('ec:setAction', 'add');
        ga('send', 'event', 'Ecommerce', 'click', GaEvent.AddToCart);
    }
}

function GaProductDetail(product) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
        });
        ga('ec:setAction', 'detail');

        ga('send', 'event', 'Ecommerce', 'detail', GaEvent.ProductDetail);
    }
}

function GaListLink(product, list) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
            'position': product.position
        });
        ga('ec:setAction', 'click', {list: list});

        ga('send', 'event', 'Ecommerce', 'click', GaEvent.Link, {
            hitCallback: createFunctionWithTimeout(function () {
                document.location = '/index.php?route=product/product&product_id=' + product.id;
            })
        });
    } else {
        document.location = '/index.php?route=product/product&product_id=' + product.id;
    }
}

function GaListAddToCart(product, list, quantity) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
            'position': product.position
        });
        ga('ec:setAction', 'click', {list: list});

        ga('send', 'event', 'Ecommerce', 'click', GaEvent.AddToCart, {
            hitCallback: createFunctionWithTimeout(function () {
                cart.add(product.id, quantity);
            })
        });
    } else {
        cart.add(product.id, quantity);
    }
}

function GaListAddToCompare(product, list) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
            'position': product.position
        });
        ga('ec:setAction', 'click', {list: list});

        ga('send', 'event', 'Ecommerce', 'click', GaEvent.AddToCompare)
        compare.add(product.id);

    } else {
        compare.add(product.id);
    }
}

function GaListAddToWishlist(product, list) {
    if (typeof ga != 'undefined') {
        ga('ec:addProduct', {
            'id': product.id,
            'name': product.name,
            'model': product.model,
            'sku': product.sku,
            'category': product.category,
            'brand': product.brand,
            'position': product.position
        });
        ga('ec:setAction', 'click', {list: list});

        ga('send', 'event', 'Ecommerce', 'click', GaEvent.AddToWishList)
        wishlist.add(product.id);
    } else {
        wishlist.add(product.id);
    }
}