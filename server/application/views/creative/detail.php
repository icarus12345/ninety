
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
                    <a href="/" class="navbar-toggle collapsed" type="button">
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
        <a href="/#creative/1" class="our-band-btn"><span>OUR BRAND</span></a>
        <a href="/#creative/2" class="contact-btn"><span>CONTACT</span></a>
        <div class="cate-menu">
            <span></span>
            <ul>
                <?php foreach($categories as $item){ ?>
                <li class="<?php if($category_detail && $category_detail->id ==  $item->id){echo 'actived';}?>"><a href="/project/<?php echo $item->alias; ?>"><?php echo $item->title; ?></a></li>
                <?php } ?>
            </ul>
        </div>
                <div class="about-us scroll-section">
                    <div>
                        <div class="portfolio wow fadeInUp">
                            <div>CREATIVE DESIGN CO.</div>
                            <h1>OVITO BRAND</h1>
                        </div>
                        <div class="container pull-top">
                            <div class="our-project big row pull-top">
                                <div class="col-sm-4 pull-bottom">
                                    <h3 class="wow fadeInUp"><?php echo $detail->title; ?></h3>
                                    <div class="our-project-info wow fadeInUp">
                                        <div class="title"><?php echo $category_detail->data['full_title'];?> </div>
                                        <div class=""><?php echo $category_detail->data['desc'];?></div>
                                    </div>
                                </div>
                                <div class="col-sm-8 pull-bottom">
                                    <div class="row">
                                        <div class="our-project-img nailthumb-figure-square cover wow fadeInUp" style="background-image: url(<?php echo $detail->data['image']; ?>)"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="row pull-top">
                                    <div class="col-sm-6">
                                    <?php 
                                    for($i=0;$i<count($detail->data['images']);$i=$i+2){ 
                                    $item = $detail->data['images'][$i];
                                    ?>
                                        <h4 class="text-right"><span><?php echo $item['title']; ?></span></h4>
                                        <div class="our-project-img nailthumb-figure-square cover wow fadeInUp" style="background-image: url(<?php echo $item['image']; ?>)"></div>
                                    <?php } ?>
                                    
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="our-project-info wow fadeInUp">
                                            <div><?php echo $detail->data['memo']; ?></div>
                                        </div>
                                        <?php 
                                        for($i=1;$i<count($detail->data['images']);$i=$i+2){ 
                                        $item = $detail->data['images'][$i];
                                        ?>
                                        <h4><span><?php echo $item['title']; ?></span></h4>
                                        <div class="our-project-img nailthumb-figure-square cover wow fadeInUp" style="background-image: url(<?php echo $item['image']; ?>)"></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="project-list row">
                                <h2 class="h2 wow fadeInUp text-center">OTHER WORK</h2>
                                    <?php 
                                        if($projects[0]){ 
                                            $item = $projects[0];
                                        ?>
                                    <div class="col-sm-6 x22">
                                        <div>
                                            <div class=" item wow fadeInUp">
                                                <a href="/project/<?php echo $item->alias; ?>" class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></a>
                                                <div class="cap">
                                                    <a href="/project/<?php echo $item->alias; ?>" class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></a>
                                                    <a href="/project/<?php echo $item->alias; ?>" class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></a>
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
                                                <a href="/project/<?php echo $item->alias; ?>" class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></a>
                                                <div class="cap">
                                                    <a href="/project/<?php echo $item->alias; ?>" class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></a>
                                                    <a href="/project/<?php echo $item->alias; ?>" class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></a>
                                                </div>
                                            </div>
                                            <?php 
                                            if($projects[2]){ 
                                                $item = $projects[2];
                                            ?>
                                            <div class=" item wow fadeInUp">
                                                <a href="/project/<?php echo $item->alias; ?>" class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></a>
                                                <div class="cap">
                                                    <a href="/project/<?php echo $item->alias; ?>" class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></a>
                                                    <a href="/project/<?php echo $item->alias; ?>" class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></a>
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
                                                <a href="/project/<?php echo $item->alias; ?>" class="thumb cover" style="background-image: url(<?php echo $item->data['image']; ?>)"></a>
                                                <div class="cap">
                                                    <a href="/project/<?php echo $item->alias; ?>" class="name"><span class="line-clamp-1"><?php echo $item->title; ?></span></a>
                                                    <a href="/project/<?php echo $item->alias; ?>" class="pdesc"><span class="line-clamp-1"><?php echo $item->data['desc']; ?></span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                                <div class="nav-control">
                                    <?php if($page<=1) { ?>
                                    <a href="#" class="prev" style="opacity: .5"></a>
                                    <?php }else{ ?>
                                    <a href="/project<?php if($category_detail){ echo '/'.$category_detail->alias;} ?>/page/<?php echo $page -1; ?>" class="prev"></a>
                                    <?php } ?>
                                    <?php if($page*$perpage >= $total_rows) { ?>
                                    <a href="#" class="next" style="opacity: .5"></a>
                                    <?php }else{ ?>
                                    <a href="/project<?php if($category_detail){ echo '/'.$category_detail->alias;} ?>/page/<?php echo $page +1; ?>" class="next"></a>
                                    <?php } ?>
                                </div>
                            </div>
                            
                        </div>
                        <div class="footer">
                            <div>
                                <a href="#">
                                    COPYRIGHT&copy;2017<br/><?php echo $page; ?><?php echo $page; ?><?php echo $page; ?><?php echo $page; ?>
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
        <script>
    jQuery(document).ready(function() {
    });
</script>