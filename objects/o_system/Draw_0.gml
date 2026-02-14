var menuback = make_colour_rgb(15, 55, 155);
if menu = 1 {
    draw_box(s_box,0,0,320,240,menuback);
    
    #region //party members
        var px = 20; var py = 20; var pm = 0;
        if party[0] != -1 {
            draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+96,py,c_white,party[pm].status);
            draw_monogram(px+36,py+12,c_white,"Level");     draw_monogram(px+78,py+12,c_white,party[pm].lv);        draw_monogram(px+96,py+12,c_white,party[pm].class);
            draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+78,py+24,c_white,string(party[pm].hp-party[pm].dmg)+"/"+string(party[pm].hp));
            draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+78,py+36,c_white,string(party[pm].mp-party[pm].drn)+"/"+string(party[pm].mp));
            }
        px = 20; py = 72; pm = 1;
        if party[1] != -1 {
            draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+96,py,c_white,party[pm].status);
            draw_monogram(px+36,py+12,c_white,"Level");     draw_monogram(px+78,py+12,c_white,party[pm].lv);        draw_monogram(px+96,py+12,c_white,party[pm].class);
            draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+78,py+24,c_white,string(party[pm].hp-party[pm].dmg)+"/"+string(party[pm].hp));
            draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+78,py+36,c_white,string(party[pm].mp-party[pm].drn)+"/"+string(party[pm].mp));
            }
        
        px = 20; py = 124; pm = 2;
        if party[2] != -1 {
            draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+96,py,c_white,party[pm].status);
            draw_monogram(px+36,py+12,c_white,"Level");     draw_monogram(px+78,py+12,c_white,party[pm].lv);        draw_monogram(px+96,py+12,c_white,party[pm].class);
            draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+78,py+24,c_white,string(party[pm].hp-party[pm].dmg)+"/"+string(party[pm].hp));
            draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+78,py+36,c_white,string(party[pm].mp-party[pm].drn)+"/"+string(party[pm].mp));
            }
        
        px = 20; py = 176; pm = 3;
        if party[3] != -1 {
            draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+96,py,c_white,party[pm].status);
            draw_monogram(px+36,py+12,c_white,"Level");     draw_monogram(px+78,py+12,c_white,party[pm].lv);        draw_monogram(px+96,py+12,c_white,party[pm].class);
            draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+78,py+24,c_white,string(party[pm].hp-party[pm].dmg)+"/"+string(party[pm].hp));
            draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+78,py+36,c_white,string(party[pm].mp-party[pm].drn)+"/"+string(party[pm].mp));
            }
    #endregion
    
    #region //menu options
        draw_box(s_box,219,8,93,96,menuback);
        draw_monogram(235,16,c_white,"Items\nMagic\nEquipment\nFacets\nParty\nJournal\nConfig")
        draw_pointer(227,16+menu_select*12,3,c_white);
    #endregion
    
    #region //general info
        draw_box(s_box,219,108,93,60,menuback);
        draw_monogram(227,116,c_white,"Gold"); draw_set_halign(fa_right); draw_monogram(305,116,c_white,string(gold)+"g"); draw_set_halign(fa_left);
        var hour = floor(gametime/60/60/60); var minute = floor(gametime/60/60-hour*60*60); var second = floor(gametime/60-hour*60*60-minute*60);
        if hour < 10 {hour = "0"+string(hour)}; if minute < 10 {minute = "0"+string(minute)}; if second < 10 {second = "0"+string(second)};
        draw_monogram(227,128,c_white,"Time"); draw_set_halign(fa_right); draw_monogram(305,128,c_white,string(hour)+":"+string(minute)+":"+string(second)); draw_set_halign(fa_left);
        draw_monogram(227,140,c_white,"Location\nLocation");
    #endregion
    
    //draw_box(s_box,155,180,165,60,menuback);
    //draw_box(s_box,0,180,159,60,menuback);
    //draw_monogram(8,188,c_white,"12letterName 999/999 999\n12letterName 999/999 999\n12letterName 999/999 999\n12letterName 999/999 999");
    //draw_monogram(163,188,c_white,"Enemy A\nEnemy B\nEnemy C\nEnemy D");
    //draw_box(s_box,83,168,63,72,menuback);
    }