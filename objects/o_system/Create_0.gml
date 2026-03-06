menu = 0;
menu_select = 0;
menu_page = "";
page_category = 0;
page_active = 0;
page_select = 0;
unit_select = -1;   //which unit is selected on the general party screen
active_item = -1;   //the item struct that is currently controlling the menu
confirm = 0;        //used for basic yes/no selectors, doesnt do anything on its own
back_skip = 0;      //forces the default "back" switch case to skip
hide_items = 0;     //hide main item screen to make room for other stuff

gold = 0;
display_gold = 0;
gametime = 0;

#region INVENTORY/FACETS
    for(i=0;i<999;i+=1) {
        inventory[i] = -1;
        facet_bag[i] = -1;
    }
    inventory[0] = global.item_potion;
    inventory[1] = global.item_coin_purse;
    inventory[2] = global.item_short_sword;
    inventory[3] = global.item_rapierb;
    inventory[4] = global.item_short_swordc;
    inventory[5] = global.item_rapier;
    inventory[6] = global.item_short_swordb;
    inventory[7] = global.item_cloak;
    inventory[8] = global.item_pyjamas;
    inventory[9] = global.item_ruby_ring;

    facet_bag[0] = variable_clone(global.facet_flame);
    facet_bag[1] = variable_clone(global.facet_vigor_plus);
    facet_bag[2] = variable_clone(global.facet_swipe);
    facet_bag[3] = variable_clone(global.facet_flame);
        facet_bag[3].lv = 2;
#endregion

#region PARTY

    party[0] = global.unit_player;
    party[1] = global.unit_pekingente;
    party[2] = -1;
    party[3] = -1;

#endregion