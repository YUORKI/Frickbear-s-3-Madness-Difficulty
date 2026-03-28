application_surface_draw_enable(false);
BossMode = UnknownEnum.Value_0;

if (global.Night == 6 || global.Night == "Custom")
{
    switch (global.Route)
    {
        default:
            BossMode = UnknownEnum.Value_0;
            break;
        
        case UnknownEnum.Value_2:
            BossMode = UnknownEnum.Value_1;
            break;
        
        case UnknownEnum.Value_3:
            BossMode = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_4:
            BossMode = UnknownEnum.Value_3;
            instance_destroy(oPauser);
            break;
    }
}

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_texrepeat(true);
CameraRotation = 0;
CameraX = x;
CameraY = y;
CameraZ = 256;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = 512;
MonitorUp = 0;
ShakeX = 0;
ShakeY = 0;
FOV = 64;

if (global.Night != "Custom" && BossMode != UnknownEnum.Value_3)
    global.NightSpeedup = 1;

global.BaseBrightness = 0.5;
global.Brightness = global.BaseBrightness;
global.Doors = [0, 0];
global.Flashlight = false;
global.Timer = 360 - (360 / global.NightSpeedup);
global.Lights = 1;
global.CamUp = 0;
global.Cam = 1;
global.SavedCam = 1;
global.MaskDown = 0;
global.Fan = 0;
global.MonitorSystem = "Cameras";
global.Heater = false;
global.Jumpscare = 0;
DrainRate = lerp(global.NightSpeedup, 1, 0.25);

if (BossMode == UnknownEnum.Value_3)
    DrainRate = 2;

global.TimeOfDeath = 0;
CamAnimation = 0;
MaskAnimation = 0;
CamAlpha = 1;

if (BossMode != UnknownEnum.Value_3)
{
    audio_resume_all();
    audio_stop_all();
}

var MusicList = [musNight1, musNight2, musNight3, musNight4, musNight5, musNight6];
var CustomMusicList = [musNightCustom1, musNightCustom2, musNightCustom3, musNightCustom4, musNightCustom5];
var MusicGain = 1;

if (global.Night == "Custom" && !boss_fight_night())
{
    global.Upgrades = [];
    global.AllTimeSalvages = [];
    var TwentyAmount = floor(get_total_ai_levels() / 20);
    
    if (TwentyAmount < 5)
        global.Music = musNightCustom1;
    else if (TwentyAmount < 10)
        global.Music = musNightCustom2;
    else if (TwentyAmount < 20)
        global.Music = musNightCustom3;
    else if (TwentyAmount < 30)
        global.Music = musNightCustom4;
    else if (TwentyAmount < 40)
        global.Music = musNightCustom5;
    else
        global.Music = musNightCustom6;
    
    if (global.CustomNightMusic != undefined)
    {
        global.Music = global.CustomNightMusic;
        
        if (global.Music == mus_BossFredbear || global.Music == mus_BossNightmare_Main)
            MusicGain = 0.3;
    }
    
    if (global.Cheats[UnknownEnum.Value_6])
        array_push(global.Upgrades, UnknownEnum.Value_12);
}
else if (is_numeric(global.Night) && BossMode == UnknownEnum.Value_0)
{
    global.Music = MusicList[global.Night - 1];
}
else
{
    global.Music = sfxNOTHING;
}

if (global.Music != sfxNOTHING)
    play_music(global.Music, MusicGain);

if (global.Music != mus_BossSalvage)
    audio_play_sound(sfxAmbience, 10, true, 0.3);

global.DoorGen = 0;
global.Power = 100;
global.Panic = 0;
global.Tokens = 0;
global.Temperature = 0;
global.CupcakeMeter = 0;
MinTokens = 0;
MinTemperature = 0;
FanSpeed = 1;
FlashlightPower = 1;
InfinitePowerCutoffTime = 0;

if (global.Cheats[UnknownEnum.Value_2])
    InfinitePowerCutoffTime = infinity;

Freeze = false;
global.Tools = 
{
    Camera: 0,
    Doors: [0, 0],
    Fan: 0,
    Mask: 0,
    Flashlight: 0
};
Freezeframe = undefined;
JawLevel = 0;
ShowMalhare = false;
StareFrames = -180;
Itemless = 2;
OnetimersScheduled = false;
ScreenshotsTaken = 0;
EntranceAlpha = 1;
TokenBoxSpeed = 0;
TokenBoxOffset = 0;
TokenBoxValue = global.Tokens;
HandheldUp = false;
HandheldOffset = 740;

function start_salvage_fight(arg0 = 0)
{
    instance_create_depth(0, 0, 0, oSalvage);
    global.Music = mus_BossSalvage;
    play_music(global.Music);
}

if (BossMode == UnknownEnum.Value_1)
{
    global.Brightness = 0.8;
    instance_create_depth(0, 0, depth - 1, oHappiestDayDrawer);
    instance_deactivate_object(oHappiestDayDrawer);
    
    if (global.BossPhase > 1 || global.Night == "Custom")
    {
        global.BossPhase = max(global.BossPhase, 1);
        
        if (global.BossPhase > 1)
            global.Brightness = 0.5;
        
        instance_activate_object(oHappiestDayDrawer);
        
        with (oHappiestDayDrawer)
        {
            Level = global.BossPhase;
            Screen = "LevelOpen";
            Timer = 180;
        }
        
        if (global.Difficulty > 3)
            oHappiestDayDrawer.PeacefulMode = true;
        
        with (oNightmareFoxy)
            AI = 10;
    }
}

if (BossMode == UnknownEnum.Value_2)
    instance_create_depth(0, 0, 0, oSalvageOpener_Manager);

function ai_set(arg0, arg1)
{
    if (array_contains(global.AllTimeSalvages, arg0) || global.Night == "Custom" || global.Night == "Endless")
    {
        var DiffFactor = 1 + ((global.Difficulty - 1) * 0.5);
        global.AILevels[arg0] = max(global.AILevels[arg0], clamp(round(arg1 * DiffFactor), global.AILevels[arg0], 20));
    }
}

if (numbered_night())
    global.AILevels = array_create(48, 0);

TimeOffset = (array_contains(global.Upgrades, UnknownEnum.Value_15) * -15) + (array_contains(global.Upgrades, UnknownEnum.Value_16) * -30);

if (array_contains(global.Upgrades, UnknownEnum.Value_17))
    global.Timer += (30 / global.NightSpeedup);

function get_time()
{
    return floor(global.Timer + (TimeOffset / global.NightSpeedup)) / 60;
}

function spawn_starter_items()
{
    if (array_contains(global.Upgrades, UnknownEnum.Value_40))
        instance_create_depth(0, 0, 0, oShopItem_DeathCoin);
    
    if (array_contains(global.Upgrades, UnknownEnum.Value_23))
    {
        with (instance_create_depth(0, 0, 0, oShopItem_GoldenCupcake))
            Value = 15;
    }
    else if (array_contains(global.Upgrades, UnknownEnum.Value_22))
    {
        global.Tokens += 30;
    }
    else if (array_contains(global.Upgrades, UnknownEnum.Value_21))
    {
        global.Tokens += 15;
    }
    else if (array_contains(global.Upgrades, UnknownEnum.Value_20))
    {
        global.Tokens += 5;
    }
}

if (array_contains(global.Upgrades, UnknownEnum.Value_1))
    global.Power += 25;
else if (array_contains(global.Upgrades, UnknownEnum.Value_0))
    global.Power += 10;

if (array_contains(global.Upgrades, UnknownEnum.Value_33))
    MinTemperature = -40;
else if (array_contains(global.Upgrades, UnknownEnum.Value_32))
    MinTemperature = -20;

if (array_contains(global.Upgrades, UnknownEnum.Value_14))
    FanSpeed = 5;
else if (array_contains(global.Upgrades, UnknownEnum.Value_14))
    FanSpeed = 2;

if (array_contains(global.Upgrades, UnknownEnum.Value_26))
    MinTokens = -infinity;
else if (array_contains(global.Upgrades, UnknownEnum.Value_25))
    MinTokens = -30;
else if (array_contains(global.Upgrades, UnknownEnum.Value_24))
    MinTokens = -15;

if (array_contains(global.Upgrades, UnknownEnum.Value_39))
    FlashlightPower = 2;
else if (array_contains(global.Upgrades, UnknownEnum.Value_38))
    FlashlightPower = 1.5;

if (array_contains(global.Upgrades, UnknownEnum.Value_2))
    InfinitePowerCutoffTime = 60 / global.NightSpeedup;

if (BossMode == UnknownEnum.Value_0 || BossMode == UnknownEnum.Value_3)
    spawn_starter_items();

Muffler = audio_effect_create(AudioEffectType.LPF2);
Muffler.cutoff = 600;
MaskImage = array_contains(global.Upgrades, UnknownEnum.Value_37);

if (array_contains(global.Upgrades, UnknownEnum.Value_36) || MaskImage)
    Muffler.cutoff = 9999;

FaceSprites = import_sprites("reflection.png", sGuardReflection, 2);
TintColor = 16777215;
Block6AMTransition = false;
BossTimer = global.SavedBossTime;
audio_sound_gain(sfxClockTicking, 1, 0);
MaskSprite = initialize_mask_sprites();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_12 = 12,
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_17,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_32 = 32,
    Value_33,
    Value_36 = 36,
    Value_37,
    Value_38,
    Value_39,
    Value_40
}

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
