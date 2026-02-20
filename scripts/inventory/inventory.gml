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
}