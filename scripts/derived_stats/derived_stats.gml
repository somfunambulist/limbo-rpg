function get_attack(unit,sub = -1){
    var _a = unit.str;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_str }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_str }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_str }
    if _t != "" { _a += sub.add_str }
    return(_a*3);
}

function get_power(unit,sub = -1){
    var _a = unit.wis;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_wis }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_wis }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_wis }
    if _t != "" { _a += sub.add_wis }
    return(_a*3);
}

function get_defense(unit,sub = -1){
    return(0);
}

function get_accuracy(unit,sub = -1){
    var _a = unit.vig;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_vig }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_vig }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_vig }
    if _t != "" { _a += sub.add_vig }
    return(_a*3);
}

function get_evasion(unit,sub = -1){
    var _a = unit.agi;
    var _b = unit.ins;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_agi; _b += unit.wpn.equip.add_ins }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_agi; _b += unit.arm.equip.add_ins }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_agi; _b += unit.acc.equip.add_ins }
    if _t != "" { _a += sub.add_agi; _b += sub.add_ins }
    return(floor(_a*1.5+_b*1.5));
}

function get_finesse(unit,sub = -1){
    var _a = unit.str;
    var _b = unit.ins;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_str; _b += unit.wpn.equip.add_ins }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_str; _b += unit.arm.equip.add_ins }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_str; _b += unit.acc.equip.add_ins }
    if _t != "" { _a += sub.add_str; _b += sub.add_ins }
    return(_a*1+_b*2);
}

function get_charm(unit,sub = -1){
    var _a = unit.wis;
    var _b = unit.ins;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_wis; _b += unit.wpn.equip.add_ins }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_wis; _b += unit.arm.equip.add_ins }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_wis; _b += unit.acc.equip.add_ins }
    if _t != "" { _a += sub.add_wis; _b += sub.add_ins }
    return(_a*1+_b*2);
}

function get_speed(unit,sub = -1){
    var _a = unit.agi;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    if _t != "wpn" && unit.wpn != -1 { _a += unit.wpn.equip.add_agi }
    if _t != "arm" && unit.arm != -1 { _a += unit.arm.equip.add_agi }
    if _t != "acc" && unit.acc != -1 { _a += unit.acc.equip.add_agi }
    if _t != "" { _a += sub.add_agi }
    return(_a*3);
}

function get_luck(unit,sub = -1){
    var _v = unit.vig;  var _s = unit.str;  var _w = unit.wis; var _i = unit.ins;  var _a = unit.agi;
    var _t = ""; if sub != -1 { _t = sub.type }
    if _t != "" && _t != "arm" && _t != "acc" { _t = "wpn" }
    switch(_t) {
        case "":
            if unit.wpn != -1 {
                _v += unit.wpn.equip.add_vig;
                _s += unit.wpn.equip.add_str;
                _w += unit.wpn.equip.add_wis;
                _i += unit.wpn.equip.add_ins;
                _a += unit.wpn.equip.add_agi;
            }
            if unit.arm != -1 {
                _v += unit.arm.equip.add_vig;
                _s += unit.arm.equip.add_str;
                _w += unit.arm.equip.add_wis;
                _i += unit.arm.equip.add_ins;
                _a += unit.arm.equip.add_agi;
            }
            if unit.acc != -1 {
                _v += unit.acc.equip.add_vig;
                _s += unit.acc.equip.add_str;
                _w += unit.acc.equip.add_wis;
                _i += unit.acc.equip.add_ins;
                _a += unit.acc.equip.add_agi;
            }
            break;
        case "wpn":
            _v += sub.add_vig;
            _s += sub.add_str;
            _w += sub.add_wis;
            _i += sub.add_ins;
            _a += sub.add_agi;
            if unit.arm != -1 {
                _v += unit.arm.equip.add_vig;
                _s += unit.arm.equip.add_str;
                _w += unit.arm.equip.add_wis;
                _i += unit.arm.equip.add_ins;
                _a += unit.arm.equip.add_agi;
            }
            if unit.acc != -1 {
                _v += unit.acc.equip.add_vig;
                _s += unit.acc.equip.add_str;
                _w += unit.acc.equip.add_wis;
                _i += unit.acc.equip.add_ins;
                _a += unit.acc.equip.add_agi;
            }
            break;
        case "arm":
            if unit.wpn != -1 {
                _v += unit.wpn.equip.add_vig;
                _s += unit.wpn.equip.add_str;
                _w += unit.wpn.equip.add_wis;
                _i += unit.wpn.equip.add_ins;
                _a += unit.wpn.equip.add_agi;
            }
            _v += sub.add_vig;
            _s += sub.add_str;
            _w += sub.add_wis;
            _i += sub.add_ins;
            _a += sub.add_agi;
            if unit.acc != -1 {
                _v += unit.acc.equip.add_vig;
                _s += unit.acc.equip.add_str;
                _w += unit.acc.equip.add_wis;
                _i += unit.acc.equip.add_ins;
                _a += unit.acc.equip.add_agi;
            }
            break;
        case "acc":
            if unit.wpn != -1 {
                _v += unit.wpn.equip.add_vig;
                _s += unit.wpn.equip.add_str;
                _w += unit.wpn.equip.add_wis;
                _i += unit.wpn.equip.add_ins;
                _a += unit.wpn.equip.add_agi;
            }
            if unit.arm != -1 {
                _v += unit.arm.equip.add_vig;
                _s += unit.arm.equip.add_str;
                _w += unit.arm.equip.add_wis;
                _i += unit.arm.equip.add_ins;
                _a += unit.arm.equip.add_agi;
            }
            _v += sub.add_vig;
            _s += sub.add_str;
            _w += sub.add_wis;
            _i += sub.add_ins;
            _a += sub.add_agi;
            break;
    }
    return( max(_v,_s,_w,_i,_a) - min(_v,_s,_w,_i,_a) );
}