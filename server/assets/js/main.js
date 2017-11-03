var wow
$(document).ready(function() {
    $.fn.fullpage.removeTouchHandler = function (){ 
        var isTouchDevice = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);
        if (isTouchDevice) {
            $(document).off('touchstart MSPointerDown');
            $(document).off('touchmove MSPointerMove');
        }
    };
    $('#fullpage').fullpage({
        sectionsColor: ['#f6f6f6', '#12171e', '#f6f6f6', 'whitesmoke', '#ccddff'],
        anchors: ['home', 'our-brand-contact', 'about', 'service', 'lastPage'],
        menu: '#menu',
        // css3: true,
        // scrollingSpeed: 1000,
        // autoScrolling: false,
        fitToSection: false,
        scrollOverflow:false,
        scrollBar: true,
        autoScrolling:false,
        // scrollOverflowOptions:{
            // mouseWheel: true,
            // scrollbars: false,
        // },
        afterRender: function(){
            $.fn.fullpage.removeTouchHandler();
            // $.fn.fullpage.setAllowScrolling(false, 'left, right, top, bottom');
            $.fn.fullpage.setMouseWheelScrolling(false);
            $.fn.fullpage.setKeyboardScrolling(false);
        },
        afterLoad: function(anchorLink, index){
            console.log('WOW INIT')
            wow = new WOW().init();
        },
    });
});