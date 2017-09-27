

function ProjectController(
    $rootScope, $scope, $route, $routeParams, $window, $location, $mdDialog,
    API, CategoryService, ProjectService, StorageService, Dialog
    ) {
    try {
        console.log('ProjectController',$routeParams);
        $scope.view_chart = function(cate){
            // $location.path( '/project/' + $scope.projectData.id + '/chart/' + cate.id );
            window.location.href = '#/project/' + $scope.projectData.id + '/chart/' + cate.id +'/1';
        }
        $scope.go = function(cate){
            if(cate.items && cate.items.length>0){
                window.location.href = '#/project/' + $scope.projectData.id + '/cat/' + cate.id;
            }else if(cate.questions && cate.questions.length>0){
                // $location.path( '/project/' + $scope.projectData.id + '/quest/' + cate.id );
                window.location.href = '#/project/' + $scope.projectData.id + '/quest/' + cate.id ;
            }else{
                Dialog.error('Don\'t have questions to display.');
            }
        }
        $scope.cid = $routeParams.categoryId;
        console.log($scope.projectData)
        ProjectService.get($routeParams.projectId,function(data){
            // if(!$scope.projectData){
                $scope.projectData = data.info;
                CategoryService.set_answereds(data.answereds);
            // }
            // GET ANSWERS
            // SET ANSWERS
            // GET CATEGORY
            CategoryService.get($routeParams.categoryId,function(data){
                $scope.category_info = data;
                $scope.min_height = Math.max($window.innerHeight - (60 + ($scope.category_info.items.length||3)*81 + 50),100);
                // calculator height
                // var html = $scope.category_info.desc || $scope.projectData.desc;
                // var pElmDom = document.createElement('div');
                // pElmDom.style.opacity = '0.01';
                // pElmDom.style.overflow = 'hidden';
                // pElmDom.style['position'] = 'absolute';
                // pElmDom.style['top'] = '0px';
                // pElmDom.style['left'] = '0px';
                // pElmDom.style['zZndex'] = '-1';
                // pElmDom.style.width = '100%';
                // document.body.appendChild(pElmDom);
                // var elm = document.createElement('div');
                // pElmDom.appendChild(elm);
                // elm.innerHTML = html;
                // elm.style.padding = '20px 14px';
                // elm.style.fontSize = '16px';
                var desc_height = 0;
                var item_length = $scope.category_info.items.length;
                var total_height = window.innerHeight - 60 - 50 - desc_height;
                var item_height = Math.floor((window.innerHeight - 60 - 50 - item_length - desc_height) / item_length);
                item_height = item_height - item_height%2;
                item_height = Math.max(item_height,80);
                var desc_height = window.innerHeight - 60 - 50 - item_height * item_length - item_length;
                $scope.desc_height = desc_height;
                $scope.item_height = item_height;
                $scope.item_line_height = 20;
                $scope.item_padding = (item_height - 20)/2;
                // document.body.removeChild(pElmDom);
            })
        })
    } catch (e){
        alert(e.message);
    }
}
