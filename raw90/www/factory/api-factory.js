function APIFactory(
    $rootScope,$http,SharedState, $mdDialog, $timeout, $fancyModal,
    StorageService, Dialog
    ) {
    var API = this;
    SharedState.initialize($rootScope, 'IsShowLogin');
    SharedState.initialize($rootScope, 'IsShowRegister');
    $rootScope.loading = $rootScope.loading || 0;
    
    function __request(opt,successFun,failFun){
        if(opt.loading!=false) $rootScope.loading++;
        console.log($rootScope.loading,'++')
        // opt.data.app_id = APP_ID;
        // opt.data.app_secret = APP_SECRET;
        var sCallback = function(res){
            if(res.data.code==-201){
                SharedState.turnOn('IsShowLogin');
            }else{
                if(typeof successFun == 'function') successFun(res);
            }
            $timeout(function(){
                if(opt.loading!=false) $rootScope.loading--;
                console.log($rootScope.loading,'--')
            }, 500)
        }
        var fCallback = function(res){
            console.log(res)
            if(opt.showerror!==false){
                var message = 'Server are busy.';
                switch(res.status){
                    case 404:
                        message = '404 Page Not Found.';
                        break;
                    case 403:
                        message = '403 Permission denied.';
                        break;
                    case 500:
                        message = '500 (Internal Server Error).';
                        break;
                    default:

                }
                Dialog.error(message || 'Server are busy, please try again');
            }
            if(typeof failFun == 'function') failFun(res);
            $timeout(function(){
                if(opt.loading!=false) $rootScope.loading--;
                console.log($rootScope.loading,'--')
            }, 500)
        }
        var retie = 0;
        var _run = function(){
            opt.data.uuid = device.uuid || 'unknown';
            opt.data.client_id = APP_ID || '';
            $http({
                // method: 'JSONP',
                url: opt.url,
                method:opt.method || 'POST',
                data: opt.data,
                // withCredentials: true,
                headers: {
                    // 'X-CSRF-Token': API.token || '',
                    // 'Cache-Control': 'no-cache',
                    'Content-Type': 'application/json',
                    // 'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'

                },
                // transformRequest: function(obj) {
                //     var str = [];
                //     for(var p in obj)
                //     str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                //     return str.join("&");
                // },
                
            }).then(sCallback,function(res, status,headers){
                fCallback(res);
                // if([404, 403, 500].indexOf(res.status)>=0){
                //     fCallback(res);
                // } else {
                //     retie++;
                //     if(retie<3) _run();
                //     else 
                //         fCallback(res);
                //     console.log('Re-tie');
                // }
            })
        }
        _run();
    }
    this.__request = __request;
    this.__queue = [];
    this.runQueue = function(){
        console.log('RUN QUEUE')
        for(var i = 0; i<this.__queue.length;i++){
            __request(this.__queue[i].opt,this.__queue[i].successFun,this.__queue[i].failFun);
        }
        this.__queue = [];
    }
    this.request = function(opt,successFun,failFun){
        if(API.token){
            __request(opt,successFun,failFun);
        } else {
            // getToken
            // API.getToken(function(){
                // __request(opt,successFun,failFun);
            // })
            
            API.__queue.push({
                opt:opt,
                successFun:successFun,
                failFun:failFun,
            });
            console.log('PUST QUEUE')
            API.authentication(function(){
                API.runQueue();
            });
        }
        // authentication
    }
    // if(API.token){
    //     // get info
    //     API.__request({
    //         url: BASE_URL + 'api/auth/get_info_by_token',
    //         data: {},
    //         // showerror: false
    //     },function(res){
    //         if(res.data.code==1 && res.data.data){
    //             if(res.data.data.user_info){
    //                 API.UserInfo = res.data.data.user_info;
    //                 StorageService.set('auth','info', API.UserInfo);
    //                 // API.runQueue();
    //             }else{
    //                 SharedState.turnOn('IsShowLogin');
    //             }
    //         } else {
    //             SharedState.turnOn('IsShowLogin');
    //         }
    //     },function(res){
    //         console.log('GET INFO FAIL:',res)
    //         SharedState.turnOn('IsShowLogin');
    //     });
    // } else {
    //     SharedState.turnOn('IsShowLogin');
    // }
    this.get_device_info = function(){
        
            API.__request({
                url: BASE_URL + 'api/auth/device_info',
                data: {
                    uuid: device.uuid,
                    device_info: device
                },
                // showerror: false
            },function(res){
                if(res.data.code==1 && res.data.data){
                    if(res.data.data.user_info){
                        API.UserInfo = res.data.data.user_info;
                        API.token = true;
                        if(!_CONS.total_question) _CONS.total_question = +res.data.data.total_question;
                        if(!_CONS.total_project) _CONS.total_project = +res.data.data.total_project;
                        API.runQueue();
                    }else{
                        SharedState.turnOn('IsShowLogin');
                    }
                } else {
                    SharedState.turnOn('IsShowLogin');
                }
            },function(res){
                console.log('GET INFO FAIL:',res)
                SharedState.turnOn('IsShowLogin');
            });
    }

    $rootScope.doAuthRegister = function(){
        if(!$rootScope.auth_reg_info.tos){
            $rootScope.registerForm.tos.$setValidity("required",true);
            return;
        }
        API.__request({
            url: BASE_URL + 'api/auth/register',
            data: $rootScope.auth_reg_info,
        },function(res){
            if(res.data.code == 1){
                SharedState.turnOff('IsShowRegister');
                SharedState.turnOn('IsShowLogin');
                Dialog.error(res.data.message);
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            console.log('Register Fail:',res)
            Dialog.error('Register Fail');
        });
    }
    $rootScope.doAuthLogin = function(){
        API.__request({
            url: BASE_URL + 'api/auth/login',
            data: $rootScope.auth_singin_info,
        },function(res){
            if(res.data.code == 1){
                SharedState.turnOff('IsShowLogin');
                StorageService.set('device-info','',res.data.data);
                API.UserInfo = res.data.data.user_info;
                API.token = true;
                _CONS.total_question = +res.data.data.total_question;
                _CONS.total_project = +res.data.data.total_project;
                API.token = true;
                API.runQueue();
                API.get_device_info()
                window.location.href = '#/';
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            console.log('Login Fail:',res)
            Dialog.error('Login Fail');
        });
    }
    $rootScope.doAuthSendCode = function(){
        API.__request({
            url: BASE_URL + 'api/auth/sendcode',
            data: $rootScope.auth_forgot,
        },function(res){
            if(res.data.code == 1){
                $rootScope.auth_forgot.step = 2;
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            Dialog.error('Fail to send  code for a password reset.');
        });
    }
    $rootScope.doAuthForgot = function(){
        API.__request({
            url: BASE_URL + 'api/auth/reset_password',
            data: $rootScope.auth_forgot,
        },function(res){
            if(res.data.code == 1){
                $rootScope.auth_forgot.status = false;
                $rootScope.auth_forgot.step = 1;
                $rootScope.auth_forgot.email = '';
                $rootScope.auth_forgot.code = '';
                $rootScope.auth_forgot.password = '';
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            Dialog.error('Reset Password Fail');
        });
    }
    $rootScope.show_register = function(){
        SharedState.turnOn('IsShowRegister');
        SharedState.turnOff('IsShowLogin');
    }
    $rootScope.show_login = function(){
        $rootScope.auth_forgot.status = false;
        SharedState.turnOff('IsShowRegister');
        SharedState.turnOn('IsShowLogin');
    }
    $rootScope.auth_forgot = {
        status: false,
        step:1,
        code: '',
        email: '',
        password: ''
    }
    $rootScope.show_forgot = function(step){
        $rootScope.auth_forgot.step = step;
        $rootScope.auth_forgot.status = true;
    }
    $rootScope.auth_singin_info = {
        username:'',
        password:'',

    }
    $rootScope.iams = ['an entrepreneur','a start-up','an angel investor','a venture capitalist','other']
    $rootScope.auth_reg_info = {
        email:'',
        username:'',
        password:'',
        sex: 'male',
        interest: '',
        professional: '',
        iam: '',
        tos: false
    }
    this.Logout = function(callback){
        API.__request({
            url: BASE_URL + 'api/auth/logout',
            data: {},
        },function(res){
            if(res.data.code == 1){
                API.token = false
                SharedState.turnOn('IsShowLogin');
                StorageService.clear();
                callback();
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            console.log('Logout Fail:',res)
            Dialog.error('Logout Fail');
        });
    }
    this.__authentication_callback = [];
    this.authentication = function(callback){
        if(typeof device != 'object'){
            $timeout(function(){
                API.authentication(callback);
            }, 500);
            return;
        }

        var device_info = StorageService.get('device-info');
        if(device_info){
            API.UserInfo = device_info.user_info;
            _CONS.total_question = +device_info.total_question;
            _CONS.total_project = +device_info.total_project;
            console.log(device_info,'device_info:cache',device_info)
            callback();
        }else{
            API.__request({
                url: BASE_URL + 'api/auth/device_info',
                data: {
                    uuid: device.uuid,
                    device_info: device
                },
                // showerror: false
            },function(res){
                if(res.data.code==1 && res.data.data){
                    if(res.data.data.user_info){
                        API.UserInfo = res.data.data.user_info;
                        if(!_CONS.total_question) _CONS.total_question = +res.data.data.total_question;
                        if(!_CONS.total_project) _CONS.total_project = +res.data.data.total_project;
                        StorageService.set('device-info','',res.data.data);
                        callback();
                    }else{
                        SharedState.turnOn('IsShowLogin');
                        API.__authentication_callback.push(callback);
                    }
                } else {
                    SharedState.turnOn('IsShowLogin');
                    API.__authentication_callback.push(callback);
                }
            },function(res){
                console.log('GET INFO FAIL:',res)
                SharedState.turnOn('IsShowLogin');
                API.__authentication_callback.push(callback);
            });
        }
    }
    
    return API;
}
