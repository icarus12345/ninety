var BASE_URL = 'http://sharktankentrepreneur.net/';
var APP_ID = 'raw';
var APP_SECRET = '6789';
var VERSION = '3.0';

APP.factory('API', function(
	$rootScope,
	$http,
	SharedState,
	$timeout,
	Helper,
    $window
	){
	var api = {};
    api.request = function(opt){
        $rootScope.loading = $rootScope.loading||0;
        var successFun = opt.done
        var failFun = opt.error
        var sCallback = function(res){
            if(
                res.data.code==-201
                ){
                $window.location.href = '#/auth';
            }else{
                if(typeof successFun == 'function') successFun(res);
            }
            $timeout(function(){
                if(opt.loading) $rootScope.loading--;
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
                Helper.alert(message || 'Server are busy, please try again');
            }
            if(typeof failFun == 'function') failFun(res);
            $timeout(function(){
                if(opt.loading) $rootScope.loading--;
                console.log($rootScope.loading,'--')
            }, 500)
        }
        var retie = 0;
        var run = function(){
            if(typeof device == 'undefined'){
                $timeout(run, 120);
            }else{
                opt.data.uuid = device.uuid || 'unknown';
                opt.data.client_id  = APP_ID;
                opt.data.device_info = device || {};
                if(opt.loading) $rootScope.loading++;
                console.log($rootScope.loading,'++')
                $http({
                    url: opt.url,
                    method:opt.method || 'POST',
                    data: opt.data,
                    headers: {
                        'Content-Type': 'application/json',

                    },
                    
                }).then(sCallback,function(res, status,headers){
                    fCallback(res);
                    if([404, 403, 500].indexOf(res.status)>=0){
                        fCallback(res);
                    } else {
                        retie++;
                        if(retie<3) run();
                        else 
                            fCallback(res);
                        console.log('Re-tie');
                    }
                })
            }
        }

        run();
    };
    api.check = function(){
        var device_info = Helper.storage.get('device-info');
    }
    return api;
});