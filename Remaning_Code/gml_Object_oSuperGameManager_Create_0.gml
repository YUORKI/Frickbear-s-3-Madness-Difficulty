gc_enable(false);
Timer = 0;
GlobalTimer = 0;
room_goto(WarningScreen);
global.TrophyQueue = [];
CommandMode = false;
CommandArray = [];
CurrentCommand = "";
ScreenshotsTaken = 0;
global.MouseX = device_mouse_x_to_gui(0);
global.MouseY = device_mouse_x_to_gui(0);
global.PrevMouseX = 0;
global.PrevMouseY = 0;
display_reset(0, true);
global.FredbearMode = global.Night == 6 && global.Route == UnknownEnum.Value_4 && global.CanContinue;
global.DevMode = false;
global.GuardAmount = 4 + array_length(get_folders());
audio_bus_main.effects[0] = undefined;
apply_settings(true);
define_music_loops();

enum UnknownEnum
{
    Value_4 = 4
}
