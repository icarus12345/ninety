APP.controller('ChartController', function(
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
    
    
    
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.go(-backNum);
    }
    
    $scope.project = $rootScope.activeProject;
    $scope.finishCategory = $rootScope.finishCategory;
    $scope.finishbg = $rootScope.finishbg;
    $scope.pid = $routeParams.pid;
    $scope.cid = $routeParams.cid || 0;
    console.log('VODAY',$routeParams);
    
    $scope.setChartData = function (data){
        // $timeout(function(){
        $rootScope.bgClass = 'white-bg';
        var activeCategory = data;
        if(!data) {
            console.log('EMPTY')
            return;
        }
        console.log(activeCategory.chart_info,'activeCategory')
        var device_info = Helper.storage.get('device-info');
        var user_info = device_info.user_info
        $scope.chart_info = activeCategory.chart_info;
        var shareds = $scope.project_data.shareds
        var series = []
        if(SHOW_GLOBAL){
            series = ['Goal'];
        }
        
        series.push(user_info.username);
        for(var u in shareds){
            series.push(shareds[u].username)
        }
        $scope.series = series;
        console.log($scope.chart_info,'$scope.chart_info')
        console.log($scope.series,'$scope.series')
        console.log(data,'$scope.data')
    // },120)
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
                    $scope.activeCategory = Category.get($scope.cid,function(data){
                        $scope.setChartData(data);
                    });
                    // setData()
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
                                $scope.activeCategory = Category.get($scope.cid,function(data){
                                    $scope.setChartData(data);
                                });
                                // setData()
                            } else {
                                Helper.alert(res.data.message);
                            }
                        }
                    })
                }
            }else{
                $scope.activeCategory = Category.get($scope.cid,function(data){
                    $scope.setChartData(data);
                });
                // setData()
            }
        }else{
            console.log('KO thay ')
        }
    }
    getProject()
    
    $scope.check_open_comment = function(cat,i){
        if(cat._actived_comment==undefined) cat._actived_comment = [true];
        if(cat._actived_comment[i]==undefined) cat._actived_comment[i] = false;
        return cat._actived_comment[i];
    }
    $scope.toggle_comment = function(cat,i){
        console.log('toggle_comment',cat,i)
        if(cat._actived_comment==undefined) cat._actived_comment = [true];
        if(cat._actived_comment[i]==undefined) cat._actived_comment[i] = false;
        cat._actived_comment[i] = !cat._actived_comment[i];
    }
});
