"use strict";

angular.module("ngTap", []).directive("ngTap", function () {
    return {
        controller: ["$scope", "$element", function ($scope, $element) {

            var moved = false;
            $element.bind("touchstart", onTouchStart);
            function onTouchStart(event) {
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
                if (!moved) {
                    var method = $element.attr("ng-tap");
                    $scope.$apply(method);
                }
            }

        }]
    }
});
