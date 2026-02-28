function get_attack(unit,subwpn = -1){
    var _a = unit.str; //no subwpn
    if subwpn != -1 {
        _a = unit.str+subwpn.add_str;
    }
    return(_a*3);
}

function get_power(unit,subwpn = -1){
    var _a = unit.wis; //no subwpn
    if subwpn != -1 {
        _a = unit.wis+subwpn.add_wis;
    }
    return(_a*3);
}

function get_defense(unit,subwpn = -1){
    return(0);
}

function get_accuracy(unit,subwpn = -1){
    var _a = unit.vig; //no subwpn
    if subwpn != -1 { _a = unit.vig+subwpn.add_vig }
    return(_a*3);
}

function get_evasion(unit,subwpn = -1){
    var _a = unit.agi;
    var _b = unit.ins;
    if subwpn != -1 {
        _a = unit.agi+subwpn.add_agi;
        _b = unit.ins+subwpn.add_ins;
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
    return(_a*2+_b*1);
}

function get_charm(unit,subwpn = -1){
    var _a = unit.ins;
    var _b = unit.wis;
    if subwpn != -1 {
        _a = unit.ins+subwpn.add_ins;
        _b = unit.wis+subwpn.add_wis;
    }
    return(_a*2+_b*1);
}

function get_speed(unit,subwpn = -1){
    var _a = unit.agi; //no subwpn
    if subwpn != -1 { _a = unit.agi+subwpn.add_agi }
    return(_a*3);
}

function get_luck(unit,subwpn = -1){
    if subwpn = -1 {
        return(max(unit.vig,unit.str,unit.wis,unit.ins,unit.agi)-min(unit.vig,unit.str,unit.wis,unit.ins,unit.agi));
    }
    else {
        return(max(unit.vig+subwpn.add_vig,unit.str+subwpn.add_str,unit.wis+subwpn.add_wis,unit.ins+subwpn.add_ins,unit.agi+subwpn.add_agi)
            -min(unit.vig+subwpn.add_vig,unit.str+subwpn.add_str,unit.wis+subwpn.add_wis,unit.ins+subwpn.add_ins,unit.agi+subwpn.add_agi));
    }
}