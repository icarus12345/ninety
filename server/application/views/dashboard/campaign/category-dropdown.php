<div>
    <select multiple
        name="category_id" 
        class="form-control selectpicker validate[required]"
        data-putto="#frm-err-data-category_id"
        data-live-search="true"
        data-size="10"
        data-server-dropdown="1"
        >
        <?php if(is_array($categories)) foreach($categories as $c): ?>
            <?php if(in_array($c->id, $trademark_category_ids)){ ?>
            <option 
                value="<?php echo $c->id; ?>"
                <?php if (in_array($c->id, $campaign_category_ids)){echo 'selected="1"';} ?>
                ><?php echo $c->title; ?></span></option>
            <?php } ?>
        <?php endforeach; ?>
    </select>
</div>
<div id="frm-err-data-category_id"></div>