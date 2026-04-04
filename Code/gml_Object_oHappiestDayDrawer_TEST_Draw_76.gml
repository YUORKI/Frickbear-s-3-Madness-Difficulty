if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (LockZone == undefined)
    LockZone = instance_nearest(x, y, oHD_CamZone);

TargetX = oHD_Guard.x + 32;
TargetY = oHD_Guard.y;
var BoundLeft = 80 + LockZone.x;
var BoundRight = (LockZone.x + LockZone.sprite_width) - 80;
var BoundTop = 72 + LockZone.y;
var BoundBottom = (LockZone.y + LockZone.sprite_height) - 72;
TargetX = clamp(round(TargetX), BoundLeft, BoundRight);
TargetY = clamp(round(TargetY), BoundTop, BoundBottom);
x += ((TargetX - x) / 4);
y += ((TargetY - y) / 4);
var rX = clamp(round(x), 80, room_width - 80);
var rY = clamp(round(y), 72, room_height - 72);
draw_set_font(global.FontGameboy);
var Obj = 0;
var XOff = 80;
var YOff = 72;

for (var o = 0; o < instance_number(oHappiestDayObject); o++)
{
    Obj = instance_find(oHappiestDayObject, o);
    
    if (Obj.sprite_index == -1 || Obj.object_index == oHD_CamZone || Obj.object_index == oHD_CutsceneZone)
        continue;
    
    draw_sprite_ext(Obj.sprite_index, Obj.image_index, ((Obj.x + Obj.XOffset) - x) + XOff, ((Obj.y + Obj.YOffset) - y) + YOff, Obj.image_xscale, Obj.image_yscale, Obj.image_angle, c_white, 1);
}

surface_reset_target();
