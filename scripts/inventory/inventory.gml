function clean_inventory(){
    var l = ds_list_create();
    for(i=0;i<999;i+=1) {
        if o_system.inventory[i] != -1 {
            if o_system.inventory[i].amount > 0 {
                ds_list_add(l,o_system.inventory[i]);
            }
            o_system.inventory[i] = -1;
        }
    }
    for(i=0;i<ds_list_size(l);i+=1) {
        o_system.inventory[i] = ds_list_find_value(l,i);
    }
    ds_list_destroy(l);
}

function filter_weapons(cull){
    var _t = o_system.party[o_system.unit_select].wpn_typ;
    var _list = ds_list_create();
    for(i=0;i<999;i+=1) {
        if o_system.inventory[i] != -1 {
            if o_system.inventory[i].equip != -1 {
                if o_system.inventory[i].equip.type = _t {
                    if cull = 1 {
                        if o_system.inventory[i].amount - o_system.inventory[i].equip.equipped > 0 {
                            ds_list_add(_list,o_system.inventory[i]);
                        }
                    }
                    else {
                            ds_list_add(_list,o_system.inventory[i]);
                    }
                }
            }
        }
        else {
            i = 9999;
        }
    }
    return(_list);
}

function filter_armor(cull){
    var _t = "arm";
    var _list = ds_list_create();
    for(i=0;i<999;i+=1) {
        if o_system.inventory[i] != -1 {
            if o_system.inventory[i].equip != -1 {
                if o_system.inventory[i].equip.type = _t {
                    if cull = 1 {
                        if o_system.inventory[i].amount - o_system.inventory[i].equip.equipped > 0 {
                            ds_list_add(_list,o_system.inventory[i]);
                        }
                    }
                    else {
                            ds_list_add(_list,o_system.inventory[i]);
                    }
                }
            }
        }
        else {
            i = 9999;
        }
    }
    return(_list);
}

function filter_accessories(cull){
    var _t = "acc";
    var _list = ds_list_create();
    for(i=0;i<999;i+=1) {
        if o_system.inventory[i] != -1 {
            if o_system.inventory[i].equip != -1 {
                if o_system.inventory[i].equip.type = _t {
                    if cull = 1 {
                        if o_system.inventory[i].amount - o_system.inventory[i].equip.equipped > 0 {
                            ds_list_add(_list,o_system.inventory[i]);
                        }
                    }
                    else {
                            ds_list_add(_list,o_system.inventory[i]);
                    }
                }
            }
        }
        else {
            i = 9999;
        }
    }
    return(_list);
}