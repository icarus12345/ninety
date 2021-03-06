$(document).ready(function(){
    App.Setting = (function(){
        var me= {}
        var gridElm;
        var URI = {
            binding : App.BaseUrl + 'dashboardapi/setting/bind',
            detail  : App.BaseUrl + 'dashboardapi/setting/detail',
            subdetail  : App.BaseUrl + 'dashboardapi/setting/subdetail',
            commit  : App.BaseUrl + 'dashboardapi/setting/commit',
            sendlatest  : App.BaseUrl + 'dashboardapi/setting/sendlatest',
            sendoldest  : App.BaseUrl + 'dashboardapi/setting/sendoldest',
            update  : App.BaseUrl + 'dashboardapi/setting/update',
            delete  : App.BaseUrl + 'dashboardapi/setting/delete',
            catebinding : App.BaseUrl + 'dashboardapi/category/bind',
        };
        var theme = 'metro';
        me.cate = {}
        me.bindingCate = function(){
            me.cate.datafields = [
                {name: 'id'   , type: 'int'},
                {name: 'title'    },
                {name: 'status' , type: 'bool'},
                {name: 'insert' , type: 'date'},
                {name: 'update' , type: 'date'},
            ];
            me.cate.source = {
                datatype    : "json",
                type        : "POST",
                datafields  : me.cate.datafields,
                url         : URI.catebinding,
                id          :'id',
                root        : 'rows'
            };
            me.cate.dataAdapter = new $.jqx.dataAdapter(me.cate.source, {
                autoBind: true,
                formatData: function (data) {
                    data.type = App.Setting.type || '';
                    return data;
                },
                beforeLoadComplete: function (records) {
                    var data = new Array();
                    for (var i = 0; i < records.length; i++) {
                        records[i].value = records[i].id;
                        records[i].label = records[i].title;
                        records[i].category = records[i].id;
                        records[i].title = records[i].title;
                        data.push(records[i]);
                    }
                    return data;
                },
                loadComplete: function(records){
                    me.bindingEntry();
                },
                loadError: function(xhr, status, error) {
                    toastr.error("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>",'Error');
                }
            });
            };
        me.bindingEntry = function(){
            me.datafields = [
                {name: 'id', type: 'int'},
                {name: 'title'},
                {name: 'cattitle',value:'category',values : { source: me.cate.dataAdapter.records, value: 'id', name: 'title' }},
                {name: 'category'},
                {name: 'status' , type: 'bool'},
                {name: 'created' , type: 'date'},
                {name: 'modified' , type: 'date'},
                {name: 'lock' , type: 'bool'},
            ];
            
            

            me.source = {
                datatype    : "json",
                type        : "POST",
                datafields  : me.datafields,
                url         : URI.binding,
                id          :'id',
                root        : 'rows',
                filter: function() {
                    $(gridElm).jqxGrid('updatebounddata', 'filter');
                },
                sort: function() {
                    $(gridElm).jqxGrid('updatebounddata');
                }
            };
            me.dataAdapter = new $.jqx.dataAdapter(me.source, {
                formatData: function (data) {
                    data.type = App.Setting.type || '';
                    data.showthumb = false;
                    return data;
                },
                loadError: function(xhr, status, error) {
                    toastr.error("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>",'Error');
                }
            });
            me.columns = [{
                text: '', dataField: 'id', width: 52, filterable: false, sortable: true,editable: false,
                cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                    var str = "";
                    if (value && value > 0) {
                        try {
                            str += "<a href='JavaScript:void(0)'"+
                            "style='padding: 5px; float: left;margin-top: 2px;' " +
                            'data-toggle="dropdown" data-target="#common-menu"'+
                            " "+ 
                            "title='Edit :" + value + "'><i class=\"icon-options-vertical\"></i></a>\
                            ";
                            str += "<a href='JavaScript:void(0)'"+
                            "style='padding: 5px; float: left;margin-top: 2px;' " +
                            "onclick=\"App.Setting.ShowDetailDialog(" + value + ");\" "+ 
                            "title='Edit :" + value + "'><i class=\"fa fa-pencil\"></i></a>\
                            ";
                            // str += "<a href='JavaScript:void(0)'"+
                            // "style='padding: 5px; float: left;margin-top: 2px;' " +
                            // "onclick=\"App.Setting.Delete(" + value + ","+row+");\" "+ 
                            // "title='Delete :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
                            // ";
                        } catch (e) {
                        }
                    }
                    return str;
                }
            },{
                text: 'Id'    , dataField: 'id2' , displayfield:'id',cellsalign: 'right', 
                width: 60, columntype: 'numberinput', filtertype: 'number',
                filterable: false, sortable: false,editable: false,hidden:true
            },{
                text: 'Title', dataField: 'title', minWidth: 180, sortable: true,
                columntype: 'textbox', filtertype: 'textbox', filtercondition: 'CONTAINS',
                
                
            },{
                text: 'Category', width: 120, cellsalign: 'left',
                columntype: 'dropdownlist',filtertype: 'list', filtercondition: 'EQUAL',
                dataField: 'cattitle', displayfield:'cattitle',
                // value:'id',
                // values: { source: me.cate.dataAdapter.records, name: 'title' },
                // map:"title",
                editable: false,
                filteritems: me.cate.dataAdapter.records, 
                // createeditor: function(row, cellvalue, editor, cellText, width, height) {
                //     console.log(row, cellvalue, editor, cellText)
                //     // construct the editor. 
                //     editor.jqxDropDownList({
                //         source: new $.jqx.dataAdapter(me.cate.source),
                //         displayMember: "title", valueMember: "id",
                //         width: width, height: height, theme: theme,
                //         // selectionRenderer: function() {
                //         //     return "Please Choose:";
                //         // }
                //     });
                //     console.log(me.cate.dataAdapter.records)
                // },
                initeditor: function(row, cellvalue, editor, celltext, pressedkey) {
                },
                // geteditorvalue: function(row, cellvalue, editor) {
                //     // return the editor's value.
                //     return editor.val();
                // }
            },{
                text: 'Status'    , dataField: 'status' , cellsalign: 'center',
                width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
                filterable: true, sortable: true,editable: true, hidden: true
            },{
                text: 'Created' , dataField: 'created', width: 120, cellsalign: 'right',
                filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
                sortable: true,editable: false
            },{
                text: 'Modifield' , dataField: 'modified', width: 120, cellsalign: 'right',
                filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
                sortable: true,editable: false, hidden: true
            }];
            
            init();
        }
        var editingItem;
        function addItem(column, sid, data){
            var li = $('<li/>')
                .addClass('col-xs-12')
                .html('<div><span>'+data.title+'</span></div>')
                .data('cdata',data)
            $( '#data-' + column ).append(li)
            li.find('>div').append([
                '<div class="dropdown pull-right">',
                    '<a href="JavaScript:" class="icon-options-vertical" data-toggle="dropdown" title="Show more action"></a>',
                    '<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">',
                        '<li><a data-action="edit" href="JavaScript:"><span class="fa fa-pencil"></span> Edit</a></li>',
                        '<li><a data-action="delete" href="JavaScript:"><span class="fa fa-trash-o"></span> Delete</a></li>',
                    '</ul>',
                '</div>'
                ].join(''))
            li.find('a[data-action="edit"]').click(function(){
                var cdata = li.data('cdata');
                editingItem = li;
                App.Setting.ShowSubDetailDialog(column,sid,cdata);
            })
            li.find('a[data-action="delete"]').click(function(){
                li.remove();
            })
        }
        function init(){
            $('#entry-detail').hide();
            gridElm = $('#jqxGrid');
            
            var h = $(window).height() - 12*2 - 90 - 46 - 30;
            $(gridElm).jqxGrid({
                width               : '100%', //
                //autoheight:true,
                rowsheight:28,
                height              : Math.max(240, h),
                source              : me.dataAdapter,
                theme               : theme,
                columns             : me.columns,
                selectionmode       : 'singlecell',
                filterable          : true,
                autoshowfiltericon  : true,
                showfilterrow       : true,
                sortable            : false,
                virtualmode         : false,
                groupable           : true,
                groups              : [],
                showgroupsheader    : false,
                editable            : true,
                editmode            : 'dblclick',
                pageable            : true,
                pagesize            : 100,
                pagesizeoptions     : [20,100, 200, 500, 1000],
                rendergridrows      : function(){ 
                    return me.dataAdapter.records; 
                },
                ready: function(){
                    // pendingOff();
                },
                handlekeyboardnavigation: function(event)
                {
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                    if (key == 27) {
                        me.cancel=true;
                    }
                },
            }).on("bindingcomplete", function (event) {
                $(gridElm).jqxGrid('addgroup', 'cattitle');
                $(gridElm).jqxGrid('expandallgroups');
            })
            $('body').append('<ul id="common-menu" class="dropdown-menu">\
                <li><a data-action="add" href="#"><i class="fa fa-plus"></i> Add new Record</a></li>\
                <li><a data-action="edit" href="#"><i class="fa fa-pencil"></i> Edit Selected Row</a></li>\
                <li><a data-action="delete" href="#"><i class="fa fa-trash-o"></i> Delete Selected Row</a></li>\
                <li role="separator" class="divider"></li>\
                <li><a data-action="status" href="#"><i class="fa fa-toggle-off"></i> Invisible</a></li>\
                <li><a data-action="sendlatest" href="#"><i class="fa fa-long-arrow-up"></i> Send to Latest</a></li>\
                <li><a data-action="sendoldest" href="#"><i class="fa fa-long-arrow-down"></i> Send to Oldest</a></li>\
                <li role="separator" class="divider"></li>\
                <li><a data-action="view" href="#"><i class="fa fa-eye"></i> View Selected Row</a></li>\
                <li><a data-action="chart" href="#"><i class="fa fa-line-chart"></i> Chart</a></li>\
            </ul>')
            $('#common-menu').on('contextmenu',function(){
                event.preventDefault();
                event.stopPropagation();
                return false;
            });
            $('#common-menu a').click(function(){
                var action = $(this).data('action');
                var cell = $(gridElm).jqxGrid('getselectedcell');
                var rowIndex = cell.rowindex;
                if(rowIndex>=0){
                    var rowData = $(gridElm).jqxGrid('getrowdata', rowIndex);
                    switch(action){
                        case 'add':
                            App.Setting.ShowDetailDialog();
                            break;
                        case 'edit':
                            App.Setting.ShowDetailDialog(rowData.id);
                            break;
                        case 'delete':
                            App.Setting.Delete(rowData.id);
                            break;
                        case 'status':
                            App.Setting.onCommit(
                                   {status: rowData.status=='1'?'0':'1'}, rowData.id, App.Setting.Refresh
                                );
                            console.log(rowData.id)
                            break;
                        case 'statuson':
                            App.Setting.onCommit(
                                   {status: '1'}, rowData.id, App.Setting.Refresh
                                );
                            console.log(rowData.id)
                            break;
                        case 'statusoff':
                            App.Setting.onCommit(
                                   {status: '0'}, rowData.id, App.Setting.Refresh
                                );
                            break;
                        case 'sendlatest':
                            App.Setting.SendLatest(rowData.id);
                            break;
                        case 'sendoldest':
                            App.Setting.SendOldest(rowData.id);
                            break;
                    }
                    console.log(action)
                }
            })

            $(gridElm).bind('cellbeginedit', function (event) {
                me.cancel = false;
            }).bind('cellendedit', function (event) {
                if(me.cancel) return;
                try{
                    var args = event.args;
                    var _column = args.datafield, 
                        _row = args.rowindex, 
                        _value = args.value;
                    var _data = $(gridElm).jqxGrid('getrowdata', _row);
                    var _id = _data.id;
                    if (_id == undefined || _id == "") {
                        return;
                    }
                    var updateCell = function(){
                        me.onRefresh();
                    };
                    console.log(_column)
                    switch (_column) {
                        case 'title':
                            if (_value != _data.title && _value!=''){

                                App.Setting.onCommit(
                                   {title: _value}, _id
                                );
                            }
                            break;
                        
                        case 'category':
                            if (_value.value != _data.category && _value.value!=''){

                                App.Setting.onCommit(
                                   {category: _value.value}, _id
                                );
                            }
                            break;
                        case 'status':
                            if (_value)
                                App.Setting.onCommit(
                                   {status: '1'}, _id
                                );
                            else
                                App.Setting.onCommit(
                                   {status: '0'}, _id
                                );
                            break;
                        default:
                            toastr.warning("Column editable is dont support !",'Warning');
                            console.log(_value)
                    }
                } catch (e) {
                    toastr.error(e.message, 'Error');
                }
            })
            $(gridElm).on('contextmenu',function(){
                event.preventDefault();
                event.stopPropagation();
                
                return false;
            }).on('cellclick', function (event) {

                var getTouches = function (e) {
                    if (e.originalEvent) {
                        if (e.originalEvent.touches && e.originalEvent.touches.length) {
                            return e.originalEvent.touches;
                        } else if (e.originalEvent.changedTouches && e.originalEvent.changedTouches.length) {
                            return e.originalEvent.changedTouches;
                        }
                    }
                    if (!e.touches) {
                        e.touches = new Array();
                        e.touches[0] = e.originalEvent;
                    }
                    return e.touches;
                };
                var rowIndex = event.args.rowindex;
                var rowData = $(gridElm).jqxGrid('getrowdata', rowIndex);
                var openContextMenu = false;
                if(event.args.rightclick) openContextMenu = true;
                if($.jqx.mobile.isTouchDevice() && event.args.originalEvent.type=='touchend' && event.args.datafield=='id') 
                    openContextMenu = true;
                if(rowIndex>=0){
                    $(gridElm).jqxGrid('selectcell', rowIndex,event.args.datafield);
                    var dataRow = $(gridElm).jqxGrid('getrowdata', rowIndex);
                    $('#common-menu a').removeAttr('disabled')
                    // if(App.Setting.settings[App.Setting.sid].data.add != 'true'){
                        // $('#common-menu a[data-action="add"]').attr('disabled','1')
                    // }
                    // if(App.Setting.settings[App.Setting.sid].data.edit != 'true'){
                        // $('#common-menu a[data-action="edit"]').attr('disabled','1')
                        // $('#common-menu a[data-action="status"]').attr('disabled','1')
                        // $('#common-menu a[data-action="delete"]').attr('disabled','1')
                    // }
                    // if(App.Setting.settings[App.Setting.sid].data.delete != 'true'){
                        // $('#common-menu a[data-action="delete"]').attr('disabled','1')
                    // }
                    if(rowData.status==1){
                        $('#common-menu a[data-action="status"]').html('<i class="fa fa-toggle-off"></i> Invisible')
                    } else {
                        $('#common-menu a[data-action="status"]').html('<i class="fa fa-toggle-on"></i> Visible')
                    }

                    var scrollTop = $(window).scrollTop();
                    var scrollLeft = $(window).scrollLeft();
                    var menuWidth = $('#common-menu').width();
                    var menuHeight = $('#common-menu').height();
                    var clientX = (event.args.originalEvent.clientX) + scrollLeft,
                    clientY = (event.args.originalEvent.clientY) + scrollTop;
                    if(event.args.originalEvent.type=='touchend'){
                        var touches = getTouches(event.args.originalEvent);
                        var touch = touches[0];
                        clientX = touch.pageX;
                        clientY = touch.pageY;
                    }
                    var x = parseInt(clientX);
                    var y = parseInt(clientY);
                    var windowWidth = $(window).width() + scrollLeft;
                    var windowHeight = $(window).height() + scrollTop;
                    if( x + menuWidth > windowWidth){
                        x = windowWidth - menuWidth -4;
                    }
                    if( y + menuHeight > windowHeight){
                        y = windowHeight - menuHeight -4;
                    }
                    $('#common-menu').css({
                            position:'fixed',
                            top:y+'px',
                            left:x+'px',
                        })
                    if (openContextMenu) {
                        setTimeout(function(){
                            $('#common-menu').addClass('open')
                        },100)
                        // event.stopPropagation();
                        // event.preventDefault();
                        event.preventDefault();
                        event.stopPropagation();
                        return false;
                    }else{
                        
                    }
                }
            })
        }
        var Lists = {};
        var Grids = {};
        return {
            onCommit: function(data,id,callback){
                new App.Request({
                    url: URI.update,
                    data: {
                        id: id,
                        sid: App.Setting.sid,
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
                        sid: App.Setting.sid
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        App.Setting.Refresh()
                    }
                })
            },
            SendOldest: function(id){
                new App.Request({
                    url: URI.sendoldest,
                    data: {
                        id: id,
                        sid: App.Setting.sid
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        App.Setting.Refresh()
                    }
                })
            },
            Grid: function(){
                me.bindingCate();
            },
            CreateList: function(data){
                var frm = $('#entry-detail-frm');
                frm.find('.add-sortable-item').click(function(){
                    editingItem = null;
                    var column = $(this).data('column');
                    var sid = $(this).data('sid');
                    App.Setting.ShowSubDetailDialog(column,sid);
                });

                frm.find('.sortable').each(function(){
                    var column = $(this).data('column');
                    var sid = $(this).data('sid');
                    if(data && data.longdata){
                    console.log(data.longdata[column])
                        data.longdata[column].map(function(cdata){
                            addItem(column,sid,cdata)
                        })

                    }
                    $(this).sortable({
                        placeholder: "placeholder",
                        start: function(e, ui){
                            console.log(ui)
                            ui.placeholder.addClass(ui.item.attr('class'))
                        }
                    });
                });

            },
            Refresh: function() {
                $(gridElm).jqxGrid('updatebounddata');
            },
            Back: function(){
                    $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>').hide();
                    $('#entrys-list').show();
            },
            Duplicate: function(){
                var frm = $('#entry-detail-frm');
                frm.find('input[name="id"]').val('');
                frm.find('input[name="title"]').val(frm.find('input[name="title"]').val() + '(copy)');
                frm.find('input[name="alias"]').val(frm.find('input[name="alias"]').val() + '-copy');
                frm.find('input[name="id"]').val('');
                App.Setting.Save();
            },
            Delete: function(id,row){
                // toastr.warning('This function to requires an administrative account.<br/>Please check your authority, and try again.','Warning');
                var _data = $(gridElm).jqxGrid('getrowdata', row);
                if(_data.lock == 1){
                    toastr.warning('You can not delete this Item.','Warning');
                    return; 
                }
                var itemName = _data.title;
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
                                App.Setting.Refresh();
                            }
                        })
                    }
                );
            },
            Save: function(only){
                var frm = $('#entry-detail-frm');
                if( frm.validationEngine('validate') === false){
                    toastr.warning('Please complete input data.','Warning');
                    return;
                }
                
                var data = $('#entry-detail-frm').serializeObject();

                data.longdata = data.longdata || {};
                frm.find('.sortable').each(function(){
                    var column = $(this).data('column');
                    var subData = $(this).find('>li').get().map(function(li){
                        return $(li).data('cdata');
                    })
                    data.longdata[column] = subData;
                })
                // console.log(data);return;
                new App.Request({
                    url: URI.commit,
                    data: {
                        id: data.id,
                        type: App.Setting.type,
                        data: data
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                    } else {
                        toastr.success(res.message,'Success');
                        $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>')
                        dialog.close();
                        App.Setting.Refresh();
                    }
                })
            },
            ShowDetailDialog: function(id){

                $('#entry-detail').html('<div class="loading"><span>Loading...</span></div>').show();
                // $('#entrys-list').hide();
                dialog = new App.Dialog({
                    'modal': true,
                    'message' : $('#entry-detail'),
                    'title': '<h4>Setting <small>dialog</small></h4>',
                    'dialogClass':'',
                    'width':'480px',
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
                        'click': App.Setting.Save
                    },{
                        'text': 'Cancel',
                        'class': 'btn btn-link',
                        'click': function() {
                            $(this).dialog("close");
                        }
                    }]
                })
                dialog.open();
                new App.Request({
                    url: URI.detail,
                    // datatype: 'html',
                    data: {
                        id: id || null,
                        type: App.Setting.type || null,
                        onlysave: App.Setting.onlysave || null
                    },
                }).done(function(res){
                    if(res.code < 0){
                        toastr.warning(res.message,'Warning');
                        dialog.close();
                    } else {
                        $('#entry-detail').html(res.html);

                        App.InitForm($('#entry-detail-frm'));
                        App.Setting.CreateList(res.data);
                        dialog.close();
                        dialog.open();
                        if(res.data)
                        $('#entry-detail').dialog('widget')
                            .find('.ui-widget-header')
                            .find('h4')
                            .html(res.data.title + '<small>edit</small>')
                        
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
                    'title': '<h4>Add <small>'+App.Setting.settings[sid].title+'</small></h4>',
                    'dialogClass':'',
                    'width': App.Setting.settings[sid].data.size || 640,
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
                        subdialog.close();
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