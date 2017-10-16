<?php 
$this->CI =& get_instance();
?>
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
                    <a href="#">Trademark</a>
                </li>
            </ul>
        </div>
        <div class="secondary-box" id="entrys-list">
            <div class="modal-header">
                <h4>
                    Trademark <small>List</small>
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
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div class="-secondary-box" id="entry-detail">
            <div class="modal-header">
                <h4>
                    Trademark <small>Add/Edit</small>
                </h4>
            </div>
        </div>
        <div class="-secondary-box" id="entry-see" style="display:none">
            <div class="modal-header">
                <h4>
                    Trademark <small>View</small>
                </h4>
            </div>
        </div>
    </div>
<!-- </div> -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#datatable').DataTable( {
            "ajax": App.BaseUrl + 'dashboardapi/trademark/dataTable',
            "processing": true,
            "serverSide": true,
            "dom": ["<'header-panel'<'search-panel'f><'setting-panel'l>>" +
                    "<'container-panel'<'grid-panel'tr>>" +
                    "<'footer-panel'<'info-panel'i><'paging-panel'p>>"].join(''),
            "columns": [
                { "data": "id" },
                { "data": "title" },
                { "data": "created" },
            ]
        } );
    } );
</script>