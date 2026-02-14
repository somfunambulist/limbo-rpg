if keyboard_check_released(vk_enter) {
    menu = menu*-1+1;
}

if menu = 1 {
    if keyboard_check_released(vk_down) = 1 {
        if menu_select < 6 {
            menu_select += 1;
        }
        else {
            menu_select = 0;
        }
    }
    if keyboard_check_released(vk_up) = 1 {
        if menu_select > 0 {
            menu_select -= 1;
        }
        else {
            menu_select = 6;
        }
    }
}
else {
    menu_select = 0;
}

gametime += 1;