function get_attack(unit,subwpn = -1){
    var _a = unit.str; //no subwpn
    if subwpn != -1 {
        _a = unit.str+subwpn.add_str;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_str;
        }
    }
    return(_a*3);
}

function get_power(unit,subwpn = -1){
    var _a = unit.wis; //no subwpn
    if subwpn != -1 {
        _a = unit.wis+subwpn.add_wis;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_wis;
        }
    }
    return(_a*3);
}

function get_defense(unit,subwpn = -1){
    return(0);
}

function get_accuracy(unit,subwpn = -1){
    var _a = unit.vig; //no subwpn
    if subwpn != -1 { 
        _a = unit.vig+subwpn.add_vig; 
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_vig;
        }
    }
    return(_a*3);
}

function get_evasion(unit,subwpn = -1){
    var _a = unit.agi;
    var _b = unit.ins;
    if subwpn != -1 {
        _a = unit.agi+subwpn.add_agi;
        _b = unit.ins+subwpn.add_ins;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_agi;
            _b += unit.wpn.equip.add_ins;
        }
    }
    return(floor(_a*1.5+_b*1.5));
}

function get_finesse(unit,subwpn = -1){
    var _a = unit.ins;
    var _b = unit.str;
    if subwpn != -1 {
        _a = unit.ins+subwpn.add_ins;
        _b = unit.str+subwpn.add_str;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_ins;
            _b += unit.wpn.equip.add_str;
        }
    }
    return(_a*2+_b*1);
}

function get_charm(unit,subwpn = -1){
    var _a = unit.ins;
    var _b = unit.wis;
    if subwpn != -1 {
        _a = unit.ins+subwpn.add_ins;
        _b = unit.wis+subwpn.add_wis;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_ins;
            _b += unit.wpn.equip.add_wis;
        }
    }
    return(_a*2+_b*1);
}

function get_speed(unit,subwpn = -1){
    var _a = unit.agi; //no subwpn
    if subwpn != -1 { 
        _a = unit.agi+subwpn.add_agi;
    }
    else {
        if unit.wpn != -1 {
            _a += unit.wpn.equip.add_agi;
        }
    }
    return(_a*3);
}

function get_luck(unit,subwpn = -1){
    var _v,_s,_w,_i,_a;
    _v = unit.vig;
    if unit.wpn != -1 { _v += unit.wpn.equip.add_vig }
    _s = unit.str;
    if unit.wpn != -1 { _s += unit.wpn.equip.add_str }
    _w = unit.wis;
    if unit.wpn != -1 { _w += unit.wpn.equip.add_wis }
    _i = unit.ins;
    if unit.wpn != -1 { _i += unit.wpn.equip.add_ins }
    _a = unit.agi;
    if unit.wpn != -1 { _a += unit.wpn.equip.add_agi }
    if subwpn = -1 {
        return(max(_v,_s,_w,_i,_a)-min(_v,_s,_w,_i,_a));
    }
    else {
        return(max(unit.vig+subwpn.add_vig,unit.str+subwpn.add_str,unit.wis+subwpn.add_wis,unit.ins+subwpn.add_ins,unit.agi+subwpn.add_agi)
            -min(unit.vig+subwpn.add_vig,unit.str+subwpn.add_str,unit.wis+subwpn.add_wis,unit.ins+subwpn.add_ins,unit.agi+subwpn.add_agi));
    }
}