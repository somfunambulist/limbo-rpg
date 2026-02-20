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

#region //inventory
    for(i=0;i<999;i+=1) {
        inventory[i] = -1;
    }
    inventory[0] = global.item_coin_purse;
    inventory[1] = global.item_potion;
    inventory[2] = global.item_hi_potion;
    inventory[3] = global.item_mega_potion;
    inventory[4] = global.item_antidote;
#endregion

#region //party data

    party[0] = -1;
    party[1] = -1;
    party[2] = -1;
    party[3] = -1;

    unit_main = 
        {
            name :      "Player",
            icon : s_image,
            class :     "Lost Child",
            status :    "Healthy",
            lv :    1,      xp :    0,
            hp :    100,    dmg :   99,
            mp :    10,     drn :   0,
            d_dmg : 0,      d_drn:  0
        }
    the_duck = 
        {
            name :      "Pekingente",
            icon : s_image,
            class :     "Paukant",
            status :    "Healthy",
            lv :    5,      xp :    0,
            hp :    70,     dmg :   0,
            mp :    18,     drn :   0,
            d_dmg : 0,      d_drn:  0
        }

    party[0] = unit_main;
    party[1] = the_duck;
    //party[2] = the_duck;
    //party[3] = the_duck;

#endregion