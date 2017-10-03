

function ShareController(
    $rootScope, $scope, $route, $routeParams, $window, $location, 
    $mdDialog,
    API, CategoryService, ProjectService, StorageService, QuestionService, Dialog
    ) {
    try{
        $scope.cid = $routeParams.categoryId;
        ProjectService.get($routeParams.projectId,function(data){
            $scope.projectData = data.info;
            $scope.shareds = data.shareds;
            console.log(data)
        })
        $scope.share_info = {
            pid: $routeParams.projectId,
            email: '',
            mode: 0
        }
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
        $scope.doShare = function(ev) {
            if(!validateEmail($scope.share_info.email)) return;
            if($scope.shareds && $scope.shareds.length>=5){
                Dialog.warning('Maximum sharing');
                return;
            }
            try{
                API.request({
                    url: BASE_URL + 'api/project/share',
                    data: $scope.share_info,
                },function(res){
                    if(res.data.code == 1){
                        $scope.shareds = res.data.data;
                        $scope.projectData.shareds = res.data.data;
                        ProjectService.set($routeParams.projectId,$scope.projectData);
                        $scope.share_info.email = '';
                        $scope.share_info.mode = 0;
                        $scope.shareForm.$setPristine();
                        $scope.shareForm.$setUntouched();
                        Dialog.error(res.data.message);
                    } else {
                        Dialog.error(res.data.message);
                    }
                },function(res){
                    Dialog.error('Can\'t share.');
                })
            }catch(e){
                Dialog.alert('Error when share.' + e.message);
            }
        };

        $scope.doUnShare = function(data) {
            try{
                Dialog.confirm({
                    title:'Stop sharing ?',
                    message: 'Would you like to unshare width "' + data.email + '"?',
                    oktext:'Unshare',
                    ok: function(){
                        API.request({
                            url: BASE_URL + 'api/project/unshare',
                            data: data,
                        },function(res){
                            if(res.data.code == 1){
                                $scope.shareds = res.data.data;
                                $scope.projectData.shareds = res.data.data;
                                ProjectService.set($routeParams.projectId,$scope.projectData);
                                Dialog.error(res.data.message);
                            } else {
                                Dialog.error(res.data.message);
                            }
                        },function(res){
                            Dialog.error('Can\'t unshare.');
                        })
                    }
                });
            }catch(e){
                Dialog.alert('Error when unshare.' + e.message);
            }
        };
    }catch(e){
        Dialog.alert('Error when init Share Page.' + e.message);
    }
}
