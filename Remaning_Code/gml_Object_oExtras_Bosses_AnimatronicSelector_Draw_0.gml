var InnerWindowWidth = 484;
var InnerWindowHeight = 244;
var WindowWidth = InnerWindowWidth + 8;
var WindowHeight = InnerWindowHeight + 56;
var WindowX = (640 - WindowWidth) / 2;
var WindowY = (360 - WindowHeight) / 2;
WindowY -= ((1 - TileSize) * 360);
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
var PicksLeft = AnimatronicQuota - count_up(SelectedAnimatronics);
draw_text(WindowX + 33, WindowY + 5, (PicksLeft == 0) ? "Click the confirm button to begin." : string("Pick {0} more.", PicksLeft));
var InnerWindowY = WindowY + (ButtonWidth + 6);
draw_sprite_stretched(sTextBox_Windows, 2, WindowX + 4, InnerWindowY, InnerWindowWidth, InnerWindowHeight);
ButtonX = WindowX + 6;
ButtonY = InnerWindowY + 2;
ButtonWidth = 48;
ButtonHeight = 48;

for (var a = 0; a <= UnknownEnum.Value_46; a++)
{
    var Animatronic = AnimatronicList[a];
    var Picked = SelectedAnimatronics[a];
    var CanClick = global.UnlockedAnimatronics[Animatronic] && (PicksLeft > 0 || Picked);
    draw_sprite_stretched(sButtonMini, Picked || !global.UnlockedAnimatronics[Animatronic], ButtonX, ButtonY, ButtonWidth, ButtonHeight);
    
    if (global.UnlockedAnimatronics[Animatronic])
        draw_sprite(Picked ? sCustomNightFaces : sCustomNightFacesInactive, Animatronic, ButtonX, ButtonY);
    
    if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && CanClick)
    {
        SelectedAnimatronics[a] = !Picked;
        audio_play_sound(sfxBump, 5, false);
    }
    
    ButtonX += 48;
    
    if ((a % 10) == 9)
    {
        ButtonX -= 480;
        ButtonY += 48;
    }
}

ButtonWidth = 96;
ButtonHeight = 22;
ButtonX = WindowX + 4;
ButtonY = (WindowY + WindowHeight) - (ButtonHeight + 4);
draw_sprite_stretched(sButtonMini, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Confirm");

if ((clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) || input_check_pressed(UnknownEnum.Value_0)) && (Active && PicksLeft == 0))
{
    global.AllTimeSalvages = [];
    
    for (var i = 0; i < array_length(SelectedAnimatronics); i++)
    {
        if (SelectedAnimatronics[i])
            array_push(global.AllTimeSalvages, AnimatronicList[i]);
    }
    
    room_goto(NightOpening);
    audio_stop_sound(musExtras);
    audio_play_sound(sfxClick, 5, false);
}

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras_Bosses.Active = true;
}

TileSize += ((Active - TileSize) / 5);

if (TileSize < 0.01 && (oExtras.Active || oExtras_Bosses.Active))
    instance_destroy();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_46 = 46
}
