
var NUM_SERIES = 1;
var hsl_colors = [
    [187,100,30],
    [187,100,40],
    [187,100,48],
    [187,100,48],
    [187,100,48],
    [187,100,48],
    [187,100,48],
    [187,100,48],
];
function Category(opt){
    var SCORE_LEVEL = [2,3,5];
    // var SCORE_LEVEL = [2.5,-1,5];
    var SCORE_DATA = [1.5,2.5,4];
    // var SCORE_DATA = [0,1,2,3,4,5];
    var NODATACOMMENT = "This section don't have comment.";
    var me = this;
    this.id = opt.id || 0;
    this.title = opt.title || '';
    this.desc = opt.desc || '';
    this.lower = opt.lower || '';
    this.medium = opt.medium || '';
    this.higher = opt.higher || '';
    this.parent_id = opt.parent_id || undefined;

    var arrayColors = [
        "156, 39, 176",
        "33, 150, 243",
        "255, 235, 59",
        "255, 152, 0",
        "121, 85, 72",
        "148, 159, 177",
        "255, 214, 0"
    ];
    var colors = [ '#9C27B0', '#2196F3', '#FFEB3B', '#FF9800', '#795548', '#607D8B', '#FFD600'];
    // var colors = arrayColors.map(function(color){
    //     return 'rgb(' + color + ')'
    // })
    var chart_options = {
        // width:320,
        // height:320,
        // maintainAspectRatio: true,
        // responsive:false,
        layout: {
            padding: {
                left: 14,
                right: 14,
                top: 14,
                bottom: 14
            }
        },
        animation: false,
        backgroundColor: '',
        fill:false,
        line:{
            lineTension:0
        },
        startAngle: 0,
        legend:{
            display: false,
            fullWidth: true,
            position:'top',
            labels:{
                align: 'start',
                // generateLabels: function(chart){
                //     chart.legend.afterFit = function () {
                //       var width = this.width; // guess you can play with this value to achieve needed layout
                //       this.lineWidths = this.lineWidths.map(function(){return width;});

                //     };
                // }
            }
        },  
        scale: {
            pointLabels:{
                display:true,
                circular: true,
                backgroundColor: '#000',
                borderColor: '#000',
                fontColor: '#fff',
                radius: 12,
                fontSize: 12
            },
            gridLines: {
                display:true,
                circular: true,
                fill:true,
                fillColor:[
                    // "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    '#d5e5c6',
                    '#f5f0e2',
                    '#f2cac8',
                    '#f2cac8',
                    ],
                drawOnChartArea: true,
                color: [
                    // "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    "rgba(0, 0, 0, 0)",
                    ],
            },  
            
            scaleLabel:{
                display:false
            },
            type: 'radialLinear',
            ticks: {
                display: false,
                stepSize: 1,
                maxTicksLimit: 5,
                suggestedMax:5,
                // suggestedMin:0,
                max:5,
                beginAtZero: true
            }
        }
    };
    this.toggle_serie = function (i){
        console.log('Toggle')
        if(this.chart_info.dataset_override[i].display!== false){
            this.chart_info.dataset_override[i].display= false;

            this.chart_info.dataset_override[i].backgroundColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].borderColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].fillColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].strokeColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].pointColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].pointHighlightStroke = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].pointBorderColor = 'rgba(0,0,0,0)';
            this.chart_info.dataset_override[i].pointBackgroundColor = 'rgba(0,0,0,0)';
        } else {
            this.chart_info.dataset_override[i].display= true;
            delete(this.chart_info.dataset_override[i].backgroundColor)
            delete(this.chart_info.dataset_override[i].borderColor)
            delete(this.chart_info.dataset_override[i].fillColor)
            delete(this.chart_info.dataset_override[i].strokeColor)
            delete(this.chart_info.dataset_override[i].pointColor)
            delete(this.chart_info.dataset_override[i].pointHighlightStroke)
            delete(this.chart_info.dataset_override[i].pointBorderColor)
            delete(this.chart_info.dataset_override[i].pointBackgroundColor)
        }
        // if(this.chart_info.colors[i] == colors[i]){
        //     this.chart_info.colors[i] = 'rgba(0,0,0,0)';
        // } else {
        //     this.chart_info.colors[i] = colors[i]
        // }
    }
    this.init = function(){
        try{
            this.score = 0;
            this.scores = [];
            this.sum_score = 0;
            this.sum_scores = [];
            this.sum_global_score=0;
            this.count_question=0;
            this.count_answered=0;
            this.count_answereds = [];
            this.process=0;
            this.level = this.level || 0;
            this.comment = NODATACOMMENT;
            var _series = [];
            var _series_data = [];
            var _dataset_override = [];
            if(SHOW_GLOBAL) _dataset_override = [{}];
            if(SHOW_GLOBAL) _series_data = [[]];
            if(SHOW_GLOBAL) _series = ['Global'];
            for(var I = 0;I<NUM_SERIES; I++){
                this.scores.push(0);
                this.sum_scores.push(0);
                this.count_answereds.push(0);
                _series_data.push([]);
                if(I==0 && SHOW_GLOBAL) _series.push('Goal');
                else _series.push(I+'');
                _dataset_override.push({});
            }
            if(this.questions){
                // Count Questions
                this.count_question = this.questions.length;
                // Sum GlobalScore
                this.sum_global_score = this.questions.reduce(function(sum, q) {
                        var score = 0;
                        // if(q.global == 0) score = SCORE_DATA[0];
                        // if(q.global == 1) score = SCORE_DATA[1];
                        // if(q.global == 2) score = SCORE_DATA[2];
                        // if(q.global == 3) score = SCORE_DATA[3];
                        // if(q.global == 4) score = SCORE_DATA[4];
                        if(+q.global>=0){
                            score = SCORE_DATA[+q.global];
                        }
                    return sum + score; 
                }, 0);
                if(this.count_question>0)
                    this.global_score = this.sum_global_score/this.count_question;


                
                for(var I = 0;I<NUM_SERIES; I++){
                    // Count Answereds
                    this.count_answereds[I] =
                        this.questions.reduce(function(sum, q) {
                            return sum + (q.answered[I]>=0?1:0); 
                        }, 0)
                    ;
                    // Sum Score
                    this.sum_scores[I] =
                        this.questions.reduce(function(sum, q) {
                                var score = 0;
                                // q.comment = 'You have not completed this section';
                                // if(q.answered[I] == 0){
                                //     score = SCORE_LEVEL[0];
                                //     q.comment = q.lower || NODATACOMMENT;
                                // }
                                // if(q.answered[I] == 1){
                                //     score = SCORE_LEVEL[1];
                                //     q.comment = q.medium || NODATACOMMENT;
                                // }
                                // if(q.answered[I] == 2){
                                //     score = SCORE_LEVEL[2];
                                //     q.comment = q.higher || NODATACOMMENT;
                                // }
                                if(+q.answered[I]>=0){
                                    score = SCORE_DATA[+q.answered[I]]
                                }
                                if(I==0){
                                    q.score = score;
                                    q.comment = 'You have not completed this section';
                                    q.comment_class = 'comment-none';
                                    if(q.score>0){
                                        if(q.score < SCORE_LEVEL[0]){
                                            q.comment = q.lower || NODATACOMMENT;
                                            q.comment_class = 'comment-lower';
                                        } else if(q.score < SCORE_LEVEL[1]){
                                            q.comment = q.medium || NODATACOMMENT;
                                            q.comment_class = 'comment-medium';
                                        } else {
                                            q.comment = q.higher || NODATACOMMENT;
                                            q.comment_class = 'comment-higher';
                                        }
                                    }
                                }
                            return sum + score; 
                        }, 0)
                    ;
                    if(this.count_answereds[I] > 0){
                        this.scores[I] = this.sum_scores[I]/this.count_answereds[I];
                    }
                }
                this.count_answered = this.count_answereds[0];
                this.sum_score = this.sum_scores[0];

                
                this.score = this.scores[0];

                this.comment = 'You have not completed this section';
                this.comment_class = 'comment-none';
                if(this.count_answered == this.count_question){
                    if(this.score < SCORE_LEVEL[0]){
                        this.comment = this.lower || NODATACOMMENT;
                        this.comment_class = 'comment-lower'
                    } else if(this.score < SCORE_LEVEL[1]){
                        this.comment = this.medium || NODATACOMMENT;
                        this.comment_class = 'comment-medium'
                    } else {
                        this.comment = this.higher || NODATACOMMENT;
                        this.comment_class = 'comment-higher'
                    }
                }
                
                // Chart Data
                var _goalData = [];
                var _globalData = [];
                var _labels = [];
                for(var J in this.questions){
                    var q = this.questions[J];
                    
                    var global_score = 0;

                    // if(q.global == 0) global_score = SCORE_LEVEL[0];
                    // if(q.global == 1) global_score = SCORE_LEVEL[1];
                    // if(q.global == 2) global_score = SCORE_LEVEL[2];
                    // if(q.global == 3) global_score = SCORE_LEVEL[3];
                    // if(q.global == 4) global_score = SCORE_LEVEL[4];
                    if(+q.global>=0){
                        global_score = SCORE_DATA[+q.global];
                    }
                    _labels.push(+J+1);
                    _goalData.push(score);
                    _globalData.push(global_score);
                    if(SHOW_GLOBAL)  _series_data[0].push(global_score);
                    for(var I = 0;I<NUM_SERIES; I++){
                        var score = 0;
                        // if(q.answered[I] == 0) score = SCORE_LEVEL[0];
                        // if(q.answered[I] == 1) score = SCORE_LEVEL[1];
                        // if(q.answered[I] == 2) score = SCORE_LEVEL[2];
                        // if(q.answered[I] == 3) score = SCORE_LEVEL[3];
                        // if(q.answered[I] == 4) score = SCORE_LEVEL[4];
                        if(+q.answered[I]>=0){
                            score = SCORE_DATA[+q.answered[I]];
                        }
                        if(SHOW_GLOBAL) _series_data[I + 1].push(score);
                        else _series_data[I].push(score);
                    }
                }
                this.chart_info = {
                    options: chart_options,
                    colors : colors,
                    labels: _labels,
                    legends:_series,
                    // legends: ['Goal','Global'],
                    data:_series_data,
                    // data:[_globalData,_goalData],
                    dataset_override:_dataset_override
                    // dataset_override:[{},{}]
                };
                // Setting Question Chart

                this.chart_info.options.scale.gridLines.circular = false;
                // this.chart_info.options.scale.gridLines.fillColor[2] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[3] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[4] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[5] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[0] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[1] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[2] = "rgba(0, 0, 0, .1)";
                // this.chart_info.options.scale.gridLines.color[3] = "rgba(0, 0, 0, .1)";
                // this.chart_info.options.scale.gridLines.color[4] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[5] = "rgba(0, 0, 0, .1)";
                // this.chart_info.options.scale.gridLines.fillColor[1] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[2] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[3] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.fillColor[4] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[0] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[0] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[1] = "rgba(0, 0, 0, .1)";
                // this.chart_info.options.scale.gridLines.color[2] = "rgba(0, 0, 0, .1)";
                // this.chart_info.options.scale.gridLines.color[3] = "rgba(0, 0, 0, 0)";
                // this.chart_info.options.scale.gridLines.color[4] = "rgba(0, 0, 0, .1)";
            }else if(this.items){
                // Build Data
                for(var c in this.items){
                    this.items[c].parent = this;
                    this.items[c].level = this.level+1;
                    this.items[c].init();
                }

                // Count Questions
                this.count_question = this.items.reduce(function(sum, c) { 
                    return sum + c.count_question;  
                }, 0);
                // Sum Global Score
                this.sum_global_score = this.items.reduce(function(sum, c) {
                    return sum + c.sum_global_score; 
                }, 0);
                if(this.count_question>0)
                    this.global_score = this.sum_global_score/this.count_question;
                

                for(var I = 0;I<NUM_SERIES; I++){
                    // Count Answereds
                    this.count_answereds[I] =
                        this.items.reduce(function(sum, c) {
                            return sum + c.count_answereds[I]; 
                        }, 0)
                    ;
                    // Sum Score
                    this.sum_scores[I] =
                        this.items.reduce(function(sum, c) {
                            return sum + c.sum_scores[I]; 
                        }, 0)
                    ;
                    if(this.count_answereds[I] > 0){
                        this.scores[I] = this.sum_scores[I] / this.count_answereds[I];
                    }
                }

                this.count_answered = this.count_answereds[0];
                this.sum_score = this.sum_scores[0];
                this.score = this.scores[0];

                this.comment = 'You have not completed this section';
                this.comment_class = 'comment-none';
                if(this.count_answered == this.count_question){
                    if(this.score < SCORE_LEVEL[0]){
                        this.comment = this.lower || NODATACOMMENT;
                        this.comment_class = 'comment-lower';
                    } else if(this.score < SCORE_LEVEL[1]){
                        this.comment = this.medium || NODATACOMMENT;
                        this.comment_class = 'comment-medium';
                    } else {
                        this.comment = this.higher || NODATACOMMENT;
                        this.comment_class = 'comment-higher';
                    }
                }
                
                // Chart Data
                var items = this.items;
                var _goalData = [];
                var _globalData = [];
                var _labels = [];
                for(var J in items){
                    _labels.push(+J+1);
                    _goalData.push(items[J].score);
                    _globalData.push(items[J].global_score);
                    if(SHOW_GLOBAL) _series_data[0].push(items[J].global_score);
                    for(var I = 0;I<NUM_SERIES; I++){
                        if(SHOW_GLOBAL) _series_data[I + 1].push(items[J].scores[I]);
                        else _series_data[I].push(items[J].scores[I]);
                    }
                }
                this.chart_info = {
                    options: chart_options,
                    colors : colors,
                    labels: _labels,
                    legends:_series,
                    // legends: ['Goal','Global'],
                    data:_series_data,
                    // data:[_globalData,_goalData],
                    dataset_override:_dataset_override
                    // dataset_override:[{},{}]
                };
            }else{
                var _goalData = [];
                var _globalData = [];
                var _labels = [];
                this.chart_info = {
                    options: chart_options,
                    colors : colors,
                    labels: _labels,
                    legends:_series,
                    data:_series_data,
                    dataset_override:_dataset_override
                };
            }
            // Process bar
            if(this.count_question>0){
                this.process = this.count_answered/this.count_question;
            }
        }catch(e){
            Dialog.alert('Error when init category.' + e.message);
        }
    }
    this._get_image = function(all_user){
        try{
            var datasets = [];
            for(var i in this.chart_info.data){
                if(!all_user && datasets.length==2){
                    break;
                }
                var rgb = arrayColors[i];
                datasets.push({
                    'label': '',
                    'data': this.chart_info.data[i],
                    // 'fill': "false",
                    // 'backgroundColor': "rgba(0,0,0,0)",
                    'borderColor': "rgba(" + rgb + ",1)",
                    // 'borderColor': colors[i],
                    'pointBackgroundColor': "rgba(" + rgb + ",1)",
                    'pointHoverBackgroundColor': "rgba(" + rgb + ",0.8)",
                    'pointBorderColor': "#fff",
                    'pointHoverBorderColor': "rgba(" + rgb + ",1)",
                })
            }
            var config = {
                type: 'radar',
                data: {
                    labels: this.chart_info.labels,
                    datasets: datasets
                },
                options: chart_options,
                // color: colors
            };
            var div = document.createElement('div');
            div.style.position='absolute';
            div.style.width='100%';
            document.body.appendChild(div)
            var canvas = document.createElement('canvas');
            div.appendChild(canvas)
            canvas.width=320
            canvas.style.width='320px'
            canvas.height=320
            canvas.style.height='320px'

            var radachart = new Chart(canvas, config);
            var resizedCanvas = document.createElement("canvas");
            var resizedContext = resizedCanvas.getContext("2d");
            resizedCanvas.height = "320";
            resizedCanvas.width = "320";
            resizedContext.beginPath();
            resizedContext.rect(0, 0, 320, 320);
            resizedContext.fillStyle = "#ffffff";
            resizedContext.fill();
            resizedContext.drawImage(canvas, 0, 0, 320, 320);
            var url = resizedCanvas.toDataURL('image/jpeg',.6);
            document.body.removeChild(div);
            return url;
        }catch(e){
            Dialog.alert('Error when get Image.' + e.message);
        }
    }
    this._get_info = function(opt){
        var items;
        if(this.items){
            if(this.items){
                items = this.items.map(function(c){
                    return {
                        title: c.title,
                        comment: c.comment,
                        comment_class: c.comment_class,
                        score: c.score,
                    }
                })
            }
        }else if(this.questions){
            items = this.questions.map(function(q){
                return {
                    title: q.title,
                    comment: q.comment,
                    comment_class: q.comment_class,
                    score: q.score,
                }
            })
        }
        return {
            level: this.level,
            title: this.title,
            desc: this.desc,
            comment: this.comment,
            comment_class: this.comment_class,
            score: this.score,
            image: this._get_image(opt.all_user),
            items: items
        }
    }
    this.get_infos = function(opt){
        var data = [];
        data.push(this._get_info(opt));
        // console.log(this)
        if(this.items){
            this.items.map(function(c){
                // if(c.items){
                    var sdata = c.get_infos(opt);
                    for(var i in sdata){
                        data.push(sdata[i]);
                    }
                // }
            })
        }
        return data;
    }
    this._set_color = function(hsl){
        try{
            this._color = hsl;
            if(this.items){
                this.items.map(function(c,i){
                    c._set_color([
                        hsl[0],
                        hsl[1],
                        hsl[2]+4 + i*4,
                        ]);
                })
            }
        } catch(e){
            alert('Error when set color:' + e.message)
        }
    }
    this.color = function(){
        try{
            return 'hsla(' + this._color[0] + ',' + this._color[1] + '%,' + this._color[2] + '%,.9)';
        } catch(e){
            alert('Error when get color:' + e.message)
        }
    }
}
function CategoryFactory(API,StorageService, $mdDialog, Dialog) {
    var me = this;
    this.get_by_id = function(param,callback){
        var data = StorageService.get('category',param.cid);
        if(data) 
            if(typeof callback == 'function') callback(data)
        else
        API.request({
            url: BASE_URL + 'api/category/get_by_id',
            data: {
                id: param.cid,
                pid: param.pid,
            },
        },function(res){
            if(res.data.code == 1){
                StorageService.set('category',param.cid,res.data.data)
                if(typeof callback == 'function') callback(res.data.data);

            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            Dialog.error('Fail to get Category');
            console.log('GET LIST FAIL:',res)
        })
    }
    this.clear_category = function(){
        // for(var key in sessionStorage){
        //     if(key.indexOf('category')===0){
        //         delete(sessionStorage[key])
        //     }
        // }
        StorageService.__storage['category'] = {};
    }

    this.get_list_category = function(callback){
        var data = StorageService.get('list_category','');
        if(data) {
            me.build(data);
            if(typeof callback == 'function') callback(data)
        }else
        API.request({
            url: BASE_URL + 'api/category/get_list',
            data: {
            },
        },function(res){
            if(res.data.code == 1){
                StorageService.set('list_category','',res.data.data)
                me.build(res.data.data);
                if(typeof callback == 'function') callback(res.data.data)
            } else {
                Dialog.error(res.data.message);
            }
        },function(res){
            Dialog.error('Fail to get List Category');
            console.log('GET LIST FAIL:',res)
        })
    }
    this.build = function(data){
        try{
            var items = data.items;
            this.rootId = items[0].id;
            this._categories = {
            };
            var questions = data.questions;
            this.questions = {}
            for(var i = 0; i<items.length;i++){
                this._categories[items[i].id] = new Category(items[i]);
            }
            for(var i = 0; i<questions.length;i++){
                var q = questions[i];
                this.questions[q.id] = q;
                var c = q.category_id;
                var cat = this._categories[c];
                if(!cat.questions) cat.questions = [];
                    cat.questions.push(q);
            }
            for(var c in this._categories){
                var cat = this._categories[c];
                var pcat = this._categories[cat.parent_id];
                if(pcat){
                    cat.parent = pcat;
                    if(!pcat.items) pcat.items = [];
                    pcat.items.push(cat);
                }
            }
            this.set_answereds();
            //this._categories[0].init();
        }catch(e){
            Dialog.alert('Error when build category.' + e.message);
        }
    }
    this.clear_answered = function(){
        for(var q in this.questions){
            this.questions[q].answered = [];
        }
    }
    this.set_answereds = function (answereds){
        if(answereds == this.answereds) {
            console.log('STOP')
            return;
        }
        if(answereds) this.answereds = answereds;
        if(this._categories){
            // build
            this.clear_answered();
            NUM_SERIES = this.answereds.length;
            for(var i = 0;i<this.answereds.length;i++){
                var anseds = this.answereds[i];
                for(var key in anseds){
                    var ans = anseds[key];
                    var qid = ans.qid;
                    this.questions[qid].answered[i] = ans.ans;
                }
                // this.questions[qid].answers[answered].answered = true;
            }
            this._categories[this.rootId].init();
            if(this._categories[this.rootId]) this._categories[this.rootId].items.map(function(c, i){
                c._set_color(hsl_colors[i]);
            });
        }
    }
    this._get = function(id,callback){

    }
    this.get = function(id, callback){
        if(!this._categories){
            this.get_list_category(function(){
                if(id==0) id = me.rootId;
                var data = me._categories[id];
                if(typeof callback == 'function') callback(data);
            })
        } else {
            if(id==0) id = this.rootId;
            var data = this._categories[id];
            if(typeof callback == 'function') callback(data);
        }
    }
    this.export = function(opt, callback){
        try{
            var items = this._categories[this.rootId].get_infos(opt.setting);
            if(items.length>0){
                items[0].title = opt.project_info.title;
                items[0].desc = opt.project_info.desc;
            }
            API.request({
                url: BASE_URL + 'api/project/export',
                data: {
                    id: opt.project_info.id,
                    info: opt.project_info,
                    setting: opt.setting,
                    items: items,
                    show_global: SHOW_GLOBAL
                },
            },function(res){
                if(res.data.code == 1){
                    if(typeof callback == 'function') callback(res.data)
                } else {
                    Dialog.error(res.data.message);
                }
            },function(res){
                Dialog.error('Fail to export');
                console.log('Export FAIL:',res)
            })
        }catch(e){
            Dialog.alert('Error when export pdf.' + e.message);
        }
    }
    return this;
}
