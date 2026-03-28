global.Temperature += (RiseRate / 60);
var TempLimit = 35;
var TimeToKill = 5 / RiseRate;

if (global.Temperature > TempLimit)
    FredbearLevel += (1 / (60 * TimeToKill));
else
    FredbearLevel = max(FredbearLevel - (1/120), 0);

with (oCamera)
    JawLevel = other.FredbearLevel;

if (Timer <= 0 && Timer > -0.5)
{
    if (Timer == 0)
        audio_play_sound(sfxPowerOn, 15, false, 0.5);
    
    global.Brightness = random_range(0.5, 2);
    Timer -= 0.016666666666666666;
}
else if (Timer <= -0.5)
{
    global.Brightness = global.BaseBrightness;
}

if (Timer <= 10 && Timer > 9.5)
{
    if (Timer == 10)
        audio_play_sound(sfxPowerOn, 15, false, 0.5);
    
    global.Brightness = random_range(0.5, 2);
    Timer -= 0.016666666666666666;
}
else if (Timer == 9.5)
{
    global.Brightness = 1;
    room_goto(NightmareEnding);
}
