if (!instance_exists(oToyChica))
    instance_destroy();

var Side = 0;

if (x < 1088)
    Side = -1;

if (x > 1600)
    Side = 1;

if (place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left) && Mode == "Wait")
{
    audio_play_sound(sfxMarioKick, 15, false);
    block_tokens();
    Mode = "Fadeout";
    image_alpha = 2;
}

if (ceil(DeathTimer) == 0)
{
    jumpscare(UnknownEnum.Value_8, Side);
    DeathTimer = -99;
}

if (Mode == "Fadeout")
{
    x = OriginalX + (random_range(-4, 4) * max(0, image_alpha - 1));
    y = (OriginalY + (random_range(-4, 4) * max(0, image_alpha - 1))) - 8;
    image_index = 2;
    image_angle = 15;
    image_alpha -= (1/15);
    
    if (image_alpha <= (1/15))
        instance_destroy(self);
}
else
{
    BlinkFrames--;
    
    if ((irandom(30) == 1 && BlinkFrames <= 0) || BlinkFrames < -30)
    {
        BlinkFrames = 5;
        simple_sound(sfxCupcakeBlink, Side * 500, 0, false, 0.4, 5, random_range(0.8, 1));
    }
    
    image_index = BlinkFrames > 0;
    
    if (global.CamUp)
        DeathTimer -= (1/30);
    else
        DeathTimer -= 0.016666666666666666;
    
    if ((1344 - x) > 300 && wearing_mask())
        DeathTimer += (1/120);
}

enum UnknownEnum
{
    Value_8 = 8
}
