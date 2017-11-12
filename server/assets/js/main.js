var wow
$(document).ready(function() {
    $(window).scroll(function(){
        $('.cate-menu').css({top:$(window).scrollTop()+190})
    })
    $.fn.fullpage.removeTouchHandler = function (){ 
        var isTouchDevice = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);
        if (isTouchDevice) {
            $(document).off('touchstart MSPointerDown');
            $(document).off('touchmove MSPointerMove');
        }
    };
    if($('#fullpage').length == 1){
        $('#fullpage').fullpage({
            sectionsColor: ['#f6f6f6', '#12171e', '#f6f6f6', 'whitesmoke', '#ccddff'],
            anchors: ['home', 'our-brand-contact', 'about', 'service', 'lastPage'],
            menu: '#menu',
            // css3: true,
            // scrollingSpeed: 1000,
            // autoScrolling: false,
            // fitToSection: false,
            // scrollOverflow:false,
            // scrollBar: true,
            // autoScrolling:false,
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
    }
    if($('#owl-our-service').length==1){
        var owl_our_team = $("#owl-our-service").owlCarousel({
            autoplay: false,
            autoplayTimeout: 6000,
            animateOut: 'fadeOut',
            // animateIn: 'fadeOut',

            items : 1,
            // center:true,
            // loop:true,
            // lazyLoad: true,
            nav : true,
            margin: 0,
            dots: false,
            navText : ["", ""],
            onChanged: function(event){
                var current = event.item.index;
                // var carousel = $('#owl-our-service').data('owl.carousel');
                // var index = carousel.relative(current)
                // console.log(current)
                var elm = $('.list-service').find("li").eq(current);
                if(elm){
                    $(".list-service li.actived").removeClass('actived')
                    elm.addClass('actived')
                }
            }
        });
        $(".list-service li").click(function(){
            var index = $(".list-service li").get().indexOf(this);
            $("#owl-our-service").trigger('to.owl.carousel',[index,1,true]);
        })
        
    }
    if($('#owl-our-team').length==1){
        var owl_our_team = $("#owl-our-team").owlCarousel({
            autoplay: false,
            autoplayTimeout: 6000,
            animateOut: 'fadeOut',
            // animateIn: 'fadeOut',

            items : 1,
            // center:true,
            // loop:true,
            // lazyLoad: true,
            nav : true,
            margin: 0,
            dots: false,
            navText : ["", ""],
            onChanged: function(event){
                var current = event.item.index;
                // var carousel = $('#owl-our-team').data('owl.carousel');
                // var index = carousel.relative(current)
                console.log(current)
                var elm = $('.our-team-thumbs>div').find(".item").eq(current);
                if(elm){
                    $(".our-team-thumbs>div>.item.selected").removeClass('selected')
                    elm.addClass('selected')
                }
            }
        });
        $(".our-team-thumbs>div>.item").click(function(){
            var index = $(".our-team-thumbs>div>.item").get().indexOf(this);
            $("#owl-our-team").trigger('to.owl.carousel',[index,1,true]);
        })
        
    }
    if($('#owl-home').length==1){
        var length = $('#owl-thumb .item').length;
        var owlThumb = $("#owl-thumb").owlCarousel({
            autoplay: false,
            // autoplayTimeout: 6000,
            animateOut: 'fadeOut',
            // animateIn: 'fadeOut',

            items : 5,
            // autoWidth:true,
            // center:true,
            loop:length>5 && false,
            // lazyLoad: true,
            nav : false,
            margin: 0,
            dots: false,
            responsive : {
                // breakpoint from 0 up
                0 : {
                    items: 5
                },
                768 : {
                    items: 5
                }
            },
            onInitialized: function(event){
                // $("#owl-thumb .selected").removeClass('selected')
                // $("#owl-thumb .active").addClass('selected')
            },
            onChanged: function(event){
                // var current = event.item.index;
                // var elm = $(event.target).find(".owl-item").eq(current);
                // if(elm){
                    // $("#owl-thumb .selected").removeClass('selected')
                    // elm.addClass('selected')
                // }
            }
        });
        var owl = $("#owl-home").owlCarousel({
            autoplay: false,
            autoplayTimeout: 6000,
            animateOut: 'fadeOut',
            // animateIn: 'fadeOut',

            items : 1,
            // center:true,
            loop:true,
            // lazyLoad: true,
            nav : true,
            margin: 0,
            dots: false,
            navText : ["", ""],
            onInitialized: function(event){
                $("#owl-home .animated").removeClass('animated')
                $("#owl-home .active").addClass('animated')
                $("#owl-thumb .selected").removeClass('selected')
                $("#owl-thumb").find(".owl-item").eq(0).addClass('selected')
                
            },
            onChanged: function(event){
                var current = event.item.index;
                var elm = $(event.target).find(".owl-item").eq(current);
                if(elm){
                    $("#owl-home .animated").removeClass('animated')
                    elm.addClass('animated')
                }
                if(owlThumb)
                var carousel = $('#owl-home').data('owl.carousel');
                $("#owl-thumb .selected").removeClass('selected')
                if(carousel) {
                    var index = carousel.relative(current)
                    // if(length>5) index = current;
                    $("#owl-thumb").find(".owl-item").eq(index).addClass('selected')
                    if(!$("#owl-thumb").find(".owl-item").eq(index).hasClass('active')){
                        $("#owl-thumb").trigger('to.owl.carousel',[index,1,true]);
                    }
                }
            }
        });
        $('#owl-thumb').on('click', '.owl-item', function () {
            var carousel = $('#owl-thumb').data('owl.carousel');
            var index = carousel.relative($(this).index());
            // if(length>5) index = $(this).index();
            console.log(index)
            $("#owl-home").trigger('stop.owl.autoplay')
            $("#owl-home").trigger('to.owl.carousel',[index,1,true]);
            $("#owl-home").trigger('play.owl.autoplay')
        });
    }
    new WOW().init();
});