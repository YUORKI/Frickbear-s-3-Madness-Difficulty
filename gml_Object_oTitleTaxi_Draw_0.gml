event_inherited();

if (Frame < 180)
    x += max((320 - x) / 15, -2);
else
    x -= max((321 - x) / 15, -2);

x = max(x, 0);

if (Frame == 140)
{
    with (instance_create_depth(x, y - 4, 0, oTitleGuardSilhouette))
    {
        Sprite = import_sprites("silhouette.png", sTitleTex_GuardSilhouettes);
        ImageIndex = global.Guard;
    }
}

if (FacePlayer)
    image_angle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;

image_xscale = sprite_get_width(Sprite) / 128 / 2;
var x1 = x - lengthdir_x(sprite_width / 2, image_angle);
var y1 = y - lengthdir_y(sprite_width / 2, image_angle);
var x2 = x + lengthdir_x(sprite_width / 2, image_angle);
var y2 = y + lengthdir_y(sprite_width / 2, image_angle);
draw_3d_sign(x1, y1, x2, y2, Height + (sprite_get_height(Sprite) / 8), Height, sprite_get_texture(Sprite, ImageIndex), 1, 1);

if (Frame == 270)
{
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text("GuardIntro");
}

Frame += 1;
