$(document).ready(function () {
    $(document).on("scrollstart", function () {
        $(document).css("pointer-events", "none");
    });
    $(document).on("scrollend", function () {
        setTimeout(function () {
            $(document).css("pointer-events", "");
        }, 200);
    });
    $('a[href*=#]').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
        && location.hostname == this.hostname) {
            var $target = $(this.hash);
            $target = $target.length && $target
            || $('[name=' + this.hash.slice(1) + ']');
            if ($target.length) {
                var targetOffset = $target.offset().top;
                var height = Math.abs($(window).scrollTop() - targetOffset);
                console.log(height);
                time = (height > 5000) ? (height - (height * 0.4)) : (height < 1000) ? (height + (height * 0.6)) : height;
                $('body')
              .animate({ scrollTop: targetOffset }, Math.round(time));
                return false;
            }
        }
    });
});
