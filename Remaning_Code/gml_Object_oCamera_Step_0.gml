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
        if (BossMode != UnknownEnum.Value_1)
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
    }
    
    if (input_check_pressed(UnknownEnum.Value_6) && !global.MaskDown)
    {
        if (BossMode == UnknownEnum.Value_1 && global.Tools.Camera == 0)
        {
            HandheldUp = !HandheldUp;
            audio_play_sound(sfxMonitor, 10, false);
            
            if (HandheldUp)
                instance_activate_object(oHappiestDayDrawer);
        }
        else if (global.Tools.Camera == 0)
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
    
    if (input_check_pressed(UnknownEnum.Value_11) && BossMode != UnknownEnum.Value_1)
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
    
    if (instance_exists(oPauser) && !oPauser.Paused)
    {
        if (global.MaskDown && audio_bus_main.effects[0] == undefined)
            audio_bus_main.effects[0] = Muffler;
    }
    
    global.Flashlight = input_check(UnknownEnum.Value_10) && global.Tools.Flashlight == 0 && !HandheldUp;
    
    if (input_check_pressed(UnknownEnum.Value_10))
    {
        if (global.Tools.Flashlight == 0)
            audio_play_sound(sfxFlashlightOn, 10, false);
        else
            audio_play_sound(sfxError, 10, false);
    }
    
    if (input_check_released(UnknownEnum.Value_10) && global.Tools.Flashlight == 0)
        audio_play_sound(sfxFlashlightOff, 10, false);
    
    if ((round(global.Timer * 60) % 60) == 1)
        simple_sound(sfxClockTicking, 500, 0, false, 0.5, 1, random_range(0.9, 1.1));
}

global.Usage = global.CamUp + global.Doors[0] + global.Doors[1] + global.Flashlight + global.Fan;

if (instance_exists(oLaserDoor))
    global.Usage -= (global.Doors[0] + global.Doors[1]);

if (InfinitePowerCutoffTime <= 0)
{
    global.Power -= ((DrainRate * global.Usage) / 180);
    
    if (global.Difficulty < 3)
    {
        if (global.Night == 1)
            global.Power += ((global.Usage / 180) * 0.2);
        
        if (global.Night == 2)
            global.Power += ((global.Usage / 180) * 0.1);
    }
}
else
{
    InfinitePowerCutoffTime -= 0.016666666666666666;
}

if (global.Fan)
    global.Temperature -= ((FanSpeed * 2) / 60);
else if (BossMode != UnknownEnum.Value_1)
    global.Temperature += (1/120);

global.Temperature = clamp(global.Temperature, MinTemperature, 40);

if (global.Cheats[UnknownEnum.Value_4])
    global.Temperature = min(global.Temperature, 0);

if (global.Temperature == 40 && !instance_exists(oJumpscare))
{
    if (BossMode == UnknownEnum.Value_1)
        jumpscare(UnknownEnum.Value_50, 0);
    else
        jumpscare(-1, 0);
}

if (BossMode != UnknownEnum.Value_2 && BossMode != UnknownEnum.Value_1)
    global.Timer += 0.016666666666666666;

if (global.Power <= 0 && global.Power > -999)
    powerdown();

global.Tools = 
{
    Camera: max(global.Tools.Camera - 1, 0),
    Doors: [max(global.Tools.Doors[0] - 1, 0), max(global.Tools.Doors[1] - 1, 0)],
    Fan: max(global.Tools.Fan - 1, 0),
    Mask: max(global.Tools.Mask - 1, 0),
    Flashlight: max(global.Tools.Flashlight - 1, 0)
};

if (global.Power <= 0)
    global.Brightness = min(global.Brightness + 0.01, 1);

if (global.Timer >= 360 && !audio_is_playing(sfxWarioLose) && !Block6AMTransition)
{
    if (!instance_exists(oJumpscare))
    {
        var BeartrapTanks = instance_number(oShopItem_Beartrap) + (global.Cheats[UnknownEnum.Value_5] * 999);
        
        if (global.Tokens < 0)
        {
            global.UnlockedAnimatronics[UnknownEnum.Value_48] = true;
            jumpscare(UnknownEnum.Value_48, 0);
            Block6AMTransition = true;
        }
        
        with (oChipper)
        {
            if (jumpscare_at_6AM())
                BeartrapTanks--;
        }
        
        with (oBaby)
        {
            if (jumpscare_at_6AM())
                BeartrapTanks--;
        }
        
        with (oToyFreddy)
        {
            if (jumpscare_at_6AM())
                BeartrapTanks--;
        }
        
        if (BeartrapTanks < 0)
            Block6AMTransition = true;
    }
    
    if (BossMode == UnknownEnum.Value_3)
    {
        var SelectedBoss = 2;
        var CurHiScore = global.BossHiScores[SelectedBoss][global.Difficulty];
        var CurScore = 21 + instance_number(oShopItem_FredbearHeart);
        
        if (CurScore > CurHiScore || CurHiScore == 0)
            global.BossHiScores[SelectedBoss][global.Difficulty] = CurScore;
        
        global.ThisBossHiScore = CurScore;
        instance_destroy(oFredbearManager);
        end_office_processes(true);
        instance_create_depth(0, 0, 0, oFredbear_EndingScare);
        Block6AMTransition = true;
    }
    
    if (!Block6AMTransition)
    {
        if (instance_exists(oJumpscare))
            get_trophy(UnknownEnum.Value_12);
        
        win_night();
    }
}

if (StareFrames > -180)
    StareFrames--;

if (keyboard_check(ord("F")) && keyboard_check_pressed(ord("B")) && global.DevMode)
{
    if (BossMode == UnknownEnum.Value_2)
    {
        with (oSalvage)
            lose_hp(20, true);
    }
    else if (BossMode == UnknownEnum.Value_3)
    {
        instance_destroy(oFredbearManager);
        end_office_processes(true);
        instance_create_depth(0, 0, 0, oFredbear_EndingScare);
        Block6AMTransition = true;
    }
    else
    {
        win_night();
    }
}

if (global.CupcakeMeter < 1)
    global.CupcakeMeter = max(global.CupcakeMeter - 0.002, 0);

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_48 = 48,
    Value_50 = 50
}
