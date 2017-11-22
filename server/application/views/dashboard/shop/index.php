<?php 
$this->CI =& get_instance();
?>
<script type="text/javascript" src="/lib/dashboard/js/shop.js"></script>
<!-- <div class=" fluid"> -->
    <div class="modal-body">
        <!-- <h3 class="page-title">
            Dashboard <small><?php echo $settings[$sid]->title; ?></small>
        </h3> -->
        <div class="page-bar">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="<?php echo base_url('dashboard') ?>">Dashboard</a>
                </li>
                <li>
                    <a href="#">Shop</a>
                </li>
            </ul>
        </div>
        <div class="secondary-box" id="entrys-list">
            <div class="modal-header">
                <h4>
                    Shop <small>List</small>
                </h4>
                <div class="modal-action">
                    <div><a <?php $settings[$sid]->data['add'] != 'true'?'disabled':'' ?> href="JavaScript:App.Common.ShowDetailDialog()" class="icon-plus" title="Add new entry"></a></div>
                    <div class="dropdown pull-right">
                        <a href="JavaScript:" class="icon-options-vertical" data-toggle="dropdown" title="Show more action"></a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a <?php $settings[$sid]->data['add'] != 'true'?'disabled':'' ?> href="JavaScript:App.Common.ShowDetailDialog()"><span class="icon-plus"></span> Add New</a></li>
                            <li><a href="JavaScript:App.Common.Refresh()"><span class="icon-refresh"></span> Refresh</a></li>
                            <li><a href="#"><span class="icon-settings"></span> Setting</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#"><span class="icon-question"></span> Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="datatableGrid" id="datatableGrid" style="border:0">
                <table id="datatable" class="table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Trademark</th>
                            <th>Province</th>
                            <th>Title</th>
                            <th>Created</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>

                </table>
            </div>
        </div>

        <div class="-secondary-box" id="entry-detail" style="display:none">
            <div class="modal-header">
                <h4>
                    Shop <small>Add/Edit</small>
                </h4>
            </div>
        </div>
        <div class="-secondary-box" id="entry-see" style="display:none">
            <div class="modal-header">
                <h4>
                    Shop <small>View</small>
                </h4>
            </div>
        </div>
    </div>
