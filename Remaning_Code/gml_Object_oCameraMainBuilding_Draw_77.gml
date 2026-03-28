initialize_ui_surface();
var GuideWidth = 120;
GuideOffset += (((!ShowGuide * -1 * GuideWidth) - GuideOffset) / 5);
draw_rectangle_color(GuideOffset, 0, GuideOffset + GuideWidth, 360, c_black, c_black, c_black, c_black, false);
draw_set_font(global.FontW97White);
var GuideText = "CONTROLS:\n" + string("\nMove: {0}, {1}, {2}, {3}", cur_key_name(UnknownEnum.Value_2), cur_key_name(UnknownEnum.Value_3), cur_key_name(UnknownEnum.Value_4), cur_key_name(UnknownEnum.Value_5)) + string("\nGo Up: {0}", cur_key_name(UnknownEnum.Value_24)) + string("\nGo Down: {0}", cur_key_name(UnknownEnum.Value_25)) + string("\nLock/Unlock Cursor: {0}", cur_key_name(UnknownEnum.Value_10)) + string("\nToggle Guide: {0}", cur_key_name(UnknownEnum.Value_11)) + string("\nCam Warps: {0}-{1}", cur_key_name(UnknownEnum.Value_12), cur_key_name(UnknownEnum.Value_19)) + string("\n\nBack to Extras: {0}", cur_key_name(UnknownEnum.Value_1));
draw_text(GuideOffset + 6, 6, GuideText);
TransitionAmount += ((Transitioning - TransitionAmount) / 5);

if (Transitioning)
{
    TransitionFrame++;
    Perspective = true;
}

draw_rectangle_color(0, 0, 640, 180 * TransitionAmount, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 360 - (180 * TransitionAmount), 640, 360, c_black, c_black, c_black, c_black, false);

if (TransitionFrame == 60)
    room_goto(Extras);

surface_reset_target();

if (input_check_pressed(UnknownEnum.Value_12))
{
    x = 900;
    y = 580;
    HeightOffset = 126;
    CameraRotationHTarget = 220;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 640;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_13))
{
    x = 844;
    y = 664;
    HeightOffset = 126;
    CameraRotationHTarget = 310;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 64;
    global.Fog = 704;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_14))
{
    x = 940;
    y = 90;
    HeightOffset = 126;
    CameraRotationHTarget = 150;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 96;
    global.Fog = 280;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_15))
{
    x = 80;
    y = 310;
    HeightOffset = 126;
    CameraRotationHTarget = 200;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 640;
}

if (input_check_pressed(UnknownEnum.Value_16))
{
    x = 36;
    y = 580;
    HeightOffset = 126;
    CameraRotationHTarget = 145;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 640;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_17))
{
    x = 800;
    y = 850;
    HeightOffset = 126;
    CameraRotationHTarget = 300;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 32;
    global.Fog = 480;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_18))
{
    x = 1400;
    y = 870;
    HeightOffset = 126;
    CameraRotationHTarget = -40;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 64;
    global.Fog = 640;
    audio_play_sound(sfxCamSwitch, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_19))
{
    x = 1290;
    y = 340;
    HeightOffset = 126;
    CameraRotationHTarget = 135;
    CameraRotationVTarget = 30;
    CameraRotationH = CameraRotationHTarget;
    CameraRotationV = CameraRotationVTarget;
    global.FogStart = 0;
    global.Fog = 480;
    audio_play_sound(sfxCamSwitch, 10, false);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_10 = 10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_24 = 24,
    Value_25
}
