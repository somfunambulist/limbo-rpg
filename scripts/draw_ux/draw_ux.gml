function draw_box(sprite_index,x,y,width,height,color){
    draw_rectangle_color(x+4,y+4,x+width-3,y+height-3,color,color,color,color,false);
    draw_sprite_stretched_ext(sprite_index,1,x,y+1,width,height,make_colour_rgb(25, 30, 60),1);
    draw_sprite_stretched(sprite_index,0,x,y,width,height);
}

function draw_monogram(x,y,color,string){
    var shadow = make_colour_rgb(25, 30, 60);
    draw_set_font(f_monogram);
    draw_text_ext_color(x,y-3,string,12,-1,shadow,shadow,shadow,shadow,1);
    draw_text_ext_color(x,y-4,string,12,-1,color,color,color,color,1);
}

function draw_pointer(x,y,subimg,color){
    var shadow = make_colour_rgb(25, 30, 60);
    draw_sprite_ext(s_pointer,subimg,x,y+1,1,1,0,shadow,1);
    draw_sprite_ext(s_pointer,subimg,x,y,1,1,0,color,1);
}

function draw_party(){
    var menuback = make_colour_rgb(15, 55, 155);
    draw_box(s_box,0,0,218,240,menuback);
    var px = 17; var py = 20; var pm = 0;
    if party[0] != -1 {
        draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
        var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
        draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
        var _hp = party[pm].hp-party[pm].dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
        var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
        var _mp = party[pm].mp-party[pm].drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
        _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
    }
    py = 72; pm = 1;
    if party[1] != -1 {
        draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
        var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
        draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
        var _hp = party[pm].hp-party[pm].dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
        var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
        var _mp = party[pm].mp-party[pm].drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
        _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
    }
    py = 124; pm = 2;
    if party[2] != -1 {
        draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
        var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
        draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
        var _hp = party[pm].hp-party[pm].dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
        var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
        var _mp = party[pm].mp-party[pm].drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
        _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
    }
    py = 176; pm = 3;
    if party[3] != -1 {
        draw_monogram(px,py,c_white,party[pm].name);    draw_monogram(px+84,py,c_white,party[pm].status);
        var _lv = party[pm].lv; if _lv < 10 { _lv = "0"+string(_lv); }
        draw_monogram(px+36,py+12,c_white,"LV");        draw_monogram(px+60,py+12,c_white,_lv);        draw_monogram(px+84,py+12,c_white,party[pm].class);
        var _hp = party[pm].hp-party[pm].dmg; if _hp < 100 { if _hp < 10 { _hp = "00"+string(_hp); } else { _hp = "0"+string(_hp); }} else { _hp = string(_hp); }
        var _fl = party[pm].hp; if _fl < 100 { if _hp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+24,c_white,"HP");        draw_monogram(px+60,py+24,c_white,_hp+" / "+_fl);
        var _mp = party[pm].mp-party[pm].drn; if _mp < 100 { if _mp < 10 { _mp = "00"+string(_mp); } else { _mp = "0"+string(_mp); }} else { _mp = string(_mp); }
        _fl = party[pm].mp; if _fl < 100 { if _mp < 10 { _fl = "00"+string(_fl); } else { _fl = "0"+string(_fl); }} else { _fl = string(_fl); }
        draw_monogram(px+36,py+36,c_white,"MP");        draw_monogram(px+60,py+36,c_white,_mp+" / "+_fl);
    }
    if unit_select != -1 {
        draw_pointer(9,20+52*unit_select,3,c_white);
    }
}