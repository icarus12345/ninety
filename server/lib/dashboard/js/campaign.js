$(document).ready(function() {
    App.Common = (function(){
        var URI = {
            bind : App.BaseUrl + 'dashboardapi/campaign/bind',
            detail  : App.BaseUrl + 'dashboardapi/campaign/detail',
            load_category  : App.BaseUrl + 'dashboardapi/campaign/load_category_by_trademark',
            load_apply_for  : App.BaseUrl + 'dashboardapi/campaign/load_apply_for_by_trademark',
            see  : App.BaseUrl + 'dashboardapi/campaign/see',
            subdetail  : App.BaseUrl + 'dashboardapi/campaign/subdetail',
            commit  : App.BaseUrl + 'dashboardapi/campaign/commit',
            sendlatest  : App.BaseUrl + 'dashboardapi/campaign/sendlatest',
            sendoldest  : App.BaseUrl + 'dashboardapi/campaign/sendoldest',
            update  : App.BaseUrl + 'dashboardapi/campaign/update',
            delete  : App.BaseUrl + 'dashboardapi/campaign/delete',
            catebinding : App.BaseUrl + 'dashboardapi/category/bind',
        };
        var province_data,province_select,trademark_select;
        var oTable =  $('#datatable').DataTable( {
            "ajax": URI.bind,
            "processing": true,
            "serverSide": true,
            "bAutoWidth": false , 
            "order": [[ 0, "desc" ]],
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "language": {
                "paginate": {
                  "previous": "<span class='fa fa-angle-left'></span>",
                  "next": "<span class='fa fa-angle-right'></span>"
                }
            },

            "scrollX": true,

            "dom": [
                "<'header-panel'<'search-panel'f><'setting-panel'l>>" +
                "<'container-panel'<'grid-panel'tr>>" +
                "<'footer-panel'<'info-panel'i><'paging-panel'p>>"
            ].join(''),
            "columns": [
                { 
                    "data": "$.id" ,
                    'sWidth': '60px',
                    "className": '',
                    "render": function ( data, type, row, setting ) {
                      return [
                        '<div class="actions" title="'+data+'">',
                            '<span>'+data+'</span>',
                            '<a href="javascript:App.Common.ShowDetailDialog('+data+')" class="fa fa-pencil"></a>',
                            '<a href="javascript:App.Common.Delete('+data+','+setting.row+')" class="fa fa-trash-o"></a>',
                        '</div>'
                        ].join('')
                    }
                },
                { 
                    "data": "$.trademark_title",
                    'sWidth': '120px'
                },
                { 
                    "data": "$.title" ,
                    'sWidth': '180px'
                },
                { 
                    "data": "$.start_date" ,
                    'searchable':false,
                    'sWidth': '146px'
                },
                { 
                    "data": "$.end_date" ,
                    'searchable':false,
                    'sWidth': '146px'
                },
                { 
                    "data": "$.created",
                    'searchable':false,
                    'sWidth': '146px'
                },
            ],
            initComplete: function () {
                this.api().columns().every( function (index) {
                    var column = this;
                    // console.log(column,index)
                    if(index == 2){
                        var select = $('<input class="fillter-row-input" type="text"/>')
                            .appendTo( $(column.footer()).empty() )
                            .on( 'keyup', function (e) {
                                if(e.keyCode == 13) {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );
             
                                    column
                                        .search( val ? '%'+val+'%' : '', true, false )
                                        .draw();
                                }
                            } );
                    }
                    function load_filter_trademark(select){
                        var url = '/dashboardapi/trademark/get_all';
                        new App.Request({
                            'url': url,
                            'data': {
                            },
                        }).done(function(res) {
                            if (res.code < 0) {
                                toastr.error(res.message,'Error');
                            } else {
                                if(res.data) res.data.map(function(d){
                                    var title = $.fn.dataTable.util.escapeRegex(d.title)
                                    trademark_select.append( '<option value="'+d.country_id+'">'+title+'</option>' );
                                })
                            }
                        })
                    }
                    
                    
                    if(
                        index == 1
                        ){
                        trademark_select = $('<select class="fillter-row-input"><option value=""></option></select>')
                        trademark_select.appendTo( $(column.footer()).empty() )
                            .on( 'change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).find("option:selected").text()
                                    );
                                    column
                                        .search( val ? '%'+val+'%' : '', true, false )
                                        .draw();
                            } );
                        load_filter_trademark();
                    }
                    
                } );

                // $('#datatableGrid .dataTables_filter input').unbind();
                // $('#datatableGrid .dataTables_filter input').bind('keyup', function(e) {
                //     if(e.keyCode == 13) {
                //         oTable.fnFilter(this.value);    
                //     }
                // });
            }
        } );
        
        
        var Lists = {};
        var Grids = {};
        var seedialog;
        return {
            onCommit: function(data,id,callback){
                new App.Request({
                    url: URI.update,
                    data: {
                        id: id,
                        sid: App.Common.sid,
                        data: data
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        if(typeof callback == 'function') callback()
                    }
                })
            },
            SendLatest: function(id){
                new App.Request({
                    url: URI.sendlatest,
                    data: {
                        id: id,
                        sid: App.Common.sid
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        App.Common.Refresh()
                    }
                })
            },
            SendOldest: function(id){
                new App.Request({
                    url: URI.sendoldest,
                    data: {
                        id: id,
                        sid: App.Common.sid
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        App.Common.Refresh()
                    }
                })
            },
            Refresh: function() {
                oTable.ajax.reload();
            },
            Back: function(){
                    $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>').hide();
                    $('#entrys-list').show();
            },
            Duplicate: function(){
                var frm = $('#entry-detail-frm');
                if(frm.length==0) return;
                var data = frm.serializeObject();
                if(!data.id && !JSON.parse(App.Common.settings[App.Common.sid].data.add)){
                    toastr.warning('Access denied','Warning');
                     return;
                }
                frm.find('input[name="id"]').val('');
                frm.find('input[name="title"]').val(frm.find('input[name="title"]').val() + '(copy)');
                frm.find('input[name="alias"]').val(frm.find('input[name="alias"]').val() + '-copy');
                frm.find('input[name="id"]').val('');
                App.Common.Save();
            },
            Delete: function(id,row){
                data_row = oTable.row(row).data();
                // toastr.warning('This function to requires an administrative account.<br/>Please check your authority, and try again.','Warning');
                
                var itemName = data_row.$.title;
                App.Confirm(
                    'Delete item ?',
                    'Do you want delete "'+itemName+'".<br/>These items will be permanently deleted and cannot be recovered. Are you sure ?',
                    function(){
                        new App.Request({
                            'url': URI.delete,
                            'data': {
                                'id': id
                            },
                        }).done(function(res) {
                            if (res.code < 0) {
                                toastr.error(res.message,'Error');
                            } else {
                                toastr.success(res.message,'Success');
                                App.Common.Refresh();
                            }
                        })
                    }
                );
            },
            Save: function(only){
                var frm = $('#entry-detail-frm');
                if(frm.length==0) return;
                if( frm.validationEngine('validate') === false){
                    toastr.warning('Please complete input data.','Warning');
                    return;
                }
                
                var data = $('#entry-detail-frm').serializeObject();
                var id = data.id;
                delete(data.id)
                
                
                // if(!id && !JSON.parse(App.Common.settings[App.Common.sid].data.add)){
                //     toastr.warning('Access denied','Warning');
                //      return;
                // }
                new App.Request({
                    url: URI.commit,
                    data: {
                        id: id,
                        sid: App.Common.sid || null,
                        data: data
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        if(only===true) return;
                        $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>').hide();
                        $('#entrys-list').show();
                        App.Common.Refresh();
                    }
                })
            },
            BackSee: function(){
                $('#entry-see').html('<div class="loading"><span>Loading...</span></div>').hide();
                $('#entrys-list').show();
            },
            ShowViewDialog: function(id){
                $('#entry-see').html('<div class="loading"><span>Loading...</span></div>').show();
                $('#entrys-list').hide();
                new App.Request({
                    url: URI.see,
                    // datatype: 'html',
                    data: {
                        id: id || null,
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                        App.Common.Back()
                    } else {
                        $('#entry-see').html(res.html);
                        App.InitSee($('#entry-see'));
                        
                        if(!!App.Common.settings[App.Common.sid].data.size){
                            seedialog.close();
                            seedialog.open();
                        }
                        
                    }
                })
            },
            ShowDetailDialog: function(id){
                App.Common.BackSee();
                // if(
                //     id && !JSON.parse(App.Common.settings[App.Common.sid].data.edit)
                //     ){
                //     console.log('E')
                //     toastr.warning('Access denied','Warning');
                //      return;
                // }
                // if(
                //     !id && !JSON.parse(App.Common.settings[App.Common.sid].data.add)
                //     ){
                //     console.log('A')
                //     toastr.warning('Access denied','Warning');
                //      return;
                // }
                
                $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>').show();
                $('#entrys-list').hide();
                new App.Request({
                    url: URI.detail,
                    // datatype: 'html',
                    data: {
                        id: id || null
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                        App.Common.Back()
                    } else {
                        $('#entry-detail').html(res.html);
                        App.Common.onTradeMarkChanged();
                        $('#entry-detail-frm').find('[name="trademark_id"]').change(App.Common.onTradeMarkChanged)
                        $('#entry-detail-frm').find('[name="apply_for"]').change(App.Common.onApplyForChanged)
                        App.InitForm($('#entry-detail-frm'));
                        //App.Common.CreateList(res.data);
                        
                        
                    }
                })
            },
            onTradeMarkChanged: function(){
                App.Common.LoadCategory();
                App.Common.LoadApplyFor();
            },
            onApplyForChanged: function(){
                App.Common.LoadApplyFor()
            },
            LoadApplyFor:function(){
                $('#apply-for-box').html('<div class="col-xs-12 pull-bottom">Loading...</div>');
                var trademark_id = $('#entry-detail-frm').find('[name="trademark_id"]').val()
                var id = $('#entry-detail-frm').find('[name="id"]').val()
                var apply_for = $('#entry-detail-frm').find('[name="apply_for"]').val()
                new App.Request({
                    url: URI.load_apply_for,
                    // datatype: 'html',
                    data: {
                        trademark_id: trademark_id || null,
                        id: id || null,
                        apply_for: apply_for || null,
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                        App.Common.Back()
                    } else {
                        $('#apply-for-box').html(res.html);
                        $('#apply-for-box').find('.selectpicker').selectpicker();
                        //App.Common.CreateList(res.data);
                        if(apply_for == 2){

                            $('#shop_ids option').prop("selected", false);
                            $('#city_id').change(App.Common.onProvinceChanged)
                        }
                        
                    }
                }).fail(function(){
                    $('#apply-for-box').html('<div class="col-xs-12 pull-bottom">Fail to load data</div>');
                })
            },
            onProvinceChanged: function(){
                var province_ids = $('#city_id').val();
                province_ids.map(function(province_id){

                    $('#shop_ids option[data-city_id="'+province_id+'"]').prop("selected", true);
                })
                $('#shop_ids').selectpicker('refresh');
                console.log('AAA')
            },
            LoadCategory: function(){
                $('#category-box').html('<div class="form-control ">Loading...</div>')
                var trademark_id = $('#entry-detail-frm').find('[name="trademark_id"]').val()
                var id = $('#entry-detail-frm').find('[name="id"]').val()
                new App.Request({
                    url: URI.load_category,
                    // datatype: 'html',
                    data: {
                        trademark_id: trademark_id || null,
                        id: id || null
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                        App.Common.Back()
                    } else {
                        $('#category-box').html(res.html);
                        $('#category-box').find('.selectpicker').selectpicker();
                        //App.Common.CreateList(res.data);
                        
                        
                    }
                })
            }
        }
    }())
})