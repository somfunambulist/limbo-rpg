global.item_potion = {
    name : "Potion",
    amount : 5,
    sprite : s_image,
    description : "Recover 30 HP.",
    use : function(context="field",event="start") {
        var _c = context+"_"+event;
        switch(_c) {
            case "field_start":
                o_system.active_item = global.item_potion;
                o_system.confirm = 0;
                break;
            case "field_step":
                if keyboard_check_released(vk_down) = 1 {
                    if o_system.confirm < 3 {
                        if o_system.party[o_system.confirm+1] != -1 {
                            o_system.confirm += 1;
                        }
                        else {
                            o_system.confirm = 0;
                        }
                    }
                    else {
                        o_system.confirm = 0;
                    }
                }
                if keyboard_check_released(vk_up) = 1 {
                    if o_system.confirm > 0 {
                        o_system.confirm -= 1;
                    }
                    else {
                        for(i=3;i>0;i-=1) {
                            if o_system.party[i] != -1 {
                                o_system.confirm = i;
                                break;
                            }
                        }
                    }
                }
                if keyboard_check_released(vk_backspace) = 1 {
                    o_system.back_skip = 1;
                    o_system.active_item = -1;
                    o_system.hide_items = 0;
                }
                if keyboard_check_released(vk_space) = 1 {
                    if o_system.party[o_system.confirm].dmg > 0 {
                        o_system.party[o_system.confirm].dmg = max(0,o_system.party[o_system.confirm].dmg-30);
                        amount -= 1;
                        if amount < 1 {
                            o_system.active_item = -1;
                            o_system.hide_items = 0;
                            clean_inventory();
                        }
                    }
                }
                break;
            case "field_draw":
                draw_sprite(sprite,0,10,33);
                var n = amount; if n < 10 { n = "00"+string(n) } else { if n < 100 { n = "0"+string(n) } else { n = string(n) }}
                draw_monogram(46,33,c_white,name+" :"+n+"  Heal 25 HP.");
                draw_monogram(46,33+16,c_white,"Select a party member.");
                draw_party_select(o_system.confirm);
                if keyboard_check(vk_space) = 1 {
                    if o_system.party[o_system.confirm].dmg < 1 {
                        draw_sprite(s_x,0,8,96+o_system.confirm*38);
                    }
                }
                o_system.hide_items = 1;
                break;
        }
    }
}
global.item_antidote = {
    name : "Antidote",
    amount : 2,
    sprite : s_image,
    description : "Cure Poisoned status\neffect.",
    use : function(context,event="") {
        //
    }
}
global.item_hi_potion = {
    name : "Hi-Potion",
    amount : 1,
    sprite : s_image,
    description : "Recover 80 HP.",
    use : function(context,event="") {
        //
    }
}
global.item_mega_potion = {
    name : "Mega Potion",
    amount : 1,
    sprite : s_image,
    description : "Recover 100 HP per party\nmember.",
    use : function(context,event="") {
        //
    }
}
global.item_coin_purse = {
    name : "Coin Purse",
    amount : 5,
    sprite : s_image,
    description: "Contains a small amount of\ngold coins.",
    use : function(context="field",event="start") {
        var _c = context+"_"+event;
        switch(_c) {
            case "field_start":
                o_system.active_item = global.item_coin_purse;
                o_system.confirm = 1;
                break;
            case "field_step":
                if keyboard_check_released(vk_left)+keyboard_check_released(vk_right) > 0 {
                    o_system.confirm = 1-o_system.confirm;
                } 
                if keyboard_check_released(vk_backspace) = 1 {
                    o_system.back_skip = 1;
                    o_system.active_item = -1;
                }
                if keyboard_check_released(vk_space) = 1 {
                    if o_system.confirm = 0 {
                        o_system.active_item = -1;
                    }
                    else {
                        amount -= 1;
                        randomize();
                        o_system.gold += irandom_range(4,35);
                        if amount < 1 {
                            o_system.active_item = -1;
                            clean_inventory();
                        }
                    }
                }
                break;
            case "field_draw":
                draw_sprite(sprite,0,10,33);
                var n = amount; if n < 10 { n = "00"+string(n) } else { if n < 100 { n = "0"+string(n) } else { n = string(n) }}
                draw_monogram(46,33,c_white,name+" :"+n+"  Receive a\nsmall number of coins.\nUse item?   Yes   No");
                draw_pointer(146-o_system.confirm*36,57,3,c_white);
                break;
        }
    }
}