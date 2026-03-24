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
var vm = matrix_build_lookat(rX, rY, -10, rX, rY, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(160, 144, 1, 10000000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
draw_set_font(global.FontGameboy);
