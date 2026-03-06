global.smallfont = font_add_sprite(s_smallfont,ord(" "),0,1);

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

function draw_smallfont(x,y,color,string){
    var shadow = make_colour_rgb(25, 30, 60);
    draw_set_font(global.smallfont);
    draw_text_ext_color(x,y+1,string,12,-1,shadow,shadow,shadow,shadow,1);
    draw_text_ext_color(x,y,string,12,-1,color,color,color,color,1);
}

function draw_pointer(x,y,subimg,color){
    var shadow = make_colour_rgb(25, 30, 60);
    draw_sprite_ext(s_pointer,subimg,x,y+1,1,1,0,shadow,1);
    draw_sprite_ext(s_pointer,subimg,x,y,1,1,0,color,1);
}

function draw_mini_hp(x,y,struct){
    draw_smallfont(x,y,c_white,format_number(struct.hp-struct.d_dmg,4)+"/"+format_number(struct.hp,4));
    var _g = make_colour_rgb(65, 205, 115);
    draw_rectangle_color(x,y+6,x+34,y+6,_g,_g,_g,_g,0);
    var shadow = make_colour_rgb(25, 30, 60);
    draw_rectangle_color(x,y+7,x+34,y+7,shadow,shadow,shadow,shadow,0);
}

function draw_mini_mp(x,y,struct){
    draw_smallfont(x,y,c_white,format_number(struct.mp-struct.d_drn,4)+"/"+format_number(struct.mp,4));
    var _g = make_colour_rgb(65, 205, 115);
    draw_rectangle_color(x,y+6,x+34,y+6,_g,_g,_g,_g,0);
    var shadow = make_colour_rgb(25, 30, 60);
    draw_rectangle_color(x,y+7,x+34,y+7,shadow,shadow,shadow,shadow,0);
}

function draw_unit_select(x,y,struct){
    draw_set_halign(fa_left);
    draw_monogram(x,y,c_white,struct.name);
    draw_sprite(struct.icon,struct.subimg,x,y+12);
    draw_monogram(x+36,y+12,c_white,"Lv "+format_number(struct.lv,2)+"\nHp\nMp");
    draw_mini_hp(x+54,y+24,struct);
    draw_mini_mp(x+54,y+36,struct);
}

function draw_party_select(n=-1) {
    var _x = 0; var _y = 74;
    var menuback = make_colour_rgb(15, 55, 155);
    draw_box(s_box,_x,_y,218,166,menuback);
    for(i=0;i<4;i+=1) {
        if o_system.party[i] != -1 {
            var u = o_system.party[i];
            draw_sprite(u.icon,0,_x+16,_y+10+i*38);
            draw_monogram(_x+52,_y+10+i*38,c_white,u.name+"  "+u.status);
            draw_monogram(_x+52,_y+22+i*38,c_white,"HP  "+format_number(u.hp-u.d_dmg,4)+" / "+format_number(u.hp,4));
            draw_monogram(_x+52,_y+34+i*38,c_white,"MP  "+format_number(u.mp-u.d_drn,4)+" / "+format_number(u.mp,4));
        }
    }
    if n != -1 {
        draw_pointer(_x+8,_y+22+n*38,3,c_white);
    }
}

function format_number(n,length) {
    var l = length;
    var r = "";
    switch(l) {
        case 2:
            if n < 10 { r = "0"+string(n) } else { r = string(n) }
            break;
        case 3:
            if n < 10 { r = "00"+string(n) } else { if n < 100 { r = "0"+string(n) } else { r = string(n) } }
            break;
        case 4:
            if n < 10 { r = "000"+string(n) } else { if n < 100 { r = "00"+string(n) } else { if n < 1000 { r = "0"+string(n) } else { r = string(n) } } }
            break;
    }
    return(r);
}

function draw_facets(x,y,equip,unit=-1) {
    var _shadow = make_colour_rgb(25, 30, 60);
    var _x = x;
    var _y = y;
    if equip.facets > 0 {
        for(i=0;i<equip.facets;i+=1) {
            draw_sprite_ext(s_facet_slot,0,_x+9*i,_y+1,1,1,0,_shadow,1);
            if equip.pairs > 0 {
                if equip.pairs*2 > i && i % 2 != 0 {
                    draw_rectangle_color(_x+6+9*i-9,_y+3,_x+9+9*i-9,_y+5,_shadow,_shadow,_shadow,_shadow,0);
                }
            }
            draw_sprite_ext(s_facet_slot,0,_x+9*i,_y,1,1,0,c_white,1);
            if equip.pairs > 0 {
                if equip.pairs*2 > i && i % 2 != 0 {
                    draw_rectangle_color(_x+6+9*i-9,_y+2,_x+9+9*i-9,_y+4,c_white,c_white,c_white,c_white,0);
                }
            }
        }
    }
}

function draw_facet(x,y,color) {;
    var _shadow = make_colour_rgb(25, 30, 60);
    draw_sprite_ext(s_facet_slot,0,x,y+1,1,1,0,_shadow,1);
    if color != -1 {
        draw_sprite_ext(s_facet_slot,1,x,y,1,1,0,color,1);
    }
    draw_sprite_ext(s_facet_slot,0,x,y,1,1,0,c_white,1);
}