APP.controller('ProfileController', function(
    $rootScope, 
    $scope,
    $timeout,
    $window,
    $routeParams,
    Helper,
    API,
    Category
    ) {
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.go(-backNum);
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
    device_info.user_info.since = new Date(device_info.user_info.created.replace(new RegExp('-','g'), '/'))
    $scope.user_info = device_info.user_info
    $scope.doLogout = $rootScope.doLogout
    $scope.profile_form_data = {
        iam:$scope.user_info.data.iam
    }
    $scope.update_password_data = {
        password:'',
        confirm_password:'',
    }
    $scope.doUpdateProfile = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/member/update_profile',
                data: $scope.profile_form_data,
                done:function(res){
                    if(res.data.code == 1){
                        device_info.user_info.data.iam = $scope.profile_form_data.iam
                        Helper.storage.set('device-info','',device_info);
                        $window.history.back()
                    }
                    Helper.alert(res.data.message);
                }
            });
        }else{
            Helper.warning({
                message: 'All fields are required.'
            })
        }
    }
    $scope.doUpdatePassword = function(valid){
        if(valid){
            if($scope.update_password_data.password != $scope.update_password_data.confirm_password){
                Helper.alert('Confirm password doesn\'t match.');
                return;
            }
            API.request({
                url: BASE_URL + 'api/member/change_password',
                data: {
                    password: $scope.update_password_data.password
                },
                done:function(res){
                    if(res.data.code == 1){
                        $window.history.back()
                    }
                    Helper.alert(res.data.message);
                }
            })
        }else{
            Helper.warning({
                message: 'All fields are required.'
            })
        }
    }
      
});
