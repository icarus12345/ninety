
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
        <div class="cate-menu">
            <span></span>
            <ul>
            	<?php foreach($categories as $item){ ?>
                <li><a href="/project/<?php echo $item->alias; ?>"><?php echo $item->title; ?></a></li>
                <?php } ?>
            </ul>
        </div>
                <div class="about-us scroll-section">
                    <div>
                        <div class="portfolio wow fadeInUp">
                            <div>CREATIVE DESIGN CO.</div>
                            <h1>Portfolio</h1>
                        </div>
                        <div class="container pull-top">
                            <div class="our-project row pull-top">
                                <div class="col-sm-6">
                                    <h2 class="wow fadeInUp">Our Project</h2>
                                    <div class="our-project-info wow fadeInUp">
                                        <div class="title">OVITO BRAND </div>
                                        <div class="cate">WORKING MINDSET ARE WHAT SET </div>
                                        <p><span>US APART</span> FROM OTHER LOCAL AGENCIES. <br/>
                                        <span>IF YOU HAVE</span> AN AMAZING IDEA THAT <br/>
                                        <span>OU WANNA</span> TURN INTO REALITY, WE CA</p>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row">
                                    <div class="our-project-img nailthumb-figure-square cover wow fadeInUp" style="background-image: url(/assets/images/img1.png)"></div>
                                </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="project-list row">
                                	<?php 
                                		if($projects[0]){ 
                                			$item = $projects[0];
                                		?>
                                    <div class="col-sm-6 x22">
                                        <div>
                                            <div class=" item wow fadeInUp">
                                                <div class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                                <div class="cap">
                                                    <div class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></div>
                                                    <div class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <?php 
                                		if($projects[1]){ 
                                			$item = $projects[1];
                                		?>
                                    <div class="col-sm-3 col-xs-6 g21">
                                        <div>
                                            <div class=" item wow fadeInUp">
                                                <div class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                                <div class="cap">
                                                    <div class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></div>
                                                    <div class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></div>
                                                </div>
                                            </div>
                                            <?php 
	                                		if($projects[2]){ 
	                                			$item = $projects[2];
	                                		?>
                                            <div class=" item wow fadeInUp">
                                                <div class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                                <div class="cap">
                                                    <div class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></div>
                                                    <div class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></div>
                                                </div>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <?php 
                                		if($projects[3]){ 
                                			$item = $projects[3];
                                		?>
                                    <div class="col-sm-3 col-xs-6 x21">
                                        <div>
                                            <div class=" item wow fadeInUp">
                                                <div class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></div>
                                                <div class="cap">
                                                    <div class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></div>
                                                    <div class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                                <divb class="">

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