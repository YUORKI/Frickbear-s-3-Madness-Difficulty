if (global.MonitorSystem == "Vents")
    y = BaseY;
else
    y = BaseY + 360;

if (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left))
{
    var CanEnsnare = false;
    
    with (oSalvage_VentCrawler)
    {
        if (VentX == other.ButtonID[0] && VentY == other.ButtonID[1])
        {
            destroy_crawler();
            CanEnsnare = true;
        }
    }
    
    if (!CanEnsnare)
    {
        global.AudioLureX = ButtonID[0];
        global.AudioLureY = ButtonID[1];
        audio_play_sound(sfxCamSwitch, 10, false);
    }
}

Timer = (Timer + 0.016666666666666666) % 1;
