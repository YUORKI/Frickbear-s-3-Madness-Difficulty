var Image = floor(Frame * 2) % 4;
var EyePosition = world_to_screen(x, y, Height, oCamera.ViewMat, oCamera.ProjMat);

if (point_distance(EyePosition[0], EyePosition[1], device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) < 48 && mouse_check_button(mb_left) && Grabbed == 0 && !global.CamUp)
{
    Grabbed = true;
    simple_sound(sfxSalvage_Pull, (x - oCamera.x) * 2, (y - oCamera.y) * 2, false, 1);
}
else if (mouse_check_button_released(mb_left) && Grabbed == 1)
{
    if (Height < 240)
    {
        Grabbed = 2;
        simple_sound(sfxSalvage_WireShoot, (x - oCamera.x) * 2, (y - oCamera.y) * 2, false, 1);
    }
    else
    {
        Grabbed = 0;
    }
}

if (Frame > Timer)
{
    HeightTarget = 400;
    
    if (Grabbed != -1)
    {
        Grabbed = -1;
        HeightSpeed = -25;
    }
    
    if ((Frame - Timer) > 0.25 && !instance_exists(oSalvage_Jumpscarer))
        instance_create_depth(0, 0, 0, oSalvage_Jumpscarer);
}

if (Grabbed == 1)
{
    Height += (((((180 - device_mouse_y_to_gui(0)) * 0.4) + 256) - Height) / 5);
    Image = 4;
}
else if (Grabbed == 2)
{
    Height += ((512 - Height) / 15);
    
    if (round(Height) >= 400)
    {
        audio_play_sound(sfxMetalImpact, 5, false, 0.75);
        
        with (oSalvage)
            lose_hp(1, false);
        
        instance_destroy();
    }
    
    Image = 5;
}
else if (Frame >= 0)
{
    HeightSpeed = lerp(HeightSpeed, (HeightTarget - Height) * 0.25, 0.2);
    Height += HeightSpeed;
}

x = oCamera.x + lengthdir_y(128, image_angle + 180);
y = oCamera.y + lengthdir_x(128, image_angle + 180);

if (Frame == 0)
    simple_sound(sfxSalvage_WireDrop, (x - oCamera.x) * 3, (y - oCamera.y) * 3, false, 1);

var Width = 32;
var x1 = x + ((Width / 2) * dcos(image_angle));
var y1 = y + ((Width / 2) * dsin(image_angle));
var x2 = x - ((Width / 2) * dcos(image_angle));
var y2 = y - ((Width / 2) * dsin(image_angle));
var zTop = Height + 240;
var zBottom = Height - 16;
var TextureX = Image / 6;
var TextureWidth = TextureX + 0.16666666666666666;
shader_set(TransparencyShader);
var Texture = sprite_get_texture(sBossSalvage_OfficeWire, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureX, 1);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x2, y2, zTop, TextureWidth, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
shader_reset();
HeightTarget = 256 + (dsin(Frame * 90) * 16);
Frame += 0.016666666666666666;
