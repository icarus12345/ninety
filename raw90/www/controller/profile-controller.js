

function ProfileController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog,
    $timeout, $q, $log,
    API, StorageService, Dialog,ProjectService,
    ) {
    function setData(){
        $timeout(function(){
            API.authentication(function(){
                $scope.user_info = API.UserInfo;
            })
        },1000);
    }
    $scope.user_info = API.UserInfo;
    setData();
    $scope.doLogout = function(){
        Dialog.confirm({
            title:'',
            message: 'Do you want logout?',
            oktext:'Logout',
            ok: function(){
                API.Logout(function(){
                    ProjectService.clear_all();
                    $rootScope.auth_singin_info.password='';
                    //$rootScope.reload_list_project();
                })
                
            }
        });
    }
    
}
