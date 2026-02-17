global.item_potion = {
    name :  "Potion",       amount :    5,
    description :           "Recover 30 HP.",
    use : function(context,event="") {
        switch(context) {
            case "field" :
                switch(event) {
                    case "" :
                        o_system.item_control = global.item_potion;
                        o_system.unit_select = 0;
                        break;
                    case "step" :
                        if keyboard_check_released(vk_backspace) {
                            o_system.unit_select = -1;
                            o_system.item_control = -1;
                            o_system.back_skip = 1;
                        }
                        if keyboard_check_released(vk_space) {
                            o_system.party[o_system.unit_select].dmg = max(0,o_system.party[o_system.unit_select].dmg-30);
                            amount -= 1;
                            //set "highlight fade" to value. this automatically counts down to zero. have the code below wait until its zero to execute.
                            //o_system.unit_select = -1;
                            //o_system.item_control = -1;
                            //meanwhile a separate draw case can reference the highlight fade value to apply a green effect over the hp
                        }
                        if keyboard_check_released(vk_down) {
                            if o_system.unit_select < 3 {
                                if o_system.party[o_system.unit_select+1] != -1 {
                                    o_system.unit_select += 1;
                                }
                                else {
                                    o_system.unit_select = 0;
                                }
                            }
                            else {
                                o_system.unit_select = 0;
                            }
                        }
                        if keyboard_check_released(vk_up) {
                            if o_system.unit_select > 0 {
                                o_system.unit_select -= 1;
                            }
                            else {
                                for(i=0;i<4;i+=1) {
                                    if o_system.party[i] = -1 {
                                        break;
                                    }
                                }
                                o_system.unit_select = i-1;
                            }
                        }
                        break;
                }
                break;
        }
    }
}
global.item_antidote = {
    name : "Antidote",      amount :    2,
    description :           "Cure Poisoned status\neffect.",
    use : function(context,event="") {
        //
    }
}
global.item_hi_potion = {
    name : "Hi-Potion",     amount :    1,
    description :           "Recover 80 HP.",
    use : function(context,event="") {
        //
    }
}
global.item_mega_potion = {
    name : "Mega Potion",   amount :    1,
    description :           "Recover 100 HP per party\nmember.",
    use : function(context,event="") {
        //
    }
}
global.item_coin_purse = {
    name : "Coin Purse",    amount :    5,
    description:            "Contains a small amount of\ngold coins.",
    use : function(context,event="") {
        switch(context) {
            case "field" :
                amount -= 1;
                o_system.gold += irandom(29)+1;
                break;
        }
    }
}