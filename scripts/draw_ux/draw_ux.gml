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