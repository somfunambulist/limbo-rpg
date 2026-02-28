function itemResult() constructor {
    name        = "Name";
    desc        = "Description";
    icon        = s_image;
    iconSub     = 0;
    amount      = 0;
    use         = -1;
    equip       = -1;
}

function equipResult() constructor {
    equipped    = 0;
    type        = "";
    facets      = 0;
    pairs       = 0;
    add_vig     = 0;
    add_str     = 0;
    add_wis     = 0;
    add_ins     = 0;
    add_agi     = 0;
}

function equipBuilder() constructor {
    result = new equipResult();
    
    type = function(arg) {
        result.type = arg;
        return self;
    }
    
    facets = function(arg) {
        result.facets = arg;
        return self;
    }
    
    pairs = function(arg) {
        result.pairs = arg;
        return self;
    }
    
    add_vig = function(arg) {
        result.add_vig = arg;
        return self;
    }    
    
    add_str = function(arg) {
        result.add_str = arg;
        return self;
    }    
    
    add_wis = function(arg) {
        result.add_wis = arg;
        return self;
    }    
    
    add_ins = function(arg) {
        result.add_ins = arg;
        return self;
    }    
    
    add_agi = function(arg) {
        result.add_agi = arg;
        return self;
    }
    
    build = function() {
        return result;
    }
}

function itemBuilder() constructor {
    result = new itemResult();
    
    name = function(_name) {
        result.name = _name;
        return self;
    }
    
    desc = function(_desc) {
        result.desc = _desc;
        return self;
    }
    
    icon = function(_icon) {
        result.icon = _icon;
        return self;
    }
    
    iconSub = function(_iconSub) {
        result.iconSub = _iconSub;
        return self;
    }
    
    amount = function(_amount) {
        result.amount = _amount;
        return self;
    }
    
    use = function(_use) {
        result.use = _use;
        return self;
    }
    
    equip = function(_equip) {
        result.equip = _equip;
        return self;
    }
    
    build = function() {
        return result;
    }
}

#region ITEMS
global.item_potion = new itemBuilder()
    .name("Potion")
    .desc("Recover 30 Hp.")
    .amount(3)
    .use(
        function(context="field",event="start") {
            var _c = context+"_"+event;
            var _u = global.item_potion;
            with(_u) {
                switch(_c) {
                    case "field_start":
                        o_system.active_item = _u;
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
                        draw_sprite(icon,iconSub,125,34);
                        draw_monogram(161,34,c_white,name+": "+string(amount)+"\nHeal 30 HP.\nSelect a party member.");
                        draw_pointer(8,36+o_system.confirm*50,3,c_white);
                        if keyboard_check(vk_space) = 1 {
                            if o_system.party[o_system.confirm].dmg < 1 {
                                draw_sprite(s_x,0,8,36+o_system.confirm*50);
                            }
                        }
                        break;
                }
            }
        }
    )
    .build();

global.item_antidote = new itemBuilder()
    .name("Antidote")
    .desc("Cure Poisoned status\neffect.")
    .amount(7)
    .build();

global.item_hi_potion = new itemBuilder()
    .name("Hi Potion")
    .desc("Recover 80 Hp.")
    .amount(2)
    .build();

global.item_mega_potion = new itemBuilder()
    .name("Mega Potion")
    .desc("Recover 100 Hp per party\nmember.")
    .amount(1)
    .build();

global.item_coin_purse = new itemBuilder()
    .name("Coin Purse")
    .desc("Contains a small amount\nof gold coins.")
    .amount(8)
    .use(
        function(context="field",event="start") {
            var _c = context+"_"+event;
            var _u = global.item_coin_purse;
            with(_u) {
                switch(_c) {
                    case "field_start":
                        o_system.active_item = _u;
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
                        draw_sprite(icon,iconSub,125,34);
                        draw_monogram(161,34,c_white,name+": "+string(amount)+"\nReceive a small number\nof coins.\nUse item?   Yes   No");
                        draw_pointer(261-o_system.confirm*36,70,3,c_white);
                        break;
                }
            }
        }
    )
    .build();

global.item_short_sword = new itemBuilder()
    .name("Short Sword")
    .desc("A short but expertly\ncrafted blade.")
    .amount(2)
    .equip(
     new equipBuilder()
        .type("sword")
        .facets(3)
        .pairs(1)
        .add_str(3)
        .build()
    )
    .build();

global.item_short_swordb = new itemBuilder()
    .name("Short Sword B")
    .desc("A short but expertly\ncrafted blade.")
    .amount(3)
    .equip(
     new equipBuilder()
        .type("sword")
        .facets(2)
        .add_str(30)
        .build()
    )
    .build();

global.item_short_swordc = new itemBuilder()
    .name("Short Sword C")
    .desc("A short but expertly\ncrafted blade.")
    .amount(2)
    .equip(
     new equipBuilder()
        .type("sword")
        .facets(9)
        .pairs(3)
        .add_str(-3)
        .build()
    )
    .build();

global.item_rapier = new itemBuilder()
    .name("Rapier")
    .desc("A light, thin blade for\nquick thrusts.")
    .amount(2)
    .equip(
     new equipBuilder()
        .type("rapier")
        .facets(2)
        .add_str(2)
        .add_agi(2)
        .build()
    )
    .build();

global.item_rapierb = new itemBuilder()
    .name("Rapier B")
    .desc("A light, thin blade for\nquick thrusts.")
    .amount(2)
    .equip(
     new equipBuilder()
        .type("rapier")
        .add_str(4)
        .add_agi(3)
        .build()
    )
    .build();

global.item_rapierc = new itemBuilder()
    .name("Rapier C")
    .desc("A light, thin blade for\nquick thrusts.")
    .amount(2)
    .equip(
     new equipBuilder()
        .type("rapier")
        .facets(4)
        .pairs(2)
        .add_str(-1)
        .add_agi(10)
        .build()
    )
    .build();

global.item_pyjamas = new itemBuilder()
    .name("Pyjamas")
    .desc("Blue, striped.")
    .amount(1)
    .equip(
     new equipBuilder()
        .type("arm")
        .build()
    )
    .build();

global.item_cloak = new itemBuilder()
    .name("Cloak")
    .desc("Thick,brown wool. Waxed to\nkeep the weather out.")
    .amount(3)
    .equip(
     new equipBuilder()
        .type("arm")
        .facets(2)
        .add_agi(-1)
        .add_ins(1)
        .build()
    )
    .build();

#endregion