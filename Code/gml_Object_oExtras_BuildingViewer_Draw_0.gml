var WindowWidth = 400;
var WindowHeight = 200;
var WindowX = (640 - WindowWidth) / 2;
var WindowY = (360 - WindowHeight) / 2;
WindowY -= ((1 - TileSize) * 360);
var WarningText = "BE WARNED! The building model you're about to see wasn't exactly made with real-time rendering in mind - Because of that, it's VERY unoptimized, and will probably lag, especially on lower-end devices.\n\nIf you want to see it anyway, press the continue button!";
draw_sprite_stretched(sTextBox_Windows, 0, WindowX, WindowY, WindowWidth, WindowHeight);
var ButtonX = WindowX + 4;
var ButtonY = WindowY + 4;
var ButtonWidth = 22;
var ButtonHeight = 22;
var Quit = clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) || (input_check_pressed(UnknownEnum.Value_1) && !Transitioning && Active);
draw_sprite_stretched(sButtonMini, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_sprite(sButtonMini_Icons, 0, ButtonX + 11, ButtonY + 11);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 1, ButtonX + ButtonWidth + 2, ButtonY, WindowWidth - 32, ButtonHeight);
draw_text(WindowX + 33, WindowY + 5, "Building Viewer");
var InnerWindowY = WindowY + (ButtonWidth + 6);
var InnerWindowHeight = WindowHeight - (ButtonHeight + ButtonHeight + 12);
draw_sprite_stretched(sTextBox_Windows, 2, WindowX + 4, InnerWindowY, WindowWidth - 8, InnerWindowHeight);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var TextMiddlePoint = InnerWindowY + (InnerWindowHeight / 2);
draw_text_ext(320, TextMiddlePoint, WarningText, 15, WindowWidth - 24);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
ButtonX = WindowX + 4;
ButtonY = (WindowY + WindowHeight) - (ButtonHeight + 4);
ButtonWidth = 96;
draw_sprite_stretched(sButtonMini, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Continue");

if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && !Transitioning && Active)
{
    Transitioning = true;
    audio_play_sound(sfxClick, 10, false);
    audio_stop_sound(musExtras);
}

if (Transitioning)
{
    TransitionAmount += ((Transitioning - TransitionAmount) / 5);
    TransitionFrame++;
    draw_rectangle_color(0, 0, 640, 180 * TransitionAmount, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 360 - (180 * TransitionAmount), 640, 360, c_black, c_black, c_black, c_black, false);
    
    if (TransitionFrame == 60)
        room_goto(MainLocationMap);
}

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras.Active = true;
    instance_destroy(oMinigameParent);
    surface_free(global.MinigameSurface);
}

TileSize += ((Active - TileSize) / 5);

if (TileSize < 0.01 && oExtras.Active)
    instance_destroy();

enum UnknownEnum
{
    Value_1 = 1
}
