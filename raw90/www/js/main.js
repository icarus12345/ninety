var BASE_URL = 'http://risk90.com.au/';
// var BASE_URL = 'http://local.ninety.com/';
var APP_ID = 'raw';
// var APP_ID = 'raw';
var APP_SECRET = '6789';
var SHOW_GLOBAL = true;
var _CONS = {
};
var APP ;
document.addEventListener("deviceready",function(){
    try{
        if(device.platform == 'iOS'){
            if(window.StatusBar) StatusBar.hide();
        }
        screen.orientation.lock('portrait').then(function success() {
            console.log("Successfully locked the orientation");
        }, function error(errMsg) {
            console.log("Error locking the orientation :: " + errMsg);
        });
        if(device.platform == 'Android'){
            if(window.cordova && window.cordova.plugins.Keyboard) {
                window.cordova.plugins.Keyboard.disableScroll(false);
                // window.cordova.plugins.Keyboard.hideKeyboardAccessoryBar(false);
            }
        }
    }catch(e){
        alert(e.message)
    }
    var domElement = document.body;
    angular.bootstrap(domElement, ["MobileAngularUiExamples"]);
    
}, false);
    APP = angular
        .module('MobileAngularUiExamples', [
            'ngRoute',
            // 'ngAnimate',
            'mobile-angular-ui',
            'ngCordova',
            'loader',
            'vesparny.fancyModal',
            // 'ng-iscroll',
            // 'ngSlimScroll',
            // 'ngScrollbars',
            // touch/drag feature: this is from 'mobile-angular-ui.gestures.js'.
            // This is intended to provide a flexible, integrated and and
            // easy to use alternative to other 3rd party libs like hammer.js, with the
            // final pourpose to integrate gestures into default ui interactions like
            // opening sidebars, turning switches on/off ..
            'mobile-angular-ui.gestures',
            // 'ngTouch',
            'ngTap',
            'chart.js',
            'ngMaterial','ngMessages',
            'ngSanitize'
        ]);
    APP.run(function(
        $transform,$rootScope, $location, $routeParams, $window, 
        $timeout, $mdToast,
        API
        ) {
            try{


                window.$transform = $transform;
                $rootScope.$on('$routeChangeSuccess', function(event, current, previous) {
                    $rootScope.__path = $location.path()
                    var fullRoute = current.$$route.originalPath;
                    $rootScope.__fullRoute = fullRoute;
                    $rootScope.__backPage = $rootScope.__frontPage;
                    switch(fullRoute){
                        case '/':
                            $rootScope.__level = 0;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'home';
                            break;
                        case '/project/:projectId':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/project/:projectId/cat/:categoryId':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/project/:projectId/quest/:categoryId':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/project/:projectId/chart/:categoryId/:backNum':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/share/:projectId':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/send/:projectId':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/app-info/:id':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                        case '/content/:id':
                            $rootScope.__level = 1;
                            $rootScope.__prevLevel = $rootScope.__level || 0;
                            $rootScope.__frontPage = 'project';
                            break;
                    }
                    console.log(fullRoute,$rootScope.__frontPage);
                })
            } catch (e){
                alert(e.message)
            }
            $rootScope.goBack = function(){
                $window.history.back();
                // history.back();
                // rootScope.$apply();
            }
            // document.addEventListener("deviceready",function(){
                try{
                    _CONS.PLATFORM = device.platform;
                    if(device.platform == 'iOS'){
                        _CONS.DIR = cordova.file.dataDirectory;
                        // window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(dir){ 
                        //     dir.getDirectory("myFolder", {create: true}); 
                        // });
                    }else if(device.platform == 'Android'){
                        _CONS.DIR = cordova.file.externalRootDirectory;
                        // window.resolveLocalFileSystemURL(cordova.file.externalRootDirectory, function(dir){ 
                        //     dir.getDirectory(APP_ID, {create: true}); 
                        // });
                        // CONS.DIR = cordova.file.externalDataDirectory || cordova.file.dataDirectory;
                    }

                    var exportDirectory = "";
                    var subdir = APP_ID + '90';
                    _CONS.STORAGE_DIR
                    // What directory should we place this in?
                    if (cordova.file.documentsDirectory !== null) {
                        // iOS, OSX
                        exportDirectory = cordova.file.documentsDirectory;
                    } else if (cordova.file.sharedDirectory !== null) {
                        // BB10
                        exportDirectory = cordova.file.sharedDirectory;
                    } else if (cordova.file.externalRootDirectory !== null) {
                        // Android, BB10
                        exportDirectory = cordova.file.externalRootDirectory;
                    } else {
                        // iOS, Android, BlackBerry 10, windows
                        exportDirectory = cordova.file.DataDirectory;
                    }
                    function failFun(){
                        alert('Cant create new directory')
                    }
                    window.resolveLocalFileSystemURL(exportDirectory, function (directoryEntry) {
                        console.log("Got directoryEntry. Attempting to open / create subdirectory:" + subdir);
                        directoryEntry.getDirectory(subdir, {create: true}, function (subdirEntry) {
                            _CONS.STORAGE_DIR = subdir;
                            _CONS.DIR += (subdir + '/')
                        }, failFun);
                    }, failFun);

                }catch(e){
                    alert(e.message)
                }
                $rootScope._CONS = _CONS;
                $rootScope.device = device;
                $rootScope.cordova = cordova;
                // API.get_device_info();
            // }, false);
          // Get all URL parameter
            $rootScope.keyboard_height = 0;
            if(device.platform == 'Android'){
                try{
                    // if(window.cordova && window.cordova.plugins.Keyboard) {
                    //     window.cordova.plugins.Keyboard.disableScroll(true);
                    //         $mdToast.show(
                    //             $mdToast.simple()
                    //                 .textContent('Simple Toast!')
                    //                 .position(  "top right" )
                    //                 .hideDelay(3000)
                    //         );
                    //     window.addEventListener('native.keyboardshow', function(e){
                    //         $rootScope.keyboard_height = e.keyboardHeight;
                    //     });
                    //     window.addEventListener('native.keyboardhide', function(){
                    //         $timeout(function(){
                    //             $rootScope.keyboard_height = 0;
                    //         })
                    //     });
                    // }
                    window.addEventListener('native.keyboardhide', onKeyboardHide, false);
                    window.addEventListener('native.keyboardshow', onKeyboardShow, false);
                    var keyboard_timer;
                    function onKeyboardHide(e) {
                        console.log('onKeyboardHide');
                        keyboard_timer = $timeout(function(){
                            $rootScope.keyboard_height = 0;
                        }, 200)
                    }

                    function onKeyboardShow(e) {
                        $timeout.cancel(keyboard_timer);
                        console.log('onKeyboardShow');
                        $rootScope.keyboard_height = e.keyboardHeight;
                    }
                }catch(e){
                    alert(e.message)
                }
            }
            $mdToast.show(
                    $mdToast.simple()
                        .textContent('Notification!')
                        .position("top right")
                        .hideDelay(3000)
                        .theme("success")
                );
        });
    APP.config(function(
        $routeProvider, $locationProvider, $mdGestureProvider, $httpProvider
            // , ScrollBarsProvider
        ) {
            $httpProvider.defaults.useXDomain = true;
            delete $httpProvider.defaults.headers.common['X-Requested-With'];
            $mdGestureProvider.skipClickHijack();
            var h5m = (typeof html5Mode !== 'undefined') ? html5Mode : true;
            $locationProvider.html5Mode(h5m);
            $locationProvider.html5Mode({
                enabled: false,
                requireBase: false
            });

            $routeProvider.when('/', {
                templateUrl: 'template/home.html',
                reloadOnSearch: false,
                controller: 'MainController'
            });
            $routeProvider.when('/project/:projectId', {
                templateUrl: 'template/project-detail.html',
                reloadOnSearch: false,
                controller: 'ProjectController'
            });
            $routeProvider.when('/project/:projectId/cat/:categoryId', {
                templateUrl: 'template/project-detail.html',
                reloadOnSearch: false,
                controller: 'ProjectController'
            });
            $routeProvider.when('/project/:projectId/quest/:categoryId', {
                templateUrl: 'template/questions.html',
                reloadOnSearch: false,
                controller: 'QuestionController'
            });
            $routeProvider.when('/project/:projectId/chart/:categoryId/:backNum', {
                templateUrl: 'template/chart.html',
                reloadOnSearch: false,
                controller: 'ChartController'
            });
            $routeProvider.when('/share/:projectId', {
                templateUrl: 'template/share.html',
                reloadOnSearch: false,
                controller: 'ShareController'
            });
            $routeProvider.when('/send/:projectId', {
                templateUrl: 'template/send.html',
                reloadOnSearch: false,
                controller: 'SendController'
            });
            $routeProvider.when('/app-info/:id', {
                templateUrl: 'template/app-info.html',
                reloadOnSearch: false,
                controller: 'ContentController'
            });
            $routeProvider.when('/content/:id', {
                templateUrl: 'template/content.html',
                reloadOnSearch: false,
                controller: 'ContentController'
            });
        });
    APP.factory('Dialog', DialogFactory);
    APP.factory('StorageService', StorageFactory);;
    APP.factory('Auth', AuthFactory);
    APP.factory('API', APIFactory);
    APP.factory('CategoryService', CategoryFactory);
    APP.factory('ProjectService', ProjectFactory);
    APP.factory('QuestionService', QuestionFactory);

    APP.controller('MainController',MainController);
    APP.controller('Main2Controller',Main2Controller);
    APP.controller('ChartController', ChartController);
    APP.controller('ProjectController', ProjectController);
    APP.controller('QuestionController', QuestionController);
    APP.controller('SendController', SendController);
    APP.controller('ShareController', ShareController);
    APP.controller('ContentController', ContentController);
