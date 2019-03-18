APP.controller('AddProjectController', function(
    $rootScope, $scope,
    $window,
    $timeout,
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
    $scope.form_data = {
        category_id:'',
        title:'',
        desc:'',
    }
    $scope.cateories = [
        '',
        'App',
        'Software',
        'Hardware',
        'Product',
        'Service',
        'Other',
    ]
    $scope.doCreateProject = function(valid){
        if(valid){
            try {
                API.request({
                    url: BASE_URL + 'api/project/create',
                    data: $scope.form_data,
                    done:function(res){
                        if(res.data.code == 1){
                            
                            Helper.alert(res.data.message);
                            if(!$scope.form_data.id){
                                $rootScope.selectedIndex = 0;
                            }
                            Helper.storage.delete('list-project');
                            $window.history.back()
                            console.log(res.data.data)
                        } else {
                            Helper.warning(res.data.message);
                        }
                    }
                });
            } catch (e){
                Helper.warning('EM100: '+e.message);
            }
        }else{
            Helper.warning({
                message: 'All fields are required.'
            })
        }
        
    }

    
    function getProject(){
        $scope.project_info = $rootScope.activeProject;
        if($scope.project_info) 
            $scope.form_data = {
                id:$scope.project_info.id,
                category_id: $scope.project_info.category_id,
                title:$scope.project_info.title,
                desc:$scope.project_info.desc,
            }
    }
    if($routeParams.pid) getProject()
});