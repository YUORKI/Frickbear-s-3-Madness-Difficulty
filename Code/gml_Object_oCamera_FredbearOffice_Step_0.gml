if (Freeze == 0)
{
    var SE1 = 1000;
    var SE2 = 1100;
    var SE3 = 1;
    
    if (input_check_pressed(UnknownEnum.Value_8))
    {
        if (BossMode != UnknownEnum.Value_1)
        {
            if (global.Tools.Doors[0] == 0 && !instance_exists(oLaserDoor) && BossMode != UnknownEnum.Value_1)
            {
                global.Doors[0] = !global.Doors[0];
                simple_sound(sfxDoor, -400, 0, false);
            }
            else
            {
                error();
            }
        }
    }
    
    if (input_check_pressed(UnknownEnum.Value_9))
    {
        if (global.Tools.Doors[1] == 0 && !instance_exists(oLaserDoor))
        {
            global.Doors[1] = !global.Doors[1];
            simple_sound(sfxDoor, 400, 0, false);
        }
        else
        {
            error();
        }
    }
    
    if (input_check_pressed(UnknownEnum.Value_6) && !global.MaskDown)
    {
        if (global.Tools.Camera == 0)
        {
            global.CamUp = !global.CamUp;
            CamAlpha = 1;
            audio_play_sound(sfxMonitor, 10, false);
        }
        else
        {
            error();
        }
    }
    
    if (!global.CamUp)
    {
        global.MonitorSystem = "Cameras";
        global.Cam = global.SavedCam;
    }
    
    if (input_check_pressed(UnknownEnum.Value_11))
    {
        if (global.Tools.Fan == 0)
        {
            audio_play_sound(sfxBump, 10, false);
            global.Fan = !global.Fan;
            
            if (global.Fan)
                simple_sound(sfxFan, 64, -128, depth, 1);
        }
        else
        {
            error();
        }
    }
    
    if (!global.Fan)
        audio_stop_sound(sfxFan);
    
    if (input_check_pressed(UnknownEnum.Value_7) && !(global.CamUp || HandheldUp))
    {
        if (global.Tools.Mask == 0)
        {
            global.MaskDown = !global.MaskDown;
            
            if (!global.MaskDown)
            {
                audio_bus_main.effects[0] = undefined;
                audio_play_sound(sfxMaskOff, 10, false);
            }
            else
            {
                audio_play_sound(sfxMaskOn, 10, false);
                audio_bus_main.effects[0] = Muffler;
            }
        }
        else
        {
            error();
        }
    }
    
    if (global.MaskDown && audio_bus_main.effects[0] == undefined)
        audio_bus_main.effects[0] = Muffler;
    
    global.Flashlight = input_check(UnknownEnum.Value_10) && global.Tools.Flashlight == 0 && !HandheldUp;
    
    if (input_check_pressed(UnknownEnum.Value_10) && !HandheldUp)
    {
        if (global.Tools.Flashlight == 0)
            audio_play_sound(sfxFlashlightOn, 10, false);
        else
            audio_play_sound(sfxError, 10, false);
    }
    
    if (input_check_released(UnknownEnum.Value_10) && global.Tools.Flashlight == 0 && !HandheldUp)
        audio_play_sound(sfxFlashlightOff, 10, false);
    
    if ((round(global.Timer * 60) % 60) == 1)
        simple_sound(sfxClockTicking, 500, 0, false, 0.5, 1, random_range(0.9, 1.1));
}

global.Usage = global.CamUp + global.Doors[0] + global.Doors[1] + global.Flashlight + global.Fan;

if (instance_exists(oLaserDoor))
    global.Usage -= (global.Doors[0] + global.Doors[1]);

global.Power -= (global.Usage / 180);

if (global.Difficulty < 3)
{
    if (global.Night == 1)
        global.Power += ((global.Usage / 180) * 0.2);
    
    if (global.Night == 2)
        global.Power += ((global.Usage / 180) * 0.1);
}

if (global.Fan)
    global.Temperature -= ((FanSpeed * 2) / 60);
else
    global.Temperature += (1/120);

global.Temperature = clamp(global.Temperature, MinTemperature, 40);
global.Tools = 
{
    Camera: max(global.Tools.Camera - 1, 0),
    Doors: [max(global.Tools.Doors[0] - 1, 0), max(global.Tools.Doors[1] - 1, 0)],
    Fan: max(global.Tools.Fan - 1, 0),
    Mask: max(global.Tools.Mask - 1, 0),
    Flashlight: max(global.Tools.Flashlight - 1, 0)
};

enum UnknownEnum
{
    Value_1 = 1,
    Value_6 = 6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11
}
