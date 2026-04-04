Timer = 0;
YOffset = 56;
Active = true;
TileSize = 0;
BossSelected = -1;
DifficultySelected = -1;
AnimatronicSelected = 0;

function choose_from_array(arg0, arg1)
{
    arg1 = min(arg1, array_length(arg0));
    var returnArray = [];
    array_copy(returnArray, 0, array_shuffle(arg0), 0, arg1);
    return returnArray;
}

function start_night()
{
    audio_play_sound(sfxClick, 5, false);
    global.Night = "Custom";
    global.NightSpeedup = 1;
    global.CustomNightMusic = undefined;
    global.Route = (BossSelected == 0) ? UnknownEnum.Value_3 : ((BossSelected == 1) ? UnknownEnum.Value_2 : UnknownEnum.Value_4);
    global.SummonedAnimatronics = [];
    global.Challenge = undefined;
    global.ChallengeTitle = "None";
    global.Difficulty = DifficultySelected;
    global.AILevels = array_create(array_length(global.AILevels), 0);
    global.Upgrades = [];
    global.Cheats = array_create(10, false);
    global.SavedBossTime = 0;
    
    switch (AnimatronicSelected)
    {
        case 0:
            switch (global.Difficulty)
            {
                case 0:
                    global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_13, UnknownEnum.Value_14, UnknownEnum.Value_7, UnknownEnum.Value_30, UnknownEnum.Value_38];
                    break;
                
                case 1:
                    global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_11, UnknownEnum.Value_13, UnknownEnum.Value_14, UnknownEnum.Value_7, UnknownEnum.Value_18, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_38, UnknownEnum.Value_36];
                    break;
                
                case 2:
                    global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_11, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_14, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_18, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_38, UnknownEnum.Value_36, UnknownEnum.Value_22];
                    break;
                
                case 3:
                    global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_11, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_12, UnknownEnum.Value_14, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_15, UnknownEnum.Value_18, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_19, UnknownEnum.Value_38, UnknownEnum.Value_36, UnknownEnum.Value_22, UnknownEnum.Value_23];
                    break;
            }
            
            if (global.Route == UnknownEnum.Value_3)
                array_delete(global.AllTimeSalvages, 0, 4);
            
            audio_stop_sound(musExtras);
            room_goto(NightOpening);
            break;
        
        case 1:
            var Backdoors = array_shuffle([UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_45, UnknownEnum.Value_44, UnknownEnum.Value_46]);
            global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14];
            
            if (global.Route == UnknownEnum.Value_3)
                array_delete(global.AllTimeSalvages, 0, 4);
            
            global.AllTimeSalvages = array_concat(global.AllTimeSalvages, choose_from_array([UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5, Backdoors[0]], global.Difficulty + 1));
            global.AllTimeSalvages = array_concat(global.AllTimeSalvages, choose_from_array([UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18, Backdoors[1]], global.Difficulty + 1));
            global.AllTimeSalvages = array_concat(global.AllTimeSalvages, choose_from_array([UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37, Backdoors[2]], global.Difficulty + 1));
            global.AllTimeSalvages = array_concat(global.AllTimeSalvages, choose_from_array([UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38, Backdoors[3]], global.Difficulty + 1));
            audio_stop_sound(musExtras);
            room_goto(NightOpening);
            break;
        
        case 2:
            instance_create_depth(0, 0, depth - 1, oExtras_Bosses_AnimatronicSelector);
            Active = false;
    }
}

Portrait = sNOTHING;
PreviousPortrait = sNOTHING;
ImageSize = 0;
PreviousImageSize = 0;
Frame = 0;
texturegroup_load("Renders");
instance_create_depth(592, -16, depth + 3, oCustomNightGuardSelect);

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
    Value_30 = 30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
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
