var menuback = make_colour_rgb(15, 55, 155);
if menu = 1 { 
    #region DISPLAY CHUNK
        switch(menu_page) {
            case "" :
                draw_box(s_box,0,0,218,240,menuback);
                var px = 17; var py = 20; var pm = 0; 
                if unit_select != -1 { py = 37; }
                if party[0] != -1 {
                    var _u = party[pm];
                    draw_monogram(px,py,c_white,_u.name);       draw_monogram(px+84,py,c_white,_u.status);
                    draw_sprite(_u.icon,_u.subimg,px,py+12);
                    draw_monogram(px+36,py+12,c_white,"LV");    draw_monogram(px+60,py+12,c_white,format_number(_u.lv,2));  draw_monogram(px+84,py+12,c_white,_u.class);
                    draw_monogram(px+36,py+24,c_white,"HP");    draw_monogram(px+60,py+24,c_white,format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4));
                    draw_monogram(px+36,py+36,c_white,"MP");    draw_monogram(px+60,py+36,c_white,format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                }
                py = 72; pm = 1;
                if unit_select != -1 { py = 37; }
                if party[1] != -1 {
                    var _u = party[pm];
                    draw_monogram(px,py,c_white,_u.name);       draw_monogram(px+84,py,c_white,_u.status);
                    draw_sprite(_u.icon,_u.subimg,px,py+12);
                    draw_monogram(px+36,py+12,c_white,"LV");    draw_monogram(px+60,py+12,c_white,format_number(_u.lv,2));  draw_monogram(px+84,py+12,c_white,_u.class);
                    draw_monogram(px+36,py+24,c_white,"HP");    draw_monogram(px+60,py+24,c_white,format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4));
                    draw_monogram(px+36,py+36,c_white,"MP");    draw_monogram(px+60,py+36,c_white,format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                }
                py = 124; pm = 2;
                if party[2] != -1 {
                    var _u = party[pm];
                    draw_monogram(px,py,c_white,_u.name);       draw_monogram(px+84,py,c_white,_u.status);
                    draw_sprite(_u.icon,_u.subimg,px,py+12);
                    draw_monogram(px+36,py+12,c_white,"LV");    draw_monogram(px+60,py+12,c_white,format_number(_u.lv,2));  draw_monogram(px+84,py+12,c_white,_u.class);
                    draw_monogram(px+36,py+24,c_white,"HP");    draw_monogram(px+60,py+24,c_white,format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4));
                    draw_monogram(px+36,py+36,c_white,"MP");    draw_monogram(px+60,py+36,c_white,format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                }
                py = 176; pm = 3;
                if party[3] != -1 {
                    var _u = party[pm];
                    draw_monogram(px,py,c_white,_u.name);       draw_monogram(px+84,py,c_white,_u.status);
                    draw_sprite(_u.icon,_u.subimg,px,py+12);
                    draw_monogram(px+36,py+12,c_white,"LV");    draw_monogram(px+60,py+12,c_white,format_number(_u.lv,2));  draw_monogram(px+84,py+12,c_white,_u.class);
                    draw_monogram(px+36,py+24,c_white,"HP");    draw_monogram(px+60,py+24,c_white,format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4));
                    draw_monogram(px+36,py+36,c_white,"MP");    draw_monogram(px+60,py+36,c_white,format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                }
                break;
            case "items":
                px = 0; py = 0;
                #region OPTIONS
                    draw_box(s_box,px,py,218,24,menuback);
                    draw_monogram(px+17,py+8,c_white,"Items      Sort       Key Items");
                    var _s = 3; if page_active = 1 { _s = 0 }
                    draw_pointer(px+9+page_category*66,py+8,_s,c_white);
                #endregion
                #region ITEM DESCRIPTION
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
                #region DRAW ITEMS
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
                var _x = 0; var _y = 0;
                //selector
                draw_box(s_box,_x,_y,218,55,menuback);
                if page_active = 0 {
                    draw_monogram(_x+8,_y+8,c_white,"Select party member:");
                    for(i=0;i<4;i+=1) {
                        if party[i] != -1 {
                            var _r = floor(i/2);
                            var _c = 0; if i % 2 != 0 { _c = 1; }
                            draw_monogram(_x+20+84*_c,_y+22+14*_r,c_white,party[i].name);
                            if page_select = i {
                                draw_pointer(_x+12+84*_c,_y+22+14*_r,3,c_white);
                            }
                        }
                    }
                }
                //glossary
                else {
                    var _g = "";
                    switch(unit_select) {
                        case 0:
                            _g = "Vigor: Base Stat. Your energy\nand motivation. Impacts HP, MP,\nand Accuracy.";
                            break;
                        case 1:
                            _g = "Strength: Base Stat. Your muscle\nand bodily wellbeing. Impacts HP,\nDamage, and Finesse.";
                            break;
                        case 2:
                            _g = "Wisdom: Base Stat. Your mental\nand magical capacity. Impacts MP,\nPower, and Charm.";
                            break;
                        case 3:
                            _g = "Intuition: Base Stat. Your\ngut instinct. Impacts Evasion,\nFinesse, and Charm.";
                            break;
                        case 4:
                            _g = "Agility: Base Stat. Your speed\nand reflexes. Impacts Evasion\nand Frequency.";
                            break;
                        case 5:
                            _g = "Attack: Determines damage dealt\nby non-magical, non-elemental\nweapons and actions.";
                            break;
                        case 6:
                            _g = "Power: Determines damage dealt\nby magical and elemental weapons\nand actions.";
                            break;
                        case 7:
                            _g = "Defense: Reduces incoming damage\nfrom most sources. Primarily\ndetermined by equipment.";
                            break;
                        case 8:
                            _g = "Accuracy: Increases the chances\nof your attacks connecting.\nDoes not impact special effects.";
                            break;
                        case 9:
                            _g = "Evasion: Increases the chances of\nincoming attacks missing.";
                            break;
                        case 10:
                            _g = "Finesse: Increases the success\nof physical maneuvers and\nspecial effects.";
                            break;
                        case 11:
                            _g = "Charm: Increases the success of\nmagical and mental maneuvers\nand special effects.";
                            break;
                        case 12:
                            _g = "Frequency: Determines how often\nyou act, and in what order.";
                            break;
                        case 13:
                            _g = "Luck: Increases item drop rate\nand lucky breaks. Calculated by\nthe range of your Base Stats.";
                            break;
                    }
                    draw_monogram(_x+8,_y+8,c_white,_g);
                }
                //display
                _y = 56;
                draw_box(s_box,_x,_y,218,184,menuback);
                var _u = party[page_select];
                #region COLUMN A
                    draw_sprite(_u.icon,_u.subimg,_x+8,_y+8);
                    draw_monogram(_x+44,_y+8,c_white,_u.name+"\n"+_u.status+"\n"+_u.class+"\n"+string(_u.lv)+"\n"+string(_u.xp)+"\n"+string(_u.next));
                    draw_monogram(_x+8,_y+44,c_white,"  LV\n  XP\nNext\n  HP\n  MP");
                    draw_monogram(_x+44,_y+80,c_white,format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4));
                    draw_monogram(_x+44,_y+92,c_white,format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                    draw_monogram(_x+8,_y+112,c_white,"Wpn:");
                    draw_monogram(_x+8,_y+140,c_white,"Arm:");
                    draw_monogram(_x+8,_y+168,c_white,"Acc:");
                #endregion
                #region COLUMN B
                    draw_monogram(_x+127,_y+8,c_white,"Vigor\nStrength\nWisdom\nIntuition\nAgility");
                    draw_monogram(_x+193,_y+8,c_white,format_number(_u.vig,3)+"\n"+ format_number(_u.str,3)+"\n"+
                        format_number(_u.wis,3)+"\n"+ format_number(_u.int,3)+"\n"+ format_number(_u.agi,3));
                    draw_monogram(_x+127,_y+72,c_white,"Attack\nPower\nDefense\nAccuracy\nEvasion\nFinesse\nCharm\nFrequency\nLuck");
                    draw_monogram(_x+193,_y+72,c_white,
                        format_number(get_attack(_u),3)+"\n"+   format_number(get_power(_u),3)+"\n"+    format_number(get_defense(_u),3)+"\n"+
                        format_number(get_accuracy(_u),3)+"\n"+ format_number(get_evasion(_u),3)+"\n"+  format_number(get_finesse(_u),3)+"\n"+
                        format_number(get_charm(_u),3)+"\n"+    format_number(get_speed(_u),3)+"\n"+    format_number(get_luck(_u),3));
                #endregion
                if page_active = 1 {
                    var _n = 0; if unit_select > 4 { _n = 4 }
                    draw_pointer(_x+119,_y+8+unit_select*12+_n,3,c_white);
                }
                break;
            case "journal":
                break;
            case "config":
                break;
        }
    #endregion
    
    #region MENU OPTIONS
        draw_box(s_box,219,0,101,96,menuback);
        draw_monogram(235,8,c_white,"Items\nMagic\nEquipment\nFacets\nParty\nJournal\nConfig");
        var _s = 3; if menu_page != "" { _s = 1 }
        draw_pointer(227,8+menu_select*12,_s,c_white);
    #endregion
    
    #region GENERAL INFO
        draw_box(s_box,219,97,101,60,menuback);
        draw_monogram(229,105,c_white,"Gold\nTime"); draw_set_halign(fa_right); draw_monogram(313,105,c_white,string(display_gold)+"g"); draw_set_halign(fa_left);
        var hour = floor(gametime/60/60/60); var minute = floor(gametime/60/60-hour*60*60); var second = floor(gametime/60-hour*60*60-minute*60);
        if hour < 10 {hour = "0"+string(hour)}; if minute < 10 {minute = "0"+string(minute)}; if second < 10 {second = "0"+string(second)};
        draw_set_halign(fa_right); draw_monogram(313,117,c_white,string(hour)+":"+string(minute)+":"+string(second)); draw_set_halign(fa_left);
        draw_monogram(229,129,c_white,"Location\nLocation");
    #endregion
    
    #region THE UNUSED ONE
    draw_box(s_box,219,158,101,82,menuback);
    #endregion
    
    }