

function ProjectController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog,
    API, CategoryService, ProjectService, StorageService, Dialog
    ) {
    try {
        console.log('ProjectController',$routeParams);
        $scope.view_chart = function(cate){
            // $location.path( '/project/' + $scope.projectData.id + '/chart/' + cate.id );
            window.location.href = '#/project/' + $scope.projectData.id + '/chart/' + cate.id +'/1';
        }
        $scope.go = function(cate){
            if(cate.items && cate.items.length>0){
                window.location.href = '#/project/' + $scope.projectData.id + '/cat/' + cate.id;
            }else if(cate.questions && cate.questions.length>0){
                // $location.path( '/project/' + $scope.projectData.id + '/quest/' + cate.id );
                window.location.href = '#/project/' + $scope.projectData.id + '/quest/' + cate.id ;
            }else{
                Dialog.error('Don\'t have questions to display.');
            }
        }
        $scope.cid = $routeParams.categoryId;
        console.log($scope.projectData)
        ProjectService.get($routeParams.projectId,function(data){
            // if(!$scope.projectData){
                $scope.projectData = data.info;
                CategoryService.set_answereds(data.answereds);
            // }
            // GET ANSWERS
            // SET ANSWERS
            // GET CATEGORY
            CategoryService.get($routeParams.categoryId,function(data){
                $scope.category_info = data;
                $scope.min_height = Math.max($window.innerHeight - (60 + ($scope.category_info.items.length||3)*81 + 50),100);
                // calculator height
                var desc_height = 0;
                
                // var html = $scope.category_info.desc;
                // if($routeParams.categoryId==0) html = $scope.projectData.desc;
                // $scope.description = html;
                // if(html && html!=''){
                //     var pElmDom = document.createElement('div');
                //     pElmDom.style.opacity = '0.01';
                //     pElmDom.style.overflow = 'hidden';
                //     pElmDom.style['position'] = 'absolute';
                //     pElmDom.style['top'] = '0px';
                //     pElmDom.style['left'] = '0px';
                //     pElmDom.style['zZndex'] = '-1';
                //     pElmDom.style.width = '100%';
                //     document.body.appendChild(pElmDom);
                //     var elm = document.createElement('div');
                //     pElmDom.appendChild(elm);
                //     elm.innerHTML = html;
                //     elm.style.padding = '20px';
                //     elm.style.fontSize = '16px';
                //     desc_height = elm.clientHeight;
                //     document.body.removeChild(pElmDom);
                // }
                var item_length = $scope.category_info.items.length;
                var total_height = window.innerHeight - 60 - 50 - desc_height;
                var item_height = ((window.innerHeight - 60 - 50 - item_length - desc_height) / item_length);
                // item_height = item_height - item_height%2;
                item_height = Math.max(item_height,80);
                var desc_height = window.innerHeight - 60 - 50 - item_height * item_length - item_length;
                $scope.desc_height = desc_height;
                $scope.item_height = item_height;
                $scope.item_line_height = item_height;//20;
                $scope.item_padding = 0;//(item_height - 20)/2;
                
            })
        })
    } catch (e){
        Dialog.alert('EP67:'+e.message);
    }
}
function ProjectListController(
    $rootScope, $scope, $http, $route, $routeParams, API, Auth, SharedState, 
    $mdBottomSheet, $location, $mdDialog, $timeout, $window,
    $cordovaFileTransfer, $cordovaFileOpener2,
    ProjectService, CategoryService, StorageService, Dialog
    ) {
    try {
        var me = $scope;
        $scope.min_height_project = Math.max($window.innerHeight - (60 + 80*2 + 50),270);
        SharedState.initialize($scope, 'modalAddProject');
        // User agent displayed in home page
        $scope.userAgent = navigator.userAgent;
        // Needed for the loading screen
        // $rootScope.loading = true;
        $scope.$on('$routeChangeStart', function() {
            // $rootScope.loading = true;
        });

        $scope.$on('$routeChangeSuccess', function(event, current, previous) {
            // $rootScope.loading = true;
        });

        $scope.$on('$destroy', function() {
            $rootScope.activedView = undefined;
            // $rootScope.loading = true;
        });
        
        $scope.loadMore = function(){
           
        }
        
        
        $rootScope.editProjectInfo = {
            title : '',
            desc: '',
            id:''
        }
        $rootScope.onCancelUpdate = function(){
        }
        
        $rootScope.onUpdateProject = function(){
            API.__request({
                url: BASE_URL + 'api/project/create',
                data: $rootScope.editProjectInfo,
            },function(res){
                if(res.data.code == 1){
                    SharedState.turnOff('modalAddProject');
                    $rootScope.editing_project.title = $rootScope.editProjectInfo.title || '';
                    $rootScope.editing_project.desc = $rootScope.editProjectInfo.desc || '';
                    
                } else {
                    Dialog.error(res.data.message);
                }
            },function(res){
                Dialog.error('Create Project Fail');
                console.log('Create Project Fail:',res)
            });
        }
        
        $scope.showmenu = function(){
            console.log(event.changedTouches[event.changedTouches.length - 1])
            $mdBottomSheet.hide();
        }

        
        $scope.do_remove = function(p){
            if(p.mode==2){
                Dialog.confirm({
                    title:'Delete Project ?',
                    message:'Would you like to delete the project "' + p.title + '".',
                    oktext:'Delete',
                    ok: function(){
                        API.request({
                            url: BASE_URL + 'api/project/delete',
                            data: {
                                id: p.id
                            },
                        },function(res){
                            if(res.data.code == 1){
                                // update project
                                // for(var i in MainService.listProject){
                                //     var cp = MainService.listProject[i];
                                //     if(p.id ==cp.id){
                                //         MainService.listProject.splice(i, 1);
                                //         break;
                                //     }
                                // }
                                Dialog.alert(res.data.message);
                                ProjectService.re_get_list(function(list){
                                    $scope.listProject = list;
                                })
                            } else {
                                Dialog.error(res.data.message);
                            }
                        },function(res){
                            Dialog.error('Can\'t delete project.');
                        })
                    }
                });
            }
        }
        $scope.show_edit = function(p){
            if(p.mode==2){
                console.log(p)
                SharedState.turnOn('modalAddProject');
                $rootScope.editing_project = p;
                $rootScope.editProjectInfo.title = p.title.toString();
                $rootScope.editProjectInfo.desc = p.desc;
                $rootScope.editProjectInfo.id = p.id.toString();
            }
        }
        $scope.do_share = function(p){
            if(p.mode==2){
                $location.path( '/share/' + p.id  );
            }
        }
        $scope.do_send = function(p){
            if(p.mode==2){
                $location.path( '/send/' + p.id  );
            }
        }
        $scope.showListBottomSheet = function(p,is_export) {
            try{
                $timeout(function(){
                    $scope.selected_project = p;
                    $mdBottomSheet.show({
                        // scope: $scope.$new(true),
                        templateUrl: 'template/bottom-sheet-list-template.html',
                        controller: function($scope) {
                            $scope.selected_project = p;
                            $scope.ShowExportOption = is_export;
                            $scope.export_option = {
                                all_user: false,
                                all_comment: false,
                            }
                            $scope.show_export_option = function(){
                                $scope.ShowExportOption = true;
                            }
                            $scope.cancel = function(){
                                $mdBottomSheet.hide();
                            }
                            $scope.run_action = function(action) {
                                
                                switch(action){
                                    case 'edit':
                                        $mdBottomSheet.hide(action);
                                        me.show_edit(p);
                                        break;
                                    case 'export':
                                        $mdBottomSheet.hide(action);
                                        me.export_and_open_pdf(p,$scope.export_option);
                                        // $scope.show_export_option();
                                        break;
                                    case 'share':
                                        $mdBottomSheet.hide(action);
                                        me.do_share(p);
                                        break;
                                    case 'send':

                                        $mdBottomSheet.hide(action);
                                        me.do_send(p)
                                        break;
                                    case 'delete':
                                        $mdBottomSheet.hide(action);
                                        me.do_remove(p);
                                        break;
                                }
                            };
                        }
                    }).then(function(action) {
                        
                    }).catch(function(error) {
                      // User clicked outside or hit escape
                    });
                }, 150)
            } catch (e){
                Dialog.alert('EM236: '+e.message);
            }
        };
        
        
        
        var pdf_info = {}
        $scope.export_and_open_pdf = function(project, export_option){
            if(!_CONS.DIR){
                Dialog.alert('Can\'t get data directory.')
                return;
            }
            try{
                // window.plugins.spinnerDialog.show(null,"Exporting...");
                ProjectService.get(project.id,function(p){
                    // check file exits 
                    var pdf_file_name = p.info.alias;
                    if(export_option.all_user){
                        pdf_file_name +='_with-users';
                    }else{

                    }
                    if(export_option.all_comment){
                        pdf_file_name +='_with-comments';
                    } else {

                    }
                    pdf_file_name +='.pdf';
                    pdf_info.file_name = pdf_file_name;
                    pdf_info.target_path = _CONS.DIR + pdf_file_name;
                    pdf_info.project = p;
                    pdf_info.export_option = export_option;
                    console.log(pdf_info,'pdf_info')
                    _check_exits_pdf_file(_open_pdf, _export_pdf);

                    
                })
            } catch (e){
                Dialog.alert('EM270 :'+e.message);
            }
        }
        function _export_pdf(){
            try {
                $rootScope.loading_text = 'Exporting...';
                CategoryService.set_answereds(pdf_info.project.answereds);
                CategoryService.get(0,function(c){
                    $rootScope.loading_text = 'Exporting...';
                    $rootScope.loading++;
                    $timeout(function(){
                        CategoryService.export({
                            project_info: pdf_info.project.info,
                            setting: pdf_info.export_option
                        },function(res){
                            // window.plugins.spinnerDialog.hide();
                            _download(BASE_URL + res.data.url);

                        })
                        $rootScope.loading--;
                    }, 1000)
                })
            } catch (e){
                Dialog.alert('EM290'+e.message);
            }
        }
        $scope.$watch(function(){
            if($rootScope.loading==0){
                $rootScope.loading_text = undefined;
            }
        });
        function _download(pdf_url){
            // alert('DOWNLOAD PDF:'+pdf_url)
            // alert('F:'+pdf_info.target_path)
            $rootScope.loading_text = 'Downloading...';
            $rootScope.loading++;
            try{
                // window.plugins.spinnerDialog.show(null,"Exporting...");
                var targetPath = pdf_info.target_path
                var trustHosts = true;
                var options = {};
                $cordovaFileTransfer.download(
                    pdf_url, targetPath, options, trustHosts
                ).then(function(result) {
                    // raw90.ionicPopup.alert({
                    //     title: 'Message !',
                    //     template: 'Download "Project '+pName+'" success !'
                    // });
                    // raw90.ionicLoading.hide();
                    $rootScope.loading --;
                    // window.plugins.spinnerDialog.hide();
                    _open_pdf();
                }, function(err) {
                    // window.plugins.spinnerDialog.hide();
                    Dialog.alert('Can\'t download PDF file.')
                    $rootScope.loading --;
                    Dialog.alert('EM326'+JSON.stringify(err))
                }, function (progress) {
                    if(progress.loaded < progress.total){
                        $timeout(function () {
                            $scope.downloadProgress = (progress.loaded / progress.total) * 100;
                            // Show proccess bar
                            if($scope.downloadProgress >= 100) {
                                // download success
                                // $rootScope.loading --;
                                // Dialog.alert('Open PDF');
                            }
                        }, 300);
                    }
                });
            }catch(e){
                $rootScope.loading --;
                Dialog.alert('ME342:'+e.message)
            }
        }
        function _open_pdf(){
            console.log('OPEN PDF:'+pdf_info.target_path)
            try{
                $cordovaFileOpener2.open(
                    pdf_info.target_path, // Any system location, you CAN'T use your appliaction assets folder
                    'application/pdf'
                ).then(function() {
                    //alert('Success');
                }, function(err) {
                    // alert('An error occurred: ' + JSON.stringify(err));
                    Dialog.alert('Cant open PDF file !')
                });
            }catch(e){
                Dialog.alert('EM358'+e.message)
            }
        }
        function _check_exits_pdf_file(_open_pdf, _export_pdf){
            window.resolveLocalFileSystemURL(
                pdf_info.target_path, 
                function(){
                    Dialog.confirm({
                        title:'PDF file already exists',
                        message:
                            'Do you want open or export new file ?' + 
                            (device.platform == 'iOS'?'\nYou can open PDF with iBook.':'')
                        ,
                        oktext:'Open',
                        canceltext:'Export',
                        ok: function(){
                            _open_pdf()
                        },
                        cancel: function(){
                            _export_pdf();
                        }
                    });
                }, 
                function(res){
                    _export_pdf()
                }
            );
        }
        

        $scope.accordions = [
            {
                title: 'MY PROJECTS',
                status: false
            },
            {
                title: 'EXPORT REPORTS',
                status: false
            }
        ]
        function __get_list(){
        // API.authentication(function(){
            ProjectService.get_list(function(list){

                $scope.listProject = [];
                $scope.listSharedProject = [];
                if(list.length>0){
                list.map(function(p){
                    p.process = parseInt(+p.total_answer/_CONS.total_question*100);
                    if(p.uid == API.UserInfo.id){
                        $scope.listProject.push(p);
                    }else{
                        $scope.listSharedProject.push(p);

                    }
                });
                // $scope.$apply($scope.listProject = list)
                console.log('LOAD AND SET LIST PROJect', $scope.listProject)
                // $timeout(function(){
                //     $scope.$apply($scope.listProject = list);
                // },150);
                }
            });
        // });
        }

        __get_list();
        $rootScope.reload_list_project = __get_list;
    } catch (e){
        Dialog.alert('EM414:'+e.message);
    }
}
