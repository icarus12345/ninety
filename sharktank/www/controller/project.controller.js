APP.controller('ProjectController', function(
    $rootScope, 
    $scope,
    $timeout,
    $window,
    $routeParams,
    Helper,
    API,
    Category
    ) {
    var bgs = {
        '32':'bg-resource',
        '31':'bg-team',
        '34':'bg-envi',
        '35':'bg-oponi',
    }
    var firewards = {
        '32':'fireward-res',
        '31':'fireward-team',
        '34':'fireward-envi',
        '35':'fireward-opp',
    }
    var rewards = {
        '32':'reward-res',
        '31':'reward-team',
        '34':'reward-envi',
        '35':'reward-opp',
    }
    if(!Category.gets()){
        $window.location.href = '#/';
        return;
    }
    var device_info = Helper.storage.get('device-info');
    if(!device_info){
        $window.location.href = '#/';
        return;
    }
    function getParentLv1(cate){
        if(cate && cate.parent){
            if(cate.level == 1) return cate;
            var parent = cate.parent
            while(parent){
                if(parent.level == 1) return parent;
                parent = parent.parent;
            }
        }
    }
    $scope.$on("$destroy", function(){
        $rootScope.finishCategory = undefined;
        if($rootScope.isNeedRender){
            console.log('Reinit')
            var oldProcess = $scope.activeCategory.process;
            Category.reInit();
            $rootScope.isNeedRender = false;
            // if(oldProcess<$scope.activeCategory.process){
                if($scope.activeCategory.process == 1){
                    var cateLv1 = getParentLv1($scope.activeCategory)
                    if(cateLv1.process == 1){
                        console.log('Root success.');
                        $rootScope.finishCategory = cateLv1;
                        $rootScope.finishbg = rewards[cateLv1.id];

                    }else{
                        console.log('Sub success.');
                        $rootScope.finishCategory = $scope.activeCategory
                        $rootScope.finishbg = firewards[cateLv1.id];
                    }
                }
            // }
        }
    });
    $scope.confirmFinish = function(){
        $rootScope.finishCategory = undefined;
        $scope.finishCategory = $rootScope.finishCategory;
    }
    $scope.goToChart = function(pid,cid){
        $window.location.href ="#/chart/" + pid + "/" + cid
    }
    $scope.goToTutorial = function(cid){
        //href="#/tutorial/{{activeCategory.id}}"
        $window.location.href ="#/tutorial/" + cid
    }
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.go(-backNum);
    }
    $scope.onClickItem = function(item){
        console.log(item,'clicked')
        $window.location.href = '#/project/'+$scope.pid + '/' + item.id;
        if(item.items){
        }else if(item.questions){
        }
    }
    $scope.project = $rootScope.activeProject;
    $scope.finishCategory = $rootScope.finishCategory;
    $scope.finishbg = $rootScope.finishbg;
    $scope.pid = $routeParams.pid;
    $scope.cid = $routeParams.cid || 0;
    console.log('VODAY',$routeParams);
    var bgclass = bgs[$scope.cid];
    if($scope.cid){
        if(bgclass){
            $rootScope.current_bg = bgclass.toString();
        }
    }
    console.log('$rootScope.bgClass',$rootScope.current_bg)
    $scope.selectedItemIndex = 0
    $scope.onSlideChanged = function(from,to){
        $scope.selectedItemIndex = to;
    }
    $scope.onAnswer = function(answer,i){
        if(+$scope.project.mode == 1){
            Helper.alert('You don\'t have permission to answer the question.')
            return;
        }
        console.log($rootScope.$broadcast,'$rootScope.$broadcast')
        $scope.$apply(function(){
            var quest = $scope.activeCategory.questions[$scope.selectedItemIndex||0];
            console.log(quest,i,'I')
            var old_total_answered = $scope.activeCategory.get_answered_num()
            if(quest.answered[0] != i){
                if(quest){
                    var oldAnswerd = quest.answered[0];
                    quest.answered[0] = i;
                    var data = {
                        pid: $scope.pid,
                        cid: $scope.cid,
                        qid: quest.id,
                        ans: i
                    };
                    API.request({
                        url: BASE_URL + 'api/question/answer_the_question',
                        data: data,
                        done: function(res){
                            if(res.data.code == 1){
                                $rootScope.isNeedRender = true;
                                console.log('isNeedRender',$rootScope.isNeedRender)
                                $rootScope.$broadcast('doNext',{});
                                if(
                                    old_total_answered < $scope.activeCategory.get_answered_num() && 
                                    $scope.activeCategory.get_answered_num()==$scope.activeCategory.questions.length
                                    ){
                                    console.log('AUTO FINISH')
                                $scope.goBack(1)
                                }
                            } else {
                                console.log('RESTORE')
                                quest.answered[0] = oldAnswerd;
                            }
                        }
                    })
                } 
            }
        });
    }
    $scope.setChartData = function (data){
        var cateLv1 = getParentLv1(data)
        console.log(cateLv1,'cateLv1')
        var bgclass
        if(cateLv1){
            bgclass = bgs[cateLv1.id];
        }
        if(bgclass) $rootScope.current_bg = bgclass
        
    }
    function getProject(){
        if($scope.pid){
            $scope.project_data = Helper.storage.get('project-detail',$scope.pid);
            if(Category.pid != $scope.pid || !$scope.project_data){
                if($scope.project_data){
                    if(Category.pid != $scope.pid){
                        Category.set_answereds($scope.project_data.answereds);
                        Category.pid = ''+$scope.pid;
                    }
                    $scope.activeCategory = Category.get($scope.cid,function(data){
                        $scope.setChartData(data);
                    });
                }else{
                    API.request({
                        url: BASE_URL + 'api/project/get',
                        data: {
                            id: $scope.pid
                        },
                        done: function(res){
                            if(res.data.code == 1){
                                Helper.storage.set('project-detail',$scope.pid,res.data.data);
                                $scope.project_data = res.data.data;
                                console.log('HHH',$scope.project_data)
                                if(Category.pid != $scope.pid){
                                    Category.set_answereds($scope.project_data.answereds);
                                    Category.pid = ''+$scope.pid;
                                }
                                $scope.activeCategory = Category.get($scope.cid,function(data){
                                    $scope.setChartData(data);
                                });
                            } else {
                                Helper.alert(res.data.message);
                            }
                        }
                    })
                }
            }else{
                $scope.activeCategory = Category.get($scope.cid,function(data){
                    $scope.setChartData(data);
                });
            }
        }else{
            console.log('KO thay ')
        }
    }
    getProject()
    
});
