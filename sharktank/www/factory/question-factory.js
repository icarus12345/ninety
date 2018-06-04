function QuestionFactory(API,StorageService,$mdDialog, Dialog) {
    this.get_by_cid = function(param,callback){
        var data = StorageService.get('question',param.pid+'-'+param.cid);
        if(data) 
            callback(data)
        else
        API.request({
            url: BASE_URL + 'api/question/get_by_cid',
            data: {
                cid: param.cid,
                pid: param.pid,
            },
        },function(res){
            if(res.data.code == 1){
                StorageService.set('question',param.pid+'-'+param.cid,res.data.data)
                callback(res.data.data);
            } else {
                Dialog.alert(res.data.message);
            }
        },function(res){
            console.log('FAIL:',res);
            Dialog.alert('Can\'t load data.');
        })
    }
    this.answer_the_question = function(param,callback){
        
        API.request({
            url: BASE_URL + 'api/question/answer_the_question',
            data: param,
            loading: false
        },function(res){
            if(res.data.code == 1){
                StorageService.delete('list-project');
                callback(res.data.data);
            } else {
                Dialog.alert(res.data.message);
            }
        },function(res){
            console.log('FAIL:',res)
            Dialog.alert('Can\'t answer the question.');
        })
    }
    return this;
}
