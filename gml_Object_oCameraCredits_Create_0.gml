texturegroup_load("BuildingTextures");

if (instance_number(oCamera3DMaze) > 1)
    instance_destroy();

Width = 640;
Height = 360;
application_surface_draw_enable(true);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_texrepeat(true);
CameraRotationH = 90;
CameraRotationHTarget = 90;
CameraRotationV = 0;
CameraRotationVTarget = 0;
CameraRotationD = 0;
CameraRotationDTarget = 0;
CameraX = x;
CameraY = y;
CameraZ = 32;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = 32;
LockX = 0;
LockY = 0;
LockZ = 0;
FOV = 64;
Frame = 0;
SpeedX = 0;
SpeedY = 0;
SpeedTurn = 0;
Perspective = 1;
HeightOffset = 48;
audio_stop_sound(musCredits);
global.FogStart = -560;
global.Fog = 620;
XCenter = display_get_gui_width() / 2;
YOffset = 0;
UltimateMode = global.Route == UnknownEnum.Value_4;

if (UltimateMode)
    XCenter = display_get_gui_width() / 4;

function DrawCredit(arg0, arg1, arg2)
{
    draw_set_valign(fa_top);
    var XOffset = 0;
    draw_set_font(global.FontW97White);
    var Offset;
    
    if (arg0 == 1)
    {
        draw_set_halign(fa_center);
        draw_text(XCenter, YOffset, arg1);
        Offset = 20;
    }
    else
    {
        draw_set_halign(fa_right);
        draw_text(XCenter - 8, YOffset, arg1);
        draw_set_halign(fa_left);
        draw_text(XCenter + 8, YOffset, arg2);
        Offset = 20;
    }
    
    YOffset += Offset;
}

function name(arg0)
{
    if (global.UnlockedAnimatronics[arg0])
        return global.Descriptions[arg0][0];
    else
        return "???";
}

Frame = 480;
global.SavedTime = global.RunTime;
audio_stop_all();
audio_sound_gain(musCredits, 1, 0);
audio_play_sound(musCredits, 99, false);

if (!instance_exists(oExtras_Credits))
{
    if (global.Route == UnknownEnum.Value_0)
        get_trophy(UnknownEnum.Value_15);
    
    switch (global.Difficulty)
    {
        case 0:
            get_trophy(UnknownEnum.Value_0);
            break;
        
        case 1:
            get_trophy(UnknownEnum.Value_14);
            break;
        
        case 2:
            get_trophy(UnknownEnum.Value_28);
            break;
        
        case 3:
            get_trophy(UnknownEnum.Value_35);
            break;
    }
    
    global.ClearedEndings[global.Difficulty][global.Route]++;
    
    if (!array_contains(global.ClearedEndings[3], 0))
        get_trophy(UnknownEnum.Value_41);
    
    global.UnlockedAnimatronics[UnknownEnum.Value_66 + global.Difficulty] = true;
    global.UnlockedAnimatronics[UnknownEnum.Value_60] = true;
    global.UnlockedAnimatronics[UnknownEnum.Value_56] = true;
    
    if ((array_length(global.Upgrades) == 0 || (array_length(global.Upgrades) == 1 && global.Upgrades[0] == UnknownEnum.Value_41)) && global.Difficulty > 1)
        get_trophy(UnknownEnum.Value_23);
    
    if (global.Route == UnknownEnum.Value_1)
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_61] = true;
        get_trophy(UnknownEnum.Value_31);
    }
    
    if (global.Route == UnknownEnum.Value_2)
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_63] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_50] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_51] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_52] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_53] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_54] = true;
        get_trophy(UnknownEnum.Value_30);
    }
    
    if (global.Route == UnknownEnum.Value_3)
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_62] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_49] = true;
        get_trophy(UnknownEnum.Value_29);
    }
    
    if (global.Route == UnknownEnum.Value_4)
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_64] = true;
        global.UnlockedAnimatronics[UnknownEnum.Value_55] = true;
        get_trophy(UnknownEnum.Value_36);
    }
    
    var DeathAmount = 0;
    
    for (var i = 0; i < array_length(global.Deaths); i++)
        DeathAmount += global.Deaths[i];
    
    if (global.RunEarningsTotal >= 300)
        get_trophy(UnknownEnum.Value_22);
    
    if (global.SavedTime <= 1200)
        get_trophy(UnknownEnum.Value_24);
    
    if (array_length(global.AllTimeSalvages) >= 30)
        get_trophy(UnknownEnum.Value_39);
    
    if (global.Difficulty == 3 && array_length(global.AllTimeSalvages) >= 30 && array_length(global.Upgrades) == 1)
        get_trophy(UnknownEnum.Value_45);
    
    if (global.Difficulty == 3 && DeathAmount == 0)
        get_trophy(UnknownEnum.Value_46);
}

var GuardLines = ["Thanks to a gracious scholarship provided by the Boss (in exchange for his silence about his business practices), Jeremy was able to graduate debt-free! (He did fall on his face on his way up to accept his diploma, though...)", "After everything, Mike was just happy to finally spend some time at home.", "Vanessa decided it was high time that the public knew what happened at Freddy's. She's made an effort to reach out to the parents of the missing children, hoping to help them find some closure.", "Fritz would never be truly admired for his boundless intellect... But he doesn't mind. He's found another way to be immortalized.", string("As for {0}...", guard_nickname())];
PhotoCaptions = ["", "", "With the masks having been left behind, Michael decided to take matters into his own hands. His loose ends had finally been tied up...leaving nothing but a smoldering pizzeria behind.", "", "", "Free of Springtrap's influence, Vannabelle snapped out of her obsession and reconnected with some of her old friends. She's become more involved in other fandoms now.", "", "", "The Boss was able to secure a huge insurance payout after his establishment went up in flames. He wonders why he never tried burning the place down himself.", "", "", GuardLines[min(global.Guard, 4)]];
Balls = 
{
    DIALOGUE: ["I still don't know who Joe is.", "Bitch!"],
    PHOTO_CAPTION: "I'm, erm, green with it?",
    FIRST_PERSON: "true"
};

if (global.Guard > 3)
    PhotoCaptions[array_length(PhotoCaptions) - 1] = import_dialogue(global.Guard, "/SPOILERS/cutscenes/ending_dialogue.txt").PHOTO_CAPTION;

PhotoAlpha = 1;
EndingPhotos = import_sprites("SPOILERS/cutscenes/endphoto.png", sUltimateCreditsPhotos, 1);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_14 = 14,
    Value_15,
    Value_22 = 22,
    Value_23,
    Value_24,
    Value_28 = 28,
    Value_29,
    Value_30,
    Value_31,
    Value_35 = 35,
    Value_36,
    Value_39 = 39,
    Value_41 = 41,
    Value_45 = 45,
    Value_46,
    Value_49 = 49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_60 = 60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_66 = 66
}
