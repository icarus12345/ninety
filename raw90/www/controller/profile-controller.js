

function ProfileController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog,
    $timeout, $q, $log,
    API, StorageService, Dialog,ProjectService,
    ) {
    function setData(){
        $timeout(function(){
            API.authentication(function(){
                API.UserInfo.first_name = API.UserInfo.first_name || API.UserInfo.username;
                $scope.user_info = API.UserInfo;
            })
        },1000);
    }
    $scope.iams = $rootScope.iams;
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
    $scope.doUpdateProfile = function(){

        API.__request({
            url: BASE_URL + 'api/member/update_profile',
            data: {
                iam: $scope.user_info.data.iam
            },
        },function(res){
            if(res.data.code == 1){
                 window.location.href = '#/profile';
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            console.log('Register Fail:',res)
            Dialog.error('Register Fail');
        });
    }
}
