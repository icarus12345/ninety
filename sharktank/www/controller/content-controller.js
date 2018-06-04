

function ContentController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog, $anchorScroll, $timeout,$document,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    $anchorScroll.yOffset = 50;
    
    try {
        var data = StorageService.get('content', $routeParams.id);
        if(data){ 
                $scope.content = (data);
        }else{
            API.__request({
                url: BASE_URL + 'api/content/get',
                data: {
                    id: $routeParams.id
                },
            },function(res){
                if(res.data.code == 1){
                    // res.data.data.content = res.data.data.content.replace(/class=\"cat-/g, "id=\"cat-");
                    console.log(res.data.data.content )
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
    } catch (e){
        alert('EC31: '+e.message);
    }
}

function TutorialController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog, $anchorScroll, $timeout,$document,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    $anchorScroll.yOffset = 50;
    $scope.gotoAnchor = function(x) {
        $timeout(function() {

            var newHash = 'cat-' + x;
            
          console.log($location.hash(),'$location.hash()')
          if ($location.hash() !== newHash) {
            // set the $location.hash to `newHash` and
            // $anchorScroll will automatically scroll to it
            $location.hash(newHash);
          } else {
            // call $anchorScroll() explicitly,
            // since $location.hash hasn't changed
            $anchorScroll();
          }
          $timeout(function() {
            $scope.overflow_scrolling = '';
          },500)
        }, 500);
    };
    try {
        CategoryService.get(95,function(data){
                $scope.category_info = data;
                $scope.overflow_scrolling = '-webkit-overflow-scrolling: auto;';
                $scope.gotoAnchor($routeParams.cate || 0)
        })
    } catch (e){
        alert('EC72: '+e.message);
    }
}

