
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
    <body class="full-page">
    <header id="navbar" class="navbar navbar-fixed-top" role="banner">
            <!-- Menu [ -->
            <div class="">
                <div class="navbar-header">
                    <!-- <a href="http://creativedesignvn.com/" class="navbar-brand"></a> -->
                    <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navigation">
                        <span>
                            <span class="icon-bar line-1"></span>
                            <span class="icon-bar line-2"></span>
                            <span class="icon-bar line-3"></span>
                        </span>
                    </button>
                </div>
            </div>
            <!-- Menu ] -->
        </header>
        <nav id="navigation" class="navbar-collapse bs-navbar-collapse collapse" role="navigation" data-transition-duration=0>
            <div>
                <a href="index.html#home" class="logo" data-toggle="collapse" data-target="#navigation"></a>
                <ul class="nav navbar-nav">
                    <li class="active"><a href='index.html#home' data-toggle="collapse" data-target="#navigation">Home</a></li>
                    <li class=""><a href='about.html' >About</a></li>
                    <li class=""><a href='service.html'>Services</a></li>
                    <li class=""><a href='#our-brand-contact' data-toggle="collapse" data-target="#navigation">Our Brands</a></li>
                    <li class=""><a href='project.html'>Projects</a></li>
                    <!-- <li class=""><a href='#'>Blogs</a></li> -->
                    <!-- <li class=""><a href='#'>Job Opportunities</a></li> -->
                    <li class=""><a href='#our-brand-contact/1' data-toggle="collapse" data-target="#navigation">Contact</a></li>
                </ul>
                <span data-toggle="collapse" data-target="#navigation">CLOSE</span>
            </div>
        </nav>
        <div id="fullpage">
            <div class="section active" id="section-home">
                <div class="home-slider">
                    <div class="owl-carousel" id="owl-home">
                        <?php foreach($slider as $item){ ?>
                        <div class="item" >
                            <div class="contain img" style="background-image:url('<?php echo $item->data['image'];?>')">
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="thumbs">
                        <div class="owl-carousel" id="owl-thumb">
                            <?php foreach($slider as $item){ ?>
                            <div class="item" >
                                <div><span><?php echo $item->title;?></span></div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section home-section" id="section-about-our-brand">
                <div class="">
                    <div class="slide active">
                        <div class="intro our-brand">
                            <div>
                                <a href="index.html#home" class="logo"></a>
                                <div class="list-our-brand">
                                    <div class="our-title"><span>OUR <b>BRAND</b></span></div>
                                    <div>
                                        <?php foreach($ourbrands as $item){ ?>
                                        <div class="our-brand-item">
                                            <div class="contain" style="background-image: url(<?php echo $item->data['image'];?>)">
                                                
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="slide">
                        <div class="intro about">
                            <div>
                                <a href="index.html#home" class="logo"></a>
                                <div class="contact-us">
                                    <div class="our-title"><span>CONTACT</span></div>
                                    <div class="contact-us-box">
                                        <h2>DROP US A LINE</h2>
                                        <p>Press contact <a href="">hotro@creativedesignvn.com</a>. Hotline <a href="">0902 389 579 (8A.M - 6P.M)</a>
Address <a href="">39 Luong Huu Khanh,Ben Nghe Ward, Distrist 1,HCMC</a></p>
                                        <div class="form-contact-us">
                                            HI     <span contenteditable="true">YOUR NAME</span>     . WELCOME TO CDS STUDIO
                                            TO DISCUSS A PROJECT, YOU COULD LEAVE
                                                <span contenteditable="true">YOUR EMAIL</span>     AND     <span contenteditable="true">YOUR PHONE</span>    HERE.
                                            THE INFORMATION WILL BE SAVED AFTER
                                            YOU CLICK SUBMIT. 
                                            <div class="space-line1"></div>
                                            <div>
                                                <button class="btn btn-default">SUBMIT</button>
                                            </div>
                                            <div class="space-line1"></div>
                                            <div class="space-line1"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
    jQuery(document).ready(function() {
        
    });
</script>
