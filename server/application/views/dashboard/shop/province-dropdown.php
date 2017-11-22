<div>
    <select 
        name="city_id" 
        class="form-control selectpicker validate[required]"
        data-putto="#frm-err-data-city_id"
        data-live-search="true"
        data-size="10"
        data-server-dropdown="1"
        >
        <option value="">Nothing Selected</option>
        <?php if(is_array($provincies)) foreach($provincies as $c): ?>
            <option 
                value="<?php echo $c->id; ?>"
                <?php if ($c->id == $entry_detail->city_id){echo 'selected="1"';} ?>
                ><?php echo $c->title; ?></span></option>
        <?php endforeach; ?>
    </select>
</div>
<div id="frm-err-data-city_id"></div>