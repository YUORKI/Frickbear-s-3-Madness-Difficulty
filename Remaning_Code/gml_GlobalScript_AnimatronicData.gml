function get_animatronic_object(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return oFreddy;
            break;
        
        case UnknownEnum.Value_1:
            return oBonnie;
            break;
        
        case UnknownEnum.Value_2:
            return oChica;
            break;
        
        case UnknownEnum.Value_3:
            return oFoxy;
            break;
        
        case UnknownEnum.Value_4:
            return oGoldenFreddy;
            break;
        
        case UnknownEnum.Value_5:
            return oEndoskeleton;
            break;
        
        case UnknownEnum.Value_6:
            return oToyFreddy;
            break;
        
        case UnknownEnum.Value_7:
            return oToyBonnie;
            break;
        
        case UnknownEnum.Value_8:
            return oToyChica;
            break;
        
        case UnknownEnum.Value_9:
            return oMangle;
            break;
        
        case UnknownEnum.Value_10:
            return oWitheredFreddy;
            break;
        
        case UnknownEnum.Value_11:
            return oWitheredBonnie;
            break;
        
        case UnknownEnum.Value_12:
            return oWitheredChica;
            break;
        
        case UnknownEnum.Value_13:
            return oWitheredFoxy;
            break;
        
        case UnknownEnum.Value_14:
            return oBB;
            break;
        
        case UnknownEnum.Value_15:
            return oJJ;
            break;
        
        case UnknownEnum.Value_16:
            return oMarionette;
            break;
        
        case UnknownEnum.Value_17:
            return oShadowFreddy;
            break;
        
        case UnknownEnum.Value_18:
            return oRWQFSFASXC;
            break;
        
        case UnknownEnum.Value_19:
            return oPhantoms;
            break;
        
        case UnknownEnum.Value_20:
            return oSpringtrap;
            break;
        
        case UnknownEnum.Value_21:
            return oPlushtrap;
            break;
        
        case UnknownEnum.Value_22:
            return oNightmareFredbear;
            break;
        
        case UnknownEnum.Value_23:
            return oNightmareBB;
            break;
        
        case UnknownEnum.Value_24:
            return oNightmarionne;
            break;
        
        case UnknownEnum.Value_25:
            return oLolbit;
            break;
        
        case UnknownEnum.Value_26:
            return oBaby;
            break;
        
        case UnknownEnum.Value_27:
            return oFuntimeFreddy;
            break;
        
        case UnknownEnum.Value_28:
            return oFuntimeFoxy;
            break;
        
        case UnknownEnum.Value_29:
            return oBallora;
            break;
        
        case UnknownEnum.Value_30:
            return oHelpy;
            break;
        
        case UnknownEnum.Value_31:
            return oMusicMan;
            break;
        
        case UnknownEnum.Value_32:
            return oMrHippo;
            break;
        
        case UnknownEnum.Value_33:
            return oLefty;
            break;
        
        case UnknownEnum.Value_34:
            return oMoltenFreddy;
            break;
        
        case UnknownEnum.Value_35:
            return oScrapBaby;
            break;
        
        case UnknownEnum.Value_36:
            return oTwistedWolf;
            break;
        
        case UnknownEnum.Value_37:
            return oMalhare;
            break;
        
        case UnknownEnum.Value_38:
            return oDreadbear;
            break;
        
        case UnknownEnum.Value_39:
            return oLolzHax;
            break;
        
        case UnknownEnum.Value_41:
            return oAnimdude;
            break;
        
        case UnknownEnum.Value_40:
            return oCoffee;
            break;
        
        case UnknownEnum.Value_42:
            return oChipper;
            break;
        
        case UnknownEnum.Value_43:
            return oSparky;
            break;
        
        case UnknownEnum.Value_44:
            return oCandy;
            break;
        
        case UnknownEnum.Value_45:
            return oPopgoes;
            break;
        
        case UnknownEnum.Value_46:
            return oRodney;
            break;
        
        case UnknownEnum.Value_47:
            return oFuntimeChica;
            break;
        
        case UnknownEnum.Value_49:
            return oSalvage;
            break;
        
        case UnknownEnum.Value_55:
            return oFredbearAttack_Parent;
            break;
        
        default:
            return oShaderTest;
            break;
    }
}

global.AILevels = array_create(48, 0);

function get_total_ai_levels()
{
    var ReturnValue = 0;
    
    for (var i = 0; i < array_length(global.AILevels); i++)
        ReturnValue += global.AILevels[i];
    
    return ReturnValue;
}

audio_group_load(voc_WitheredChica_HaventYouHeard);
audio_group_load(mus_CandyCadetStory);
audio_group_load(voc_Rodney_Idle_TooManyNights);
audio_group_load(voc_Helpy_BuyBuyBuy);
audio_group_load(voc_Springtrap_Pathetic);
audio_group_load(voc_ToyFreddy_HardlyGaming);
audio_group_load(voc_Rodney_Idle_AltF4);
global.Guard = 0;

function get_salvage_data()
{
    var SalvageStats = [];
    SalvageStats[UnknownEnum.Value_0] = ["Acceptable", "Manageable", "Cameras\nDoors", 0];
    SalvageStats[UnknownEnum.Value_1] = ["Acceptable", "Manageable", "Cameras\nDoors", 0];
    SalvageStats[UnknownEnum.Value_2] = ["Acceptable", "Manageable", "Cameras\nDoors", 0];
    SalvageStats[UnknownEnum.Value_3] = ["Poor", "Manageable", "Cameras\nDoors", 0];
    SalvageStats[UnknownEnum.Value_4] = ["Poor", "Manageable", "Office\n Mask", 400];
    SalvageStats[UnknownEnum.Value_5] = ["Acceptable", "Manageable", "Flashlight\nAvoidance", 1100];
    SalvageStats[UnknownEnum.Value_6] = ["Good", "Manageable", "Minigames", 1300];
    SalvageStats[UnknownEnum.Value_7] = ["Good", "Manageable", "Vents\nMask\n Audio Lure", 800];
    SalvageStats[UnknownEnum.Value_8] = ["Good", "Manageable", "Office\nPoint & Click", 1700];
    SalvageStats[UnknownEnum.Value_9] = ["Good", "Manageable", "Cameras\nAvoidance", 1000];
    SalvageStats[UnknownEnum.Value_14] = ["Good", "Negligible", "Vents\nMask", 0];
    SalvageStats[UnknownEnum.Value_15] = ["Good", "Negligible", "Vents\nMask", 600];
    SalvageStats[UnknownEnum.Value_10] = ["Poor", "Manageable", "Office\nDoors", 2200];
    SalvageStats[UnknownEnum.Value_11] = ["Poor", "Manageable", "Office\nMask", 1400];
    SalvageStats[UnknownEnum.Value_12] = ["Poor", "Manageable", "Vents\nMask\nAudio Lure", 900];
    SalvageStats[UnknownEnum.Value_13] = ["Poor", "Manageable", "Office\nFlashlight", 1500];
    SalvageStats[UnknownEnum.Value_16] = ["Acceptable", "Manageable", "Cameras", 0];
    SalvageStats[UnknownEnum.Value_17] = ["???", "Negligible", "Flashlight", 2200];
    SalvageStats[UnknownEnum.Value_18] = ["???", "Manageable", "Office\nFlashlight", 1800];
    SalvageStats[UnknownEnum.Value_19] = ["???", "Negligible", "Cameras\nAvoidance", 1100];
    SalvageStats[UnknownEnum.Value_20] = ["Poor", "Concerning", "Cameras\nFlashlight", 2500];
    SalvageStats[UnknownEnum.Value_21] = ["Acceptable", "Manageable", "Office\nFlashlight", 2300];
    SalvageStats[UnknownEnum.Value_22] = ["???", "Manageable", "Fan", 1300];
    SalvageStats[UnknownEnum.Value_23] = ["???", "Manageable", "Cameras\nPoint & Click", 1800];
    SalvageStats[UnknownEnum.Value_24] = ["???", "Manageable", "Office\nAvoidance", 1500];
    SalvageStats[UnknownEnum.Value_25] = ["Good", "Negligible", "Shop", 2200];
    SalvageStats[UnknownEnum.Value_26] = ["Good", "Manageable", "Cameras\nPoint & Click", 2000];
    SalvageStats[UnknownEnum.Value_27] = ["Good", "Manageable", "Cameras\nDoors", 1600];
    SalvageStats[UnknownEnum.Value_28] = ["Good", "Manageable", "Cameras\nDoors", 1900];
    SalvageStats[UnknownEnum.Value_29] = ["Good", "Manageable", "Cameras\nPoint & Click", 2400];
    SalvageStats[UnknownEnum.Value_30] = ["Good", "Negligible", "Point & Click", 300];
    SalvageStats[UnknownEnum.Value_31] = ["Good", "Negligible", "Audio Cues?", 900];
    SalvageStats[UnknownEnum.Value_32] = ["Acceptable", "Negligible", "Vents\nMask\nAudio Lure", 600];
    SalvageStats[UnknownEnum.Value_33] = ["Acceptable", "Concerning", "Vents\nAudio Lure", 2300];
    SalvageStats[UnknownEnum.Value_34] = ["Poor", "Concerning", "Doors", 1000];
    SalvageStats[UnknownEnum.Value_35] = ["Poor", "???", "Cameras\nControlled Shock", 1500];
    SalvageStats[UnknownEnum.Value_36] = ["???", "Manageable", "Office\nPoint & Click", 600];
    SalvageStats[UnknownEnum.Value_37] = ["???", "Negligible", "Camera Flips\nAvoidance", 2300];
    SalvageStats[UnknownEnum.Value_38] = ["Acceptable", "Manageable", "Office\nPoint & Click", 900];
    SalvageStats[UnknownEnum.Value_39] = ["Good", "Negligible", "Variable", 1000];
    SalvageStats[UnknownEnum.Value_40] = ["???", "Negligible", "Point & Click", 1300];
    SalvageStats[UnknownEnum.Value_41] = ["???", "Manageable", "Platforming", 1500];
    SalvageStats[UnknownEnum.Value_42] = ["???", "Manageable", "Shop", 1000];
    SalvageStats[UnknownEnum.Value_43] = ["???", "Manageable", "Cameras\nControlled Shock", 2200];
    SalvageStats[UnknownEnum.Value_44] = ["???", "Manageable", "Office\nMask", 2000];
    SalvageStats[UnknownEnum.Value_45] = ["???", "Manageable", "Cameras\nControlled Shock", 1800];
    SalvageStats[UnknownEnum.Value_46] = ["???", "Negligible", "Earplugs", -100];
    return SalvageStats;
}

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
    Value_49 = 49,
    Value_55 = 55
}
