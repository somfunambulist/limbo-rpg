function get_attack(unit){
    return(unit.str*3);
}

function get_power(unit){
    return(unit.wis*3);
}

function get_defense(unit){
    return(0);
}

function get_accuracy(unit){
    return(unit.vig*3);
}

function get_evasion(unit){
    return(floor(unit.agi*1.5+unit.ins*1.5));
}

function get_finesse(unit){
    return(unit.ins*2+unit.str*1);
}

function get_charm(unit){
    return(unit.ins*2+unit.wis*1);
}

function get_speed(unit){
    return(unit.agi*3);
}

function get_luck(unit){
    return(max(unit.vig,unit.str,unit.wis,unit.ins,unit.agi)-min(unit.vig,unit.str,unit.wis,unit.ins,unit.agi));
}