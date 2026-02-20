var menuback = make_colour_rgb(15, 55, 155);
if menu = 1 { 
    #region //display chunk
        switch(menu_page) {
            case "" :
                draw_box(s_box,0,0,218,240,menuback);
                var px = 17; var py = 20; var pm = 0; 
                if unit_select != -1 { py = 37; }
                if party[0] != -1 {
                    draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
                    draw_sprite(party[pm].icon,0,px,py+12);
                    var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
                    draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
                    var _hp = party[pm].hp-party[pm].d_dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
                    var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
                    var _mp = party[pm].mp-party[pm].d_drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
                    _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
                }
                py = 72; pm = 1;
                if unit_select != -1 { py = 37; }
                if party[1] != -1 {
                    draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
                    draw_sprite(party[pm].icon,0,px,py+12);
                    var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
                    draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
                    var _hp = party[pm].hp-party[pm].d_dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
                    var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
                    var _mp = party[pm].mp-party[pm].d_drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
                    _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
                }
                py = 124; pm = 2;
                if party[2] != -1 {
                    draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
                    draw_sprite(party[pm].icon,0,px,py+12);
                    var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
                    draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
                    var _hp = party[pm].hp-party[pm].d_dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
                    var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
                    var _mp = party[pm].mp-party[pm].d_drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
                    _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
                }
                py = 176; pm = 3;
                if party[3] != -1 {
                    draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
                    draw_sprite(party[pm].icon,0,px,py+12);
                    var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
                    draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
                    var _hp = party[pm].hp-party[pm].d_dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
                    var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
                    var _mp = party[pm].mp-party[pm].d_drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
                    _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
                    draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
                }
                break;
            case "items":
                px = 0; py = 0;
                #region //options
                    draw_box(s_box,px,py,218,24,menuback);
                    draw_monogram(px+17,py+8,c_white,"Items      Sort       Key Items");
                    draw_pointer(px+9+page_category*66,py+8,3,c_white);
                #endregion
                #region //item description
                    px = 0; py = 25;
                    draw_box(s_box,px,py,218,48,menuback);
                    if active_item = -1 {
                        if page_active = 1 {
                            if page_category = 0 {
                                draw_sprite(inventory[page_select].sprite,0,px+10,py+8);
                                draw_monogram(px+47,py+8,c_white,inventory[page_select].description);
                            }
                        }
                        else {
                            switch(page_category) {
                                case 0:
                                    draw_monogram(px+17,py+8+6,c_white,"Items and equipment you have\ngathered on your journey.");
                                    break;
                                case 1:
                                    draw_monogram(px+17,py+8+12,c_white,"Organize your inventory.");
                                    break;
                                case 2:
                                    draw_monogram(px+17,py+8+6,c_white,"Important items that you cannot\nthrow away.");
                                    break;
                            }
                        }
                    }
                else {
                    active_item.use("field","draw");
                }
                #endregion
                #region //draw items
                    if hide_items = 0 {
                        px = 0; py = 74;
                        draw_box(s_box,px,py,218,166,menuback);
                        if page_category != 2 {
                            for(i=0;i<24;i+=1) {
                                if inventory[i] != -1 {
                                    var _c = 0;
                                    if i % 2 != 0 {
                                        _c = 102;
                                    }
                                    var _r = floor(i/2);
                                    draw_monogram(px+17+_c,py+8+12*_r,c_white,inventory[i].name);
                                    draw_set_halign(fa_right);
                                    var _a = inventory[i].amount; if _a < 10 { _a = "0"+string(_a); }
                                    draw_monogram(px+107+_c,py+8+12*_r,c_white,":"+string(_a));
                                    draw_set_halign(fa_left);
                                }
                            }
                        }
                        if page_active = 1 {
                            if page_select != -1 {
                                var _c = 0;
                                if page_select % 2 != 0 {
                                    _c = 102;
                                }
                                var _r = floor(page_select/2);
                                draw_pointer(px+9+_c,py+8+12*_r,3,c_white);
                            }
                        }
                    }
                #endregion
            case "magic":
                break;
            case "equipment":
                break;
            case "facets":
                break;
            case "party":
                break;
            case "journal":
                break;
            case "config":
                break;
        }
    #endregion
    
    #region //menu options
        draw_box(s_box,219,0,101,96,menuback);
        draw_monogram(235,8,c_white,"Items\nMagic\nEquipment\nFacets\nParty\nJournal\nConfig");
        draw_pointer(227,8+menu_select*12,3,c_white);
    #endregion
    
    #region //general info
        draw_box(s_box,219,97,101,60,menuback);
        draw_monogram(229,105,c_white,"Gold\nTime"); draw_set_halign(fa_right); draw_monogram(313,105,c_white,string(display_gold)+"g"); draw_set_halign(fa_left);
        var hour = floor(gametime/60/60/60); var minute = floor(gametime/60/60-hour*60*60); var second = floor(gametime/60-hour*60*60-minute*60);
        if hour < 10 {hour = "0"+string(hour)}; if minute < 10 {minute = "0"+string(minute)}; if second < 10 {second = "0"+string(second)};
        draw_set_halign(fa_right); draw_monogram(313,117,c_white,string(hour)+":"+string(minute)+":"+string(second)); draw_set_halign(fa_left);
        draw_monogram(229,129,c_white,"Location\nLocation");
    #endregion
    
    #region //the unused one
    draw_box(s_box,219,158,101,82,menuback);
    #endregion
    
    }