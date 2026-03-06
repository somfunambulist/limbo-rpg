function skillBuilder(_name) constructor {
    name = _name;
}

function init_skills() {
    global.skill_flame = new skillBuilder("Flame");
    
    global.skill_swipe = new skillBuilder("Swipe");
}