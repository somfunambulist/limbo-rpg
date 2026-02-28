var menuback = make_colour_rgb(15, 55, 155);
var _x = 0; var _y = 0; var _u = -1;
if menu = 1 { 
    #region TITLE BAR
        draw_box(s_box,_x,_y,218,24,menuback);
        switch(menu_page) {
            case "" :
                draw_monogram(_x+16,_y+8,c_white,"Menu");
                break;
            case "items" :
                draw_monogram(_x+16,_y+8,c_white,"Use           Sort           Key");
                switch(page_category) {
                    case 0:
                        draw_pointer(_x+8,_y+8,3,c_white);
                        break;
                    case 1:
                        draw_pointer(_x+92,_y+8,3,c_white);
                        break;
                    case 2:
                        draw_pointer(_x+182,_y+8,3,c_white);
                        break;
                }
                break;
            case "equipment" :
                switch(page_active) {
                    case 0:
                        draw_monogram(_x+16,_y+8,c_white,"Select party member.");
                        break;
                    case 1:
                        draw_monogram(_x+16,_y+8,c_white,"Select equip slot.");
                        break;
                    case 2:
                        switch(page_category) {
                            case 0:
                                draw_monogram(_x+16,_y+8,c_white,"Select weapon.");
                                break;
                            case 1:
                                draw_monogram(_x+16,_y+8,c_white,"Select armor.");
                                break;
                            case 2:
                                draw_monogram(_x+16,_y+8,c_white,"Select accessory.");
                                break;
                        }
                        break;
                }
                break;
            case "status" :
                draw_monogram(_x+16,_y+8,c_white,"Press Select to read glossary.");
                draw_monogram(_x+16,_y+8,make_colour_rgb(65, 215, 215),"      Select");
                break;
        }
    #endregion

    #region DISPLAY CHUNK
        switch(menu_page) {
            case "" :
                draw_box(s_box,_x+0,_y+25,218,215,menuback);
                for(i=0;i<4;i+=1) {
                    if party[i] != -1 {
                        _u = party[i];
                        draw_unit_select(_x+16,_y+36+i*50,_u);
                        draw_monogram(_x+118,_y+36+i*50,c_white,_u.class+"\n"+_u.status+"\nExp\nNxt");
                        draw_set_halign(fa_right);
                        draw_monogram(_x+208,_y+60+i*50,c_white,string(_u.xp)+"\n"+string(_u.next));
                        draw_set_halign(fa_left);
                    }
                }
                break;
            case "items":
                var _i = -1;
                //unit navigation
                draw_box(s_box,_x,_y+25,115,215,menuback);
                for(i=0;i<4;i+=1) {
                    if party[i] != -1 {
                        draw_unit_select(_x+16,_y+36+i*50,party[i]);
                    }
                }
                //item display
                draw_box(s_box,_x+116,_y+25,204,62,menuback);
                if page_active = 0 {
                    switch(page_category) {
                        case 0 :
                            draw_monogram(_x+125,_y+34,c_white,"Browse and utilize items you\nhave collected on your journey.");
                            break;
                        case 1 :
                            draw_monogram(_x+125,_y+34,c_white,"Organize your inventory.");
                            break;
                        case 2 :
                            draw_monogram(_x+125,_y+34,c_white,"Browse important items that\ncannot be thrown away.");
                            break;
                    }
                }
                else {
                    if active_item = -1 {
                        if inventory[page_select] != -1 {
                            _i = inventory[page_select];
                            draw_sprite(_i.icon,_i.iconSub,_x+125,_y+34);
                            draw_monogram(_x+161,_y+34,c_white,_i.name+": "+string(_i.amount)+"\n"+_i.desc);
                        }
                    }
                    else {
                        active_item.use("field","draw");
                    }
                }
                //list display
                draw_box(s_box,_x+116,_y+88,204,152,menuback);
                for(i=0;i<10;i+=1) {
                    if inventory[i] != -1 {
                        _i = inventory[i];
                        var _c = c_white; if _i.use = -1 { _c = make_colour_rgb(165, 190, 205) }
                        draw_monogram(_x+132,_y+104+12*i,_c,_i.name);
                        draw_monogram(_x+288,_y+104+12*i,_c,":"+string(_i.amount));
                        if page_select = i {
                            draw_pointer(_x+124,_y+104+i*12,3,c_white);
                            if keyboard_check(vk_space) {
                                if _i.use = -1 {
                                    draw_sprite(s_x,0,_x+124,_y+104+i*12);
                                }
                            }
                        }
                    } 
                }
                break;
            case "magic":
                break;
            case "equipment":
                if page_active = 0 {
                    draw_box(s_box,_x+0,_y+25,218,215,menuback);
                    for(i=0;i<4;i+=1) {
                        if party[i] != -1 {
                            _u = party[i];
                            draw_unit_select(_x+16,_y+36+i*50,_u);
                            draw_monogram(_x+118,_y+36+i*50,c_white,_u.class+"\n"+_u.status+"\nExp\nNxt");
                            draw_set_halign(fa_right);
                            draw_monogram(_x+208,_y+60+i*50,c_white,string(_u.xp)+"\n"+string(_u.next));
                            draw_set_halign(fa_left);
                        }
                    }
                    draw_pointer(_x+8,_y+36+unit_select*50,3,c_white);
                }
                else {
                    //unit info
                    draw_box(s_box,_x,_y+25,320,60,menuback);
                    draw_unit_select(_x+8,_y+33,party[unit_select]);
                    if page_active = 1 {
                        draw_monogram(_x+109,_y+33,c_white,"Wpn");
                        if party[unit_select].wpn != -1 {
                            draw_monogram(_x+133,_y+33,c_white,party[unit_select].wpn.name);
                            draw_facets(_x+224,_y+33,party[unit_select].wpn.equip)
                        }
                        draw_monogram(_x+109,_y+51,c_white,"Arm");
                        if party[unit_select].arm != -1 {
                            draw_monogram(_x+133,_y+51,c_white,party[unit_select].arm.name);
                            draw_facets(_x+224,_y+51,party[unit_select].arm.equip)
                        }
                        draw_monogram(_x+109,_y+69,c_white,"Acc"); 
                        if party[unit_select].acc != -1 {
                            draw_monogram(_x+133,_y+69,c_white,party[unit_select].acc.name);
                            draw_facets(_x+224,_y+69,party[unit_select].acc.equip)
                        }
                        draw_pointer(_x+101,_y+33+page_category*18,3,c_white);
                    }
                    else {
                        switch(page_category) {
                            case 0:
                                draw_monogram(_x+109,_y+33,c_white,"Wpn");
                                if party[unit_select].wpn != -1 {
                                    draw_monogram(_x+133,_y+33,c_white,party[unit_select].wpn.name);
                                    draw_facets(_x+224,_y+33,party[unit_select].wpn.equip)
                                }
                                break;
                            case 1:
                                draw_monogram(_x+109,_y+33,c_white,"Arm");
                                break;
                            case 2:
                                draw_monogram(_x+109,_y+33,c_white,"Acc");
                                break;
                        }
                        draw_pointer(_x+101,_y+33,0,c_white);
                    }
                    //list view
                    draw_box(s_box,_x,_y+86,139,154,menuback);
                    //item view
                    draw_box(s_box,_x+140,_y+86,180,154,menuback);
                    //filter suff
                    var _list,_curr,_titl,_sngl;
                    switch(page_category) {
                        case 0:
                            _titl = "Weapons";
                            _sngl = "Weapon";
                            _list = filter_weapons(1);
                            _curr = party[unit_select].wpn;
                            break;
                        case 1:
                            _titl = "Armor";
                            _sngl = "Armor";
                            _list = filter_armor(1);
                            _curr = party[unit_select].arm;
                            break;
                        case 2:
                            _titl = "Accessories";
                            _sngl = "Accessory";
                            _list = filter_accessories(1);
                            _curr = party[unit_select].acc;
                            break;
                    }
                    var _c = c_white;
                    var _shadow = make_colour_rgb(25, 30, 60);
                    draw_monogram(_x+16,_y+97,c_white,_titl);
                    if ds_list_size(_list) > 0 {
                        for(i=0;i<min(10,ds_list_size(_list));i+=1) {
                            _c = c_white;
                            if ds_list_find_value(_list,i) = _curr { _c = make_colour_rgb(165, 190, 205) }
                            draw_monogram(_x+16,_y+111+12*i,_c,ds_list_find_value(_list,i).name);
                            draw_monogram(_x+108,_y+111+12*i,_c,":"+string(ds_list_find_value(_list,i).amount-ds_list_find_value(_list,i).equip.equipped));
                        }
                        if page_active = 2 {
                            var _e = ds_list_find_value(_list,page_select);
                            draw_sprite(_e.icon,_e.iconSub,_x+148,_y+94);
                            draw_monogram(_x+184,_y+94,c_white,_sngl+"\n"+_e.name);
                            draw_monogram(_x+148,_y+130,c_white,_e.desc);
                            //facets
                            draw_facets(_x+184,_y+118,_e.equip);
                            //stats
                            _c = c_white;
                            draw_monogram(_x+148,_y+180,c_white,"Attack");
                            draw_smallfont(_x+196,_y+182,c_white,":"+string(get_attack(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+182,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+183,1,1,0,c_white,1);
                            _c = c_white;
                            if get_attack(party[unit_select],_e.equip) > get_attack(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_attack(party[unit_select],_e.equip) < get_attack(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+217,_y+182,_c,string(get_attack(party[unit_select],_e.equip)));
                            draw_monogram(_x+148,_y+180+11,c_white,"Power");
                            draw_smallfont(_x+196,_y+182+11,c_white,":"+string(get_power(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+182+11,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+183+11,1,1,0,c_white,1);
                            _c = c_white;
                            if get_power(party[unit_select],_e.equip) > get_power(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_power(party[unit_select],_e.equip) < get_power(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+217,_y+182+11,_c,string(get_power(party[unit_select],_e.equip)));
                            draw_monogram(_x+148,_y+180+22,c_white,"Defense");
                            draw_smallfont(_x+196,_y+182+22,c_white,":"+string(get_defense(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+182+22,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+183+22,1,1,0,c_white,1);
                            _c = c_white;
                            if get_defense(party[unit_select],_e.equip) > get_defense(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_defense(party[unit_select],_e.equip) < get_defense(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+217,_y+182+22,_c,string(get_defense(party[unit_select],_e.equip)));
                            draw_monogram(_x+148,_y+180+33,c_white,"Accuracy");
                            draw_smallfont(_x+196,_y+182+33,c_white,":"+string(get_accuracy(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+182+33,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+183+33,1,1,0,c_white,1);
                            _c = c_white;
                            if get_accuracy(party[unit_select],_e.equip) > get_accuracy(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_accuracy(party[unit_select],_e.equip) < get_accuracy(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+217,_y+182+33,_c,string(get_accuracy(party[unit_select],_e.equip)));
                            draw_monogram(_x+148,_y+180+44,c_white,"Evasion");
                            draw_smallfont(_x+196,_y+182+44,c_white,":"+string(get_evasion(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+182+44,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+212,_y+183+44,1,1,0,c_white,1);
                            _c = c_white;
                            if get_evasion(party[unit_select],_e.equip) > get_evasion(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_evasion(party[unit_select],_e.equip) < get_evasion(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+217,_y+182+44,_c,string(get_evasion(party[unit_select],_e.equip)));
                            draw_monogram(_x+232,_y+180,c_white,"Finesse");
                            draw_smallfont(_x+280,_y+182,c_white,":"+string(get_finesse(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+182,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+183,1,1,0,c_white,1);
                            _c = c_white;
                            if get_finesse(party[unit_select],_e.equip) > get_finesse(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_finesse(party[unit_select],_e.equip) < get_finesse(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+301,_y+182,_c,string(get_finesse(party[unit_select],_e.equip)));
                            draw_monogram(_x+232,_y+180+11,c_white,"Charm");
                            draw_smallfont(_x+280,_y+182+11,c_white,":"+string(get_charm(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+182+11,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+183+11,1,1,0,c_white,1);
                            _c = c_white;
                            if get_charm(party[unit_select],_e.equip) > get_charm(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_charm(party[unit_select],_e.equip) < get_charm(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+301,_y+182+11,_c,string(get_charm(party[unit_select],_e.equip)));
                            draw_monogram(_x+232,_y+180+22,c_white,"Speed");
                            draw_smallfont(_x+280,_y+182+22,c_white,":"+string(get_speed(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+182+22,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+183+22,1,1,0,c_white,1);
                            _c = c_white;
                            if get_speed(party[unit_select],_e.equip) > get_speed(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_speed(party[unit_select],_e.equip) < get_speed(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+301,_y+182+22,_c,string(get_speed(party[unit_select],_e.equip)));
                            draw_monogram(_x+232,_y+180+33,c_white,"Luck");
                            draw_smallfont(_x+280,_y+182+33,c_white,":"+string(get_luck(party[unit_select])));
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+182+33,1,1,0,_shadow,1);
                            draw_sprite_ext(s_small_arrow,0,_x+296,_y+183+33,1,1,0,c_white,1);
                            _c = c_white;
                            if get_luck(party[unit_select],_e.equip) > get_luck(party[unit_select]) {
                                _c = make_colour_rgb(65, 205, 115);
                            }
                            if get_luck(party[unit_select],_e.equip) < get_luck(party[unit_select]) {
                                _c = make_colour_rgb(215, 45, 45);
                            }
                            draw_smallfont(_x+301,_y+182+33,_c,string(get_luck(party[unit_select],_e.equip)));
                        }
                    }
                    ds_list_destroy(_list);
                    if page_active = 2 {
                        draw_pointer(_x+8,_y+111+12*page_select,3,c_white);
                    }
                }
                break;
            case "facets":
                break;
            case "status":
                //unit navigation
                draw_box(s_box,_x,_y+25,115,215,menuback);
                for(i=0;i<4;i+=1) {
                    if party[i] != -1 {
                        draw_unit_select(_x+16,_y+36+i*50,party[i]);
                    }
                }
                draw_pointer(_x+8,_y+36+page_select*50,3,c_white);
                //stat display
                draw_box(s_box,_x+116,_y+25,204,215,menuback);
                _u = party[page_select];
                draw_monogram(_x+126,_y+36,c_white,_u.name);
                draw_sprite(_u.icon,_u.subimg,_x+126,_y+48);
                draw_monogram(_x+162,_y+48,c_white,_u.class+"\n"+_u.status+"\nLevel "+string(_u.lv));
                draw_monogram(_x+126,_y+85,c_white,"Exp "+string(_u.xp)+"\nNxt "+string(_u.next)+
                    "\n Hp "+format_number(_u.hp-_u.dmg,4)+" / "+format_number(_u.hp,4)+
                    "\n Mp "+format_number(_u.mp-_u.drn,4)+" / "+format_number(_u.mp,4));
                //equipment
                draw_monogram(_x+126,_y+138,make_colour_rgb(65, 215, 215),"Weapon");
                if party[page_select].wpn != -1 {
                    draw_monogram(_x+126,_y+150,c_white,party[page_select].wpn.name);
                    draw_facets(_x+126,_y+162,party[page_select].wpn.equip);
                }
                draw_monogram(_x+126,_y+174,make_colour_rgb(65, 215, 215),"Armor");
                if party[page_select].arm != -1 {
                    draw_monogram(_x+126,_y+186,c_white,party[page_select].arm.name);
                    draw_facets(_x+126,_y+198,party[page_select].arm.equip);
                }
                draw_monogram(_x+126,_y+210,make_colour_rgb(65, 215, 215),"Accessory");
                if party[page_select].acc != -1 {
                    draw_monogram(_x+126,_y+222,c_white,party[page_select].acc.name);
                }
                //base stats
                draw_monogram(_x+232,_y+36,c_white,"BASE STATS\nVigor\nStrength\nWisdom\nInstinct\nAgility");
                draw_monogram(_x+232,_y+36,make_colour_rgb(65, 215, 215),"BASE STATS");
                draw_monogram(_x+292,_y+48,c_white,string(_u.vig)+"\n"+string(_u.str)+"\n"+string(_u.wis)+"\n"+string(_u.ins)+"\n"+string(_u.agi));
                //derived stats
                draw_monogram(_x+232,_y+114,c_white,"DERIVED STATS\nAttack\nPower\nDefense\nAccuracy\nEvasion\nFinesse\nCharm\nSpeed\nLuck");
                draw_monogram(_x+232,_y+114,make_colour_rgb(65, 215, 215),"DERIVED STATS");
                draw_monogram(_x+292,_y+126,c_white,string(get_attack(_u))+"\n"+string(get_power(_u))+"\n"+string(get_defense(_u))+"\n"+
                    string(get_accuracy(_u))+"\n"+string(get_evasion(_u))+"\n"+string(get_finesse(_u))+"\n"+string(get_charm(_u))+"\n"+
                    string(get_speed(_u))+"\n"+string(get_luck(_u)));
                //glossary
                if page_active = 1 {
                    draw_box(s_box,_x+8,_y+36,208,196,menuback);
                    draw_monogram(_x+16,_y+44,c_white,"Glossary");
                    var _n = 0; if unit_select > 5 { _n = 6 }
                    draw_pointer(_x+224,_y+36+unit_select*12+_n,3,c_white);
                    var _g = "";
                    switch(unit_select) {
                        case 0:
                            _g = "Base Stats:";
                            break;
                        case 1:
                            _g = "Vigor: Base Stat. Your energy\nand motivation. Impacts HP, MP,\nand Accuracy.";
                            break;
                        case 2:
                            _g = "Strength: Base Stat. Your muscle\nand bodily wellbeing. Impacts HP,\nDamage, and Finesse.";
                            break;
                        case 3:
                            _g = "Wisdom: Base Stat. Your mental\nand magical capacity. Impacts MP,\nPower, and Charm.";
                            break;
                        case 4:
                            _g = "Intuition: Base Stat. Your\ngut instinct. Impacts Evasion,\nFinesse, and Charm.";
                            break;
                        case 5:
                            _g = "Agility: Base Stat. Your speed\nand reflexes. Impacts Evasion\nand Frequency.";
                            break;
                        case 6:
                            _g = "Derived Stats:";
                            break;
                        case 7:
                            _g = "Attack: Determines damage dealt\nby non-magical, non-elemental\nweapons and actions.";
                            break;
                        case 8:
                            _g = "Power: Determines damage dealt\nby magical and elemental weapons\nand actions.";
                            break;
                        case 9:
                            _g = "Defense: Reduces incoming damage\nfrom most sources. Primarily\ndetermined by equipment.";
                            break;
                        case 10:
                            _g = "Accuracy: Increases the chances\nof your attacks connecting.\nDoes not impact special effects.";
                            break;
                        case 11:
                            _g = "Evasion: Increases the chances of\nincoming attacks missing.";
                            break;
                        case 12:
                            _g = "Finesse: Increases the success\nof physical maneuvers and\nspecial effects.";
                            break;
                        case 13:
                            _g = "Charm: Increases the success of\nmagical and mental maneuvers\nand special effects.";
                            break;
                        case 14:
                            _g = "Frequency: Determines how often\nyou act, and in what order.";
                            break;
                        case 15:
                            _g = "Luck: Increases item drop rate\nand lucky breaks. Calculated by\nthe range of your Base Stats.";
                            break;
                    }
                    draw_monogram(_x+16,_y+60,c_white,_g);
                }
                break;
            case "journal":
                break;
            case "config":
                break;
        }
    #endregion
    
    #region MENU OPTIONS
        if menu_page = "" || ( menu_page = "equipment" && page_active = 0 ) {
            draw_box(s_box,_x+219,_y+0,101,96,menuback);
            draw_monogram(_x+235,_y+8,c_white,"Items\nMagic\nEquipment\nFacets\nStatus\nJournal\nConfig");
            var _s = 3; if menu_page != "" { _s = 1 }
            draw_pointer(_x+227,_y+8+menu_select*12,_s,c_white);
        }
        else {
            draw_box(s_box,_x+219,_y+0,101,24,menuback);
            draw_monogram(_x+235,_y+8,c_white,string_char_at(string_upper(menu_page),1)+string_copy(menu_page,2,12));
        }
    #endregion
    
    #region GENERAL INFO
        if menu_page = "" || ( menu_page = "equipment" && page_active = 0 ) {
            draw_box(s_box,219,97,_x+101,_y+60,menuback);
            draw_monogram(_x+229,_y+105,c_white,"Gold\nTime"); draw_set_halign(fa_right); draw_monogram(_x+313,_y+105,c_white,string(display_gold)+"g"); draw_set_halign(fa_left);
            var hour = floor(gametime/60/60/60); var minute = floor(gametime/60/60-hour*60*60); var second = floor(gametime/60-hour*60*60-minute*60);
            draw_set_halign(fa_right); draw_monogram(_x+313,_y+117,c_white,format_number(hour,3)+":"+format_number(minute,2)+":"+format_number(second,2)); draw_set_halign(fa_left);
            draw_monogram(_x+229,_y+129,c_white,"Location\nLocation");
        }
    #endregion
    
    #region THE UNUSED ONE
        if menu_page = "" || ( menu_page = "equipment" && page_active = 0 ) {
            draw_box(s_box,219,158,_x+101,_y+82,menuback);
        }
    #endregion
    
    }