image_index = (floor(abs(x) / 2) % 2) + 16;
var MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
var MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;
var Paused = oMinigame_PuppetPatrol.Paused;

if (Stunned)
{
    image_index = 2 + RightKid + (Color * 4);
    
    if (!Paused)
    {
        Frame += 1;
        
        if ((YOffset + YSpeed) > 0)
        {
            YOffset = 0;
            YSpeed = ceil(YSpeed * -0.5);
        }
        
        YOffset += YSpeed;
        YSpeed += 0.5;
    }
}
else if (!Paused)
{
    x += (Direction / 4);
}

image_xscale = Direction;

if (x < -16 || x > 336 || Frame > 60)
    instance_destroy();

if ((MouseX >= bbox_left && MouseY >= bbox_top && MouseX < bbox_right && MouseY < bbox_bottom) && mouse_check_button_pressed(mb_left) && !Stunned && oMinigame_PuppetPatrol.DesiredKid != -1 && !Paused)
{
    Stunned = true;
    YSpeed = -2;
    audio_play_sound(sfxBitCrunch, 10, false);
    
    if (Color == oMinigame_PuppetPatrol.DesiredKid || Color == 3)
    {
        RightKid = true;
    }
    else
    {
        RightKid = false;
        audio_play_sound(sfxBitFail, 10, false);
    }
    
    if (Color == 3)
        audio_play_sound(sfxBitBoost, 10, false);
    
    with (oMinigame_PuppetPatrol)
    {
        var StreakBonus = Streak >= 5;
        
        if (Streak == 4 && !audio_is_playing(sfxBitBoost) && other.RightKid)
            audio_play_sound(sfxBitBoost, 20, false);
        
        DesiredKid = -1;
        Happy = other.RightKid;
        Cooldown = 32 + (32 * (1 - Happy));
        
        if (other.Color == 3)
        {
            Score += (3 + (2 * StreakBonus));
            var TokenAmount = 3 + (2 * StreakBonus);
            add_tokens(TokenAmount);
            global.TokensPerMinigame[UnknownEnum.Value_3] += TokenAmount;
            Streak++;
        }
        else if (Happy)
        {
            Score += (1 + StreakBonus);
            add_tokens(1 + StreakBonus);
            global.TokensPerMinigame[UnknownEnum.Value_3] += 1 + StreakBonus;
            Streak++;
        }
        else
        {
            Streak = 0;
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3
}
