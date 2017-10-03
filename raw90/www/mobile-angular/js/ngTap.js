"use strict";

angular.module("ngTap", []).directive("ngTap", function () {
    return {
        controller: ["$scope", "$element", function ($scope, $element) {
            var _target;
            var moved = false;
            $element.bind("touchstart", onTouchStart);
            function onTouchStart(event) {
                _target = event.target;
                moved = false;
                $element.bind("touchmove", onTouchMove);
                $element.bind("touchend", onTouchEnd);
            }
            function onTouchMove(event) {
                moved = true;
            }
            function onTouchEnd(event) {
                $element.unbind("touchmove", onTouchMove);
                $element.unbind("touchend", onTouchEnd);
                if (!moved && _target == event.target) {
                    var method = $element.attr("ng-tap");
                    $scope.$apply(method);
                }
            }

        }]
    }
});
