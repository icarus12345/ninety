

function SendController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog,
    $timeout, $q, $log,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    console.log('SendController',$routeParams);
    try{


        $scope.cid = $routeParams.categoryId;
        ProjectService.get($routeParams.projectId,function(data){
            $scope.projectData = data.info;
            
        })
        $scope.send_info = {
            pid: $routeParams.projectId,
            email: '',
            pdf:''
        }
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
        $scope.doSend = function(){
            if(!validateEmail($scope.send_info.email)) return;
            $rootScope.loading++;
            $timeout(function(){
                try{
                    $rootScope.loading--;
                    ProjectService.get($routeParams.projectId,function(p){
                        CategoryService.set_answereds(p.answereds);
                        CategoryService.get(0,function(c){
                            console.log(c)
                            // setTimeout(function(){
                                CategoryService.export({
                                    project_info: p.info,
                                    setting: {
                                        all_user: true,
                                        all_comment: true,
                                    }
                                },function(res){
                                    $scope.send_info.pdf = res.data.url;
                                    API.request({
                                        url: BASE_URL + 'api/project/send',
                                        data: $scope.send_info,
                                    },function(res){
                                        if(res.data.code == 1){
                                            Dialog.error(res.data.message);
                                        } else {
                                            Dialog.error(res.data.message);
                                        }
                                    },function(res){
                                        Dialog.error('Can\'t send.');
                                    })
                                })
                            // },1000)
                        })
                    })
                }catch(e){
                    Dialog.alert('Error when send email.' + e.message);
                }
            },100)
        }
    }catch(e){
        Dialog.alert('Error when init Send Page.' + e.message);
    }
}
