if keyboard_check_released(vk_enter) {
    menu = menu*-1+1;
}

if menu = 1 {
    switch(menu_page) {
        case "" :
            if keyboard_check_released(vk_space) {
                switch(menu_select) {
                    case 0: menu_page = "items"; page_active = 1; break;
                    case 1: menu_page = "magic"; break;
                    case 2: menu_page = "equipment"; unit_select = 0; break;
                    case 3: menu_page = "facets"; unit_select = 0; break;
                    case 4: menu_page = "status"; break;
                    case 5: menu_page = "journal"; break;
                    case 6: menu_page = "config"; break;
                }
                page_select = 0;
            }
            if keyboard_check_released(vk_down) {
                if menu_select < 6 {
                    menu_select += 1;
                }
                else {
                    menu_select = 0;
                }
            }
            if keyboard_check_released(vk_up) {
                if menu_select > 0 {
                    menu_select -= 1;
                }
                else {
                    menu_select = 6;
                }
            }
            break;
        case "items" :
            if active_item = -1 {
                if page_active = 0 {
                    if keyboard_check_released(vk_right) {
                        page_select = 0;
                        if page_category < 2 {
                            page_category += 1;
                        }
                        else {
                            page_category = 0;
                        }
                    }
                    if keyboard_check_released(vk_left) {
                        page_select = 0;
                        if page_category > 0 {
                            page_category -= 1;
                        }
                        else {
                            page_category = 2;
                        }
                    }
                    if keyboard_check_released(vk_space) {
                        if page_category != 1 {
                            page_active = 1;
                        }
                    }
                }
                else {
                    if keyboard_check_released(vk_backspace) {
                        page_active = 0;
                        page_select = 0;
                        break;
                    }
                    if keyboard_check_released(vk_space) {
                        if inventory[page_select] != -1 {
                            if inventory[page_select].use != -1 {
                                inventory[page_select].use("field","start");
                            }
                        }
                    }
                    if keyboard_check_released(vk_down) {
                        if inventory[page_select+1] != -1 {
                            page_select += 1;
                        }
                        else {
                            page_select = 0;
                        }
                    }
                    if keyboard_check_released(vk_up) {
                        if page_select > 0 {
                            page_select -= 1;
                        }
                        else {
                            var _n
                            for(i=0;i<999;i+=1) {
                                if inventory[i] = -1 {
                                    _n = i-1;
                                    break;
                                }
                            }
                            page_select = _n;
                        }
                    }
                }
            }
            else {
                active_item.use("field","step");
            }
            if keyboard_check_released(vk_backspace) {
                if back_skip = 0 {
                    menu_page = "";
                    page_select = 0;
                    page_category = 0;
                    page_active = 0;
                }
                else {
                    back_skip = 0;
                }
            }
            break;
        case "magic" :
            if keyboard_check_released(vk_backspace) {
                if back_skip = 0 {
                    menu_page = "";
                    page_select = 0;
                    page_category = 0;
                    page_active = 0;
                }
                else {
                    back_skip = 0;
                }
            }
            break;
        case "equipment" :
            switch(page_active) {
                case 0:
                    if keyboard_check_released(vk_backspace) {
                        if back_skip = 0 {
                            menu_page = "";
                            page_select = 0;
                            page_category = 0;
                            page_active = 0;
                            unit_select = -1;
                        }
                        else {
                            back_skip = 0;
                        }
                    }
                    if keyboard_check_released(vk_space) {
                        page_active = 1;
                    }
                    if keyboard_check_released(vk_down) {
                        if unit_select < 3 {
                            if party[unit_select+1] != -1 {
                                unit_select += 1;
                            }
                            else {
                                unit_select = 0;
                            }
                        }
                    }
                    if keyboard_check_released(vk_up) {
                        if unit_select > 0 {
                            unit_select -= 1;
                        }
                        else {
                            for(i=3;i>0;i-=1) {
                                if party[i] != -1 {
                                    unit_select = i;
                                    break;
                                }
                            }
                        }
                    }
                    break;
                case 1:
                    if keyboard_check_released(vk_backspace) {
                        if back_skip = 0 {
                            page_active = 0;
                        }
                        else {
                            back_skip = 0;
                        }
                    }
                    if keyboard_check_released(vk_down) {
                        if page_category < 2 {
                            page_category += 1;
                        }
                        else {
                            page_category = 0;
                        }
                    }
                    if keyboard_check_released(vk_up) {
                        if page_category > 0 {
                            page_category -= 1;
                        }
                        else {
                            page_category = 2;
                        }
                    }
                    if keyboard_check_released(vk_space) {
                        page_active = 2;
                    }
                    if keyboard_check_released(vk_right) {
                        if unit_select < 3 {
                            if party[unit_select+1] != -1 {
                                unit_select += 1;
                            }
                            else {
                                unit_select = 0;
                            }
                        }
                    }
                    if keyboard_check_released(vk_left) {
                        if unit_select > 0 {
                            unit_select -= 1;
                        }
                        else {
                            for(i=3;i>0;i-=1) {
                                if party[i] != -1 {
                                    unit_select = i;
                                    break;
                                }
                            }
                        }
                    }
                    break;
                case 2:
                    if keyboard_check_released(vk_backspace) {
                        page_active = 1;
                        page_select = 0;
                    }
                    //filter stuff
                    var _list,_curr;
                    switch(page_category) {
                        case 0:
                            _list = filter_weapons(1);
                            _curr = party[unit_select].wpn;
                            break;
                        case 1:
                            _list = filter_armor(1);
                            _curr = party[unit_select].arm;
                            break;
                        case 2:
                            _list = filter_accessories(1);
                            _curr = party[unit_select].acc;
                            break;
                    }
                    if keyboard_check_released(vk_space) {
                        if ds_list_size(_list) > 0 {
                            if _curr != ds_list_find_value(_list,page_select) {
                                if _curr != -1 {
                                    _curr.equip.equipped -= 1;
                                }
                                switch(page_category) {
                                    case 0:
                                        party[unit_select].wpn = ds_list_find_value(_list,page_select);
                                        break;
                                    case 1:
                                        party[unit_select].arm = ds_list_find_value(_list,page_select);
                                        break;
                                    case 2:
                                        party[unit_select].acc = ds_list_find_value(_list,page_select);
                                        break;
                                }
                                ds_list_find_value(_list,page_select).equip.equipped += 1;
                                page_active = 1;
                                page_select = 0;
                            }
                        }
                    }
                    if keyboard_check_released(vk_down) {
                        if page_select < ds_list_size(_list)-1 {
                            page_select += 1;
                        }
                        else {
                            page_select = 0;
                        }
                    }
                    if keyboard_check_released(vk_up) {
                        if page_select > 0 {
                            page_select -= 1;
                        }
                        else {
                            page_select = max(ds_list_size(_list)-1,0);
                        }
                    }
                    ds_list_destroy(_list);
                    break;
            }
            break;
        case "facets" :
            switch(page_active) {
                case 0:
                    if keyboard_check_released(vk_backspace) {
                        if back_skip = 0 {
                            menu_page = "";
                            page_select = 0;
                            page_category = 0;
                            page_active = 0;
                            unit_select = -1;
                        }
                        else {
                            back_skip = 0;
                        }
                    }
                    if keyboard_check_released(vk_space) {
                        page_active = 1;
                    }
                    if keyboard_check_released(vk_down) {
                        if unit_select < 3 {
                            if party[unit_select+1] != -1 {
                                unit_select += 1;
                            }
                            else {
                                unit_select = 0;
                            }
                        }
                    }
                    if keyboard_check_released(vk_up) {
                        if unit_select > 0 {
                            unit_select -= 1;
                        }
                        else {
                            for(i=3;i>0;i-=1) {
                                if party[i] != -1 {
                                    unit_select = i;
                                    break;
                                }
                            }
                        }
                    }
                    break;
                case 1:
                    if keyboard_check_released(vk_backspace) {
                        page_active = 0;
                    }
                    if keyboard_check_released(vk_down)+keyboard_check_released(vk_up) > 0 {
                        if page_select > 0 {
                            switch(page_category) {
                                case 0:
                                    if party[unit_select].arm != -1 {
                                        if party[unit_select].arm.equip.facets-1 < page_select {
                                            page_select = party[unit_select].arm.equip.facets-1;
                                        }
                                    }
                                    else {
                                        page_select = 0;
                                    }
                                    break;
                                case 1:
                                    if party[unit_select].wpn != -1 {
                                        if party[unit_select].wpn.equip.facets-1 < page_select {
                                            page_select = party[unit_select].wpn.equip.facets-1;
                                        }
                                    }
                                    else {
                                        page_select = 0;
                                    }
                                    break;
                            }
                        }
                        page_category = page_category*-1+1;
                    }
                    if keyboard_check_released(vk_right) {
                        switch(page_category) {
                            case 0:
                                if party[unit_select].wpn != -1 {
                                    if party[unit_select].wpn.equip.facets-1 > page_select {
                                        page_select += 1;
                                    }
                                    else {
                                        page_select = 0;
                                    }
                                }
                                break;
                            case 1:
                                if party[unit_select].arm != -1 {
                                    if party[unit_select].arm.equip.facets-1 > page_select {
                                        page_select += 1;
                                    }
                                    else {
                                        page_select = 0;
                                    }
                                }
                                break;
                        }
                    }
                    if keyboard_check_released(vk_left) {
                        switch(page_category) {
                            case 0:
                                if party[unit_select].wpn != -1 {
                                    if page_select > 0 {
                                        page_select -= 1;
                                    }
                                    else {
                                        page_select = party[unit_select].wpn.equip.facets-1;
                                    }
                                }
                                break;
                            case 1:
                                if party[unit_select].arm != -1 {
                                    if page_select > 0 {
                                        page_select -= 1;
                                    }
                                    else {
                                        page_select = party[unit_select].arm.equip.facets-1;
                                    }
                                }
                                break;
                        }
                    }
                    break;
            }
            break;
        case "status" :
            if page_active = 0 {
                if keyboard_check_released(vk_down) > 0 {
                    if page_select < 3 {
                        if party[page_select+1] != -1 {
                            page_select += 1;
                        }
                        else {
                            page_select = 0;
                        }
                    }
                    else {
                        page_select = 0;
                    }
                }
                if keyboard_check_released(vk_up) > 0 {
                    if page_select > 0 {
                        page_select -= 1;
                    }
                    else {
                        for(i=0;i<4;i+=1) {
                            if party[i] = -1 {
                                break;
                            }
                        }
                        page_select = i-1;
                    }
                }
                if keyboard_check_released(vk_backspace) {
                    if back_skip = 0 {
                        menu_page = "";
                        page_select = 0;
                        page_category = 0;
                        page_active = 0;
                    }
                    else {
                        back_skip = 0;
                    }
                }
                if keyboard_check_released(vk_space) {
                    page_active = 1;
                    unit_select = 0;
                }
            }
            else {
                if keyboard_check_released(vk_down) {
                    if unit_select < 15 {
                        unit_select += 1;
                    }
                    else {
                        unit_select = 0;
                    }
                }
                if keyboard_check_released(vk_up) {
                    if unit_select > 0 {
                        unit_select -= 1;
                    }
                    else {
                        unit_select = 15;
                    }
                }
                if keyboard_check_released(vk_backspace) {
                    unit_select = -1;
                    page_active = 0;
                    back_skip = 1;
                }
            }
            break;
        case "journal" :
            if keyboard_check_released(vk_backspace) {
                if back_skip = 0 {
                    menu_page = "";
                    page_select = 0;
                    page_category = 0;
                    page_active = 0;
                }
                else {
                    back_skip = 0;
                }
            }
            break;
        case "config" :
            if keyboard_check_released(vk_backspace) {
                if back_skip = 0 {
                    menu_page = "";
                    page_select = 0;
                    page_category = 0;
                    page_active = 0;
                }
                else {
                    back_skip = 0;
                }
            }
            break;
        default :
            if keyboard_check_released(vk_backspace) {
                if back_skip = 0 {
                    menu_page = "";
                    page_select = 0;
                    page_category = 0;
                    page_active = 0;
                }
                else {
                    back_skip = 0;
                }
            }
            break;
    }
}
else {
    menu_select = 0;
    menu_page = "";
    page_select = 0;
    page_category = 0;
    page_active = 0;
}

gametime += 1;
#region DISPLAY UPDATES
    if gametime % 2 != 0 { //slow down display updates
        if display_gold < gold {
            display_gold += 1;
        }
        if display_gold > gold {
            display_gold -= 1;
        }
        for(i=0;i<4;i+=1) {
            if party[i] != -1 {
                if party[i].d_dmg < party[i].dmg {
                    party[i].d_dmg += 1;
                }
                if party[i].d_dmg > party[i].dmg {
                    party[i].d_dmg -= 1;
                }
                if party[i].d_drn < party[i].drn {
                    party[i].d_drn += 1;
                }
                if party[i].d_drn > party[i].drn {
                    party[i].d_drn -= 1;
                }
            }
        }
    }
#endregion