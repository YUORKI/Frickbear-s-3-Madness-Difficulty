var ID = UnknownEnum.Value_23;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (!global.CamUp && !Active)
{
    WaitForFlip = true;
    CanSpawn = true;
}

if (((WaitForFlip == true && oCamera.CamAlpha < 1) || (global.Cam != PreviousCamera && global.MonitorSystem == "Cameras")) && (CanSpawn && global.CamUp))
{
    var CanAppear = irandom_range(0, round(lerp(5, 1, AI / 20))) == 0;
    
    if (instance_exists(oMangle) && global.AILevels[UnknownEnum.Value_9] > 0)
    {
        if (oMangle.CurrentCam == global.Cam)
            CanAppear = false;
    }
    
    if (CanAppear)
    {
        audio_play_sound(sfxWindowScare, 15, false);
        audio_play_sound(choose(voc_NightmareBB_Laugh1, voc_NightmareBB_Laugh2, voc_NightmareBB_Laugh3), 15, false);
        Frame = 0;
        HitsLeft = round(lerp(3, 8, AI / 20));
        Camera = global.Cam;
        HeightSpeed = 0;
        Height = 0;
        Active = true;
        CanSpawn = false;
    }
    
    WaitForFlip = false;
    PreviousCamera = global.Cam;
}

if (global.Cam == Camera && global.CamUp && global.MonitorSystem == "Cameras")
{
    depth = 6;
    
    if (mouse_check_button_pressed(mb_left) && HitsLeft > 0 && mouse_in_zone(240, 32, 400, 300) && Active)
    {
        Shakiness += 10;
        HitsLeft--;
        Frame = max(Frame - 1, 0);
        audio_stop_sound(voc_NightmareBB_Laugh1);
        audio_stop_sound(voc_NightmareBB_Laugh2);
        audio_stop_sound(voc_NightmareBB_Laugh3);
        audio_stop_sound(voc_NightmareBB_Hurt1);
        audio_stop_sound(voc_NightmareBB_Hurt2);
        audio_stop_sound(voc_NightmareBB_Hurt3);
        audio_stop_sound(voc_NightmareBB_Hurt4);
        audio_stop_sound(voc_NightmareBB_Hurt5);
        audio_play_sound(choose(sfxPunch1, sfxPunch2, sfxPunch3), 15, false);
        audio_play_sound(choose(voc_NightmareBB_Hurt1, voc_NightmareBB_Hurt2, voc_NightmareBB_Hurt3, voc_NightmareBB_Hurt4, voc_NightmareBB_Hurt5), 15, false);
        
        if (HitsLeft == 0)
        {
            HeightSpeed = 10;
            block_tokens();
        }
    }
    
    var Direction = -30;
    var XOffset = random_range(-1 * Shakiness, Shakiness) + lengthdir_x(Height, Direction + 90);
    var YOffset = random_range(-1 * Shakiness, Shakiness) + lengthdir_y(Height, Direction + 90);
    var JawHeight = (Height + (Shakiness * -12)) - 48;
    var JawXOffset = XOffset + lengthdir_x(JawHeight, Direction + 90);
    var JawYOffset = YOffset + lengthdir_y(JawHeight, Direction + 90);
    var ShakeOffset = random_range(-1 * Shakiness, Shakiness);
    var Size = 1 - (Shakiness * 0.01);
    var EyeSize = 1 - (clamp(Shakiness, 0, 10) / 20);
    draw_sprite_ext(sCameras_NightmareBB, 1, global.CamX + 200 + JawXOffset, global.CamY + 150 + JawYOffset, Size, Size, Direction + ShakeOffset, c_white, 1);
    draw_sprite_ext(sCameras_NightmareBB, 0, global.CamX + 200 + XOffset, global.CamY + 150 + YOffset, Size, Size, Direction + ShakeOffset, c_white, 1);
    var EyeXOffset = XOffset + lengthdir_x(64 + Shakiness, Direction);
    var EyeYOffset = YOffset + lengthdir_y(64 + Shakiness, Direction);
    draw_sprite_ext(sCameras_NightmareBBEye, 0, global.CamX + 200 + EyeXOffset, global.CamY + 150 + EyeYOffset, EyeSize, EyeSize, Direction + ShakeOffset, c_white, 1);
    EyeXOffset = XOffset + lengthdir_x(-64 - Shakiness, Direction);
    EyeYOffset = YOffset + lengthdir_y(-64 - Shakiness, Direction);
    draw_sprite_ext(sCameras_NightmareBBEye, 0, global.CamX + 200 + EyeXOffset, global.CamY + 150 + EyeYOffset, EyeSize, EyeSize, Direction + ShakeOffset, c_white, 1);
    
    if (instance_exists(oPhantoms) && Active)
        oPhantoms.Aggro = 0;
}

if (HitsLeft == 0)
{
    if (Active)
    {
        audio_play_sound(sfxCartoonHitSlip, 15, false);
        audio_play_sound(choose(voc_NightmareBB_Leave1, voc_NightmareBB_Leave2, voc_NightmareBB_Leave3), 15, false);
    }
    
    if (Height > -400)
    {
        Height += HeightSpeed;
        HeightSpeed -= 2;
    }
    
    Active = false;
}

if (Frame > lerp(10, 3, AI / 20) && Active)
    jumpscare(ID, 0);

Shakiness += ((0 - Shakiness) / 10);
Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_9 = 9,
    Value_23 = 23
}
