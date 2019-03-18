APP.controller('AuthController', function(
    $rootScope, $scope,
    $window,
    $timeout,
    Helper,
    API
    ) {
    console.log('AuthController')
    $scope.goBack = function(backNum){
        backNum = backNum || 1;
        $window.history.go(-backNum);
    }
    $scope.login_data = {
        username:'',
        password:''
    }
    $scope.reg_data = {
        email:'',
        username:'',
        password:'',
        accept: false,
        iam:'',

        sex: 'male',
        interest: '',
        professional: '',

    }
    $scope.userAgent = navigator.userAgent;

    $scope.screen_height = window.innerHeight
    $scope.terms = function(){
        Helper.terms()
    }
    var time = 15 * 60 * 1000;
    $rootScope.showRating = function(){
        if($rootScope.ratingTimer) $timeout.cancel($rootScope.ratingTimer);
        $rootScope.ratingTimer = $timeout(function(){
            Helper.confirm({
                title:'Do you love us?',
                message: 'If yoi enjoy using our app, please visit the store and give us <b>5 start</b> of rating. Thank you so much.',
                oktext:'Yes',
                canceltext:'No',
                onconfirm: function(){
                    time += 15 * 60 * 1000;
                    $rootScope.showRating()
                    var url = "https://itunes.apple.com/au/app/shark-tank-entrepreneur/id1390358746?mt=8";
                    var target = "_blank";
                    var options = "location=yes,hidden=yes";
                    inAppBrowserRef = cordova.InAppBrowser.open(url, target, options);
                },
                oncancel:function(){
                    $rootScope.showRating()
                }
            })
        },time)
    }
    $rootScope.showRating()
    $rootScope.doLogout = function(){
        Helper.confirm({
            title:'Logout',
            message:'Are you sure to logout?\nWe have a lot more interesting\n thing to show you.',
            onconfirm: function(){
                API.request({
                    url: BASE_URL + 'api/auth/logout',
                    data: {},
                    done:function(res){
                        if(res.data.code == 1){
                            Helper.storage.clear();
                            $window.location.href = '#/auth';
                            // if(typeof callback == 'function') callback();
                        } else {
                            Helper.alert(res.data.message);
                        }
                    },
                    error:function(res){
                        Helper.alert('Logout Fail');
                    }
                });
                
            }
        })
    }
    $scope.fbLogin = function(){
        
        try{
            var fbErrorHandler = function(error) {
              //alert(JSON.stringify(error))
                console.error(error)
              }
            
            var fbLoginSuccess = function (userData) {
              console.log("UserInfo: ", JSON.stringify(userData));
              
                facebookConnectPlugin.api(
                    "/me?fields=id,name,email", 
                    ["public_profile", "email"], 
                    function(response) {
                        API.request({
                            url: BASE_URL + 'api/auth/fb_login',
                            data: {
                                username:response.name,
                                name: response.name,
                                email:response.email
                            },
                            done: function(res){
                                if(res.data.code == 1){
                                    Helper.storage.set('device-info','',res.data.data);
                                    $window.location.href = '#/';
                                } else {
                                    Helper.alert({message:res.data.message});
                                }

                            },
                            error: function(res){
                                Helper.alert({message:'Fail to login.'})
                            }
                        });
                    },
                    fbErrorHandler
                );
            }

            facebookConnectPlugin.login(["email","public_profile"], fbLoginSuccess,fbErrorHandler);

            // facebookConnectPlugin.login({
            //    permissions: ['email', 'public_profile'],
            //    onSuccess: function(result) {
            //         alert(JSON.stringify(result));
            //         if(result.declined.length > 0) {
            //             alert("The User declined something!");
            //         }
            //       /* ... */
            //    },
            //    onFailure: function(result) {
            //         alert(JSON.stringify(result));
            //       if(result.cancelled) {
            //          alert("The user doesn't like my app");
            //       } else if(result.error) {
            //          alert("There was an error:" + result.errorLocalized);
            //       }
            //    }
            // });
        }catch(e){
            Helper.warning('E-FB :'+e.message);
        }
    }
    $scope.doLogin = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/auth/login',
                data: $scope.login_data,
                done: function(res){
                    if(res.data.code == 1){
                        Helper.storage.set('device-info','',res.data.data);
                        $scope.login_data = {
                            username:'',
                            password:''
                        }
                        $window.location.href = '#/';
                    } else {
                        Helper.alert({message:res.data.message});
                    }

                },
                error: function(res){
                    Helper.alert({message:'Fail to login.'})
                }
            });

        }else{
            Helper.alert({
                message: 'All fields are required.'
            })
        }
    }
    $scope.doRegister = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/auth/register',
                data: $scope.reg_data,
                done: function(res){
                    if(res.data.code == 1){
                        Helper.alert({
                            message: res.data.message,
                            onclose: function(){
                                $scope.login_data.username = $scope.reg_data.username;
                                $scope.login_data.password = $scope.reg_data.password;
                                $scope.doLogin(true);
                                $scope.reg_data = {
                                    email:'',
                                    username:'',
                                    password:'',
                                    accept: false,
                                    iam:'',

                                    sex: 'male',
                                    interest: '',
                                    professional: '',

                                }
                            }
                        });

                    } else {
                        Helper.warning({message:res.data.message});
                    }

                },
                error: function(res){
                    Helper.warning('Fail to login.')
                }
            });

        }else{
            Helper.warning({
                message: 'All fields are required.'
            })
        }
    }
    $scope.auth_forgot = {
        status: false,
        step:1,
        code: '',
        email: '',
        password: ''
    }
    $scope.doSendCode = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/auth/sendcode',
                data: $scope.auth_forgot,
                done: function(res){
                    if(res.data.code == 1){
                        $scope.auth_forgot.step = 2;
                    }
                    Helper.alert({message:res.data.message});
                },
                error: function(res){
                    Helper.warning({message:'Fail to send reset code.'})
                }
            });
        }else{
            Helper.warning({
                message: 'Email fields are required.'
            })
        }
    }
    $scope.doResetPassword = function(valid){
        if(valid){
            API.request({
                url: BASE_URL + 'api/auth/sendcode',
                data: $scope.auth_forgot,
                done: function(res){
                    if(res.data.code == 1){
                        $scope.goBack();
                    }
                    Helper.alert({message:res.data.message});
                },
                error: function(res){
                    Helper.warning({message:'Fail to send reset code.'})
                }
            });
        }else{
            Helper.warning({
                message: 'Reset code fields are required.'
            })
        }
    }
    $scope.skip = localStorage.getItem('skip') || 0;
    $rootScope.is_quiz = localStorage.getItem('quiz') || 0;
    $scope.doSkip = function(link){
        localStorage.setItem('skip', 1);
        $scope.skip = true;
        if(link) $window.location.href = link;
    }
    $rootScope.doSkipQuiz = function(){
        localStorage.setItem('quiz', 1);
        $rootScope.is_quiz = true;
    }
    
});