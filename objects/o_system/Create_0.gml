menu = 0;
menu_select = 2;

gold = 0;
gametime = 0;

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
            hp :    30,     dmg :   0,
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