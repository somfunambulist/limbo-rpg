var menuback = make_colour_rgb(15, 55, 155);
if menu = 1 { 
    #region //display chunk
        switch(menu_page) {
            case "" :
                draw_party();
                break;
            case "items":
                #region //options
                    draw_box(s_box,0,0,218,24,menuback);
                    draw_monogram(17,8,c_white,"Items      Sort       Key Items");
                    draw_pointer(9+page_category*66,8,3,c_white);
                #endregion
                #region //draw items
                    draw_box(s_box,0,25,218,166,menuback);
                    if item_control = -1 {
                        if page_category != 2 {
                            for(i=0;i<24;i+=1) {
                                if inventory[i] != -1 {
                                    var _c = 0;
                                    if i % 2 != 0 {
                                        _c = 102;
                                    }
                                    var _r = floor(i/2);
                                    draw_monogram(17+_c,38+12*_r,c_white,inventory[i].name);
                                    draw_set_halign(fa_right);
                                    var _a = inventory[i].amount; if _a < 10 { _a = "0"+string(_a); }
                                    draw_monogram(107+_c,38+12*_r,c_white,":"+string(_a));
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
                                draw_pointer(9+_c,38+12*_r,3,c_white);
                            }
                        }
                    }
                #endregion
                #region //item description
                    draw_box(s_box,0,192,218,48,menuback);
                    if item_control = -1 {
                        if page_active = 1 {
                            if page_category = 0 {
                                draw_monogram(47,200,c_white,inventory[page_select].description);
                            }
                        }
                        else {
                            switch(page_category) {
                                case 0:
                                    draw_monogram(11,200,c_white,"Items and equipment you have\ngathered on your journey.");
                                    break;
                                case 1:
                                    draw_monogram(11,200,c_white,"Organize your inventory.");
                                    break;
                                case 2:
                                    draw_monogram(11,200,c_white,"Important items that you cannot\nthrow away.");
                                    break;
                            }
                        }
                    }
                #endregion
                #region //item control
                    if item_control != -1 {
                        if unit_select != -1 {
                            draw_party();
                        }
                    }
                #endregion
                break;
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
        draw_monogram(229,105,c_white,"Gold\nTime"); draw_set_halign(fa_right); draw_monogram(313,105,c_white,string(gold)+"g"); draw_set_halign(fa_left);
        var hour = floor(gametime/60/60/60); var minute = floor(gametime/60/60-hour*60*60); var second = floor(gametime/60-hour*60*60-minute*60);
        if hour < 10 {hour = "0"+string(hour)}; if minute < 10 {minute = "0"+string(minute)}; if second < 10 {second = "0"+string(second)};
        draw_set_halign(fa_right); draw_monogram(313,117,c_white,string(hour)+":"+string(minute)+":"+string(second)); draw_set_halign(fa_left);
        draw_monogram(229,129,c_white,"Location\nLocation");
    #endregion
    
    draw_box(s_box,219,158,101,82,menuback);
    
    }