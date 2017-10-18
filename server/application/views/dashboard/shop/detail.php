<?php 
$CI =& get_instance();
$user = $CI->session->userdata('dasbboard_user');
?>
<div class="-modal-header pull-top pull-bottom">
    <h4>
       Shop <small><?php echo $entry_detail?'Edit':'Add'; ?></small>
    </h4>
</div>

<div class="-modal-body pull-top">
    <div class="row half info-box pull-top">
        <form name="entry-detail-frm" id="entry-detail-frm" target="integration_asynchronous" class="validation-frm">
            <input 
                type="hidden"
                name="id" 
                value="<?php echo $entry_detail->{$prefix.'id'}; ?>" 
                >
            <div class="col-xs-6 half">
                <div class="pull-bottom">
                    <div>Trademark :</div>
                    <div class="control-group">
                        <div>
                            <select 
                                name="trademark_id" 
                                class="form-control selectpicker validate[required]"
                                data-putto="#frm-err-data-trademark_id"
                                data-live-search="true"
                                data-size="10"
                                data-server-dropdown="1"
                                >
                                <option value="">Nothing Selected</option>
                                <?php if(is_array($trademarks)) foreach($trademarks as $c): ?>
                                    <option 
                                        value="<?php echo $c->id; ?>"
                                        <?php if ($c->id == $entry_detail->trademark_id){echo 'selected="1"';} ?>
                                        ><?php echo $c->title; ?></span></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div id="frm-err-data-trademark_id"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 half">
                <div class="pull-bottom">
                    <div>Province :</div>
                    <div class="control-group" id="province-box">
                        Loading...
                    </div>
                </div>
            </div>
            <div class="col-xs-6 half">
                <div class="pull-bottom">
                    <div>Title :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control validate[required,minSize[2],maxSize[250]]" 
                                data-putto="#frm-err-data-title"
                                name="title"
                                value="<?php echo html_escape($entry_detail->title); ?>" >
                        </div>
                        <div id="frm-err-data-title"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 half">
                <div class="pull-bottom">
                    <div>Address :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control validate[required,minSize[2],maxSize[250]]" 
                                data-putto="#frm-err-data-address"
                                name="address"
                                value="<?php echo html_escape($entry_detail->address); ?>" >
                        </div>
                        <div id="frm-err-data-address"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 half">
                <div class="pull-bottom">
                    <div>Lat : <span data-latlonpreview="latlon"><?php echo html_escape($entry_detail->lat); ?> <?php echo html_escape($entry_detail->lon); ?></span></div>
                    <div class="control-group">
                        <div style="height:320px;background:#ccc"
                            data-googlemap="1" 
                            data-lat="<?php echo html_escape($entry_detail->lat); ?>" 
                            data-latcolumn="lat" 
                            data-lon="<?php echo html_escape($entry_detail->lon); ?>"
                            data-loncolumn="lon"
                            ></div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="lat" class="validate[required]" value="<?php echo html_escape($entry_detail->lat); ?>">
            <input type="hidden" name="lon" value="<?php echo html_escape($entry_detail->lon); ?>">
        </form>
    </div>
    <?php if($entry_detail): ?>
    <div class="pre">
    Author:<?php echo $users[$entry_detail->{$prefix.'author'}]->ause_name; ?><br/>
    Created: <?php echo $entry_detail->{$prefix.'created'}; ?><br/>
    Modified: <?php echo $entry_detail->{$prefix.'modified'}; ?>
    </div>
    <?php endif; ?>
</div>

<div class="-modal-footer pull-top text-center">
    <?php if($entry_detail && !$onlysave) : ?>
    <!-- <button class="btn btn-outline-secondary" onclick="App.Common.Duplicate()">Duplicate</button> -->
    <?php endif; ?>
    <?php if(!$onlysave) : ?>
    <button class="btn btn-default" onclick="App.Common.Save()">Save</button>
    <button class="btn btn-link" onclick="App.Common.Back()">Back</button>
    <?php else: ?>
    <button class="btn btn-block" onclick="App.Common.Save(true)">Save</button>
    <?php endif; ?>
</div>