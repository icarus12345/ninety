function StorageFactory() {
    this.__storage = {};
    this.set = function(name,id,val,time){
        id = id || '';
        time = (time || 10*60)*1000;
        // var key = name + '-' + id;
        // var data = {
        //     value: val,
        //     expried: new Date().getTime() + time
        // }
        // sessionStorage[key] = angular.toJson(data);


        if(!this.__storage[name]) this.__storage[name] = {}
        this.__storage[name][id] = {
            value: val,
            expried: new Date().getTime() + time
        }
    }
    this.get = function(name,id){
        id = id || '';
        // var key = name + '-' + id;
        // var data = angular.fromJson(sessionStorage[key]);
        // if(data && new Date().getTime()<data.expried) return data.value;
        // return undefined;
        if(!this.__storage[name]) this.__storage[name] = {}
        var data = this.__storage[name][id];
        if(data && new Date().getTime() < data.expried){
            return data.value;
        }
        return undefined;
    }
    this.delete = function(name,id){
        id = id || '';
        if(!this.__storage[name]) this.__storage[name] = {}
        delete(this.__storage[name][id]);
    }
    this.clear = function(){
        this.__storage = {};
    }
    return this;
}
function DialogFactory($mdDialog, $fancyModal, $cordovaDialogs){
    this.alert = function(message,callback){
        // $cordovaDialogs.alert(message, '', 'OK')
        //     .then(function() {
        //       // callback success
        //     });
        $mdDialog.show(
            $mdDialog.alert()
            // .parent(angular.element(document.querySelector('#popupContainer')))
                .clickOutsideToClose(true)
                // .title('Message')
                .textContent(message)
                .ariaLabel('Alert Dialog')
                .ok('OK')
        );
    }
    this.warning = function(message,callback){
        $mdDialog.show(
            $mdDialog.alert()
                // .parent(angular.element(document.querySelector('#popupContainer')))
                .clickOutsideToClose(true)
                // .title('Warning')
                .textContent(message)
                .ariaLabel('Alert Dialog')
                .ok('OK')
        )
    }
    this.error = function(message,callback){
        $mdDialog.show(
            $mdDialog.alert()
                // .parent(angular.element(document.querySelector('#popupContainer')))
                .clickOutsideToClose(true)
                // .title('Warning')
                .textContent(message)
                .ariaLabel('Alert Dialog')
                .ok('OK')
        )
    }
    this.confirm = function(opt){
        $mdDialog.show(
            $mdDialog.confirm()
            .title(opt.title || 'Confirm ?')
            .textContent(opt.message || '')
            .ariaLabel('Confirm')
            // .targetEvent(ev)
            .ok(opt.oktext || 'OK')
            .cancel(opt.canceltext || 'Cancel')
        ).then(opt.ok, opt.cancel);
    }
    return this;
}
