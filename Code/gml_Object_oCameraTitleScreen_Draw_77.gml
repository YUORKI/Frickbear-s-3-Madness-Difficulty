initialize_ui_surface();
draw_set_alpha(1 - Brightness);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(TitleAlpha);
draw_sprite_ext(sGameTitle, 0, 460, 150 - TitleFlyY, 1, 1, 0, c_white, TitleAlpha);
draw_set_font(global.FontW97White);
draw_set_halign(fa_right);
draw_text(632, 338 + TitleFlyY, "VER. 1.1.4");
shader_set(shFlash);
draw_sprite_ext(sGameTitle, 0, 460, 150 - TitleFlyY, 1, 1, 0, c_white, TitleBrightness);
shader_reset();
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
draw_text(460, 290 + TitleFlyY, "Press space!");
draw_set_alpha(1);
surface_reset_target();

if (input_check_pressed(UnknownEnum.Value_0) && TitleAlpha > 0 && !SpacePressed)
{
    TitleBrightness = 1;
    SpacePressed = true;
    TitleFlySpeed = -2;
    audio_play_sound(sfxMeleeConfirm, 15, false);
}
else if (input_check_pressed(UnknownEnum.Value_0) && !SpacePressed && Frame > -90)
{
    Frame = 150;
    
    if (!audio_is_playing(musTitleScreen))
        play_music(musTitleScreen, 1, global.FredbearMode ? 0.98 : 1);
}

if (TitleFlySpeed > 10 && !instance_exists(oTitleMenu))
    instance_create_depth(0, 0, 0, oTitleMenu);

if (SpacePressed)
{
    TitleFlyY = min(TitleFlyY + TitleFlySpeed, 360);
    TitleFlySpeed += 0.5;
}

if (Frame == -60)
    audio_play_sound(sfxLightning, 10, false);

if (Frame == 0 && !audio_is_playing(musTitleScreen))
    play_music(musTitleScreen, 1, global.FredbearMode ? 0.9 : 1);

if (Frame == 150)
{
    with (oTitleStars)
        Show = true;
}

if (Frame < 0)
{
    Perspective = 1;
    x = 320;
    y = 236;
    HeightOffset = 48;
    CameraRotationHTarget = 270;
    CameraRotationVTarget = 0;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 200;
    
    if (Frame >= -60)
        Brightness = ((dsin((60 + Frame) * 45) / (60 + Frame + 1)) + 0.5) - (Frame / 120);
}
else if (!TransitionToCutscene)
{
    var StartDegree = (dcos(Frame) / 2) + 0.5;
    
    if (Frame > 180)
        StartDegree = 0;
    
    var EndDegree = 1 - StartDegree;
    Perspective = 1;
    x += ((((StartDegree * 320) + (EndDegree * 305)) - x) / 10);
    y += ((((StartDegree * 236) + (EndDegree * 260)) - y) / 10);
    HeightOffset += ((((StartDegree * 48) + (EndDegree * 0)) - HeightOffset) / 10);
    CameraRotationHTarget += (((((StartDegree * 270) + (EndDegree * 230)) - CameraRotationHTarget) + (dsin(Frame) * 1)) / 10);
    CameraRotationVTarget += (((((StartDegree * 0) + (EndDegree * -35)) - CameraRotationVTarget) + (dcos(Frame) * 1)) / 10);
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 160;
    Brightness = (dsin((60 + Frame) * 45) / (60 + (2 * Frame) + 1)) + 0.5;
    
    if (Frame > 150)
        TitleAlpha += ((1 - TitleAlpha) / 10);
}
else
{
    var StartDegree = (dcos(Frame) / 2) + 0.5;
    
    if (Frame > 180)
        StartDegree = 0;
    
    var EndDegree = 1 - StartDegree;
    Perspective = 1;
    x += ((((EndDegree * 320) + (StartDegree * 305)) - x) / 10);
    y += ((((EndDegree * 245) + (StartDegree * 260)) - y) / 10);
    HeightOffset += ((((EndDegree * 4) + (StartDegree * 0)) - HeightOffset) / 10);
    CameraRotationHTarget += (((((EndDegree * 270) + (StartDegree * 230)) - CameraRotationHTarget) + (dsin(Frame) * 1)) / 10);
    CameraRotationVTarget += (((((EndDegree * -30) + (StartDegree * -35)) - CameraRotationVTarget) + (dcos(Frame) * 1)) / 10);
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 160;
    Brightness = (dsin((60 + Frame) * 45) / (60 + (2 * Frame) + 1)) + 0.5;
    
    if (Frame > 150)
        TitleAlpha += ((1 - TitleAlpha) / 10);
    
    if (Frame == 30)
        instance_create_depth(480, 232, 0, oTitleTaxi);
    
    with (oTitle_SpecialCharacter)
        TransitionSquish -= (TransitionSquish / 10);
}

TitleBrightness = max(TitleBrightness - 0.016666666666666666, 0);

enum UnknownEnum
{
    Value_0
}
