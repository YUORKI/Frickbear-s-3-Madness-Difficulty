initialize_ui_surface();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.FontW97Black);

if (!Freeze || instance_exists(oJumpscarePhantoms))
{
    if (CamAlpha == 1)
        draw_sprite_ext(sFlashlight, global.Flashlight, clamp(device_mouse_x_to_gui(0), 0, 640), clamp(device_mouse_y_to_gui(0), 0, 360), FlashlightPower, FlashlightPower, 0, c_white, global.Brightness);
    
    if (global.GoGreen)
    {
        shader_set(shGreenToWhite);
        
        if (surface_exists(application_surface))
            draw_surface(application_surface, 0, 0);
        
        shader_reset();
    }
    
    draw_sprite(sNightmareGameBorder, 0, 320, HandheldOffset);
    
    if (HandheldUp)
        HandheldOffset += ((360 - HandheldOffset) / 5);
    else
        HandheldOffset += ((740 - HandheldOffset) / 5);
    
    if (surface_exists(global.MinigameSurface))
    {
        draw_surface_ext(global.MinigameSurface, 160, 36 + (HandheldOffset - 360), 2, 2, 0, c_white, 1);
        var BlurbWindowSize = 80;
        
        if (instance_exists(oHD_Guard) && instance_exists(oHappiestDayDrawer))
        {
            var SurfaceX = (oHD_Guard.x + (80 - (BlurbWindowSize / 2))) - oHappiestDayDrawer.x;
            var SurfaceY = (oHD_Guard.y + (72 - (BlurbWindowSize / 2))) - oHappiestDayDrawer.y;
            SurfaceX = clamp(SurfaceX, 0, 160 - BlurbWindowSize);
            SurfaceY = clamp(SurfaceY, 0, 144 - BlurbWindowSize);
            draw_surface_part(global.MinigameSurface, SurfaceX, SurfaceY, BlurbWindowSize, BlurbWindowSize, 320 - (BlurbWindowSize / 2), (370 - BlurbWindowSize) + (720 - HandheldOffset));
            draw_sprite(sNightmareMinigameMiniWindow, 0, 320 - (BlurbWindowSize / 2), (370 - BlurbWindowSize) + (720 - HandheldOffset));
        }
    }
    
    if (instance_exists(oVanniMask) && CamAlpha == 1)
        draw_sprite_ext(sVanniOverlay, 0, 320, 180, oVanniMask.OverlaySize, oVanniMask.OverlaySize, 0, c_white, (0.6 + (dsin(oVanniMask.Timer * 2) * 0.2)) * oVanniMask.Alpha);
    
    if (global.Temperature > 30)
    {
        var VignettePercent = (global.Temperature - 30) / 10;
        draw_sprite_ext(sBurningVignette, 0, 320, 180, 3 - VignettePercent, 3 - VignettePercent, 0, c_white, VignettePercent / 2);
    }
    
    if (CamAlpha == 1 && JawLevel != 0)
    {
        var FredShift = round(360 * (1 - (JawLevel * 0.6)));
        draw_sprite_ext(sFredbearJaw, 0, 320, 0 - FredShift, 1, 1, 0, -1, 1);
        draw_sprite_ext(sFredbearJaw, 0, 320, 360 + FredShift, 1, -1, 0, -1, 1);
    }
    
    if (StareFrames > -180)
    {
        if (StareFrames > 0 && !global.CamUp)
        {
            draw_set_alpha(random_range(2, 0));
        }
        else
        {
            audio_stop_sound(sfxStareStatic);
            var StareAlpha = (StareFrames + 180) / 180;
            draw_set_alpha(StareAlpha * StareAlpha * StareAlpha * StareAlpha);
        }
        
        draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
}

CamAnimation += ((global.CamUp - CamAnimation) / 5);
MaskAnimation += ((global.MaskDown - MaskAnimation) / 5);
var CamSize = 1;
var CamTop = (1 - CamAnimation) * 400;
var MonitorY = (1 - CamAnimation) * 480;
draw_sprite_ext(sMonitorScreen, 0, 320, 180 + MonitorY, CamSize, CamSize, 0, -1, CamAlpha);

if (sprite_exists(MaskSprite))
    draw_sprite_ext(MaskSprite, MaskImage + (global.Guard * 2), 320, 180 - ((1 - MaskAnimation) * 480), CamSize, CamSize, 0, -1, 1);

draw_set_alpha(0.5 * CamAlpha);
draw_sprite_part(sMonitorReflection, 0, 0, CamTop, 640, 360 - CamTop, 0, CamTop);
draw_set_alpha(0.25 * CamAlpha);
draw_sprite_part(FaceSprites, (global.Guard * 2) + (BossMode != UnknownEnum.Value_0), 0, CamTop, 640, 360 - CamTop, 0, CamTop);
draw_set_alpha(1);

if (global.CamUp && !ShowMalhare)
{
    if (instance_exists(oMalhare) && global.AILevels[UnknownEnum.Value_37] > 0)
    {
        oMalhare.FlipsLeft--;
        
        if (oMalhare.FlipsLeft <= 10)
        {
            if (oMalhare.FlipsLeft == 10)
                audio_play_sound(voc_Malhare_LaughAppear, 5, false, 0.5);
            
            if (oMalhare.FlipsLeft == 0)
                audio_play_sound(voc_Malhare_LaughEnd, 5, false, 0.5);
            
            audio_play_sound(sfxMalhareBlip, 5, false);
        }
        
        ShowMalhare = true;
    }
}
else if (!global.CamUp)
{
    ShowMalhare = false;
}

if (ShowMalhare && instance_exists(oMalhare))
{
    if (oMalhare.FlipsLeft <= 10)
    {
        draw_set_alpha(CamAlpha);
        var CurrentY = 0;
        
        while (CurrentY < 360)
        {
            var XOffset = irandom_range(-4, 4);
            var PreviousY = CurrentY;
            var CurrentX = irandom_range(-160, 160);
            
            if (irandom(2) != 1)
                CurrentX = XOffset;
            
            CurrentY += irandom_range(32, 128);
            draw_sprite_part(sMalhare, 0, 0, PreviousY, 640, CurrentY, CurrentX - 640, PreviousY + MonitorY);
            draw_sprite_part(sMalhare, 0, 0, PreviousY, 640, CurrentY, CurrentX, PreviousY + MonitorY);
            draw_sprite_part(sMalhare, 0, 0, PreviousY, 640, CurrentY, CurrentX + 640, PreviousY + MonitorY);
            var LivesOffset = 240;
            draw_sprite_part(sMalhareLives, oMalhare.FlipsLeft, 0, PreviousY - LivesOffset, 288, CurrentY - LivesOffset, 176, PreviousY + MonitorY);
        }
        
        draw_set_alpha(1);
    }
}

if (!Freeze || instance_exists(oJumpscarePhantoms))
{
    draw_sprite(sOfficeUI, 0, 0, 0);
    var TimerHour = floor((global.Timer / 60) + 12) % 12;
    var TimerMinute = floor(global.Timer + 1440) % 60;
    var TimerA;
    
    if (TimerHour == 0)
        TimerA = "12";
    else
        TimerA = string(TimerHour);
    
    var TimerB;
    
    if (TimerMinute < 10)
        TimerB = "0" + string(TimerMinute);
    else
        TimerB = string(TimerMinute);
    
    var TimerC;
    
    if ((floor(global.Timer / 720) % 2) == 0)
        TimerC = " AM";
    else
        TimerC = " PM";
    
    var Text = string(TimerA) + ":" + string(TimerB) + string(TimerC);
    
    if (BossMode != UnknownEnum.Value_0 && BossMode != UnknownEnum.Value_3)
        Text = "Phase " + string(global.BossPhase);
    
    var NightText = "Night " + string(global.Night);
    
    if (is_string(global.Night))
        NightText = string(global.Night);
    
    if (global.Night == "Custom" && global.Route != UnknownEnum.Value_0)
    {
        NightText = format_as_timer(BossTimer, true);
        BossTimer += 0.016666666666666666;
    }
    
    draw_text_color(34, 6, Text, c_white, c_white, c_white, c_white, 1);
    draw_text_color(34, 23, NightText, c_white, c_white, c_white, c_white, 1);
    var MeterWidth = min(6 * ceil(global.Power / 5), 120);
    draw_sprite_part(sMeter, 0, 0, 0, MeterWidth, 6, 49, 344);
    
    if (global.Power > 100)
    {
        MeterWidth = min(6 * ceil((global.Power - 100) / 5), 120);
        draw_sprite_part(sMeter, 4, 0, 0, MeterWidth, 6, 49, 344);
    }
    
    if (InfinitePowerCutoffTime > 0 && !(InfinitePowerCutoffTime < 5 && (floor(global.Timer * 4) % 2) == 1))
    {
        MeterWidth = 120;
        draw_sprite_part(sMeter, 5, 0, 0, MeterWidth, 6, 49, 344);
    }
    
    MeterWidth = 6 * global.Usage;
    draw_sprite_part(sMeter, 4, 0, 0, MeterWidth, 6, 184, 344);
    MeterWidth = 6 * floor(global.Temperature / 2);
    var MeterColor = floor(global.Temperature / 8) - 1;
    draw_sprite_part(sMeter, MeterColor, 0, 0, MeterWidth, 6, 511, 344);
    
    if (global.Temperature < 0)
    {
        MeterWidth = 6 * abs(floor(global.Temperature / 2));
        draw_sprite_part(sMeter, 5, 0, 0, MeterWidth, 6, 511 + (120 - MeterWidth), 344);
    }
    
    if (global.Tokens != TokenBoxValue)
    {
        TokenBoxSpeed = min(abs(TokenBoxValue - global.Tokens), 4);
        TokenBoxValue = global.Tokens;
    }
    
    draw_set_halign(fa_left);
    draw_sprite_stretched(sWindowBase, 0, 554, 2 + TokenBoxOffset, 84, 22);
    draw_text_color(560, 3 + TokenBoxOffset, "Tokens: ", c_white, c_white, c_white, c_white, 1);
    draw_set_halign(fa_right);
    draw_text_color(632, 3 + TokenBoxOffset, floor(global.Tokens), c_white, c_white, c_white, c_white, 1);
    
    if (!global.CamUp && mouse_in_zone(554, 2, 84, 88))
    {
        TokenBoxOffset += ((-24 - TokenBoxOffset) / 5);
        TokenBoxSpeed = 0;
    }
    else
    {
        TokenBoxSpeed = lerp(TokenBoxSpeed, (0 - TokenBoxOffset) * 0.8, 0.2);
        TokenBoxOffset += TokenBoxSpeed;
    }
}

draw_set_alpha(EntranceAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
EntranceAlpha = max(EntranceAlpha - 0.016666666666666666, 0);

if (Freezeframe != undefined)
{
    draw_sprite(Freezeframe, 0, 0, 0);
    draw_sprite_ext(sFlashlight, 0, 0, 0, 1, 1, 0, -1, global.Brightness);
}

if (instance_exists(oJumpscare))
{
    draw_sprite_ext(sFlashlight, 0, 320, 180, 1, 1, 0, -1, global.Brightness);
    
    if (global.Jumpscare == UnknownEnum.Value_55)
    {
        draw_sprite(sJumpscare_Fredbear, floor(oJumpscare.Frame / 2), 0, 0);
    }
    else
    {
        var Vibration = (oJumpscare.Frame / 5) + 1;
        var FrameVal = 1 - (floor(oJumpscare.Frame) % 3);
        var Offset = (round(((FrameVal * 2) / Vibration) * 80) / 10) + (sqrt(oJumpscare.Frame) * oJumpscare.OriginX * 2);
        
        if (sprite_exists(oJumpscare.Sprite))
        {
            draw_sprite_ext(oJumpscare.Sprite, oJumpscare.BodyImage, oJumpscare.JumpX + Offset, oJumpscare.JumpY, oJumpscare.SizeBody, oJumpscare.SizeBody, oJumpscare.JumpAngle, -1, 1);
            draw_sprite_ext(oJumpscare.Sprite, oJumpscare.HeadImage, oJumpscare.JumpX, oJumpscare.JumpY, oJumpscare.SizeHead, oJumpscare.SizeHead, Offset + oJumpscare.JumpAngle, -1, 1);
        }
    }
}

surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_37 = 37,
    Value_55 = 55
}
