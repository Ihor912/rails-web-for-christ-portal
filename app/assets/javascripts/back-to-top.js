document.addEventListener("turbolinks:load", function() {
    $('body').prepend('<a href="#" class="back_to_top">Повернутись вгору</a>');

    var amountScrolled = 300;
    $(window).scroll(function () {
    if( $(window).scrollTop() > amountScrolled ){
        $('a.back_to_top').fadeIn('slow');
    } else {
        $('a.back_to_top').fadeOut('slow');
    }
    });

    $('a.back_to_top, a.simple_back_to_top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 700);
        return false;
    });
});