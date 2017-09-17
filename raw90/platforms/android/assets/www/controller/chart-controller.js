

function ChartController(
    $rootScope, $scope, $route, $routeParams, $window, $location,
    $timeout,
    API, CategoryService, ProjectService, StorageService, Auth
    ) {
    console.log('ChartController',$routeParams);
    $scope.goBack = function(){
        var backNum = +($routeParams.backNum || 1);
        $window.history.go(-backNum);
    }
    ProjectService.get($routeParams.projectId,function(data){
        $scope.projectData = data.info;
        var shareds = data.shareds;
        console.log(data)
        CategoryService.set_answereds(data.answereds);
        // GET ANSWERS
        // SET ANSWERS
        // GET CATEGORY
        CategoryService.get($routeParams.categoryId,function(data){
            console.log(shareds)
            console.log('data')
            console.log(data)
            // return;
            $scope.category_info = data;
            $scope.chart_data = data.chart_data;
            var series = []
            if(SHOW_GLOBAL) series = ["Goal"]
            var device_info = StorageService.get('device-info')
            series.push(device_info.user_info.email);
            for(var u in shareds){
                series.push(shareds[u].email)
            }
            $scope.series = series;
            console.log(series)
            // $scope.$apply(function() {
            //     $scope.___++;
            //     console.log($scope.___)
            // })
        })
    })
    // $scope.$on('chart-create', function (event, chart) {
    //     $scope.chartLegend = chart.generateLegend();
    // });
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
}
