<div class="col-xs-12 half">
    <div class="pull-bottom">
        <select 
            name="city_id" multiple="" 
            class="form-control selectpicker validate[required]"
            data-putto="#frm-err-data-city_id"
            data-live-search="true"
            data-size="10"
            data-server-dropdown="1"
            >
            <?php if(is_array($provincies)) foreach($provincies as $c): ?>
                <option 
                    value="<?php echo $c->id; ?>"
                    ><?php echo $c->title; ?></span></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div id="frm-err-data-city_id"></div>
</div>
<?php $this->load->view('dashboard/campaign/dropdown-shop'); ?>