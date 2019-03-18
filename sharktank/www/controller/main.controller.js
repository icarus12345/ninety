

APP.controller('MainController', function(
    $rootScope, $scope,
    $window,
    $timeout,
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
    $scope.user_info = device_info.user_info
    $scope.cateories = [
        '',
        'App',
        'Software',
        'Hardware',
        'Product',
        'Service',
        'Other',
    ]
    $scope.selectedIndex = $rootScope.selectedIndex || 0;
    $scope.total_question = Object.keys(Category.questions).length;
    function getList(){
        $scope.project_list = Helper.storage.get('list-project');
        if($scope.project_list){
            $scope.selectedProject = $scope.project_list[$scope.selectedIndex];
            return;
        }
        API.request({
            url: BASE_URL + 'api/project/gets',
            data: {
                page: 1,
                perpage: 100
            },
            done: function(res){
                if(res.data.code == 1){
                    Helper.storage.set('list-project','',res.data.data);
                    $scope.project_list = res.data.data;
                    if($scope.project_list){
                        $scope.selectedProject = $scope.project_list[$scope.selectedIndex];
                        $rootScope.activeProject = $scope.selectedProject;
                    }
                } else {
                    Helper.alert(res.data.message);
                }
            }
        })
    }
    getList();
    
    $scope.onSlideChanged = function(from, to){
        $rootScope.selectedIndex = to;
        $scope.selectedIndex = to;
        $scope.selectedProject = $scope.project_list[$scope.selectedIndex];
        $rootScope.activeProject = $scope.selectedProject;
        
    }
    $scope.onItemClick = function(item){
      $window.location.href = '#/project/'+item.id;

    }
    $scope.doDelete = function(){
        Helper.confirm({
            title:'Delete this project?',
            message: 'Are you sure you want to delete this project? You can lose this project forever',
            oktext:'Yes',
            canceltext:'No',
            onconfirm: function(){
                var pid = $scope.selectedProject.id;
                API.request({
                    url: BASE_URL + 'api/project/delete',
                    data: {
                        id: pid
                    },
                    done:function(res){
                    if(res.data.code == 1){
                        // for(var i in $scope.project_list){
                        //     var cp = $scope.project_list[i];
                        //     if(p.id ==cp.id){
                        //         $scope.project_list.splice(i, 1);
                        //         Helper.storage.set('list-project','',$scope.project_list);
                        //         $rootScope.selectedIndex = 0;
                        //         $scope.selectedIndex = 0;
                        //         $scope.selectedProject = $scope.project_list[$scope.selectedIndex];
                        //         break;
                        //     }
                        // }
                        Helper.storage.delete('list-project');
                        $rootScope.selectedIndex = 0;
                        $scope.selectedIndex = 0;
                        $scope.project_list = []
                        getList()
                        Helper.alert(res.data.message);
                    } else {
                        Helper.alert(res.data.message);
                    }
                  }
                })
            }
        })
    }
    $scope.skip = localStorage.getItem('quick-skip') || 0;
    $scope.doSkip = function(link){
        localStorage.setItem('quick-skip', 1);
        $scope.skip = true;
        if(link) $window.location.href = link;
    }
    $timeout(function(){
        if($('#owl-quiz').length)
            $('#owl-quiz').owlCarousel({
                items:1,
                loop:false,
                margin:0
            });
    },300)
});