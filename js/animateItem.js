$(document).ready(function () {
    $(window).scroll(function () {
        $('.events-circle').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 1900) {
                $(this).addClass("hatch");
            }
        });
    });



    $(window).scroll(function () {
        $('.rules-circle').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            $('#rocket1').removeClass("animate slideUp")
            if (topOfWindow > 3200) {
                $(this).addClass("hatch");
                $('#rocket1').addClass("animate slideUp");
            }
        });
    });


    $(window).scroll(function () {
        $('.day-text').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
           //console.log(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 4436) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#pointer').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("animate slideUp");
            if (topOfWindow > 6500) {
                $(this).addClass("animate slideUp");
            }
        });
    });

    $(window).scroll(function () {
        $('.contact').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 6990) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#contact-box1').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 7100) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#contact-box2').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 7100) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#contact-box3').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 7100) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#ufo1').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("hatch");
            if (topOfWindow > 1190) {
                $(this).addClass("hatch");
            }
        });
    });

    $(window).scroll(function () {
        $('#ufo2').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("animate slideUp");
            if (topOfWindow > 2290) {
                $(this).addClass("animate slideUp");
            }
        });
    });

    $(window).scroll(function () {
        $('#ufo3').each(function () {
            var imagePos = $(this).offset().top;
            //alert(imagePos);
            var topOfWindow = $(window).scrollTop();
            //alert(topOfWindow);
            $(this).removeClass("slideDown ");
            if (topOfWindow > 5100) {
                $(this).addClass("slideDown");
            }
        });
    });

});