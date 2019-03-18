

function ContentController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $anchorScroll, $timeout,$document,
    API, Helper
    ) {
    $anchorScroll.yOffset = 50;
    
    try {
        var data = Helper.storage.get('content', $routeParams.id);
        if(data){ 
                $scope.content = (data);
        }else{
            API.request({
                url: BASE_URL + 'api/content/get',
                data: {
                    id: $routeParams.id
                },
                done: function(res){
                    if(res.data.code == 1){
                        // res.data.data.content = res.data.data.content.replace(/class=\"cat-/g, "id=\"cat-");
                        console.log(res.data.data.content )
                        $scope.content = res.data.data;
                        Helper.storage.set('content', $routeParams.id,res.data.data);
                    } else {
                        Helper.alert(res.data.message);
                    }
                },
                error: function(res){
                    Helper.alert('GET CONTENT FAIL');
                    console.log('GET CONTENT FAIL:',res)
                }
            })
        }
    } catch (e){
        alert('EC31: '+e.message);
    }
}
APP.controller('ContentController', ContentController)
function TutorialController(
    $rootScope, 
    $scope, 
    $route, 
    $routeParams, 
    $window, 
    $location, 
    Helper, 
    $anchorScroll, 
    $timeout,$document,
    API,
    Category
    ) {
    $anchorScroll.yOffset = 50;
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.back();
        $timeout(function(){
            $window.history.back();

        },120)
    }
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
        Category.get(95,function(data){
            $scope.category_info = data;
            $scope.overflow_scrolling = '-webkit-overflow-scrolling: auto;';
            $scope.gotoAnchor($routeParams.cid || 0)
        })
    } catch (e){
        alert('EC72: '+e.message);
    }
}
APP.controller('TutorialController', TutorialController)