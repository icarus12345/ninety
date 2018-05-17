

function ContentController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog, $anchorScroll, $timeout,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    $anchorScroll.yOffset = 50;
    $scope.gotoAnchor = function(x) {
        $timeout(function() {

            var newHash = 'cat-' + x;
            function findAncestor (el, cls) {
                while ((el = el.parentNode) && el.className.indexOf(cls) < 0);
                return el;
            }
            console.log(newHash,'newHash')
            if(document.getElementsByClassName(newHash).length>0){
                var elm = document.getElementsByClassName(newHash)[0];
                var t = elm.getBoundingClientRect().top
                var scrollElm = findAncestor(elm,"scrollable-content");
                scrollElm.scrollTo(0,t - 60)
            }
        }, 1000);
      // console.log($location.hash(),'$location.hash()')
      // if ($location.hash() !== newHash) {
      //   // set the $location.hash to `newHash` and
      //   // $anchorScroll will automatically scroll to it
      //   $location.hash('cat-' + x);
      // } else {
      //   // call $anchorScroll() explicitly,
      //   // since $location.hash hasn't changed
      //   $anchorScroll();
      // }
    };
    try {
        var data = StorageService.get('content', $routeParams.id);
        if(data){ 
                $scope.content = (data);
                $scope.gotoAnchor($routeParams.cate)
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
                    $scope.gotoAnchor($routeParams.cate)
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
