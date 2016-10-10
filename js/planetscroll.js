$(document).ready(function () {
    $(window).scroll(function () {
        $('.notification').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 400) {
                $(this).addClass("hatch");
            }
        });
    });
});
