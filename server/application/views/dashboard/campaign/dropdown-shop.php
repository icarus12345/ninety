<div class="col-xs-12 half shop-list" style="position: relative;z-index: 1">
    <div>Shops</div>
    <div class="pull-bottom list-dropdown">
        <select 
            name="tmp[shop_ids]" multiple="" 
            id="shop_ids"
            class="form-control selectpicker validate[required]"
            data-putto="#frm-err-data-shop_ids"
            data-live-search="true"
            data-size="10"
            data-server-dropdown="1"
            >
            <?php if(is_array($shops)) foreach($shops as $c): ?>
                <option 
                    data-city_id = "<?php echo $c->city_id; ?>"
                    value="<?php echo $c->id; ?>"
                    <?php if (in_array($c->id , $selected_shop_ids)){echo 'selected="1"';} ?>
                    ><?php echo html_escape($c->title); ?></span></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div id="frm-err-data-shop_ids"></div>
</div>