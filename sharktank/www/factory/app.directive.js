APP.directive('fittext', ['$parse','$touch','$timeout',function($parse,$touch,$timeout) {
  return {
    restrict: 'C',
    scope: {
      item: '@item'
    },
    link: function($scope, $elem, $attrs) {
      var min = 6;//+$attrs.min || 1;
      var min = +($attrs.min || 3)*document.body.clientWidth/100;
      var max = 4*document.body.clientWidth/100;//+$attrs.max || 100;
      var max = +($attrs.max || 4)*document.body.clientWidth/100;
      var elem =$elem[0]
      var childElem = elem.children[0];
      $timeout(function () {
        for(var i = max;i>min;i--){
            elem.style.fontSize = i + 'px';
            console.log(i+'px')
            if(elem.clientHeight>childElem.clientHeight) break;
        }
      },42)
    }
  }
}])
APP.directive('carouselBtn', ['$parse','$touch',function($parse,$touch) {
  return {
    restrict: 'C',
    scope: {
      item: '@item'
    },
    link: function($scope, elem, attrs, carousel) {
      var onTouchedFn = $parse(attrs.onTouched);
      $scope.isTouchMove = false;
      $touch.bind(elem, {
        start: function(touch) {
          $scope.isTouchMove = false;
        },
        cancel: function(touch) {

        },
        move: function(touch) {
          $scope.isTouchMove = true;
        },
        end: function(touch) {
          if(!$scope.isTouchMove){
            if(typeof onTouchedFn == 'function') onTouchedFn($scope.$parent,{
              q:$scope.$parent.q,
              qi:$scope.$parent.qi
            })
          }
        }
      });
    }
  }
}])
APP.directive('carouselItem', ['$parse','$drag','$touch',function($parse,$drag,$touch) {
  return {
    restrict: 'C',
    require: '^carousel',
    scope: {},
    transclude: true,
    template: '<div class="item"><div ng-transclude></div></div>',
    link: function($scope, elem, attrs, carousel) {
        var onTouchedFn = $parse(attrs.onCarouselTouched);
        var me = this;
        $scope.carousel = carousel;
        var id = carousel.addItem(elem[0]);

        var zIndex = function() {
            var res = 0;
            if (id === carousel.activeItem) {
              res = 2000;
            } else if (carousel.activeItem < id) {
              res = 2000 - (id - carousel.activeItem);
            } else {
              res = 2000 - (carousel.itemCount - 1 - carousel.activeItem + id);
            }
            return res;
        };
        $scope.$watch(function() {
          return carousel.activeItem;
        }, function() {
          elem[0].style.zIndex = zIndex();
        });
      $scope.isTouchMove = false;
      $touch.bind(elem, {
        start: function(touch) {
          $scope.isTouchMove = false;
        },
        cancel: function(touch) {

        },
        move: function(touch) {
          $scope.isTouchMove = true;
        },
        end: function(touch) {
          if(!$scope.isTouchMove){
            if(typeof onTouchedFn == 'function') onTouchedFn($scope.$parent,{item:$scope.$parent.item})
          }
        }
      });
      $drag.bind(elem, {
        //
        // This is an example of custom transform function
        //
        transform: function(element, transform, touch) {
          //
          // use translate both as basis for the new transform:
          //
          var t = $drag.TRANSLATE_BOTH(element, transform, touch);
          //
          // Add rotation:
          //
          var dx = touch.distanceX;
          var dy = touch.distanceY;
          var t0 = touch.startTransform;
          var sign = dx < 0 ? -1 : 1;
          var angle = sign * Math.min((Math.abs(dx) / 700) * 30, 30);
          t.rotateZ = elem._flag * angle + (Math.round(t0.rotateZ));
          return t;
        },
        move: function(drag) {
          // if (Math.abs(drag.distanceX) >= drag.rect.width / 3) {
          //   elem.addClass('dismiss');
          // } else {
          //   elem.removeClass('dismiss');
          // }
          var opacity = (drag.rect.width - Math.abs(drag.distanceX))/drag.rect.width
          elem.css({
            opacity: opacity
          })
        },
        cancel: function() {
          elem.css({
            opacity: 1
          })
        },
        start: function(drag) {
          console.log(drag,'drag.rect.height')
            if(drag.startY - drag.startRect.top>drag.rect.height/2){
                elem._flag  = -1;
            }else{
                elem._flag  = 1;
            }
        },
        end: function(drag) {
          elem.css({
            opacity: 1
          })
          if (Math.abs(drag.distanceX) >= drag.rect.width / 3) {
            $scope.$apply(function() {
              carousel.next();
            });
          }
          drag.reset();
        }
      });
    }
  };
}]);

APP.directive('carousel', ['$parse',function($parse) {
  return {
    restrict: 'C',
    scope: {
      activeindex: '@activeindex',
      options: '='
    },
    link: function (scope, element, attrs, carousel) {
      console.log(scope,'scope')
      // angular.extend(scope.options, {
      //   next: function(){  
      //   }
      // });
      scope.$on('doNext',function(event, data){
          //scope.$apply(function() {
              carousel.next();
          //});
      });
    },
    controller: function($rootScope,$scope, $element, $attrs, $transclude) {
      console.log($scope,'$scope.activeindex',$scope.activeindex)
      this.activeItem = +$scope.activeindex || 0;
      this.itemCount = 0;
      // this.activeItem = 0;
      this.addItem = function(elm) {
        this.itemCount = $element[0].querySelectorAll('.carousel-item').length;
        var newId = this.itemCount-1;
        // this.activeItem = 0;
        // return $element[0].querySelectorAll('.carousel-item').indexOf(elm)
        return newId;
      };

      this.next = function() {
        this.itemCount = $element[0].querySelectorAll('.carousel-item').length;
        console.log(this.activeItem)
        console.log(this.itemCount)
        this.activeItem = this.activeItem || 0;
        var from = this.activeItem;
        this.activeItem = this.activeItem >= this.itemCount - 1 ? 0 : this.activeItem + 1;
        var to = this.activeItem;
        if(typeof this.select == 'function'){
            this.select(from,to)
        }
      };

      this.prev = function() {
        this.itemCount = $element[0].querySelectorAll('.carousel-item').length;
        this.activeItem = this.activeItem || 0;
        var from = this.activeItem;
        this.activeItem = this.activeItem <= 0 ? this.itemCount - 1 : this.activeItem - 1;
        var to = this.activeItem;
        if(typeof this.select == 'function'){
            this.select(from,to)
        }
      };
    },
  };
}])
.directive('onCarouselChange', function ($parse) {
  return {
    require: 'carousel',
    link: function (scope, element, attrs, carousel) {
      var fn = $parse(attrs.onCarouselChange);
      var origSelect = carousel.select;
      carousel.select = function (from, to) {
        // if (to !== carousel.activeItem) {
          if(typeof fn == 'function') fn(scope, {
            from: from,
            to: to,
          });
        // }
        if(origSelect) return origSelect.apply(this, arguments);
      };
    }
  };
});