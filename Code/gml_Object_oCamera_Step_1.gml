if (BossMode != UnknownEnum.Value_0)
    exit;

switch (global.Night)
{
    case 1:
        if ((global.Timer / 60) < 2)
            global.Temperature -= 0.006666666666666667;
        
        switch (get_time())
        {
            case 0:
                ai_set(UnknownEnum.Value_3, 3);
                break;
            
            case 0.5:
                ai_set(UnknownEnum.Value_1, 1);
                break;
            
            case 0.8333333333333334:
                global.AILevels[UnknownEnum.Value_16] = 1;
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_14, 10);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_1, 5);
                ai_set(UnknownEnum.Value_2, 3);
                ai_set(UnknownEnum.Value_16, 5);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_0, 1);
                ai_set(UnknownEnum.Value_2, 5);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_0, 2);
                ai_set(UnknownEnum.Value_1, 8);
                ai_set(UnknownEnum.Value_2, 8);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_0, 5);
                ai_set(UnknownEnum.Value_3, 5);
                break;
        }
        
        break;
    
    case 2:
        switch (get_time())
        {
            case 0:
            case 0.5:
                ai_set(UnknownEnum.Value_40, 6);
                ai_set(UnknownEnum.Value_41, 6);
                ai_set(UnknownEnum.Value_42, 6);
                ai_set(UnknownEnum.Value_43, 6);
                ai_set(UnknownEnum.Value_44, 6);
                ai_set(UnknownEnum.Value_45, 6);
                ai_set(UnknownEnum.Value_46, 6);
                ai_set(UnknownEnum.Value_1, 7);
                ai_set(UnknownEnum.Value_2, 5);
                ai_set(UnknownEnum.Value_3, 3);
                ai_set(UnknownEnum.Value_4, 1);
                ai_set(UnknownEnum.Value_16, 5);
            
            case -0.5:
            case -0.25:
                ai_set(UnknownEnum.Value_42, 6);
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_0, 5);
                ai_set(UnknownEnum.Value_1, 10);
                ai_set(UnknownEnum.Value_2, 8);
                ai_set(UnknownEnum.Value_12, 5);
                ai_set(UnknownEnum.Value_14, 5);
                ai_set(UnknownEnum.Value_11, 5);
                ai_set(UnknownEnum.Value_13, 4);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_5, 5);
                ai_set(UnknownEnum.Value_13, 6);
                ai_set(UnknownEnum.Value_12, 8);
                ai_set(UnknownEnum.Value_14, 10);
                ai_set(UnknownEnum.Value_20, 5);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_3, 5);
                ai_set(UnknownEnum.Value_4, 5);
                ai_set(UnknownEnum.Value_10, 2);
                ai_set(UnknownEnum.Value_11, 8);
                ai_set(UnknownEnum.Value_12, 10);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_0, 5);
                ai_set(UnknownEnum.Value_10, 5);
                ai_set(UnknownEnum.Value_11, 12);
                ai_set(UnknownEnum.Value_5, 10);
                ai_set(UnknownEnum.Value_13, 7);
                ai_set(UnknownEnum.Value_14, 12);
                ai_set(UnknownEnum.Value_20, 10);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_0, 12);
                ai_set(UnknownEnum.Value_1, 15);
                ai_set(UnknownEnum.Value_2, 15);
                ai_set(UnknownEnum.Value_3, 10);
                ai_set(UnknownEnum.Value_10, 7);
                ai_set(UnknownEnum.Value_12, 15);
                ai_set(UnknownEnum.Value_13, 10);
                ai_set(UnknownEnum.Value_4, 10);
                break;
        }
        
        break;
    
    case 3:
        switch (get_time())
        {
            case 0:
            case 0.5:
                ai_set(UnknownEnum.Value_40, 7);
                ai_set(UnknownEnum.Value_41, 7);
                ai_set(UnknownEnum.Value_42, 7);
                ai_set(UnknownEnum.Value_43, 7);
                ai_set(UnknownEnum.Value_44, 7);
                ai_set(UnknownEnum.Value_45, 7);
                ai_set(UnknownEnum.Value_46, 7);
                ai_set(UnknownEnum.Value_0, 6);
                ai_set(UnknownEnum.Value_1, 8);
                ai_set(UnknownEnum.Value_2, 8);
                ai_set(UnknownEnum.Value_3, 8);
                ai_set(UnknownEnum.Value_16, 5);
                ai_set(UnknownEnum.Value_14, 8);
                ai_set(UnknownEnum.Value_10, 5);
                ai_set(UnknownEnum.Value_11, 5);
                ai_set(UnknownEnum.Value_12, 7);
                ai_set(UnknownEnum.Value_13, 5);
                ai_set(UnknownEnum.Value_4, 5);
                ai_set(UnknownEnum.Value_5, 5);
                ai_set(UnknownEnum.Value_20, 5);
                ai_set(UnknownEnum.Value_6, 5);
            
            case -0.5:
            case -0.25:
                ai_set(UnknownEnum.Value_6, 5);
                ai_set(UnknownEnum.Value_42, 7);
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_7, 7);
                ai_set(UnknownEnum.Value_8, 2);
                ai_set(UnknownEnum.Value_15, 6);
                ai_set(UnknownEnum.Value_33, 5);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_14, 12);
                ai_set(UnknownEnum.Value_8, 5);
                ai_set(UnknownEnum.Value_9, 5);
                ai_set(UnknownEnum.Value_18, 2);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_7, 11);
                ai_set(UnknownEnum.Value_15, 10);
                ai_set(UnknownEnum.Value_33, 8);
                ai_set(UnknownEnum.Value_18, 5);
                ai_set(UnknownEnum.Value_10, 8);
                ai_set(UnknownEnum.Value_11, 8);
                ai_set(UnknownEnum.Value_12, 12);
                ai_set(UnknownEnum.Value_13, 8);
                ai_set(UnknownEnum.Value_4, 8);
                ai_set(UnknownEnum.Value_5, 8);
                ai_set(UnknownEnum.Value_20, 8);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_0, 10);
                ai_set(UnknownEnum.Value_1, 13);
                ai_set(UnknownEnum.Value_2, 13);
                ai_set(UnknownEnum.Value_3, 10);
                ai_set(UnknownEnum.Value_7, 15);
                ai_set(UnknownEnum.Value_8, 10);
                ai_set(UnknownEnum.Value_15, 15);
                ai_set(UnknownEnum.Value_33, 15);
                ai_set(UnknownEnum.Value_18, 10);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_7, 12);
                ai_set(UnknownEnum.Value_8, 12);
                ai_set(UnknownEnum.Value_15, 13);
                ai_set(UnknownEnum.Value_33, 13);
                ai_set(UnknownEnum.Value_18, 13);
                ai_set(UnknownEnum.Value_10, 12);
                ai_set(UnknownEnum.Value_11, 12);
                ai_set(UnknownEnum.Value_12, 12);
                ai_set(UnknownEnum.Value_13, 12);
                ai_set(UnknownEnum.Value_4, 12);
                ai_set(UnknownEnum.Value_5, 12);
                ai_set(UnknownEnum.Value_20, 12);
                break;
        }
        
        break;
    
    case 4:
        switch (get_time())
        {
            case 0:
            case 0.5:
                ai_set(UnknownEnum.Value_40, 8);
                ai_set(UnknownEnum.Value_41, 8);
                ai_set(UnknownEnum.Value_43, 8);
                ai_set(UnknownEnum.Value_44, 8);
                ai_set(UnknownEnum.Value_45, 8);
                ai_set(UnknownEnum.Value_46, 8);
                ai_set(UnknownEnum.Value_0, 8);
                ai_set(UnknownEnum.Value_1, 10);
                ai_set(UnknownEnum.Value_2, 10);
                ai_set(UnknownEnum.Value_3, 10);
                ai_set(UnknownEnum.Value_14, 10);
                ai_set(UnknownEnum.Value_10, 6);
                ai_set(UnknownEnum.Value_11, 6);
                ai_set(UnknownEnum.Value_12, 8);
                ai_set(UnknownEnum.Value_13, 6);
                ai_set(UnknownEnum.Value_4, 6);
                ai_set(UnknownEnum.Value_5, 6);
                ai_set(UnknownEnum.Value_20, 6);
                ai_set(UnknownEnum.Value_7, 10);
                ai_set(UnknownEnum.Value_8, 8);
                ai_set(UnknownEnum.Value_9, 8);
                ai_set(UnknownEnum.Value_15, 10);
                ai_set(UnknownEnum.Value_18, 8);
                ai_set(UnknownEnum.Value_33, 8);
                ai_set(UnknownEnum.Value_16, 8);
                ai_set(UnknownEnum.Value_17, 10);
                ai_set(UnknownEnum.Value_37, 10);
            
            case -0.5:
            case -0.25:
                ai_set(UnknownEnum.Value_6, 10);
                ai_set(UnknownEnum.Value_42, 8);
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_32, 8);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_14, 13);
                ai_set(UnknownEnum.Value_19, 3);
                ai_set(UnknownEnum.Value_30, 5);
                ai_set(UnknownEnum.Value_31, 5);
                ai_set(UnknownEnum.Value_35, 8);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_19, 7);
                ai_set(UnknownEnum.Value_10, 8);
                ai_set(UnknownEnum.Value_11, 8);
                ai_set(UnknownEnum.Value_12, 12);
                ai_set(UnknownEnum.Value_13, 8);
                ai_set(UnknownEnum.Value_4, 8);
                ai_set(UnknownEnum.Value_5, 8);
                ai_set(UnknownEnum.Value_20, 8);
                ai_set(UnknownEnum.Value_7, 13);
                ai_set(UnknownEnum.Value_8, 11);
                ai_set(UnknownEnum.Value_9, 11);
                ai_set(UnknownEnum.Value_15, 13);
                ai_set(UnknownEnum.Value_18, 11);
                ai_set(UnknownEnum.Value_33, 15);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_0, 11);
                ai_set(UnknownEnum.Value_1, 15);
                ai_set(UnknownEnum.Value_2, 15);
                ai_set(UnknownEnum.Value_3, 12);
                ai_set(UnknownEnum.Value_30, 8);
                ai_set(UnknownEnum.Value_31, 10);
                ai_set(UnknownEnum.Value_19, 10);
                ai_set(UnknownEnum.Value_35, 12);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_30, 12);
                ai_set(UnknownEnum.Value_31, 12);
                ai_set(UnknownEnum.Value_19, 12);
                ai_set(UnknownEnum.Value_32, 12);
                break;
        }
        
        break;
    
    case 5:
        switch (get_time())
        {
            case 0:
            case 0.5:
                ai_set(UnknownEnum.Value_40, 9);
                ai_set(UnknownEnum.Value_41, 9);
                ai_set(UnknownEnum.Value_43, 9);
                ai_set(UnknownEnum.Value_44, 9);
                ai_set(UnknownEnum.Value_45, 9);
                ai_set(UnknownEnum.Value_46, 9);
                ai_set(UnknownEnum.Value_0, 11);
                ai_set(UnknownEnum.Value_1, 11);
                ai_set(UnknownEnum.Value_2, 11);
                ai_set(UnknownEnum.Value_3, 11);
                ai_set(UnknownEnum.Value_14, 12);
                ai_set(UnknownEnum.Value_10, 7);
                ai_set(UnknownEnum.Value_11, 7);
                ai_set(UnknownEnum.Value_12, 9);
                ai_set(UnknownEnum.Value_13, 7);
                ai_set(UnknownEnum.Value_4, 7);
                ai_set(UnknownEnum.Value_5, 7);
                ai_set(UnknownEnum.Value_20, 7);
                ai_set(UnknownEnum.Value_7, 11);
                ai_set(UnknownEnum.Value_8, 9);
                ai_set(UnknownEnum.Value_9, 9);
                ai_set(UnknownEnum.Value_15, 11);
                ai_set(UnknownEnum.Value_18, 9);
                ai_set(UnknownEnum.Value_33, 10);
                ai_set(UnknownEnum.Value_30, 12);
                ai_set(UnknownEnum.Value_31, 12);
                ai_set(UnknownEnum.Value_19, 12);
                ai_set(UnknownEnum.Value_32, 14);
                ai_set(UnknownEnum.Value_35, 12);
                ai_set(UnknownEnum.Value_16, 10);
                ai_set(UnknownEnum.Value_17, 12);
                ai_set(UnknownEnum.Value_37, 12);
            
            case -0.5:
            case -0.25:
                ai_set(UnknownEnum.Value_6, 12);
                ai_set(UnknownEnum.Value_42, 9);
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_22, 1);
                ai_set(UnknownEnum.Value_36, 5);
                ai_set(UnknownEnum.Value_38, 8);
                ai_set(UnknownEnum.Value_34, 5);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_30, 15);
                ai_set(UnknownEnum.Value_31, 15);
                ai_set(UnknownEnum.Value_19, 15);
                ai_set(UnknownEnum.Value_32, 17);
                ai_set(UnknownEnum.Value_35, 15);
                ai_set(UnknownEnum.Value_14, 16);
                ai_set(UnknownEnum.Value_22, 5);
                ai_set(UnknownEnum.Value_21, 1);
                ai_set(UnknownEnum.Value_23, 8);
                ai_set(UnknownEnum.Value_24, 8);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_34, 10);
                ai_set(UnknownEnum.Value_22, 10);
                ai_set(UnknownEnum.Value_36, 10);
                ai_set(UnknownEnum.Value_38, 10);
                ai_set(UnknownEnum.Value_21, 8);
                ai_set(UnknownEnum.Value_7, 14);
                ai_set(UnknownEnum.Value_8, 11);
                ai_set(UnknownEnum.Value_9, 11);
                ai_set(UnknownEnum.Value_15, 14);
                ai_set(UnknownEnum.Value_18, 11);
                ai_set(UnknownEnum.Value_33, 14);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_0, 12);
                ai_set(UnknownEnum.Value_1, 15);
                ai_set(UnknownEnum.Value_2, 15);
                ai_set(UnknownEnum.Value_3, 12);
                ai_set(UnknownEnum.Value_10, 10);
                ai_set(UnknownEnum.Value_11, 10);
                ai_set(UnknownEnum.Value_12, 14);
                ai_set(UnknownEnum.Value_13, 10);
                ai_set(UnknownEnum.Value_4, 10);
                ai_set(UnknownEnum.Value_5, 10);
                ai_set(UnknownEnum.Value_20, 12);
                ai_set(UnknownEnum.Value_22, 13);
                ai_set(UnknownEnum.Value_36, 13);
                ai_set(UnknownEnum.Value_38, 13);
                ai_set(UnknownEnum.Value_21, 13);
                ai_set(UnknownEnum.Value_23, 13);
                ai_set(UnknownEnum.Value_24, 13);
                ai_set(UnknownEnum.Value_34, 13);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_22, 15);
                ai_set(UnknownEnum.Value_23, 15);
                ai_set(UnknownEnum.Value_38, 15);
                ai_set(UnknownEnum.Value_21, 15);
                ai_set(UnknownEnum.Value_36, 15);
                ai_set(UnknownEnum.Value_24, 15);
                ai_set(UnknownEnum.Value_34, 15);
                break;
        }
        
        break;
    
    case 6:
        switch (get_time())
        {
            case 0:
            case 0.5:
                ai_set(UnknownEnum.Value_40, 10);
                ai_set(UnknownEnum.Value_41, 10);
                ai_set(UnknownEnum.Value_43, 10);
                ai_set(UnknownEnum.Value_44, 10);
                ai_set(UnknownEnum.Value_45, 10);
                ai_set(UnknownEnum.Value_46, 10);
                ai_set(UnknownEnum.Value_0, 11);
                ai_set(UnknownEnum.Value_1, 11);
                ai_set(UnknownEnum.Value_2, 11);
                ai_set(UnknownEnum.Value_3, 11);
                ai_set(UnknownEnum.Value_14, 13);
                ai_set(UnknownEnum.Value_10, 8);
                ai_set(UnknownEnum.Value_11, 8);
                ai_set(UnknownEnum.Value_12, 10);
                ai_set(UnknownEnum.Value_13, 8);
                ai_set(UnknownEnum.Value_4, 8);
                ai_set(UnknownEnum.Value_5, 8);
                ai_set(UnknownEnum.Value_20, 6);
                ai_set(UnknownEnum.Value_7, 11);
                ai_set(UnknownEnum.Value_8, 9);
                ai_set(UnknownEnum.Value_9, 9);
                ai_set(UnknownEnum.Value_15, 11);
                ai_set(UnknownEnum.Value_18, 9);
                ai_set(UnknownEnum.Value_33, 9);
                ai_set(UnknownEnum.Value_30, 11);
                ai_set(UnknownEnum.Value_31, 11);
                ai_set(UnknownEnum.Value_19, 11);
                ai_set(UnknownEnum.Value_32, 13);
                ai_set(UnknownEnum.Value_35, 11);
                ai_set(UnknownEnum.Value_21, 10);
                ai_set(UnknownEnum.Value_22, 10);
                ai_set(UnknownEnum.Value_23, 10);
                ai_set(UnknownEnum.Value_24, 10);
                ai_set(UnknownEnum.Value_36, 10);
                ai_set(UnknownEnum.Value_38, 10);
                ai_set(UnknownEnum.Value_34, 10);
                ai_set(UnknownEnum.Value_16, 12);
                ai_set(UnknownEnum.Value_17, 15);
                ai_set(UnknownEnum.Value_37, 15);
                ai_set(UnknownEnum.Value_28, 6);
                ai_set(UnknownEnum.Value_29, 10);
                ai_set(UnknownEnum.Value_25, 10);
                ai_set(UnknownEnum.Value_39, 10);
            
            case -0.5:
            case -0.25:
                ai_set(UnknownEnum.Value_26, 10);
                ai_set(UnknownEnum.Value_6, 15);
                ai_set(UnknownEnum.Value_42, 10);
                break;
            
            case 1:
                ai_set(UnknownEnum.Value_0, 14);
                ai_set(UnknownEnum.Value_1, 18);
                ai_set(UnknownEnum.Value_2, 18);
                ai_set(UnknownEnum.Value_3, 14);
                ai_set(UnknownEnum.Value_10, 11);
                ai_set(UnknownEnum.Value_11, 11);
                ai_set(UnknownEnum.Value_12, 14);
                ai_set(UnknownEnum.Value_13, 11);
                ai_set(UnknownEnum.Value_4, 11);
                ai_set(UnknownEnum.Value_5, 11);
                ai_set(UnknownEnum.Value_20, 10);
                ai_set(UnknownEnum.Value_27, 8);
                ai_set(UnknownEnum.Value_28, 10);
                break;
            
            case 2:
                ai_set(UnknownEnum.Value_7, 13);
                ai_set(UnknownEnum.Value_8, 12);
                ai_set(UnknownEnum.Value_9, 12);
                ai_set(UnknownEnum.Value_15, 13);
                ai_set(UnknownEnum.Value_18, 12);
                ai_set(UnknownEnum.Value_33, 13);
                ai_set(UnknownEnum.Value_14, 15);
                break;
            
            case 3:
                ai_set(UnknownEnum.Value_30, 13);
                ai_set(UnknownEnum.Value_31, 13);
                ai_set(UnknownEnum.Value_19, 13);
                ai_set(UnknownEnum.Value_32, 15);
                ai_set(UnknownEnum.Value_35, 13);
                ai_set(UnknownEnum.Value_27, 12);
                break;
            
            case 4:
                ai_set(UnknownEnum.Value_22, 13);
                ai_set(UnknownEnum.Value_23, 13);
                ai_set(UnknownEnum.Value_38, 13);
                ai_set(UnknownEnum.Value_21, 13);
                ai_set(UnknownEnum.Value_36, 13);
                ai_set(UnknownEnum.Value_24, 13);
                ai_set(UnknownEnum.Value_34, 13);
                ai_set(UnknownEnum.Value_27, 15);
                ai_set(UnknownEnum.Value_28, 15);
                break;
            
            case 5:
                ai_set(UnknownEnum.Value_0, 16);
                ai_set(UnknownEnum.Value_1, 18);
                ai_set(UnknownEnum.Value_2, 18);
                ai_set(UnknownEnum.Value_3, 16);
                break;
        }
        
        break;
}

if (!OnetimersScheduled)
{
    var AppearTimes = [];
    var CurAppearTime = global.Timer + (random_range(45, 60) / global.NightSpeedup);
    
    repeat (4)
    {
        array_push(AppearTimes, CurAppearTime);
        CurAppearTime += (random_range(60, 75) / global.NightSpeedup);
    }
    
    if (global.ChallengeTitle == "Minute 2 Win It")
        AppearTimes = [0, 0, 0, 0];
    
    AppearTimes = array_shuffle(AppearTimes);
    
    with (oShadowFreddy)
        ActivationTime = AppearTimes[0];
    
    with (oBallora)
        ActivationTime = AppearTimes[1];
    
    with (oCoffee)
        ActivationTime = AppearTimes[2];
    
    with (oAnimdude)
        ActivationTime = AppearTimes[3];
    
    OnetimersScheduled = true;
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
