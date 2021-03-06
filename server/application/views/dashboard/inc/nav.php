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
        <?php 
        if($dashboard_menus) {
            foreach ($dashboard_menus as $m) {
                $privileges = explode(',',$m->privilege);
                $check = !!array_intersect($user_privileges,$privileges);
                if($check){
        ?>
        <li>
            <?php if(!empty($m->children)) :?>
            <a href="#">
                <i class="<?php echo !empty($m->data['icon'])?$m->data['icon']:'icon-home'; ?>"></i> <span class="title"><?php echo $m->title; ?></span> 
                <span class="arrow"></span>
            </a>
            <ul>
            <?php 
            foreach ($m->children as $sm) {
                $privileges = explode(',',$sm->privilege);
                $check = !!array_intersect($user_privileges,$privileges);
                if($check){
            ?>
                <li>
                    <?php if(!empty($sm->children)) :?>
                    <a href="#"><i class="<?php echo !empty($sm->data['icon'])?$sm->data['icon']:'fa fa-th-list'; ?>"></i> <span class="title"><?php echo $sm->title; ?></span> <span class="arrow"></span></a>
                    <ul>
                    <?php
                    foreach ($sm->children as $ssm) {
                        $privileges = explode(',',$ssm->privilege);
                        $check = !!array_intersect($user_privileges,$privileges);
                        if($check){
                    ?>
                        <li>
                            <a href="<?php echo !empty($ssm->data['link'])? get_url($ssm->data['link']):'#';?>">
                                <i class="<?php echo !empty($ssm->data['icon'])?$ssm->data['icon']:'icon-folder'; ?>"></i> <span class="title"><?php echo $ssm->title; ?></span>
                            </a>
                        </li>
                    <?php
                        }
                    }
                    ?>
                    </ul>
                    <?php else: ?>
                    <a href="<?php echo !empty($sm->data['link'])? get_url($sm->data['link']):'#';?>">
                        <i class="<?php echo !empty($sm->data['icon'])?$sm->data['icon']:'icon-folder'; ?>"></i> <span class="title"><?php echo $sm->title; ?></span>
                    </a>
                    <?php endif; ?>
                </li>
            <?php
                }
            }
            ?>
            </ul>
            <?php else: ?>
            <a href="<?php echo !empty($m->data['link'])? get_url($m->data['link']):'#';?>">
                <i class="<?php echo !empty($m->data['icon'])?$m->data['icon']:'icon-home'; ?>"></i> <span class="title"><?php echo $m->title; ?></span>
            </a>
            <?php endif; ?>
        </li>
        <?php
                }
            }
        }
        ?>
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
