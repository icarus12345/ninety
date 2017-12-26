
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Creative Design Studio</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no">

        <link rel="stylesheet" type="text/css" href="/lib/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="/lib/bootstrap/css/hover.css"/>
        <link rel="stylesheet" type="text/css" href="/lib/bootstrap/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="/lib/owl-carousel/owl.carousel.css">
        
        <link rel="stylesheet" type="text/css" href="/lib/scrollreveal/animate.css"/>
        <link rel="stylesheet" type="text/css" href="/lib/fullpage/jquery.fullPage.css"/>
        <link rel="stylesheet" type="text/css" href="/assets/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="/assets/css/slider.css"/>



        <script type="text/javascript" src="/lib/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="/lib/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="/lib/owl-carousel/owl.carousel.js"></script>
        <script type="text/javascript" src="/lib/jquery.nailthumb.1.1.js"></script>
        <script type="text/javascript" src="/lib/jquery.lazyload.min.js"></script>
        <script type="text/javascript" src="/lib/wow.min.js"></script>
        <script type="text/javascript" src="/lib/fullpage/jquery.slimscroll.min.js"></script>
        <script type="text/javascript" src="/lib/fullpage/jquery.fullPage-slimscroll.min.js"></script>
        <script type="text/javascript" src="/assets/js/main.js"></script>

        <!--[if IE]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <header id="navbar" class="navbar navbar-fixed-top" role="banner">
            <!-- Menu [ -->
            <div class="">
                <div class="navbar-header">
                    <!-- <a href="http://creativedesignvn.com/" class="navbar-brand"></a> -->
                    <a href="index.html" class="navbar-toggle collapsed" type="button">
                        <span>
                            <span class="icon-bar line-1"></span>
                            <span class="icon-bar line-2"></span>
                            <span class="icon-bar line-3"></span>
                        </span>
                        <i>BACK</i>
                    </a>
                </div>
            </div>
            <!-- Menu ] -->
        </header>
                <div class="about-us scroll-section">
                    <div>
                        <div class="service-bg contain" style="background-image: url(/assets/images/about.jpg)">
                            <h2><span>Who<br/> we are</span></h2>
                            
                        </div>
                        <div class="container text-center who-we-are">
                            <h3>who we are</h3>
                            <div data-wow-delay="0.5s" class="wow fadeInUp desc">
                                <p class="text-justify">CDS STUDIO IS A CREATIVE DIGITAL AGENCY BASED IN SAIGON THAT CRAFTED FUNCTIONALLY BEAUTIFUL WEBSITES AND APPS. TOGETHER, WE CAN TRANSFORM THE WAY YOUR BRAND CONNECTS WITH CLIENTS.</p>

                                <p class="text-justify wow fadeInUp">OUR UX DESIGN EXPERTISE AND INTERNATIONAL WORKING MINDSET ARE WHAT SET US APART FROM OTHER LOCAL AGENCIES. IF YOU HAVE AN AMAZING IDEA THAT YOU WANNA TURN INTO REALITY, WE CAN BE YOUR DIGITAL PARTNER TO POWER ALL THE DESIGN AND DEVELOPMENT WORKS SO YOU CAN RAISE MONEY AND TAKE OVER THE WORLD!</p>
                            </div> 
                            <div class="our-team">
                                <h2>Our Team</h2>
                                <div class="our-team-slider">
                                    <div class="owl-carousel" id="owl-our-team">
                                    	<?php foreach($staffs as $item){ ?>
                                        <div class="item" >
                                            <div class="our-avatar">
                                                <div class="cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                                <p><span class="line-clamp-1"><?php echo $item->title; ?></span></p>
                                                <span><?php echo $item->data['position']; ?></span>
                                            </div>
                                            <div class="our-desc">
                                                <div>
                                                    <p><span></span></p>
                                                    <i class="clear-fix"></i>
                                                    <?php echo $item->data['desc']; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="our-team-thumbs wow fadeInUp">
                                    <div>
                                    	<?php foreach($staffs as $item){ ?>
                                        <div class="item">
                                            <div class="thumb-img cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                            <div class="thumb-name"><span class="line-clamp-1"><?php echo $item->title; ?></span></div>
                                            <div class="thumb-pos"><span class="line-clamp-1"><?php echo $item->data['position']; ?></span></div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="clear-fix"></div>
                            </div> 
                            <div class="how-we-work">
                                 <h2 class="h2 wow fadeInUp">How We Work</h2>
                                 <div class="desc text-justify wow fadeInUp">
                                     OUR UX DESIGN EXPERTISE AND INTERNATIONAL WORKING MINDSET ARE WHAT SET US APART FROM OTHER LOCAL AGENCIES. IF YOU HAVE AN AMAZING IDEA THAT YOU WANNA TURN INTO REALITY, WE CAN BE YOUR DIGITAL PARTNER TO POWER ALL THE DESIGN AND DEVELOPMENT WORKS SO YOU CAN RAISE MONEY AND TAKE OVER THE WORLD !
                                 </div>
                                 <div class="space-linex2"></div>
                                 <div class="row half">
                                     <div class="col-sm-4 half item">
                                         <div class="how-we-work-1 contain"></div>
                                         <h3>DISCOVER</h3>
                                         <p>WE DEVELOP A THOROUGH UNDERSTANDING OF OUR CLIENTS BRIEF & OBJECTIVES TO FORMULATE A STRATEGY</p>
                                     </div>
                                     <div class="col-sm-4 half item">
                                         <div class="how-we-work-2 contain"></div>
                                         <h3>CONCEPT & DESIGN</h3>
                                         <p>WE BRAINSTORM WITH TEAM TO CRAFT A FUNCTIONAL YET CREATIVE DESIGN THAT MEET THE OBJECTIVES OF THE PROJECT</p>
                                     </div>
                                     <div class="col-sm-4 half item">
                                         <div class="how-we-work-3 contain"></div>
                                         <h3>DEVELOP & DEPLOY</h3>
                                         <p>WE BRING YOUR VISION TO LIFE, DEVELOP SEAMLESS PERFORMANCE PRODUCTS WITH CAREFUL TESTING PROCESS</p>
                                     </div>
                                 </div>
                            </div>
                        </div>
                        <div class="footer">
                            <div>
                                <a href="#">
                                    COPYRIGHT&copy;2017<br/>
                                    WEBDESIGN & DEVELOPMENT BY <b>CDS</b>
                                </a>
                            </div>
                            <ul>
                                <li><a href="/">#HOME</a></li>
                                <li><a href="/project/web">#WEBDESIGN</a></li>
                                <li><a href="/project/print">#GRAPHICDESIGN</a></li>
                                <li><a href="/project/brand">#BRANDING</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
        <script>
    jQuery(document).ready(function() {
    });
</script>