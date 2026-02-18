if keyboard_check_released(vk_enter) {
    menu = menu*-1+1;
}

if menu = 1 {
    switch(menu_page) {
        case "" :
            if keyboard_check_released(vk_space) {
                switch(menu_select) {
                    case 0: menu_page = "items"; break;
                    case 1: menu_page = "magic"; break;
                    case 2: menu_page = "equipment"; break;
                    case 3: menu_page = "facets"; break;
                    case 4: menu_page = "party"; break;
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
                    break;
                }
                if keyboard_check_released(vk_space) {
                    if inventory[page_select] != -1 {
                        //
                    }
                }
                if keyboard_check_released(vk_left)+keyboard_check_released(vk_right) > 0 {
                    if page_select % 2 != 0 {
                        page_select -= 1;
                    }
                    else {
                        if inventory[page_select+1] != -1 {
                            page_select += 1;
                        }
                    }
                }
                if keyboard_check_released(vk_down) {
                    if inventory[page_select+2] != -1 {
                        page_select += 2;
                    }
                    else {
                        if page_select % 2 != 0 {
                            page_select = 1;
                        }
                        else {
                            page_select = 0;
                        }
                    }
                }
                if keyboard_check_released(vk_up) {
                    if page_select-2 >= 0 {
                        page_select -= 2;
                    }
                    else {
                        var _n
                        for(i=0;i<999;i+=1) {
                            if inventory[i] = -1 {
                                _n = i-1;
                                break;
                            }
                        }
                        if _n % 2 != 0 {
                            if page_select % 2 != 0 {
                                page_select = _n;
                            }
                            else {
                                page_select = _n-1;
                            }
                        }
                        else {
                            if page_select % 2 != 0 {
                                page_select = _n-1;
                            }
                            else {
                                page_select = _n;
                            }
                        }
                    }
                }
            }
        case "magic" :
        case "equipment" :
        case "facets" :
        case "party" :
        case "journal" :
        case "config" :
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