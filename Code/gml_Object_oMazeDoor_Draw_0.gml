depth = 80;

if (distance_to_object(oCamera3DMaze) < 128)
    RotationTarget = 90;
else if (distance_to_object(oCamera3DMaze) > 196)
    RotationTarget = 0;

image_angle += (((OriginalAngle + RotationTarget) - image_angle) / 15);
var _left = -sprite_xoffset;
var _top = -sprite_yoffset;
var _right = sprite_width + _left;
var _bottom = sprite_height + _top;
var _c = dcos(image_angle);
var _s = dsin(image_angle);
var x1 = x + (_left * _c) + (_top * _s);
var y1 = y + (_left * -_s) + (_top * _c);
var x2 = x + (_right * _c) + (_top * _s);
var y2 = y + (_right * -_s) + (_top * _c);
var x4 = x + (_right * _c) + (_bottom * _s);
var y4 = y + (_right * -_s) + (_bottom * _c);
var x3 = x + (_left * _c) + (_bottom * _s);
var y3 = y + (_left * -_s) + (_bottom * _c);
draw_3d_square(x1, y1, x2, y2, x3, y3, x4, y4, depth, 0, image_xscale, image_yscale, TextureFace, Texture, TextureFace, Texture);
draw_self();
