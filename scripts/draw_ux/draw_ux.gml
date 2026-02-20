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

function draw_party_select(n=-1) {
    var _x = 0; var _y = 74;
    var menuback = make_colour_rgb(15, 55, 155);
    draw_box(s_box,_x,_y,218,166,menuback);
    for(i=0;i<4;i+=1) {
        if o_system.party[i] != -1 {
            var u = o_system.party[i];
            draw_sprite(u.icon,0,_x+16,_y+10+i*38);
            draw_monogram(_x+52,_y+10+i*38,c_white,u.name+"  "+u.status);
            var a = u.hp-u.d_dmg;   if a < 10 { a = "00"+string(a) } else { if a < 100 { a = "0"+string(a) } else { a = string(a) }}
            var b = u.hp;        if b < 10 { b = "00"+string(b) } else { if b < 100 { b = "0"+string(b) } else { b = string(b) }}
            draw_monogram(_x+52,_y+22+i*38,c_white,"HP  "+a+" / "+b);
            a = u.mp-u.d_drn;   if a < 10 { a = "00"+string(a) } else { if a < 100 { a = "0"+string(a) } else { a = string(a) }}
            b = u.mp;        if b < 10 { b = "00"+string(b) } else { if b < 100 { b = "0"+string(b) } else { b = string(b) }}
            draw_monogram(_x+52,_y+34+i*38,c_white,"MP  "+a+" / "+b);
        }
    }
    if n != -1 {
        draw_pointer(_x+8,_y+22+n*38,3,c_white);
    }
}