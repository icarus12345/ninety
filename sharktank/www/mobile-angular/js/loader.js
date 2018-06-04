angular.module('loader', [])

    .directive('loader', function($window, $timeout,$rootScope) {

        var promise;

        var SIZE = 3;
        var FPS = 1000 / 60;
        var BACKGROUND = '#FFF';
        var COLOR = '#4CAF50';

        var t = 100, a;
        var points = new Array(5);

        function create() {
            
        }

        function draw() {
            $rootScope.is_loading = true;
        }

        function clear() {
            timer = $timeout(function(){
                $rootScope.is_loading = false;
            }, 1000);
        }

        function animate() {
            if(timer) {
                $timeout.cancel(timer);
                timer = undefined;
            }
            draw();
            promise = $timeout(animate, FPS);
        }

        function toggle(val) {
            if (val) {
                animate();
            } else {
                $timeout.cancel(promise);
                clear();
            }
        }
        var timer;
        return function($scope, element) {

            
            create();

            $scope.$watch(function() {
                if($rootScope.loading==0){
                    $rootScope.loading_text = undefined;
                }
                return $rootScope.loading > 0;
            }, toggle);

            angular.element($window).bind('resize', create);

        }

    });
