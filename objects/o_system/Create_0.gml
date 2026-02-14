menu = 0;
menu_select = 0;
menu_page = "";
page_category = 0;
page_active = 0;
page_select = 0;

gold = 0;
gametime = 0;

#region //inventory
    for(i=0;i<999;i+=1) {
        inventory[i] = -1;
    }
    inventory[0] = global.item_potion;
    inventory[1] = global.item_antidote;
    inventory[2] = global.item_hi_potion;
    inventory[3] = global.item_mega_potion;
#endregion

#region //party data

    party[0] = -1;
    party[1] = -1;
    party[2] = -1;
    party[3] = -1;

    unit_main = 
        {
            name :      "Player",
            class :     "Lost Child",
            status :    "Healthy",
            lv :    1,      xp :    0,
            hp :    999,     dmg :   0,
            mp :    10,     drn :   0
            
        }
    the_duck = 
        {
            name :      "Pekingente",
            class :     "Paukant",
            status :    "Healthy",
            lv :    5,      xp :    0,
            hp :    70,     dmg :   0,
            mp :    18,     drn :   0
            
        }

    party[0] = unit_main;
    party[1] = the_duck;

#endregion