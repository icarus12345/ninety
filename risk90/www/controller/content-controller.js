

function ContentController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    try{
        var data = StorageService.get('content', $routeParams.id);
        if(data){ 
                $scope.content = (data);
        }else{
            API.request({
                url: BASE_URL + 'api/content/get',
                data: {
                    id: $routeParams.id
                },
            },function(res){
                if(res.data.code == 1){
                    $scope.content = res.data.data;
                    StorageService.set('content', $routeParams.id,res.data.data);
                } else {
                    Dialog.error(res.data.message);
                }
            },function(res){
                Dialog.error('GET CONTENT FAIL');
                console.log('GET CONTENT FAIL:',res)
            })
        }
    }catch(e){
        Dialog.alert('Error when init Content Page.' + e.message);
    }
}
