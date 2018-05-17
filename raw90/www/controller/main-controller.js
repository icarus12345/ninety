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
    $scope.addProjectInfo  = {
        title : '',
        desc: '',
        id:''
    }
    $scope.total_project = _CONS.total_project;
    $timeout(function(){
        API.authentication(function(){
            $scope.total_project = _CONS.total_project;

        })
    },1000);
    $scope.onCreateProject = function(){
        try {
            API.__request({
                url: BASE_URL + 'api/project/create',
                data: $scope.addProjectInfo,
            },function(res){
                if(res.data.code == 1){
                    ProjectService.re_get_list(function(list){
                        _CONS.total_project++;
                    })
                    
                    $scope.addProjectInfo.title='';
                    $scope.addProjectInfo.desc='';
                    $scope.addProjectInfo.id='';
                } else {
                    Dialog.error(res.data.message);
                }
            },function(res){
                Dialog.error('Create Project Fail');
                console.log('Create Project Fail:',res)
            });
        } catch (e){
            Dialog.alert('EM100: '+e.message);
        }
    }
}

