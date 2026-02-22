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

#region INVENTORY
    for(i=0;i<999;i+=1) {
        inventory[i] = -1;
    }
    inventory[0] = global.item_coin_purse;
    inventory[1] = global.item_potion;
    inventory[2] = global.item_hi_potion;
    inventory[3] = global.item_mega_potion;
    inventory[4] = global.item_antidote;
#endregion

#region PARTY DATA

    party[0] = -1;
    party[1] = -1;
    party[2] = -1;
    party[3] = -1;

    unit_main = 
        {
            name : "Player", class : "Tourist", status : "Healthy",
            icon : s_image, subimg : 0,
            lv : 1, xp : 0, next : 999,
            hp : 100, dmg : 99, d_dmg : 0, mp : 10, drn : 0, d_drn : 0,
            vig : 999, str : 99, wis : 9, int : 999, agi : 999,
            wpn : -1, arm : -1, acc : -1
        }
    the_duck = 
        {
            name : "Pekingente", class : "Paukant", status : "Healthy",
            icon : s_image, subimg : 0,
            lv : 1, xp : 0, next : 999,
            hp : 100, dmg : 99, d_dmg : 0, mp : 10, drn : 0, d_drn : 0,
            vig : 999, str : 999, wis : 999, int : 999, agi : 999,
            wpn : -1, arm : -1, acc : -1
        }
    //possibly consider removing d_ stats and having those be stored in the party array?

    party[0] = unit_main;
    party[1] = the_duck;
    party[2] = the_duck;
    party[3] = the_duck;

#endregion