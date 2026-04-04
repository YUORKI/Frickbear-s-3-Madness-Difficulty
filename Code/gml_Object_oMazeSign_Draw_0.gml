if (FacePlayer)
    image_angle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;

image_xscale = sprite_get_width(Sprite) / 32;
var x1 = x - lengthdir_x(sprite_get_width(Sprite) / 2, image_angle);
var y1 = y - lengthdir_y(sprite_get_width(Sprite) / 2, image_angle);
var x2 = x + lengthdir_x(sprite_get_width(Sprite) / 2, image_angle);
var y2 = y + lengthdir_y(sprite_get_width(Sprite) / 2, image_angle);
shader_set(TransparencyShader);
draw_3d_sign(x1, y1, x2, y2, Height + sprite_get_height(Sprite), Height, sprite_get_texture(Sprite, ImageIndex), 1, 1);
shader_reset();
