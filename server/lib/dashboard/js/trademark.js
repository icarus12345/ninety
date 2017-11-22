$(document).ready(function() {
    App.Common = (function(){
        var URI = {
            bind : App.BaseUrl + 'dashboardapi/trademark/bind',
            detail  : App.BaseUrl + 'dashboardapi/trademark/detail',
            see  : App.BaseUrl + 'dashboardapi/trademark/see',
            subdetail  : App.BaseUrl + 'dashboardapi/trademark/subdetail',
            commit  : App.BaseUrl + 'dashboardapi/trademark/commit',
            sendlatest  : App.BaseUrl + 'dashboardapi/trademark/sendlatest',
            sendoldest  : App.BaseUrl + 'dashboardapi/trademark/sendoldest',
            update  : App.BaseUrl + 'dashboardapi/trademark/update',
            delete  : App.BaseUrl + 'dashboardapi/trademark/delete',
            catebinding : App.BaseUrl + 'dashboardapi/category/bind',
        };
        var oTable = $('#datatable').DataTable( {
            "ajax": URI.bind,
            "processing": true,
            "serverSide": true,
            "bAutoWidth": false , 
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "order": [[ 0, "desc" ]],
            "language": {
                "paginate": {
                  "previous": "<span class='fa fa-angle-left'></span>",
                  "next": "<span class='fa fa-angle-right'></span>"
                }
            },
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
                { "data": "$.title" },
                { 
                    "data": "$.ctitle",
                    'sWidth': '120px'
                },
                { 
                    "data": "$.created",
                    'searchable':false,
                    'sWidth': '146px'
                },
            ]
        } );
        $('#datatable input').unbind();
        $('#datatable input').bind('keyup', function(e) {
            if(e.keyCode == 13) {
                oTable.fnFilter(this.value);    
            }
        });
        
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
                                'id': id,
                                sid: App.Common.sid,
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
                        sid: App.Common.sid || null,
                        onlysave: App.Common.onlysave || null
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

                        App.InitForm($('#entry-detail-frm'));
                        //App.Common.CreateList(res.data);
                        
                        
                    }
                })
            },
            ShowSubDetailDialog: function(column,sid,data){
                if ($("#sub-entry-detail").length === 0) {
                    $('body').append('<div id="sub-entry-detail"></div>');
                }

                $('#sub-entry-detail').html('<div class="loading"><span>Loading...</span></div>');
                var subdialog = new App.Dialog({
                    'modal': true,
                    'message' : $('#sub-entry-detail'),
                    'title': '<h4>Add <small>'+App.Common.settings[sid].title+'</small></h4>',
                    'dialogClass':'',
                    'width': App.Common.settings[sid].data.size || 640,
                    'type':'notice',
                    'hideclose':true,
                    'closeOnEscape':false,
                    'oncreate': function(event, ui){
                        var toolbar = [
                            '<div class="modal-action">',
                                '<div class="dropdown pull-right">',
                                    '<a href="JavaScript:" class="icon-options-vertical" data-toggle="dropdown" title="Show more action"></a>',
                                    '<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">',
                                        '<li><a href="#"><span class="icon-settings"></span> Setting</a></li>',
                                        '<li role="separator" class="divider"></li>',
                                        '<li><a href="#"><span class="icon-question"></span> Help</a></li>',
                                    '</ul>',
                                '</div>',
                            '</div>'
                        ].join('')
                        $(event.target).dialog('widget')
                            .find('.ui-widget-header')
                            .append(toolbar)
                    },
                    'buttons' : [{
                        'text': 'Done',
                        'class': 'ui-btn btn',
                        'click': function(){
                            var frm = $('#subentry-detail-frm');
                            if( frm.validationEngine('validate') === false){
                                toastr.warning('Please complete input data.','Warning');
                                return;
                            }
                            var data = $('#subentry-detail-frm').serializeObject();
                            if (editingItem) {
                                editingItem.data('cdata',data);
                                editingItem.find('>div>span').html(data.title)
                            } else {
                                addItem(column,sid,data);
                            }
                            $(this).dialog("close");
                        }
                    },{
                        'text': 'Cancel',
                        'class': 'btn btn-link',
                        'click': function() {
                            $(this).dialog("close");
                        }
                    }]
                })
                subdialog.open();
                new App.Request({
                    url: URI.subdetail,
                    // datatype: 'html',
                    data: {
                        sid: sid,
                        data: data || null
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        $('#sub-entry-detail').html(res.html);

                        App.InitForm($('#subentry-detail-frm'));
                        subdialog.close();
                        subdialog.open();
                        
                    }
                })
            }
        }
    }())
})