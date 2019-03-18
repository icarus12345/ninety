/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
 //
// Load current account
var _CONS = {
};
function waitForWebfonts(fonts, callback) {
    var loadedFonts = 0;
    for(var i = 0, l = fonts.length; i < l; ++i) {
        (function(font) {
            var node = document.createElement('span');
            // Characters that vary significantly among different fonts
            node.innerHTML = 'giItT1WQy@!-/#';
            // Visible - so we can measure it - but not on the screen
            node.style.position      = 'absolute';
            node.style.left          = '-10000px';
            node.style.top           = '-10000px';
            // Large font size makes even subtle changes obvious
            node.style.fontSize      = '300px';
            // Reset any font properties
            node.style.fontFamily    = 'sans-serif';
            node.style.fontVariant   = 'normal';
            node.style.fontStyle     = 'normal';
            node.style.fontWeight    = 'normal';
            node.style.letterSpacing = '0';
            document.body.appendChild(node);

            // Remember width with no applied web font
            var width = node.offsetWidth;

            node.style.fontFamily = font+',sans-serif';

            var interval;
            function checkFont() {
                // Compare current width with original width
                if(node && node.clientWidth != width) {
                    ++loadedFonts;
                    node.parentNode.removeChild(node);
                    node = null;
                    if(interval) {
                        clearInterval(interval);
                    }
                }

                // If all fonts have been loaded
                if(loadedFonts >= fonts.length) {
                    if(loadedFonts == fonts.length) {
                        callback();
                        return true;
                    }
                }
            };

            // if(!checkFont()) {
                interval = setInterval(checkFont, 50);
            // }
        })(fonts[i]);
    }
};

// document.addEventListener("deviceready",function(){
//     // var domElement = document.body;
//     // angular.bootstrap(domElement, ["MobileAngularUiExamples"]);
//     waitForWebfonts([
//         'sf-ui-display-light', 
//         'sf-ui-display-bold',
//         'sf-ui-display-heavy',
//         'sf-ui-display-black',
//         'sf-ui-display-medium',
//         'sf-ui-display-semibold',
//         'sf-ui-display-thin',
//         'sf-ui-display-ultralight',
//     ], function() {
//         document.body.className +=' app-ready';
//     })
//     onDeviceReady()
// });

var APP  = angular.module('MobileAngularUiExamples', [
  'ngRoute',
  'mobile-angular-ui',
  'mobile-angular-ui.gestures',
  'ngDialog',
  'ngSanitize',
  'angularjs-autogrow',
  'ngSanitize',
  'ngTap',
  'ngTapHref',
  'chart.js',
  'ngCordova',
]);

APP.run(function(
    $transform,
    $rootScope, 
    $location, 
    $routeParams, 
    $window, 
    $timeout
    ) {
    window.$transform = $transform;
    var loadFonts = function(){
        waitForWebfonts([
            'sf-ui-display-light', 
            'sf-ui-display-bold',
            'sf-ui-display-heavy',
            'sf-ui-display-black',
            'sf-ui-display-medium',
            'sf-ui-display-semibold',
            'sf-ui-display-thin',
            'sf-ui-display-ultralight',
        ], function() {
            document.body.className +=' app-ready';
        })
    }
    var onDeviceReady = function(){
        try{
            if(device.platform == 'iOS'){
                if(window.StatusBar) StatusBar.hide();
            }
            screen.orientation.lock('portrait').then(function success() {
                console.log("Successfully locked the orientation");
            }, function error(errMsg) {
                alert("Error locking the orientation :: " + errMsg);
            });
            if(device.platform == 'Android'){
                if(window.cordova && window.cordova.plugins.Keyboard) {
                    // Scroll vo inputt khi show keybooard
                    window.cordova.plugins.Keyboard.disableScroll(false);
                    // window.cordova.plugins.Keyboard.disableScrollingInShrinkView(false);
                    // Show keyboar accessory bar
                    window.cordova.plugins.Keyboard.hideKeyboardAccessoryBar(false);
                }
            }

        }catch(e){
            alert("onDeviceReady"+e.message)
        }
        // try{
            _CONS.DIR = '/';
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
            var subdir = 'sharktank';
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
                exportDirectory = cordova.file.dataDirectory;
            }
            function failFun(){
                console.log('Cant create new directory')
                
            }
            window.resolveLocalFileSystemURL(exportDirectory, function (directoryEntry) {
                console.log("Got directoryEntry. Attempting to open / create subdirectory:" + subdir);
                directoryEntry.getDirectory(subdir, {create: true}, function (subdirEntry) {
                    _CONS.STORAGE_DIR = subdir;
                    _CONS.DIR += (subdir + '/')
                }, failFun);
            }, failFun);

        // }catch(e){
        //     alert('Device ready:'+e.message)
        // }

        $('#owl-intro').owlCarousel({
            items:1,
            loop:false,
            margin:0
        });
        
    }
    var onKeyboard = function(){
        try{
            if(device.platform == 'Android'){
                window.addEventListener('native.keyboardhide', onKeyboardHide, false);
                window.addEventListener('native.hidekeyboard', onKeyboardHide, false);
                window.addEventListener('native.keyboardshow', onKeyboardShow, false);
                window.addEventListener('native.showkeyboard', onKeyboardShow, false);
                var keyboard_timer;
                function onKeyboardHide(e) {
                    console.log('onKeyboardHide');
                    keyboard_timer = $timeout(function(){
                        $rootScope.keyboard_height = 0;
                        $rootScope.isKeyboardShow = false;
                        $('#debug').html("Window-height:"+$(window).height())
                    }, 200)
                }

                function onKeyboardShow(e) {
                    $timeout.cancel(keyboard_timer);
                    console.log('onKeyboardShow');
                    $rootScope.keyboard_height = e.keyboardHeight;
                    $rootScope.isKeyboardShow = true;
                    $timeout(function(){
                        $('#debug').html("Window-height:"+$(window).height())
                    })
                }

                document.addEventListener('focusin', function (event) {
                    if (
                        event.target.tagName === 'INPUT' ||
                        event.target.tagName === 'TEXTAREA'
                        ) {
                        // document.body.scrollTop = 0;
                    }
                });
            }
            _CONS.ScreenHeight = $(window).height();
        }catch(e){
            alert('NativeEvent:'+e.message)
        }
    }
    document.addEventListener("deviceready",onDeviceReady);
    document.addEventListener("deviceready",onKeyboard);
    document.addEventListener("deviceready",loadFonts)
});

APP.config(['ngDialogProvider', function (ngDialogProvider) {
    ngDialogProvider.setDefaults({
        className: 'ngdialog-theme-default',
        plain: false,
        showClose: true,
        closeByDocument: true,
        closeByEscape: true,
        appendTo: false,
        preCloseCallback: function () {
            console.log('default pre-close callback');
        }
    });
}]);
APP.directive('dragMe', ['$drag', function($drag) {
  return {
    controller: function($scope, $element) {
      $drag.bind($element,
        {
          //
          // Here you can see how to limit movement
          // to an element
          //
          transform: $drag.TRANSLATE_INSIDE($element.parent()),
          end: function(drag) {
            // go back to initial position
            drag.reset();
          }
        },
        { // release touch when movement is outside bounduaries
          sensitiveArea: $element.parent()
        }
      );
    }
  };
}]);
