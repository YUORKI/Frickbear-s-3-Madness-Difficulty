if (instance_number(oCamera3DMaze) > 1)
    instance_destroy();

application_surface_draw_enable(false);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_texrepeat(true);
CameraRotationH = 0;
CameraRotationHTarget = 0;
CameraRotationV = 0;
CameraRotationVTarget = 0;
CameraX = x;
CameraY = y;
CameraZ = 32;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = 32;
LockX = 0;
LockY = 0;
LockZ = 0;
MonitorUp = 0;
FOV = 64;
Frame = 0;
SpeedX = 0;
SpeedY = 0;
SpeedTurn = 0;
Perspective = 0;
HeightOffset = 48;
LockOnTarget = -4;
application_surface_draw_enable(false);
Palettes = [[13497343, 9150972, 2367462, 3670100], [16776682, 15582005, 10510858, 3875328], [13695200, 7389320, 5662772, 3354368], [15852799, 15045092, 9517434, 3997737], [14940415, 13479679, 11422463, 3670100], [15137535, 2740449, 2848732, 4417], [15592941, 9211020, 5263440, 1579032], [16773119, 9221623, 10253188, 1052696], [240, 144, 72, 0], [16777215, 10461087, 1248964, 0], [16777215, 8553215, 1248964, 0], [1118481, 328965, 131586, 0], [0, 72, 144, 240], [7302117, 7759285, 8018285, 7360565], [3025408, 2498560, 1180672, 0], [12452095, 10223742, 8192050, 3474688], [10133, 1645, 48, 1542], [62207, 24063, 10748042, 5832760], [2818167, 4128855, 3276838, 917511], [16777215, 11316396, 5263440, 0]];
audio_stop_all();
CurrentPalette = 0;
Loudness = 0;

switch (room)
{
    case MinigameMaze_1:
        global.Music = musMinigameA;
        CurrentPalette = 0;
        break;
    
    case MinigameMaze_2:
        global.Music = musMinigameB;
        CurrentPalette = 1;
        break;
    
    case MinigameMaze_3:
        global.Music = musMinigameC;
        CurrentPalette = 2;
        break;
    
    case MinigameMaze_4:
        global.Music = musMinigameD;
        CurrentPalette = 3;
        break;
    
    case MinigameMaze_5:
        global.Music = musMinigameE;
        CurrentPalette = 4;
        break;
}

play_music(global.Music);
instance_create_depth(0, 0, 0, oCamera3DMaze_Cursor);
global.Night = CurrentPalette;
global.SalvagesCurrent = [];
SalvageAmount = 0;
SalvageIconOffset = 48;
global.SalvageQuota = global.Difficulty + 1;
global.MinigameCleared = 0;
global.HasGift = false;
PlayOpening = true;
ScreenshotsTaken = 0;
window_set_cursor(cr_none);
DisplayedEarnings = global.RunEarnings;

function randomize_animatronics()
{
    var PossibleAnimatronics = [UnknownEnum.Value_41, UnknownEnum.Value_40, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46];
    
    if (global.Night > 1)
        PossibleAnimatronics = array_concat(PossibleAnimatronics, [UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5]);
    
    if (global.Night > 2)
        PossibleAnimatronics = array_concat(PossibleAnimatronics, [UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18]);
    
    if (global.Night > 3)
        PossibleAnimatronics = array_concat(PossibleAnimatronics, [UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37]);
    
    if (global.Night > 4)
        PossibleAnimatronics = array_concat(PossibleAnimatronics, [UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38]);
    
    for (var i = 0; i < array_length(PossibleAnimatronics); i++)
    {
        if (array_contains(global.AllTimeSalvages, PossibleAnimatronics[i]))
        {
            array_delete(PossibleAnimatronics, i, 1);
            i--;
        }
    }
    
    PossibleAnimatronics = array_shuffle(PossibleAnimatronics);
    
    for (var i = 0; i < array_length(PossibleAnimatronics); i++)
    {
        var CurID = PossibleAnimatronics[i];
        var PriorityVal = irandom(3);
        
        if (array_contains([UnknownEnum.Value_41, UnknownEnum.Value_40, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46], CurID))
            PriorityVal++;
        
        if (!global.UnlockedAnimatronics[CurID])
            PriorityVal += max(3 - i, 1);
        
        PossibleAnimatronics[i] = 
        {
            ID: CurID,
            Priority: PriorityVal
        };
    }
    
    array_sort(PossibleAnimatronics, function(arg0, arg1)
    {
        return arg1.Priority - arg0.Priority;
    });
    
    for (var i = 0; i < instance_number(oInteraction_AnimatronicRandom); i++)
    {
        with (instance_find(oInteraction_AnimatronicRandom, i))
        {
            ID = i;
            
            if (i >= array_length(PossibleAnimatronics))
            {
                instance_destroy();
            }
            else
            {
                AnimatronicID = PossibleAnimatronics[i].ID;
                Text = global.Descriptions[AnimatronicID][0];
                Height = get_animatronic_height(AnimatronicID);
            }
        }
    }
    
    show_debug_message(PossibleAnimatronics);
}

TransitionPercent = 1;
TransitionFrames = 30;
GiftOffset = -32;
CurrentLoadZone = -4;

with (oMaze_Object)
{
    InView = true;
    InZone = true;
}

instance_create_depth(0, 0, 0, oPauser);
CustomHeight = clamp(get_guard_property("player_height", 48), 16, 80);
CustomSneakHeight = clamp(get_guard_property("player_sneak_height", 16), 8, 24);

enum UnknownEnum
{
    Value_4 = 4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_15 = 15,
    Value_17 = 17,
    Value_18,
    Value_19,
    Value_21 = 21,
    Value_22,
    Value_23,
    Value_24,
    Value_30 = 30,
    Value_31,
    Value_32,
    Value_36 = 36,
    Value_37,
    Value_38,
    Value_40 = 40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46
}
