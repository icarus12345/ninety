function Project(opt){
    this.id = opt.id;
    this.items = [];
}
// var ProjecStorage = {};
function ProjectFactory(API,StorageService, $mdDialog,Dialog) {
    var me = this;
    this.clear = function(id){
        // for(var key in sessionStorage){
        //     if(key.indexOf('project-'+(id||''))===0){
        //         delete(sessionStorage[key])
        //         console.log('clear',id)
        //     }
        // }
        // delete ProjecStorage[id];
        delete StorageService.__storage['project'][id];
    }
    this.clear_all = function(){
        // for(var key in sessionStorage){
        //     if(key.indexOf('project')===0){
        //         delete(sessionStorage[key])
        //     }
        // }
        // ProjecStorage = {}
        StorageService.__storage['project'] = {};
    }
    this.get = function(id,callback){
        try {
            var data = StorageService.get('project',id);
            // var data = ProjecStorage[id];
            if(data) 
                callback(data)
            else
            API.request({
                url: BASE_URL + 'api/project/get',
                data: {
                    id: id
                },
            },function(res){
                if(res.data.code == 1){
                    StorageService.set('project',id,res.data.data)
                    // ProjecStorage[id] = res.data.data;
                    callback(res.data.data)
                } else {
                    $mdDialog.show(
                        $mdDialog.alert()
                            // .parent(angular.element(document.querySelector('#popupContainer')))
                            .clickOutsideToClose(true)
                            .title('Error !')
                            .textContent(res.data.message)
                            .ariaLabel('Alert Dialog')
                            .ok('OK')
                            // .targetEvent(ev)
                    );
                }
            },function(res){
                console.log('GET LIST FAIL:',res)
            })
        } catch (e){
            alert(e.message);
        }
    }
    this.set = function(id,data,callback){
        // ProjecStorage[id] = data;
        StorageService.set('project',id,data);
    }
    this.__page = 1;
    this.__perpage = 100;
    var pending = false;
    this.get_list = function(callback){
        try {
            // if(pending) return;
            console.log('GET LIST');
            var data = StorageService.get('list-project');
            if(data){
                callback(data);
            } else {
                pending = true;
                API.request({
                    url: BASE_URL + 'api/project/gets',
                    data: {
                        page: me.__page,
                        perpage: me.__perpage
                    },
                },function(res){
                    if(res.data.code == 1){
                        StorageService.set('list-project','',res.data.data);
                        callback(res.data.data);
                    } else {
                        Dialog.error(res.data.message);
                    }
                    pending = false;
                },function(res){
                    Dialog.error('GET LIST FAIL');
                    console.log('GET LIST FAIL:',res);
                    pending = false;
                })
            }
        } catch (e){
            alert(e.message);
        }
    }
    this.re_get_list = function(callback){
        StorageService.delete('list-project');
        this.get_list(callback);
    }
    return this;
}
