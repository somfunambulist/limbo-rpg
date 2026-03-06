function facetBuilder(_name) constructor {
    name        = _name;
    color       = c_white;
    lv          = 0;
    ap          = 0;
    max_lv      = 0;
    next        = array_create(10,0);
    //
    equipped    = 0;
    //
    skills      = array_create(10);
    //
    add_vig     = array_create(10,0);
    add_str     = array_create(10,0);
    add_wis     = array_create(10,0);
    add_ins     = array_create(10,0);
    add_agi     = array_create(10,0);
}

#region Colors
var _green  = make_colour_rgb(65, 205, 115);
var _violet   = make_colour_rgb(160, 65, 215);
var _yellow = make_colour_rgb(255, 170, 50);
var _red    = make_colour_rgb(215, 45, 45);
#endregion

init_skills();

global.facet_flame = new facetBuilder("Flame");
with(global.facet_flame) {
    color       = _green;
    max_lv      = 5;
    next[0]     = 24;
    next[1]     = 36;
    next[2]     = 54;
    next[3]     = 81;
    next[4]     = 122;
    add_vig[0]  = 1;
    add_vig[1]  = 1;
    add_vig[2]  = 2;
    add_vig[3]  = 2;
    add_vig[4]  = 3;
    add_vig[5]  = 4;
    skills[0]   = global.skill_flame;
}

global.facet_vigor_plus = new facetBuilder("Vigor Plus");
with(global.facet_vigor_plus) {
    color       = _violet;
    max_lv      = 5;
    next[0]     = 24;
    next[1]     = 36;
    next[2]     = 54;
    next[3]     = 81;
    next[4]     = 122;
    add_vig[0]  = 20;
    add_vig[1]  = 40;
    add_vig[2]  = 60;
    add_vig[3]  = 80;
    add_vig[4]  = 100;
    add_vig[5]  = 150;
}

global.facet_swipe = new facetBuilder("Swipe");
with(global.facet_swipe) {
    color       = _yellow;
    max_lv      = 2;
    next[0]     = 24;
    next[1]     = 36;
    add_agi[0]  = 4;
    add_agi[1]  = 8;
    add_agi[2]  = 20;
    skills[0]   = global.skill_swipe;
}