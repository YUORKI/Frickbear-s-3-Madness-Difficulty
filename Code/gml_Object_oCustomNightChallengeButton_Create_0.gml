Text = "ERR";
BaseY = 0;
Loaded = false;
Locked = false;

function set_duration(arg0)
{
    global.NightSpeedup = 6 / arg0;
    
    with (oCustomNightDurationSelector)
    {
        TimeSetting = arg0 - 1;
        Text = SettingsArray[TimeSetting][0];
        global.NightSpeedup = SettingsArray[TimeSetting][1];
    }
}

function set_levels(arg0)
{
    global.AILevels = array_create(48, 0);
    global.Challenge = ChallengeID;
    global.ChallengeTitle = arg0;
    
    switch (arg0)
    {
        case "Rabbit Season":
            global.AILevels[UnknownEnum.Value_1] = 20;
            global.AILevels[UnknownEnum.Value_7] = 20;
            global.AILevels[UnknownEnum.Value_11] = 20;
            global.AILevels[UnknownEnum.Value_18] = 20;
            global.AILevels[UnknownEnum.Value_20] = 20;
            global.AILevels[UnknownEnum.Value_21] = 20;
            global.AILevels[UnknownEnum.Value_37] = 20;
            set_duration(2);
            break;
        
        case "Window Watchers":
            global.AILevels[UnknownEnum.Value_5] = 20;
            global.AILevels[UnknownEnum.Value_10] = 20;
            global.AILevels[UnknownEnum.Value_13] = 20;
            global.AILevels[UnknownEnum.Value_38] = 20;
            global.AILevels[UnknownEnum.Value_16] = 20;
            global.AILevels[UnknownEnum.Value_21] = 20;
            global.AILevels[UnknownEnum.Value_44] = 20;
            global.Cheats[UnknownEnum.Value_0] = true;
            set_duration(2);
            break;
        
        case "Era of '87":
            global.AILevels[UnknownEnum.Value_6] = 20;
            global.AILevels[UnknownEnum.Value_7] = 20;
            global.AILevels[UnknownEnum.Value_8] = 20;
            global.AILevels[UnknownEnum.Value_9] = 20;
            global.AILevels[UnknownEnum.Value_14] = 20;
            global.AILevels[UnknownEnum.Value_16] = 20;
            global.AILevels[UnknownEnum.Value_10] = 20;
            global.AILevels[UnknownEnum.Value_11] = 20;
            global.AILevels[UnknownEnum.Value_12] = 20;
            global.AILevels[UnknownEnum.Value_13] = 20;
            global.AILevels[UnknownEnum.Value_4] = 5;
            global.AILevels[UnknownEnum.Value_15] = 5;
            global.AILevels[UnknownEnum.Value_5] = 5;
            global.AILevels[UnknownEnum.Value_17] = 5;
            global.AILevels[UnknownEnum.Value_18] = 5;
            set_duration(3);
            break;
        
        case "Ladies' Night":
            global.Cheats[UnknownEnum.Value_1] = true;
            global.AILevels[UnknownEnum.Value_2] = 20;
            global.AILevels[UnknownEnum.Value_8] = 20;
            global.AILevels[UnknownEnum.Value_9] = 10;
            global.AILevels[UnknownEnum.Value_15] = 20;
            global.AILevels[UnknownEnum.Value_12] = 20;
            global.AILevels[UnknownEnum.Value_16] = 10;
            global.AILevels[UnknownEnum.Value_19] = 21;
            global.AILevels[UnknownEnum.Value_25] = 10;
            global.AILevels[UnknownEnum.Value_26] = 20;
            global.AILevels[UnknownEnum.Value_28] = 10;
            global.AILevels[UnknownEnum.Value_29] = 20;
            global.AILevels[UnknownEnum.Value_34] = 5;
            global.AILevels[UnknownEnum.Value_35] = 20;
            global.AILevels[UnknownEnum.Value_33] = 5;
            set_duration(3);
            break;
        
        case "Watchful Eye":
            global.Cheats[UnknownEnum.Value_1] = true;
            global.Cheats[UnknownEnum.Value_0] = true;
            global.AILevels[UnknownEnum.Value_0] = 10;
            global.AILevels[UnknownEnum.Value_1] = 10;
            global.AILevels[UnknownEnum.Value_2] = 10;
            global.AILevels[UnknownEnum.Value_3] = 20;
            global.AILevels[UnknownEnum.Value_6] = 20;
            global.AILevels[UnknownEnum.Value_16] = 20;
            global.AILevels[UnknownEnum.Value_20] = 10;
            global.AILevels[UnknownEnum.Value_23] = 10;
            global.AILevels[UnknownEnum.Value_25] = 10;
            global.AILevels[UnknownEnum.Value_26] = 20;
            global.AILevels[UnknownEnum.Value_27] = 20;
            global.AILevels[UnknownEnum.Value_28] = 20;
            global.AILevels[UnknownEnum.Value_29] = 20;
            global.AILevels[UnknownEnum.Value_33] = 20;
            global.AILevels[UnknownEnum.Value_35] = 20;
            global.AILevels[UnknownEnum.Value_37] = 21;
            global.AILevels[UnknownEnum.Value_43] = 20;
            global.AILevels[UnknownEnum.Value_45] = 20;
            set_duration(3);
            break;
        
        case "Old Friends":
            global.AILevels[UnknownEnum.Value_0] = 20;
            global.AILevels[UnknownEnum.Value_1] = 20;
            global.AILevels[UnknownEnum.Value_2] = 20;
            global.AILevels[UnknownEnum.Value_3] = 20;
            global.AILevels[UnknownEnum.Value_4] = 20;
            global.AILevels[UnknownEnum.Value_5] = 20;
            global.AILevels[UnknownEnum.Value_9] = 20;
            global.AILevels[UnknownEnum.Value_14] = 20;
            global.AILevels[UnknownEnum.Value_16] = 20;
            global.AILevels[UnknownEnum.Value_11] = 20;
            global.AILevels[UnknownEnum.Value_12] = 20;
            global.AILevels[UnknownEnum.Value_18] = 20;
            global.AILevels[UnknownEnum.Value_22] = 20;
            global.AILevels[UnknownEnum.Value_24] = 20;
            set_duration(2);
            break;
        
        case "New Friends":
            global.AILevels[UnknownEnum.Value_15] = 20;
            global.AILevels[UnknownEnum.Value_17] = 20;
            global.AILevels[UnknownEnum.Value_21] = 20;
            global.AILevels[UnknownEnum.Value_26] = 20;
            global.AILevels[UnknownEnum.Value_27] = 20;
            global.AILevels[UnknownEnum.Value_28] = 20;
            global.AILevels[UnknownEnum.Value_29] = 20;
            global.AILevels[UnknownEnum.Value_30] = 20;
            global.AILevels[UnknownEnum.Value_31] = 20;
            global.AILevels[UnknownEnum.Value_38] = 20;
            global.AILevels[UnknownEnum.Value_40] = 20;
            global.AILevels[UnknownEnum.Value_41] = 20;
            global.AILevels[UnknownEnum.Value_42] = 20;
            global.AILevels[UnknownEnum.Value_43] = 20;
            global.AILevels[UnknownEnum.Value_44] = 20;
            global.AILevels[UnknownEnum.Value_45] = 20;
            global.Cheats[UnknownEnum.Value_0] = true;
            set_duration(3);
            break;
        
        case "Even a Bear!":
            global.Cheats[UnknownEnum.Value_1] = true;
            global.AILevels[UnknownEnum.Value_0] = 20;
            global.AILevels[UnknownEnum.Value_4] = 20;
            global.AILevels[UnknownEnum.Value_6] = 20;
            global.AILevels[UnknownEnum.Value_10] = 20;
            global.AILevels[UnknownEnum.Value_17] = 20;
            global.AILevels[UnknownEnum.Value_19] = 21;
            global.AILevels[UnknownEnum.Value_22] = 20;
            global.AILevels[UnknownEnum.Value_27] = 20;
            global.AILevels[UnknownEnum.Value_30] = 20;
            global.AILevels[UnknownEnum.Value_33] = 20;
            global.AILevels[UnknownEnum.Value_34] = 20;
            global.AILevels[UnknownEnum.Value_38] = 20;
            set_duration(3);
            break;
        
        case "The Second Coming":
            global.AILevels[UnknownEnum.Value_6] = 20;
            global.AILevels[UnknownEnum.Value_7] = 20;
            global.AILevels[UnknownEnum.Value_8] = 20;
            global.AILevels[UnknownEnum.Value_10] = 20;
            global.AILevels[UnknownEnum.Value_13] = 20;
            global.AILevels[UnknownEnum.Value_19] = 20;
            global.AILevels[UnknownEnum.Value_20] = 20;
            global.AILevels[UnknownEnum.Value_23] = 20;
            global.AILevels[UnknownEnum.Value_25] = 20;
            global.AILevels[UnknownEnum.Value_32] = 20;
            global.AILevels[UnknownEnum.Value_33] = 20;
            global.AILevels[UnknownEnum.Value_34] = 20;
            global.AILevels[UnknownEnum.Value_35] = 20;
            global.AILevels[UnknownEnum.Value_36] = 20;
            global.AILevels[UnknownEnum.Value_37] = 20;
            global.AILevels[UnknownEnum.Value_39] = 20;
            global.AILevels[UnknownEnum.Value_46] = 20;
            global.Cheats[UnknownEnum.Value_0] = true;
            set_duration(3);
            break;
        
        case "Blind Mode":
            global.AILevels[UnknownEnum.Value_17] = 21;
            global.AILevels[UnknownEnum.Value_14] = 21;
            global.AILevels[UnknownEnum.Value_0] = 20;
            global.AILevels[UnknownEnum.Value_1] = 15;
            global.AILevels[UnknownEnum.Value_2] = 15;
            global.AILevels[UnknownEnum.Value_3] = 20;
            global.AILevels[UnknownEnum.Value_7] = 20;
            global.AILevels[UnknownEnum.Value_12] = 20;
            global.AILevels[UnknownEnum.Value_32] = 20;
            global.AILevels[UnknownEnum.Value_31] = 10;
            global.AILevels[UnknownEnum.Value_24] = 10;
            global.AILevels[UnknownEnum.Value_35] = 20;
            global.AILevels[UnknownEnum.Value_34] = 20;
            global.AILevels[UnknownEnum.Value_43] = 20;
            global.Cheats[UnknownEnum.Value_1] = true;
            global.Cheats[UnknownEnum.Value_0] = true;
            set_duration(3);
            break;
        
        case "Deafening":
            global.AILevels[UnknownEnum.Value_31] = 21;
            global.AILevels[UnknownEnum.Value_0] = 20;
            global.AILevels[UnknownEnum.Value_8] = 20;
            global.AILevels[UnknownEnum.Value_14] = 20;
            global.AILevels[UnknownEnum.Value_15] = 20;
            global.AILevels[UnknownEnum.Value_18] = 10;
            global.AILevels[UnknownEnum.Value_20] = 20;
            global.AILevels[UnknownEnum.Value_35] = 20;
            global.AILevels[UnknownEnum.Value_38] = 20;
            global.Cheats[UnknownEnum.Value_1] = true;
            set_duration(3);
            break;
        
        case "The General's Challenge":
            global.AILevels[UnknownEnum.Value_41] = 21;
            global.Cheats[UnknownEnum.Value_0] = true;
            global.Cheats[UnknownEnum.Value_1] = true;
            set_duration(2);
            break;
        
        case "Chipper's Revenge":
            global.AILevels[UnknownEnum.Value_25] = 20;
            global.AILevels[UnknownEnum.Value_42] = 21;
            global.Cheats[UnknownEnum.Value_0] = true;
            global.Cheats[UnknownEnum.Value_1] = true;
            global.Cheats[UnknownEnum.Value_2] = true;
            set_duration(6);
            break;
        
        case "Paddleball Panic":
            global.AILevels[UnknownEnum.Value_3] = 1;
            global.AILevels[UnknownEnum.Value_30] = 20;
            global.AILevels[UnknownEnum.Value_40] = 21;
            global.Cheats[UnknownEnum.Value_0] = true;
            global.Cheats[UnknownEnum.Value_1] = true;
            set_duration(2);
            break;
        
        case "Minute 2 Win It":
            global.AILevels[UnknownEnum.Value_6] = 5;
            global.AILevels[UnknownEnum.Value_17] = 21;
            global.AILevels[UnknownEnum.Value_26] = 20;
            global.AILevels[UnknownEnum.Value_29] = 15;
            global.AILevels[UnknownEnum.Value_40] = 20;
            global.AILevels[UnknownEnum.Value_41] = 20;
            global.AILevels[UnknownEnum.Value_42] = 20;
            global.Cheats[UnknownEnum.Value_0] = true;
            global.Cheats[UnknownEnum.Value_1] = true;
            global.Cheats[UnknownEnum.Value_2] = true;
            set_duration(1);
            break;
        
        case "Gaming Hard?":
            global.AILevels[UnknownEnum.Value_6] = 21;
            global.Cheats[UnknownEnum.Value_1] = true;
            global.Cheats[UnknownEnum.Value_2] = true;
            global.Cheats[UnknownEnum.Value_4] = true;
            set_duration(6);
            break;
        
        case "The LolzHax Shuffle":
            global.AILevels[UnknownEnum.Value_16] = 20;
            global.AILevels[UnknownEnum.Value_39] = 21;
            global.Cheats[UnknownEnum.Value_1] = true;
            set_duration(6);
        
        case "REFIGHT: Nightmares":
            break;
        
        case "REFIGHT: Salvage":
            break;
        
        case "REFIGHT: Fredbear":
            break;
        
        case "Demo Demons":
            global.AILevels = array_create(48, 0);
            
            for (var i = 0; i < 20; i += 1)
                global.AILevels[i] = 20;
            
            global.AILevels[UnknownEnum.Value_20] = 20;
            global.AILevels[UnknownEnum.Value_19] = 0;
            set_duration(6);
            break;
        
        case "Full Game Fiends":
            global.AILevels = array_create(48, 0);
            
            for (var i = 20; i < 40; i += 1)
                global.AILevels[i] = 20;
            
            global.AILevels[UnknownEnum.Value_20] = 0;
            global.AILevels[UnknownEnum.Value_19] = 20;
            set_duration(6);
            break;
        
        case "A Bit of Everything":
            global.AILevels = array_create(48, 0);
            
            for (var i = 0; i < 47; i += 1)
                global.AILevels[i] = 5;
            
            global.Cheats[UnknownEnum.Value_0] = true;
            set_duration(6);
            break;
        
        case "Infernal 47":
            global.Cheats[UnknownEnum.Value_0] = true;
            global.AILevels = array_create(48, 0);
            
            for (var i = 0; i < 47; i += 1)
                global.AILevels[i] = 20;
            
            set_duration(6);
            break;
        
        default:
            global.AILevels = array_create(48, 0);
    }
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
    Value_46
}
