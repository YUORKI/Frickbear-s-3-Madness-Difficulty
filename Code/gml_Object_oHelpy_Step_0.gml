var ID = UnknownEnum.Value_30;
var AI = global.AILevels[ID];
var TimeToPopup = 20 - (AI / 2);

if (AI > 0)
    Timer += 1;
else
    Timer = 0;

if ((Timer / 60) > TimeToPopup)
{
    audio_stop_sound(CurrentClip);
    audio_stop_sound(CurrentCloseClip);
    var PopupLines = [];
    CurrentClip = (irandom(20) == 7) ? choose(voc_Helpy_SendEmail, voc_Helpy_BuyBuyBuy) : choose(voc_Helpy_ClickHere, voc_Helpy_HelloThere1, voc_Helpy_HelloThere2);
    SoundPlaying = bitcrush_sound(CurrentClip, 0, 0, false, 1, 4);
    var WindowX = irandom_range(32, display_get_gui_width() - (sprite_get_width(sHelpyWindow) + 32));
    var WindowY = irandom_range(32, display_get_gui_height() - (sprite_get_height(sHelpyWindow) + 32));
    instance_create_depth(WindowX, WindowY, -1 - instance_number(oHelpyPopup), oHelpyPopup);
    audio_play_sound(sfxWindowNotif, 10, false);
    Timer = 0;
}

enum UnknownEnum
{
    Value_30 = 30
}
