APP.controller('DownloadController', function(
    $rootScope, 
    $scope,
    $timeout,
    $window,
    $routeParams,
    $cordovaFileTransfer, 
    $cordovaFileOpener2,
    Helper,
    API,
    Category
    ) {
    if(!Category.gets()){
        $window.location.href = '#/';
        return;
    }
    var device_info = Helper.storage.get('device-info');
    if(!device_info){
        $window.location.href = '#/';
        return;
    }
    
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.go(-backNum);
    }
    
    $scope.project = $rootScope.activeProject;
    $scope.pid = $routeParams.pid;
   
    
    
    function getProject(){
        if($scope.pid){
            $scope.project_data = Helper.storage.get('project-detail',$scope.pid);
            if(Category.pid != $scope.pid || !$scope.project_data){
                if($scope.project_data){
                    if(Category.pid != $scope.pid){
                        Category.set_answereds($scope.project_data.answereds);
                        Category.$scope.pid = ''+$scope.pid;
                    }
                }else{
                    API.request({
                        url: BASE_URL + 'api/project/get',
                        data: {
                            id: $scope.pid
                        },
                        done: function(res){
                            if(res.data.code == 1){
                                Helper.storage.set('project-detail',$scope.pid,res.data.data);
                                $scope.project_data = res.data.data;
                                console.log('HHH',$scope.project_data)
                                if(Category.pid != $scope.pid){
                                    Category.set_answereds($scope.project_data.answereds);
                                    Category.pid = ''+$scope.pid;
                                }
                            } else {
                                Helper.alert(res.data.message);
                            }
                        }
                    })
                }
            }else{
            }
        }else{
            console.log('KO thay ')
        }
    }
    getProject();

    $scope.export_and_open_pdf = function(){
        try{
                var p = $scope.project_data;
                // check file exits 
                var pdf_file_name = p.info.alias;
                if($scope.export_option.all_user){
                    pdf_file_name +='_with-users';
                }else{

                }
                if($scope.export_option.all_comment){
                    pdf_file_name +='_with-comments';
                } else {

                }
                pdf_file_name +='.pdf';
                pdf_info.file_name = pdf_file_name;
                pdf_info.target_path = _CONS.DIR + pdf_file_name;
                pdf_info.project = p;
                pdf_info.export_option = $scope.export_option;
                console.log(pdf_info,'pdf_info')
                _check_exits_pdf_file(_open_pdf, _export_pdf);
        } catch (e){
            Helper.warning('EM270 :'+e.message);
        }
    }
    var pdf_info = {}
    $scope.export_option = {
        all_user: true,
        all_comment: true,
    }
    $scope.toggle = function(key){
        $scope.export_option[key] = !$scope.export_option[key];
    }
    function _export_pdf(){
        try {

            $rootScope.loading_text = 'Exporting...';
            // CategoryService.set_answereds(pdf_info.project.answereds);
            // CategoryService.get(0,function(c){
                $rootScope.loading_text = 'Exporting...';
                $rootScope.loading++;
                $timeout(function(){
                    Category.export({
                        project_info: $scope.project_data.info,
                        setting: $scope.export_option
                    },function(res){
                        _download(BASE_URL + res.data.url);
                    })
                    $rootScope.loading--;
                }, 1000)
            // })
        } catch (e){
            Helper.warning('EM290'+e.message);
        }
    }
    function _download(pdf_url){
        // alert('DOWNLOAD PDF:'+pdf_url)
        // alert('F:'+pdf_info.target_path)
        $rootScope.loading_text = 'Downloading...';
        $rootScope.loading++;
        try{
            var targetPath = pdf_info.target_path
            var trustHosts = true;
            var options = {};
            $cordovaFileTransfer.download(
                pdf_url, targetPath, options, trustHosts
            ).then(function(result) {
                $rootScope.loading --;
                _open_pdf();
            }, function(err) {
                Helper.warning('Can\'t download PDF file.')
                $rootScope.loading --;
                // Helper.alert('EM326'+JSON.stringify(err))
            }, function (progress) {
                if(progress.loaded < progress.total){
                    $timeout(function () {
                        $scope.downloadProgress = (progress.loaded / progress.total) * 100;
                        // Show proccess bar
                        if($scope.downloadProgress >= 100) {
                            // download success
                            // $rootScope.loading --;
                            // Helper.warning('Open PDF');
                        }
                    }, 300);
                }
            });
        }catch(e){
            $rootScope.loading --;
            Helper.alert('ME342:'+e.message)
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
                Helper.warning('Cant open PDF file !')
            });
        }catch(e){
            Helper.warning('EM358'+e.message)
        }
    }
    function _check_exits_pdf_file(_open_pdf, _export_pdf){
        window.resolveLocalFileSystemURL(
            pdf_info.target_path, 
            function(){
                Helper.confirm({
                    title:'PDF file already exists',
                    message:
                        'Do you want open or export new file ?' + 
                        (device.platform == 'iOS'?'\nYou can open PDF with iBook.':'')
                    ,
                    oktext:'Open',
                    canceltext:'Export',
                    onconfirm: function(){
                        _open_pdf()
                    },
                    oncancel: function(){
                        _export_pdf();
                    }
                });
            }, 
            function(res){
                _export_pdf()
            }
        );
    }
});
