APP.factory('Helper', function(
	$rootScope,
	$timeout,
	ngDialog,
	$http
	){
	var _storage = {
		data:{}
	}
	_storage.set = function(name,id,val,time){
        id = id || '';
        time = (time || 24*60*60)*1000;
        // var key = name + '-' + id;
        // var data = {
        //     value: val,
        //     expried: new Date().getTime() + time
        // }
        // sessionStorage[key] = angular.toJson(data);


        if(!this.data[name]) this.data[name] = {}
        this.data[name][id] = {
            value: val,
            expried: new Date().getTime() + time
        }
    }
    _storage.get = function(name,id){
        id = id || '';
        // var key = name + '-' + id;
        // var data = angular.fromJson(sessionStorage[key]);
        // if(data && new Date().getTime()<data.expried) return data.value;
        // return undefined;
        if(!this.data[name]) this.data[name] = {}
        var data = this.data[name][id];
        if(data && new Date().getTime() < data.expried){
            return data.value;
        }
        return undefined;
    }
    _storage.delete = function(name,id){
        id = id || '';
        if(!this.data[name]) this.data[name] = {}
        delete(this.data[name][id]);
    }
    _storage.clear = function(){
        this.data = {};
    }


	var alertDefSetting = {
		title: 'Cool!',
		message:''
	};
	var confirmDefSetting = {
		title: 'Confirm ?',
		oktext: 'Yes',
		canceltext: 'Cancel',
		message:''
	};
	var helper = {
		storage : _storage,
		alert : function(opt){
			if(typeof opt == 'string'){
				opt = {
					message: opt
				}
			}
			opt = angular.extend({},alertDefSetting,opt);
			ngDialog.openConfirm({
		        template: 'template/widget/dialog.html',
                className: 'ngdialog-theme-default',
        		controller: ['$scope', '$timeout', function ($scope, $timeout) {
        			$scope.title = opt.title
        			$scope.message = opt.message
                    $scope.$on('$destroy', function () {
                    });
                }],
		        // preCloseCallback: function(value) {

		        //     var nestedConfirmDialog = ngDialog.openConfirm({
		        //     });

		        //     return nestedConfirmDialog;
		        // },
		    })
		    .then(function(value){
		        console.log('resolved:' + value);
		        // Perform the save here
		    }, function(value){
		        console.log('rejected:' + value);
		        if(typeof opt.onclose == 'function') opt.onclose();
		    });
		},
		warning: function(opt){
			opt.title =opt.title || 'Oops!';
			helper.alert(opt);
		},
		confirm : function(opt){
			opt = angular.extend({},confirmDefSetting,opt);
			ngDialog.openConfirm({
		        template: 'template/widget/confirm.html',
                className: 'ngdialog-theme-default',
        		controller: ['$scope', '$timeout', function ($scope, $timeout) {
        			$scope.title = opt.title
        			$scope.oktext = opt.oktext
        			$scope.canceltext = opt.canceltext
        			$scope.message = opt.message
                    $scope.$on('$destroy', function () {
                    });
                }],
		        // preCloseCallback: function(value) {

		        //     var nestedConfirmDialog = ngDialog.openConfirm({
		        //     });

		        //     return nestedConfirmDialog;
		        // },
		    })
		    .then(function(value){
		        if(typeof opt.onconfirm == 'function') opt.onconfirm();
		    }, function(value){
		        console.log('rejected:' + value);
		        if(typeof opt.oncancel == 'function') opt.oncancel();
		    });
		},
		terms: function(){
			var that = this;
			ngDialog.openConfirm({
		        template: 'template/widget/terms.html',
                className: 'ngdialog-theme-default',
        		controller: ['$scope', '$timeout', function ($scope, $timeout) {
        			if(that.terms_condition){
        				$scope.terms_condition = that.terms_condition
        			}else{
	        			$http({
		                    url: BASE_URL + 'api/auth/terms',
		                    method: 'POST',
		                    data: {
		                        id: 47
		                    },
		                    headers: {
		                        'Content-Type': 'application/json',

		                    },
		                    
		                }).then(function(res){
		                    $scope.terms_condition = res.data.data;
		                    that.terms_condition = res.data.data;
		                },function(res, status,headers){
		                    that.alert('Fail to load term and condition');
		                })
		            }
                    $scope.$on('$destroy', function () {
                    });
                }],
		    })
		},
	}
	return	helper;
});