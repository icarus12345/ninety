

function QuestionController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog, $timeout,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    try{
        console.log('QuestionController',$routeParams);
        
        $scope.cid = $routeParams.categoryId;
        ProjectService.get($routeParams.projectId,function(data){
            $scope.projectData = data.info;
            CategoryService.set_answereds(data.answereds);
            // GET ANSWERS
            // SET ANSWERS
            // GET CATEGORY
            CategoryService.get($routeParams.categoryId,function(data){
                $scope.category_info = data;
                console.log(data)
            })
        })
        $scope.view_chart = function(cate){
            $rootScope.loading ++;
            $timeout(function(){
                
                if($rootScope.loading > 1){
                    $timeout(function(){
                        $rootScope.loading --;
                        $scope.view_chart(cate);
                    },1000);
                } else {
                    $rootScope.loading --;
                // $location.path( '/project/' + $scope.projectData.id + '/chart/' + cate.id );
                        
                    var cid = cate.id;
                    // if(cate.parent) cid = cate.parent.id;
                    window.location.href = '#/project/' + $scope.projectData.id + '/chart/' + cid +'/2';
                }
            },1000);
        }
        $scope.answer_the_question = function(quest,ans){
            if(+$scope.projectData.mode >= 1){
                if(quest.timer) $timeout.cancel(quest.timer);
                quest.timer = $timeout(function(){
                    quest.timer = undefined;
                    var ansIndex = quest.answered[0];
                    console.log(quest,ans,ansIndex)
                    // if(quest.answered[0]==ansIndex) return;
                    QuestionService.answer_the_question({
                        pid: $routeParams.projectId,
                        cid: $routeParams.categoryId,
                        qid: quest.id,
                        ans: ansIndex
                    },function(data){
                        //quest.answered[0] = ansIndex;
                        // Clear and reload answered
                        // ProjectService.get($routeParams.projectId,function(data){
                        //     for(var i in data.answered){

                        //     }
                        //     CategoryService._categories[0].init();
                        // })
                        ProjectService.clear($routeParams.projectId)
                    })
                }, 500)
            } else {
                Dialog.alert('You don\'t have permission to answer the question.')
            }
        }
    } catch (e){
        Dialog.alert('E71:'+e.message);
    }
}
