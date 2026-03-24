event_inherited();

if (FacePlayer)
    image_angle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;

var x1 = x - lengthdir_x(sprite_width / 2, image_angle);
var y1 = y - lengthdir_y(sprite_width / 2, image_angle);
var x2 = x + lengthdir_x(sprite_width / 2, image_angle);
var y2 = y + lengthdir_y(sprite_width / 2, image_angle);
draw_3d_sign(x1, y1, x2, y2, Height + (sprite_get_height(Sprite) / 4), Height, sprite_get_texture(Sprite, ImageIndex), image_xscale, 1);
