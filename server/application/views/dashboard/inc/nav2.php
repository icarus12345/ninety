<?php 
$CI =& get_instance();
$user = $CI->session->userdata('dasbboard_user');
$user_privileges = explode(',',$user->ause_authority);
?>
<!-- Menu [ -->
<nav id="navigation" class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
    <ul >
        <li class="sidebar-search-wrapper">
            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
            <form action="extra_search.html" class="sidebar-search" method="post">
                <!-- <a class="remove" href="javascript:;"><i class="icon-close"></i></a> -->
                <div class="input-group">
                    <input class="form-control" placeholder="Search..." type="text"> <span class="input-group-btn"><a class="btn submit" href="javascript:;"><i class="icon-magnifier"></i></a></span>
                </div>
            </form><!-- END RESPONSIVE QUICK SEARCH FORM -->
        </li>
        <li class="heading">
            <h3 class="text-uppercase">Dashboard</h3>
        </li>
        
        <li>
            <a href="/dashboard/trademark">
                <i class="fa fa-address-book-o"></i> <span class="title">Trademark</span> 
            </a>
        </li>
        <li>
            <a href="/dashboard/shop">
                <i class="fa fa-shopping-bag"></i> <span class="title">Shop</span> 
            </a>
        </li>
        <li>
            <a href="/dashboard/campaign">
                <i class="fa fa-newspaper-o"></i> <span class="title">Campaign</span> 
            </a>
        </li>
        <!-- <li class="heading">
            <h3 class="uppercase">More</h3>
        </li>
        <li>
            <a href="javascript:;"><i class="icon-puzzle"></i> <span class="title">Feature</span> <span class="arrow"></span></a>
            <ul class="sub-menu">
                <li>
                    <a href="#"><i class="icon-info"></i> Help</a>
                </li>
            </ul>

        </li> -->
    </ul>
</nav>
