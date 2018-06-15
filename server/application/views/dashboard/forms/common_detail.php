<?php 
$CI =& get_instance();
$user = $CI->session->userdata('dasbboard_user');
?>
<?php if(empty($entry_setting->data['size'])) : ?>
<div class="-modal-header pull-top pull-bottom">
    <h4>
        <?php echo $entry_setting->title; ?> <small><?php echo $entry_detail?'Edit':'Add'; ?></small>
    </h4>
</div>

<div class="-modal-body pull-top">
<?php endif; ?>
<?php
    $prefix = $entry_setting->data['prefix'];
    function _addField($column,$entry_detail, $entry_setting){
        $CI =& get_instance();
        $user = $CI->session->userdata('dasbboard_user');
        // global $entry_detail;
        $prefix = $entry_setting->data['prefix'];
        $value = $entry_detail->data[$column['name']];
        $name = 'data['.$column['name'].']';
        $id = 'data-'.$column['name'];
            if($column['columndata'] == ''){
                $value = $entry_detail->{$column['name']};
                $name = $column['name'];
                $id = $column['name'];
            } else if($column['columndata'] == '0'){
                $name = 'data['.$column['name'].']';
                $id = 'data-'.$column['name'];
                $value = $entry_detail->data[$column['name']];
            } else if($column['columndata'] == '1'){
                $value = $entry_detail->longdata[$column['name']];
                $name = 'longdata['.$column['name'].']';
                $id = 'longdata-'.$column['name'];
            } 
        if ($column['type'] == 'catetree'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>
                                <?php foreach($column['categories'] as $c): ?>
                                    <option 
                                        data-data="<span style='padding-left: <?php echo $c->level*20; ?>px;'><?php echo $c->title; ?></span>"
                                        <?php if ($c->id == $value){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'map'): ?>
            
            <?php 
                $latlon_columns = (explode(',',$column['name']));
                if($column['columndata'] == ''){
                    $lat = $entry_detail->{$latlon_columns[0]};
                    $latname = $latlon_columns[0];
                    $lon = $entry_detail->{$latlon_columns[1]};
                    $lonname = $latlon_columns[1];
                } else if($column['columndata'] == '0'){
                    $lat = $entry_detail->data[$latlon_columns[0]];
                    $lon = $entry_detail->data[$latlon_columns[1]];
                    $latname = 'data['.$latlon_columns[0].']';
                    $lonname = 'data['.$latlon_columns[1].']';
                } else if($column['columndata'] == '1'){
                    $lat = $entry_detail->longdata[$latlon_columns[0]];
                    $lon = $entry_detail->longdata[$latlon_columns[1]];
                    $latname = 'longdata['.$latlon_columns[0].']';
                    $lonname = 'longdata['.$latlon_columns[1].']';
                }
                
            ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> : <span data-latlonpreview="<?php echo $latname.$lonname; ?>"><?php echo $lat; ?> <?php echo $lon; ?></span></div>
                    <div class="control-group">
                        <div style="height:200px;background:#ccc"
                            data-googlemap="1" 
                            data-lat="<?php echo $lat; ?>" 
                            data-latcolumn="<?php echo $latlon_columns[0]; ?>" 
                            data-lon="<?php echo $lon; ?>"
                            data-loncolumn="<?php echo $latlon_columns[1] ?>"
                            ></div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="<?php echo $latname; ?>" value="<?php echo $lat; ?>">
            <input type="hidden" name="<?php echo $lonname; ?>" value="<?php echo $lon; ?>">
        <?php elseif ($column['type'] == 'treedropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                data-server-dropdown="1"
                                onchange="<?php echo $column['onchange']; ?>"
                                >
                                <option value="">Nothing Selected</option>
                                <?php if(is_array($column['sub_data'])) foreach($column['sub_data'] as $c): ?>
                                    <option 
                                        data-content="<span style='padding-left: <?php echo $c->level*20; ?>px;'><?php echo $c->title; ?></span>"
                                        
                                        value="<?php echo $c->id; ?>"
                                        <?php if ($c->id == $value){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'server-dropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                data-server-dropdown="1"
                                onchange="<?php echo $column['onchange']; ?>"
                                >
                                <option value="">Nothing Selected</option>
                                <?php if(is_array($column['sub_data'])) foreach($column['sub_data'] as $c): ?>
                                    <option 
                                        data-company="<?php echo $c->company_id; ?>"
                                        value="<?php echo $c->id; ?>"
                                        <?php if ($c->id == $value){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'privilege'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select multiple
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>
                                <?php
                                $authority = explode(',',$value);
                                if(empty($authority)) $authority = [];
                                $user_authority = explode(',',$user->ause_authority);
                                $levels = array(
                                    '1' => 'Admin Superviser',
                                    '2' => 'Superviser',
                                    // '3' => 'User'
                                    );
                                foreach ($levels as $key=> $value) {
                                    // if( in_array($key,$user_authority)){
                                    ?>
                                <option value="<?php echo $key; ?>" <?php echo in_array($key,$authority)?'selected=1':'' ; ?>>
                                    <?php echo $value; ?>
                                </option>
                                    <?php
                                    // }
                                } 
                                ?>
                                <?php if(is_array($column['privileges'])) foreach($column['privileges'] as $c): ?>
                                    <option 
                                        value="<?php echo $c->id; ?>"
                                        <?php if( in_array($c->id, $authority) ){echo 'selected="1"';} ?>
                                        ><?php echo $c->name; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'group-server-dropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                data-server-dropdown="1"
                                onchange="<?php echo $column['onchange']; ?>"
                                >
                                <option value="">Nothing Selected</option>
                                <?php if(is_array($column['sub_data'])) foreach($column['sub_data'] as $c): ?>
                                    <option 
                                        data-company="<?php echo $c->company_id; ?>"
                                        value="<?php echo $c->id; ?>"
                                        <?php if ($c->id == $value){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'parent'): ?>
            <?php 
                $id = $entry_detail->{$prefix.'id'};
            ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="0">[Root]</option>
                                <?php $level=-1; ?>
                                <?php if(is_array($column['parents'])) foreach($column['parents'] as $c): ?>
                                    <?php 
                                    if ($c->id == $id){
                                        $level = $c->level;
                                    }
                                    if ($level!=-1 and $c->level <= $level and $c->id != $id){
                                        $level = -1;
                                    }
                                    ?>
                                    <option 
                                        data-content="<span style='padding-left: <?php echo $c->level*20 + 20; ?>px;'><?php echo $c->title; ?></span>"
                                        <?php if ($level!=-1 and $level < $c->level){ echo 'disabled=1';} ?>
                                        <?php if ($c->id == $id){ echo 'disabled=1';} ?>
                                        <?php if ($c->id == $value){echo 'selected="1"';} ?>
                                        value="<?php echo $c->id; ?>"
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'server-multidropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select multiple
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>

                                <?php if(is_array($column['sub_data'])) foreach($column['sub_data'] as $c): ?>
                                    <option 
                                        value="<?php echo $c->id; ?>"
                                        <?php if (in_array($c->id ,$authority)){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'group-server-multidropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select multiple
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>
                                <?php
                                $value = explode(',',$value);
                                 ?>
                                <?php if(is_array($column['sub_data'])) foreach($column['sub_data'] as $c): ?>
                                    <?php
                                    if(!$group){
                                        echo '<optgroup data-groupid="'.$c->group_id.'" label="'.$c->group_title.'">';
                                    } elseif($group != $c->group_title) {
                                        echo '</optgroup></optgroup  label="'.$c->group_title.'">';
                                    }
                                        $group = $c->group_title;
                                    ?>
                                    <option 
                                        value="<?php echo $c->id; ?>"
                                        <?php if (in_array($c->id ,$value)){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                                <?php 
                                if($group){
                                        echo '</optgroup>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'radio'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div class="rdbs">
                            <?php if(is_array($column['data'])) foreach($column['data'] as $c): ?>
                            <label class="rdb">
                                <input 
                                    type="radio" 
                                    class="<?php echo $column['client']; ?>"
                                    data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                    name="<?php echo $name; ?>" 
                                    <?php if ($c['value'] == $value){echo 'checked="1"';} ?>
                                    value="<?php echo $c['value']; ?>"
                                    >
                                <span><?php echo $c['display']; ?></span>
                            </label>
                            <?php endforeach; ?>
                            <div class="clearfix"></div>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'checkbox'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="chks">
                        <label class="chk">
                            <input 
                                type="checkbox" 
                                name="<?php echo $name; ?>" 
                                <?php if ($value){echo 'checked="1"';} ?>
                                value="1"
                                >
                            <span>&nbsp;</span>
                        </label>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'string'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                name="<?php echo $name; ?>"
                                value="<?php echo $value; ?>" >
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'date'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div class="input-append date-picker">
                            <input type="text" 
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-<?php echo $id; ?>"
                                name="<?php echo $name; ?>"
                                id="<?php echo $id; ?>"
                                value="<?php echo $value; ?>"
                                >
                            <span class="add-on input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </div>
                        <div id="frm-err-<?php echo $id; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'datetime'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div class="input-append date-time-picker">
                            <input type="text" 
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-<?php echo $id; ?>"
                                name="<?php echo $name; ?>"
                                id="<?php echo $id; ?>"
                                value="<?php echo $value; ?>"
                                >
                            <span class="add-on input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </div>
                        <div id="frm-err-<?php echo $id; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'stringalias'): ?>
            
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                name="<?php echo $name; ?>"
                                onblur="App.Helper.Alias(this,'<?php echo $name; ?>','<?php echo $prefix; ?>alias')"
                                value="<?php echo $value; ?>" >
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
            <input 
                type="hidden" 
                name="<?php echo $prefix; ?>alias" 
                value="<?php echo $entry_detail->{$prefix.'alias'}; ?>" 
                >
        <?php elseif ($column['type'] == 'text'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <textarea 
                                type="text"
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-data-<?php echo $column['name']; ?>"
                                name="<?php echo $name; ?>"
                                ><?php echo $value; ?></textarea>
                        </div>
                        <div id="frm-err-data-<?php echo $column['name']; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'html'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <textarea 
                                type="text" row="4" 
                                id="<?php echo $id; ?>"
                                data-editor=1
                                class="form-control <?php echo $column['client']; ?>" 
                                data-putto="#frm-err-<?php echo $column['biz']?'long':'';?>data-<?php echo $column['name']; ?>"
                                name="<?php echo $name; ?>"
                                ><?php echo $value; ?></textarea>
                        </div>
                        <div id="frm-err-<?php echo $id; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'image'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom" style="position: relative;">
                    <div style="position: relative;padding-left: 58px">
                        <div><?php echo $column['title']; ?> :</div>
                        <div class="control-group">
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control <?php echo $column['client']; ?>" 
                                    data-putto="#frm-err-<?php echo $id; ?>"
                                    name="<?php echo $name; ?>"
                                    id="<?php echo $id; ?>"
                                    onblur="$('#preview-common-thumb<?php echo $id; ?>').css('background-image','url('+this.value+')')"
                                    value="<?php echo $value; ?>"
                                    >
                                <span class="add-on" onclick="App.KCFinder.BrowseServer('#<?php echo $id; ?>')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frm-err-<?php echo $id; ?>"></div>
                        </div>
                    </div>
                    <div style="position: absolute;left: 0;top: 0;width: 48px;height: 48px;">
                        <div id="preview-common-thumb<?php echo $id; ?>" 
                            style="padding-bottom: 100%;border:1px solid #ccc;background-image:url(<?php echo $value; ?>)" class="cover"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'images'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom" style="position: relative;">
                    <div style="position: relative;">
                        <div><?php echo $column['title']; ?> :</div>
                        <!--
                        <div class="container pull-top">
                            <span class="code cursor" 
                                title="Add new Photo" 
                                onclick="App.Common.choosePhotos('<?php echo $name; ?>')">
                                <i class="fa fa-plus"></i>&nbsp;Add Images
                            </span>
                            &nbsp;&nbsp;
                            <span class="code cursor" 
                                title="Delete all" 
                                onclick="App.Common.deletePhotos('<?php echo $name; ?>')">
                                <i class="fa fa-trash-o"></i>&nbsp;Delete all
                            </span>
                        </div> 
                        -->
                        <?php
                        $imgs = preg_split('/\n|\r\n?/', $value);
                        ?>
                        <ul id="<?php echo $id; ?>" 
                            data-name="<?php echo $name; ?>"
                            data-column="<?php echo $name; ?>"
                            class="sortable ui-sortable image-sortable">
                            <?php foreach ($imgs as $key => $img): ?>
                                <?php if (!empty($img)): ?>
                                    
                                <li data-cdata="<?php echo $img; ?>">
                                    <img class="thumb" src="<?php echo $img; ?>">
                                    <div class="action cursor" onclick="App.Common.deletePhoto(this)">
                                        <i class="fa fa-trash-o"></i>
                                    </div>
                                </li>
                                <?php endif ?>
                            <?php endforeach ?>
                            <li 
                                onclick="App.Common.choosePhotos('<?php echo $name; ?>')"
                                class="ui-state-default ui-state-add ui-disabled-sort"
                                >
                                <i class="fa fa-plus"></i>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        
                        <!--  -->
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'multidropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-<?php echo $id; ?>"
                                -data-live-search="true"
                                multiple=1
                                data-size="10"
                                >
                                <?php if(is_array($column['data']))  foreach($column['data'] as $c): ?>
                                    <option value="<?php echo $c['value']; ?>"
                                        <?php if (in_array($c['value'],$value)){echo 'selected="1"';} ?>
                                        >
                                        <?php echo $c['display']; ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-<?php echo $id; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'dropdown'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="<?php echo $name; ?>" 
                                class="form-control selectpicker <?php echo $column['client']; ?>"
                                data-putto="#frm-err-<?php echo $id; ?>"
                                -data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>
                                <?php if(is_array($column['data'])) foreach($column['data'] as $c): ?>
                                    <option value="<?php echo $c['value']; ?>"
                                        <?php if ($c['value'] == $value){echo 'selected="1"';} ?>
                                        >
                                        <?php echo $c['display']; ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-<?php echo $id; ?>"></div>
                    </div>
                </div>
            </div>
        <?php elseif ($column['type'] == 'list'): ?>
            <div class="col-xs-<?php echo $column['col']; ?> half">
                <div class="pull-bottom">
                    <div><?php echo $column['title']; ?> :</div>
                    
                    <div>
                        <ul id="<?php echo $id; ?>" class="sortable" data-column="<?php echo $column['name']; ?>" data-sid="<?php echo $column['sid']; ?>"></ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="add-sortable-item" data-column="<?php echo $column['name']; ?>" data-sid="<?php echo $column['sid']; ?>">
                        <span class="icon-plus"></span> Add
                    </div>
                </div>
            </div>
        <?php endif; ?>
    <?php
    }
?>
<form name="entry-detail-frm" id="entry-detail-frm" target="integration_asynchronous" class="validation-frm">
    <input 
        type="hidden"
        name="id" 
        value="<?php echo $entry_detail->{$prefix.'id'}; ?>" 
        >
    <?php if(!empty($entry_setting->data['type'])){ ?>
    <input 
        type="hidden" 
        name="<?php echo $prefix; ?>type" 
        value="<?php echo $entry_setting->data['type']; ?>" 
        >
    <?php } ?>
    <?php if($entry_setting->data['groups']): ?>
    <ul class="nav nav-tabs" role="tablist" <?php if(count($entry_setting->data['groups'])<=1) echo 'style="display:none"'; ?>>
        <?php 
        $num = 0;
        foreach ($entry_setting->data['groups'] as $key => $g) :
            ?>
        <li role="presentation" class="<?php echo $key==0?'active':''; ?>">
            <a href="#entry-tab-<?php echo $key; ?>" aria-controls="entry-info-tab" role="tab" data-toggle="tab">
            <?php echo $g['name']; ?>
            </a>
        </li>
        <?php
        $entry_setting->data['groups'][$key]['data'] = array();
        for($i=0;$i<$g['length'];$i++){
            $entry_setting->data['groups'][$key]['data'][] = $entry_setting->data['columns'][$num++];
        }
        endforeach;
        ?>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <?php foreach ($entry_setting->data['groups'] as $key => $g) : ?>
        <div role="tabpanel" class="tab-pane <?php echo $key==0?'active':''; ?>" id="entry-tab-<?php echo $key; ?>">
            <div class="row half pull-top">
            <?php 
            if(
                $key==0 && 
                $entry_setting->data['companyrequired'] == 'true' &&
                empty($user->ause_company_id)
            ) : 
            ?>
                <div class="col-xs-12 half">
                    <div class="pull-bottom">
                        <div>Company :(*)</div>
                        <div class="control-group">
                            <div>
                                <select 
                                    name="company_id" 
                                    class="form-control selectpicker "
                                    data-putto="#frm-err-data-company"
                                    data-live-search="true"
                                    data-size="10"
                                    onchange="App.Common.onCompanyChange()" 
                                    >
                                    <option value="">[Nothing Select]</option>
                                    <?php foreach($entry_setting->data['companies'] as $c): ?>
                                        <option 
                                            <?php if ($c->id == $entry_detail->company_id){echo 'selected="1"';} ?>
                                            value="<?php echo $c->id; ?>"
                                            ><?php echo $c->title; ?></span></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div id="frm-err-data-company"></div>
                        </div>
                    </div>
                </div>
            <?php elseif($entry_setting->data['companyrequired'] == 'true'): ?>
                <input name="company_id" type="hidden" value="<?php echo $user->ause_company_id; ?>">
            <?php endif; ?>
            <?php 
            foreach($g['data'] as $i => $column): 
                _addField($column,$entry_detail, $entry_setting);
            endforeach;
            ?>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
    <?php else: ?>
    
            <div class="row half info-box pull-top">
                
                <?php 
                if($entry_setting->data['columns']):

                foreach($entry_setting->data['columns'] as $i => $column): 
                _addField($column,$entry_detail, $entry_setting);
                endforeach; 
                endif;
                ?>
            </div>
    <?php endif; ?>
</form>
<?php if($entry_detail): ?>
<div class="pre">
Author:<?php echo $users[$entry_detail->{$prefix.'author'}]->ause_name; ?><br/>
Created: <?php echo $entry_detail->{$prefix.'created'}; ?><br/>
Modified: <?php echo $entry_detail->{$prefix.'modified'}; ?>
</div>
<?php endif; ?>
<?php if(empty($entry_setting->data['size'])) : ?>
</div>

<div class="-modal-footer pull-top text-center">
    <?php if($entry_detail && !$onlysave) : ?>
    <button class="btn btn-outline-secondary" onclick="App.Common.Duplicate()">Duplicate</button>
    <?php endif; ?>
    <?php if(!$onlysave) : ?>
    <button class="btn btn-default" onclick="App.Common.Save()">Save</button>
    <button class="btn btn-link" onclick="App.Common.Back()">Back</button>
    <?php else: ?>
    <button class="btn btn-block" onclick="App.Common.Save(true)">Save</button>
    <?php endif; ?>
</div>
<?php endif; ?>