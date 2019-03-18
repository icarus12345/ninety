APP.controller('RenderController', function(
    $rootScope, 
    $scope,
    $timeout,
    $window,
    Helper,
    API,
    Category
    ) {
    $rootScope.loading = 0;
    $rootScope.$on('$routeChangeStart', function() {
        $rootScope.pageLoading = true;
    });

    $rootScope.$on('$routeChangeSuccess', function(event, toState, toParams, fromState, fromParams){
        $rootScope.pageLoading = false;
        $rootScope.current_bg = 'bg'; 
        if (toState && toState.$$route && toState.$$route.data) {
            $rootScope.current_bg = toState.$$route.data.current_bg;
        }
        // console.log(toState, toParams, fromState, fromParams,'toState, toParams, fromState, fromParams')
    });
    // check update.

    // Load data
    $scope.dataLoading = true;
    $scope.loadingText = 'Loading data from server. Please wait.';
    function loadData(){
        API.request({
            url: BASE_URL + 'api/category/get_list',
            data: {
            },
            done: function(res){
                if(res.data.code == 1){
                    Category.build(res.data.data);
                    $scope.dataLoading = false;
                    $scope.loadingText = null;
                    // if(typeof callback == 'function') callback(res.data.data)
                    // $timeout(function(){
                    //     $window.location.href = '#/auth';
                    // }, 1000)
                    loadInfo()
                } else {
                    Helper.alert(res.data.message);
                }
            },
            fail: function(res){
                Helper.warning({
                    message: 'Fail to load data. Please try again.',
                    onclose: function(){
                        loadData()
                    }
                });
            }
        })
    }
    $scope.showUpdate = function(v){
        Helper.confirm({
            title:'Have a new version',
            message: 'A new version(' + v + ') of this app is available for download.\nPlease update it from PlayStore !',
            oktext:'Update',
            onconfirm: function(){
                var url = "https://itunes.apple.com/au/app/shark-tank-entrepreneur/id1390358746?mt=8";
                var target = "_blank";
                var options = "location=yes,hidden=yes";
                inAppBrowserRef = cordova.InAppBrowser.open(url, target, options);
            }
        })
    }
    
    function loadInfo(){
        API.request({
            url: BASE_URL + 'api/auth/device_info',
            data: {
            },
            done: function(res){
                $timeout(function(){
                    if(res.data.code == 1){
                        // $scope.dataLoading = false;
                        $scope.loadingText = null;
                        Helper.storage.set('device-info','',res.data.data);
                        if(res.data.version!=VERSION){
                            $scope.showUpdate(res.data.version);
                        }
                        $window.location.href = '#/list';
                    } else {
                        $window.location.href = '#/auth';
                    }
                },1000)
            },
            fail: function(res){
                $window.location.href = '#/auth';
            }
        })
    }
    // loadData();
    $timeout(function(){

        var data = {
            items: category_data,
            questions: question_data
        }
        Category.build(data);
        loadInfo();
    },1000)

    
    
});
