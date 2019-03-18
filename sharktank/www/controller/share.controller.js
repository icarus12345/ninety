APP.controller('ShareController', function(
    $rootScope, 
    $scope,
    $timeout,
    $window,
    $routeParams,
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
    $scope.form_data = {
        pid: $routeParams.pid,
        email: '',
        mode: 0,
    }
    $scope.doShare = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/project/share',
                data: $scope.form_data,
                done: function(res){
                    if(res.data.code == 1){
                        $scope.form_data.email=""
                    } else {
                    }
                    Helper.alert(res.data.message);
                }
            })
        }else{
            Helper.alert({
                message: 'Please input your email.'
            })
        }
    }
    $scope.send_info = {
        pid: $routeParams.pid,
        email: '',
        pdf:''
    }
    $scope.doSend = function(valid){
        if(valid){
            $rootScope.loading++;
            $timeout(function(){
                Category.get(0,function(c){
                    Category.export({
                        project_info: $scope.project_data.info,
                        setting: {
                            all_user: true,
                            all_comment: true,
                        }
                    },function(res){
                        $scope.send_info.pdf = res.data.url;
                        API.request({
                            loading: true,
                            url: BASE_URL + 'api/project/send',
                            data: $scope.send_info,
                            done: function(res){
                                if(res.data.code == 1){
                                    $scope.send_info.email=""
                                } else {
                                }
                                Helper.alert(res.data.message);
                                $rootScope.loading--;
                            },
                            error: function(){
                                $rootScope.loading--;
                            }
                        })
                    })
                })
            },420);
        }else{
            Helper.alert({
                message: 'Please input your email.'
            })
        }
    }
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
    getProject()
});
