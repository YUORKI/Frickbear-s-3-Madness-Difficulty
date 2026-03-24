if (place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left) && Mode == "Wait")
{
    audio_play_sound(sfxMarioKick, 15, false);
    block_tokens();
    Mode = "Fadeout";
    image_alpha = 2;
    global.MicrogameWin = true;
    end_microgame();
}

if (ceil(DeathTimer) == 0)
{
    var Side = 0;
    
    if (x < 1088)
        Side = -1;
    
    if (x > 1600)
        Side = 1;
    
    jumpscare(UnknownEnum.Value_8, Side);
    DeathTimer = -99;
}

if (Mode == "Fadeout")
{
    x = OriginalX + (random_range(-4, 4) * max(0, image_alpha - 1));
    y = (OriginalY + (random_range(-4, 4) * max(0, image_alpha - 1))) - 8;
    image_index = 2;
    image_angle = 15;
    image_alpha -= ((global.MicrogameSpeed * 4) / 60);
    
    if (image_alpha <= ((global.MicrogameSpeed * 4) / 60))
        instance_destroy(self);
}
else
{
    x = OriginalX;
    y = OriginalY;
    image_index = 0;
    DeathTimer -= (global.MicrogameSpeed / 60);
}

show_debug_message(string(x) + "," + string(y));

enum UnknownEnum
{
    Value_8 = 8
}
