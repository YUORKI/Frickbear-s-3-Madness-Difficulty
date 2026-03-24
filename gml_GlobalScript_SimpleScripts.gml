function fuzz_up(arg0 = 0, arg1 = 0)
{
    if (global.Cam == arg0 || global.Cam == arg1 || arg0 == 0)
    {
        if (instance_exists(oCameraUI))
        {
            with (oCameraUI)
                FuzzDegree = 1;
        }
    }
}

global.Jumpscare = 0;

function guard_name(arg0 = global.Guard)
{
    return global.GuardNames[clamp(arg0, 0, array_length(global.GuardNames) - 1)];
}

function guard_nickname()
{
    return no_brackets(guard_name());
}

function force_mask_off()
{
    if (global.MaskDown)
    {
        global.MaskDown = 0;
        audio_bus_main.effects[0] = undefined;
        audio_play_sound(sfxMaskOff, 10, false);
    }
}

function end_office_processes(arg0)
{
    instance_destroy(oAnimatronicParent);
    instance_destroy(oShopItem);
    instance_destroy(oPhoneGuy);
    
    if (arg0)
        audio_stop_all();
    
    force_mask_off();
    
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
    
    with (oCamera)
        Freeze = true;
}

function notification(arg0, arg1 = 1)
{
    with (oNotificationWindow)
        YTarget += 24;
    
    with (instance_create_depth(320, -28, 0, oNotificationWindow))
    {
        Text = arg0;
        Alpha = arg1 + 1;
    }
}

function beartrap_notif(arg0)
{
    audio_play_sound(sfxBlock, 100, false);
    audio_play_sound(sfxBiteOf87, 100, false);
    instance_destroy(instance_find(oShopItem_Beartrap, 0));
    notification(string("Blocked {0}!", global.Descriptions[arg0][0]));
}

function jumpscare(arg0, arg1 = 0, arg2 = 0, arg3 = true, arg4 = true)
{
    if ((instance_exists(oShopItem_Beartrap) || global.Cheats[UnknownEnum.Value_5]) && (arg0 != -1 && arg0 != UnknownEnum.Value_48 && arg0 != UnknownEnum.Value_60))
    {
        if (arg0 == UnknownEnum.Value_30)
            arg0 = UnknownEnum.Value_27;
        
        instance_destroy(get_animatronic_object(arg0));
        instance_create_layer(0, 0, "Room", get_animatronic_object(arg0));
        
        with (oCamera)
            play_deathcoin_voiceline(arg0);
        
        beartrap_notif(arg0);
    }
    else
    {
        if (arg0 == UnknownEnum.Value_55)
            texturegroup_load("FinalBossJumpscare");
        
        end_office_processes(arg3);
        
        if (instance_exists(oPhoneGuy))
        {
            with (oPhoneGuy)
            {
                if (TonightsCall != undefined)
                    audio_stop_sound(TonightsCall);
            }
        }
        
        global.Jumpscare = arg0;
        
        with (instance_create_layer(0, 0, "Camera", oJumpscare))
        {
            Side = arg1;
            Sprite = sJumpscare;
            BodyImage = arg0 * 2;
            HeadImage = (arg0 * 2) + 1;
            
            if (global.Jumpscare == UnknownEnum.Value_49)
            {
                Sprite = sJumpscareSalvage;
                BodyImage = 0;
                HeadImage = arg2;
            }
        }
        
        if (arg0 == -1)
            oJumpscare.alarm[0] = 1;
        
        if (arg0 == -1)
            arg0 = UnknownEnum.Value_19;
        
        if (arg4)
            count_jumpscare(arg0);
        
        save_permanent_data();
    }
}

function count_jumpscare(arg0)
{
    global.DeathRecord[arg0]++;
    
    if (global.DeathRecord[arg0] >= 10)
        get_trophy(UnknownEnum.Value_26);
    
    if (numbered_night())
    {
        global.Deaths[global.Night - 1]++;
        create_save();
    }
    
    var GetEndoTrophy = true;
    
    for (var i = 0; i <= UnknownEnum.Value_55; i++)
    {
        if (global.DeathRecord[i] == 0 && !array_contains([UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_25, UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_37, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_46], i))
        {
            GetEndoTrophy = false;
            break;
        }
    }
    
    if (GetEndoTrophy)
        get_trophy(UnknownEnum.Value_34);
}

function numbered_night()
{
    return global.Night != "Custom";
}

function wearing_mask()
{
    return global.MaskDown || instance_exists(oVanniMask);
}

function update_boss_scores()
{
    if (boss_fight_night() && global.Route != UnknownEnum.Value_0)
    {
        var SelectedBoss = (global.Route == UnknownEnum.Value_3) ? 0 : ((global.Route == UnknownEnum.Value_2) ? 1 : 2);
        var CurHiScore = global.BossHiScores[SelectedBoss][global.Difficulty];
        var CurTime = oCamera.BossTimer;
        global.ThisBossHiScore = CurTime;
        
        if (global.Route == UnknownEnum.Value_4)
        {
        }
        else if (CurTime < CurHiScore || CurHiScore == 0)
        {
            global.BossHiScores[SelectedBoss][global.Difficulty] = CurTime;
        }
    }
}

function win_night()
{
    var TargetSurf = application_surface;
    
    if (surface_exists(global.UISurface))
        TargetSurf = global.UISurface;
    
    with (oCamera)
        global.Freezeframe = sprite_create_from_surface(TargetSurf, 0, 0, surface_get_width(TargetSurf), surface_get_height(TargetSurf), 0, 1, 0, 0);
    
    for (var i = 0; i < array_length(global.AILevels); i++)
    {
        if (array_contains(global.AllTimeSalvages, i) || global.AILevels[i] > 0)
            global.UnlockedAnimatronics[i] = true;
    }
    
    if (is_numeric(global.Night))
    {
        var Earnings = max(round(global.Power * 0.1 * 100) / 100, 0) + (round(global.Tokens * 0.1 * 10) / 10);
        global.RunEarnings += Earnings;
        global.RunEarningsTotal += Earnings;
        global.StartRoom = MidnightCutscnes;
        global.SavedTime = global.RunTime;
        create_save();
    }
    else if (global.Night == "Custom" && global.Challenge != undefined)
    {
        global.ClearedChallenges[global.Challenge] = max(1 + oCamera.Itemless, global.ClearedChallenges[global.Challenge]);
        Cleared = 0;
        ClearedNDC = 0;
        ClearedNPU = 0;
        
        for (var i = 0; i < 20; i++)
        {
            if (global.ClearedChallenges[i] > 0)
            {
                Cleared++;
                
                if (global.ClearedChallenges[i] > 1)
                {
                    ClearedNDC++;
                    
                    if (global.ClearedChallenges[i] > 2)
                        ClearedNPU++;
                }
            }
        }
        
        if (Cleared >= 20)
            get_trophy(UnknownEnum.Value_37);
        
        if (Cleared >= 20)
            get_trophy(UnknownEnum.Value_38);
        
        if (ClearedNPU >= 20)
            get_trophy(UnknownEnum.Value_44);
        
        if (ClearedNDC >= 10)
            get_trophy(UnknownEnum.Value_32);
        
        if (ClearedNPU >= 5)
            get_trophy(UnknownEnum.Value_16);
        
        if (global.ClearedChallenges[21])
            get_trophy(UnknownEnum.Value_43);
    }
    
    save_permanent_data();
    instance_destroy(oAnimatronicParent);
    audio_stop_all();
    audio_sound_gain(sfx6AM, 1, 0);
    audio_play_sound(sfx6AM, 999, false);
    room_goto(NightClear);
}

function powerdown()
{
    global.Power = -999;
    audio_play_sound(sfxPowerDown, 99, false);
    disable_camera(9999);
    disable_flashlight(9999);
    disable_fan(9999);
    disable_doors(9999);
    audio_sound_gain(sfxAmbience, 1, 100);
    audio_stop_sound(global.Music);
}

function error()
{
    audio_play_sound(sfxError, 10, false);
}

function disable_doors(arg0)
{
    global.Tools.Doors = [arg0 * 60, arg0 * 60];
    
    if (global.Doors[0])
    {
        global.Doors[0] = 0;
        simple_sound(sfxDoor, -400, 0, false, 1);
    }
    
    if (global.Doors[1])
    {
        global.Doors[1] = 0;
        simple_sound(sfxDoor, 400, 0, false, 1);
    }
}

function disable_camera(arg0)
{
    global.Tools.Camera = max(global.Tools.Camera, arg0 * 60);
    
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
}

function disable_mask(arg0)
{
    global.Tools.Mask = max(global.Tools.Mask, arg0 * 60);
}

function disable_flashlight(arg0)
{
    global.Tools.Flashlight = max(global.Tools.Flashlight, arg0 * 60);
}

function disable_fan(arg0)
{
    global.Tools.Fan = max(global.Tools.Fan, arg0 * 60);
    
    if (global.Fan)
    {
        global.Fan = 0;
        audio_stop_sound(sfxFan);
    }
}

function draw_on_cam(arg0, arg1)
{
    if (global.Cam == arg1)
        draw_sprite(sCameraAnimatronics, arg0, global.CamX, global.CamY);
}

global.MinigameWindowX = 0;
global.MinigameWindowY = 0;
global.MinigameWindowScale = 1;
global.HiScores[UnknownEnum.Value_0] = 360;
global.HiScores[UnknownEnum.Value_1] = 0;
global.HiScores[UnknownEnum.Value_2] = 0;
global.HiScores[UnknownEnum.Value_3] = 0;
global.HiScores[UnknownEnum.Value_4] = 360;
global.HiScores[UnknownEnum.Value_5] = 0;
global.HiScores[UnknownEnum.Value_6] = 0;
global.HiScores[UnknownEnum.Value_7] = 360;
global.HiScores[UnknownEnum.Value_8] = 0;
global.HiScores[UnknownEnum.Value_9] = 0;

function touching_mouse()
{
    return mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_x < bbox_right && mouse_y < bbox_bottom;
}

function mouse_in_zone(arg0, arg1, arg2, arg3)
{
    return arg0 <= device_mouse_x_to_gui(0) && (arg0 + arg2) > device_mouse_x_to_gui(0) && arg1 <= device_mouse_y_to_gui(0) && (arg1 + arg3) > device_mouse_y_to_gui(0);
}

function in_window(arg0, arg1, arg2, arg3)
{
    return arg0 <= device_mouse_x_to_gui(0) && (arg0 + arg2) > device_mouse_x_to_gui(0) && arg1 <= device_mouse_y_to_gui(0) && (arg1 + arg3) > device_mouse_y_to_gui(0);
}

function clicked(arg0, arg1, arg2, arg3)
{
    return mouse_check_button_pressed(mb_left) && in_window(arg0, arg1, arg2, arg3);
}

function format_as_timer(arg0, arg1 = false)
{
    var TimerSeconds = floor(arg0) % 60;
    var TimerMinutes = floor(arg0 / 60) % 60;
    var TimerHours = floor(floor(arg0 / 60) / 60);
    
    if (TimerSeconds < 10)
        TimerSeconds = "0" + string(TimerSeconds);
    
    TimerSeconds = string(TimerSeconds);
    
    if (TimerHours > 0)
    {
        TimerHours = string(TimerHours) + ":";
        
        if (TimerMinutes < 10)
            TimerMinutes = "0" + string(TimerMinutes);
    }
    else
    {
        TimerHours = "";
    }
    
    TimerMinutes = string(TimerMinutes);
    
    if (arg1)
    {
        var TimerDecimal = floor((arg0 % 1) * 100);
        
        if (TimerDecimal >= 100)
            TimerDecimal -= 100;
        
        if (TimerDecimal < 10)
            TimerDecimal = "0" + string(TimerDecimal);
        else
            TimerDecimal = string(TimerDecimal);
        
        TimerSeconds += ("." + TimerDecimal);
    }
    
    return TimerHours + TimerMinutes + ":" + TimerSeconds;
}

function add_tokens(arg0)
{
    add_tokens_silently(arg0);
    audio_play_sound(sfxBitCollect, 1, false);
}

function add_tokens_silently(arg0)
{
    if (room == Office)
    {
        if (array_contains(global.Upgrades, UnknownEnum.Value_5))
            global.Tokens += (arg0 * 2);
        else if (array_contains(global.Upgrades, UnknownEnum.Value_4))
            global.Tokens += (arg0 * 1.5);
        else if (array_contains(global.Upgrades, UnknownEnum.Value_3))
            global.Tokens += (arg0 * 1.25);
        else
            global.Tokens += arg0;
    }
}

function block_tokens(arg0 = 1)
{
    if (room == Office)
    {
        if (array_contains(global.Upgrades, UnknownEnum.Value_35))
            global.Tokens += (arg0 * 2);
        else if (array_contains(global.Upgrades, UnknownEnum.Value_34))
            global.Tokens += (arg0 * 1.5);
        else
            global.Tokens += arg0;
    }
}

function mouse_in_minigame_window()
{
    var MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
    var MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;
    return MouseX >= 0 && MouseX < 160 && MouseY >= 0 && MouseY < 144;
}

function random_sign()
{
    return (irandom_range(0, 1) * 2) - 1;
}

function binary_to_sign(arg0)
{
    return (arg0 * 2) - 1;
}

function sign_to_binary(arg0)
{
    return (1 + arg0) / 2;
}

function check_reset()
{
    if (keyboard_check_pressed(ord("R")) && global.DevMode)
        room_restart();
}

global.SummonedAnimatronics = [];

function clear_summons()
{
    if (array_length(global.SummonedAnimatronics) == 0)
        exit;
    
    for (var a = 0; a < array_length(global.SummonedAnimatronics); a++)
        global.AILevels[global.SummonedAnimatronics[a]] = 0;
    
    global.SummonedAnimatronics = [];
}

function nonlethal_characters_only()
{
    var a = global.AILevels;
    
    for (var i = 0; i < array_length(global.AILevels); i++)
    {
        if (is_nonlethal(i, true))
            continue;
        
        if (a[i] > 0)
            return false;
    }
    
    return true;
}

function is_nonlethal(arg0, arg1 = false)
{
    var CharList = [UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_37, UnknownEnum.Value_25, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_46];
    
    if (arg1)
        array_push(CharList, UnknownEnum.Value_14);
    
    return array_contains(CharList, arg0);
}

function character_active(arg0)
{
    return (global.AILevels[arg0] > 0 || (numbered_night() && array_contains(global.AllTimeSalvages, arg0))) && instance_exists(get_animatronic_object(arg0));
}

function approach_factor(arg0, arg1)
{
    return 1 - power(1 - arg0, arg1);
}

function get_location(arg0)
{
    var CharacterOrder = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18, UnknownEnum.Value_33, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_35, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38, UnknownEnum.Value_34, UnknownEnum.Value_25, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_47];
    var i = 0;
    
    repeat (array_length(CharacterOrder) - 1)
    {
        if (arg0 == CharacterOrder[i])
            return i;
        
        i++;
    }
}

global.SortByLocation = function(arg0, arg1)
{
    return get_location(arg0) - get_location(arg1);
};

function skip_cutscenes()
{
    return false;
    return global.Settings[3][0];
}

function set_audio_volumes()
{
    audio_group_set_gain(voc_WitheredChica_HaventYouHeard, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
    audio_group_set_gain(mus_CandyCadetStory, (global.Settings[2][0] * global.Settings[2][2]) / 100, 0);
    audio_group_set_gain(voc_Rodney_Idle_TooManyNights, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
    audio_group_set_gain(voc_Helpy_BuyBuyBuy, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(voc_ToyFreddy_HardlyGaming, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(voc_Springtrap_Pathetic, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(voc_Rodney_Idle_AltF4, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    
    if (global.Settings[2][5] == 1 || global.Settings[2][5] == 2 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_Helpy_BuyBuyBuy, 0, 0);
    
    if (global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_ToyFreddy_HardlyGaming, 0, 0);
    
    if (global.Settings[2][5] == 2 || global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_Springtrap_Pathetic, 0, 0);
    
    if (global.Settings[2][5] == 2 || global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_Rodney_Idle_AltF4, 0, 0);
    
    if (global.Settings[2][3] == 0)
    {
    }
}

function get_item_amount(arg0 = true, arg1 = false)
{
    var Num = instance_number(oShopItem);
    
    if (!arg1)
        Num -= (instance_number(oShopItem_DistortionClock) + instance_number(oShopItem_RewindClock));
    
    if (!arg0)
        Num -= instance_number(oShopItem_KingsPrize);
    
    return Num;
}

function get_current_time()
{
    var dt = date_current_datetime();
    var hour = string_format(date_get_hour(dt), 2, 0);
    var minute = string_format(date_get_minute(dt), 2, 0);
    var second = string_format(date_get_second(dt), 2, 0);
    var AMorPM = "AM";
    
    if (hour >= 12)
        AMorPM = "PM";
    
    hour = hour % 12;
    
    if (hour == 0)
        hour = 12;
    
    return string("{0}:{1} {2}", hour, minute, AMorPM);
}

function get_current_date()
{
    var dt = date_current_datetime();
    var year = date_get_year(dt);
    var month = string_format(date_get_month(dt), 2, 0);
    var day = string_format(date_get_day(dt), 2, 0);
    var MonthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return string("{0} {1}, {2}", MonthNames[month - 1], day, year);
}

function scroll_bar(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var ButtX = 0;
    var ButtY = 0;
    var BarMaxHeight = arg5 - 32;
    var MaxOffset = max(arg6 - arg5, 0);
    ButtX = arg2 + arg4;
    ButtY = arg3;
    var UpButton = in_window(ButtX, ButtY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(sButtonMini, UpButton, ButtX, ButtY, 16, 16);
    draw_sprite(sButtonMini_Icons, 3, ButtX + 8, ButtY + 8);
    draw_sprite_stretched(sScrollBarBG, 0, ButtX, ButtY + 16, 16, BarMaxHeight);
    var BarHeight = BarMaxHeight * min(1, arg5 / arg6);
    var BarY = (MaxOffset == 0) ? 0 : ((BarMaxHeight - BarHeight) * (arg0 / MaxOffset));
    ButtY = arg3 + 16 + BarY;
    var BarClicked = in_window(ButtX, ButtY, 16, BarHeight) && mouse_check_button(mb_left);
    
    if (BarClicked)
        arg1 = true;
    
    draw_sprite_stretched(sButtonMini, arg1, ButtX, ButtY, 16, BarHeight);
    
    if (!mouse_check_button(mb_left))
        arg1 = false;
    
    if (arg1 && BarMaxHeight != BarHeight)
    {
        var BarShift = global.MouseY - global.PrevMouseY;
        arg0 += (BarShift * (MaxOffset / (BarMaxHeight - BarHeight)));
    }
    
    ButtX = arg2 + arg4;
    ButtY = (arg3 + arg5) - 16;
    var DownButton = in_window(ButtX, ButtY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(sButtonMini, DownButton, ButtX, ButtY, 16, 16);
    draw_sprite(sButtonMini_Icons, 4, ButtX + 8, ButtY + 8);
    var ScrollUp = (UpButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2, arg3, arg4 + 16, arg5) && mouse_wheel_up());
    var ScrollDown = (DownButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2, arg3, arg4 + 16, arg5) && mouse_wheel_down());
    arg0 -= ((ScrollUp - ScrollDown) * arg7);
    arg0 = clamp(arg0, 0, MaxOffset);
    return [arg0, arg1];
}

function has_been_good()
{
    if (!is_numeric(global.Night))
        return false;
    
    for (var n = 0; n < min(global.Night - 2, 3); n++)
    {
        if (global.SalvagedMasks[n] == 0)
            return false;
    }
    
    return true;
}

function currently_good()
{
    if (!is_numeric(global.Night))
        return false;
    
    return global.SalvagedMasks[clamp(global.Night - 2, 0, 3)];
}

function has_been_evil()
{
    if (!is_numeric(global.Night))
        return false;
    
    for (var n = 0; n < min(global.Night - 2, 3); n++)
    {
        if (global.SalvagedScraps[n] == 0)
            return false;
    }
    
    return true;
}

function currently_evil()
{
    if (!is_numeric(global.Night))
        return false;
    
    return global.SalvagedScraps[clamp(global.Night - 2, 0, 3)];
}

function has_been_ultimate()
{
    return has_been_good() * has_been_evil();
}

function currently_ultimate()
{
    return currently_good() * currently_evil();
}

function subtitles_enabled()
{
    return !global.Settings[2][6];
}

function add_flag(arg0)
{
    if (!array_contains(global.UnlockFlags, arg0))
        array_push(global.UnlockFlags, arg0);
}

function count_up(arg0, arg1 = false, arg2 = 9999, arg3 = 0)
{
    var Total = 0;
    
    for (var i = arg3; i < min(arg3 + arg2, array_length(arg0)); i++)
        Total += (arg1 ? min(1, arg0[i]) : arg0[i]);
    
    return Total;
}

function end_microgame()
{
    with (oFredbearManager)
        MicrogameTimer = min(MicrogameTimer, 1);
}

function in_salvage_location()
{
    return array_contains([MinigameMaze_1, MinigameMaze_2, MinigameMaze_3, MinigameMaze_4, MinigameMaze_5], room);
}

function ultimate_route_unlocked()
{
    return global.UnlockedTrophies[UnknownEnum.Value_30] && global.UnlockedTrophies[UnknownEnum.Value_29] && global.UnlockedTrophies[UnknownEnum.Value_31] && global.UnlockedTrophies[UnknownEnum.Value_15];
}

function boss_fight_night()
{
    return (global.Night == 6 || global.Night == "Custom") && (global.Route != UnknownEnum.Value_0 && global.Route != UnknownEnum.Value_1);
}

function draw_outline(arg0, arg1 = undefined, arg2 = undefined, arg3 = x, arg4 = y)
{
    if (arg1 == undefined)
        arg1 = sprite_index;
    
    if (arg2 == undefined)
        arg2 = image_index;
    
    shader_set(shFlash);
    
    for (var i = -45; i < 360; i += 90)
        draw_sprite_ext(arg1, arg2, arg3 + round(lengthdir_x(1, i)), arg4 + round(lengthdir_y(1, i)), 1, 1, 0, arg0, 1);
    
    shader_reset();
}

function kill_mendo()
{
    return (global.BossPhase == 5 && oCamera.BossMode == UnknownEnum.Value_2) || oCamera.BossMode == UnknownEnum.Value_3;
}

function set_relative_depth(arg0)
{
    depth = layer_get_depth(layer) + arg0;
}

global.Challenge = undefined;
global.ChallengeTitle = "None";
global.NightSpeedup = 1;
global.CustomNightMusic = undefined;
global.MicrogameSpeed = 1;
global.MicrogameLevel = 0;
global.MicrogameWin = true;

enum UnknownEnum
{
    Value_0,
    Value_1,
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
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_55 = 55,
    Value_60 = 60
}
