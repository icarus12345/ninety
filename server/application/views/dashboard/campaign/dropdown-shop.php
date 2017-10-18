<div class="col-xs-12 half shop-list">
    <div class="pull-bottom list-dropdown">
        <select 
            name="shop_ids" multiple="" 
            class="form-control selectpicker validate[required]"
            data-putto="#frm-err-data-shop_ids"
            data-live-search="true"
            data-size="10"
            data-server-dropdown="1"
            >
            <?php if(is_array($shops)) foreach($shops as $c): ?>
                <option 
                    value="<?php echo $c->id; ?>"
                    <?php if (in_array($c->id , $selected_shop_ids)){echo 'selected="1"';} ?>
                    ><?php echo $c->title; ?></span></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div id="frm-err-data-shop_ids"></div>
</div>