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
                                class="form-control selectpicker "
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
                                class="form-control " 
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
                    <div>Email :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control " 
                                data-putto="#frm-err-data-email"
                                name="email"
                                value="<?php echo html_escape($entry_detail->email); ?>" >
                        </div>
                        <div id="frm-err-data-email"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 half">
                <div class="pull-bottom">
                    <div>Contact Person :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control " 
                                data-putto="#frm-err-data-contact-name"
                                name="contact_name"
                                value="<?php echo html_escape($entry_detail->contact_name); ?>" >
                        </div>
                        <div id="frm-err-data-contact-name"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 half">
                <div class="pull-bottom">
                    <div>Phone :</div>
                    <div class="control-group">
                        <div>
                            <input 
                                type="text"
                                class="form-control " 
                                data-putto="#frm-err-data-contact_phone"
                                name="contact_phone"
                                value="<?php echo html_escape($entry_detail->contact_phone); ?>" >
                        </div>
                        <div id="frm-err-data-contact_phone"></div>
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
                                class="form-control " 
                                data-putto="#frm-err-data-contact_address"
                                name="contact_address"
                                value="<?php echo html_escape($entry_detail->contact_address); ?>" >
                        </div>
                        <div id="frm-err-data-contact_address"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 half">
                <div class="pull-bottom">
                    <div>Description :</div>
                    <div class="control-group">
                        <div>
                            <textarea 
                                type="text"
                                class="form-control " 
                                data-putto="#frm-err-data-desc"
                                name="desc"
                                ><?php echo html_escape($entry_detail->desc); ?></textarea>
                        </div>
                        <div id="frm-err-data-desc"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 half">
                <div class="pull-bottom" style="position: relative;">
                    <div style="position: relative;padding-left: 58px">
                        <div>Logo :</div>
                        <div class="control-group">
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control " 
                                    data-putto="#frm-err-logo"
                                    name="logo"
                                    id="logo"
                                    onblur="$('#preview-common-thumblogo').css('background-image','url('+this.value+')')"
                                    value="<?php echo html_escape($entry_detail->logo); ?>"
                                    >
                                <span class="add-on" onclick="App.KCFinder.BrowseServer('#logo')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frm-err-logo"></div>
                        </div>
                    </div>
                    <div style="position: absolute;left: 0;top: 0;width: 48px;height: 48px;">
                        <div id="preview-common-thumblogo" 
                            style="padding-bottom: 100%;border:1px solid #ccc;background-image:url(<?php echo html_escape($entry_detail->logo); ?>)" class="cover"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 half">
                <div class="pull-bottom" style="position: relative;">
                    <div style="position: relative;padding-left: 58px">
                        <div>Image :</div>
                        <div class="control-group">
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control " 
                                    data-putto="#frm-err-image"
                                    name="image"
                                    id="image"
                                    onblur="$('#preview-common-thumbimage').css('background-image','url('+this.value+')')"
                                    value="<?php echo html_escape($entry_detail->image); ?>"
                                    >
                                <span class="add-on" onclick="App.KCFinder.BrowseServer('#image')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frm-err-image"></div>
                        </div>
                    </div>
                    <div style="position: absolute;left: 0;top: 0;width: 48px;height: 48px;">
                        <div id="preview-common-thumbimage" 
                            style="padding-bottom: 100%;border:1px solid #ccc;background-image:url(<?php echo html_escape($entry_detail->image); ?>)" class="cover"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 half">
                <div class="pull-bottom">
                    <div>Content :</div>
                    <div class="control-group">
                        <div>
                            <textarea 
                                type="text" row="4" 
                                id="content"
                                data-editor=1
                                class="form-control " 
                                data-putto="#frm-err-content"
                                name="content"
                                ><?php echo $entry_detail->content; ?></textarea>
                        </div>
                        <div id="frm-err-content"></div>
                    </div>
                </div>
            </div>
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