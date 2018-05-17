//
// For this trivial demo we have just a unique MainController
// for everything
//
var MainService = {
    page: 1,
    perpage: 100,
    isLoadMore: true,
    get_list: function(){

    }
}
function MainController(
    $rootScope, $scope, $http, $route, $routeParams, API, Auth, SharedState, 
    $mdBottomSheet, $location, $mdDialog, $timeout, $window,
    $cordovaFileTransfer, $cordovaFileOpener2,
    ProjectService, CategoryService, StorageService, Dialog
    ) {
    $scope.doLogout = function(){
        Dialog.confirm({
            title:'',
            message: 'Do you want logout?',
            oktext:'Logout',
            ok: function(){
                API.Logout(function(){
                    ProjectService.clear_all();
                    $rootScope.auth_singin_info.password='';
                    $rootScope.reload_list_project();
                })
                
            }
        });
    }
}

