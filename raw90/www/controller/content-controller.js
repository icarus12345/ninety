

function ContentController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog,$timeout,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    $scope.autoScroll = function(){
        $timeout(function(){
            var categoryId = $routeParams.categoryId;
            var elm = angular.element(document.getElementsByClassName("cat-"+categoryId));
            console.log(elm,"cat-"+categoryId)
            if(elm && elm[0]){
                 $location.hash("cat-"+categoryId);
                 $anchorScroll();
            }
        },1000)
    }
    try {
        var data = StorageService.get('content', $routeParams.id);
        if(data){ 
            $scope.content = (data);
            $scope.autoScroll();
        }else{
            API.request({
                url: BASE_URL + 'api/content/get',
                data: {
                    id: $routeParams.id
                },
            },function(res){
                if(res.data.code == 1){
                    $scope.content = res.data.data;
                    StorageService.set('content', $routeParams.id,res.data.data,60*60*24*365);
                    $scope.autoScroll();
                } else {
                    Dialog.error(res.data.message);
                }
            },function(res){
                Dialog.error('GET CONTENT FAIL');
                console.log('GET CONTENT FAIL:',res)
            })
        }
    } catch (e){
        alert('EC31: '+e.message);
    }
}
