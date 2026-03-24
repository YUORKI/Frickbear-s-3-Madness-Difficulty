Frame = 0;

function get_animatronic_height(arg0)
{
    switch (arg0)
    {
        default:
            return 48;
            break;
        
        case UnknownEnum.Value_4:
            return 48;
            break;
        
        case UnknownEnum.Value_5:
            return 64;
            break;
        
        case UnknownEnum.Value_6:
            return 64;
            break;
        
        case UnknownEnum.Value_7:
            return 64;
            break;
        
        case UnknownEnum.Value_8:
            return 64;
            break;
        
        case UnknownEnum.Value_9:
            return 16;
            break;
        
        case UnknownEnum.Value_10:
            return 64;
            break;
        
        case UnknownEnum.Value_11:
            return 64;
            break;
        
        case UnknownEnum.Value_12:
            return 64;
            break;
        
        case UnknownEnum.Value_13:
            return 64;
            break;
        
        case UnknownEnum.Value_14:
            return 40;
            break;
        
        case UnknownEnum.Value_15:
            return 40;
            break;
        
        case UnknownEnum.Value_17:
            return 48;
            break;
        
        case UnknownEnum.Value_18:
            return 80;
            break;
        
        case UnknownEnum.Value_19:
            return 48;
            break;
        
        case UnknownEnum.Value_20:
            return 40;
            break;
        
        case UnknownEnum.Value_21:
            return 32;
            break;
        
        case UnknownEnum.Value_22:
            return 88;
            break;
        
        case UnknownEnum.Value_23:
            return 40;
            break;
        
        case UnknownEnum.Value_24:
            return 112;
            break;
        
        case UnknownEnum.Value_25:
            return 24;
            break;
        
        case UnknownEnum.Value_26:
            return 88;
            break;
        
        case UnknownEnum.Value_27:
            return 80;
            break;
        
        case UnknownEnum.Value_28:
            return 72;
            break;
        
        case UnknownEnum.Value_29:
            return 88;
            break;
        
        case UnknownEnum.Value_30:
            return 40;
            break;
        
        case UnknownEnum.Value_31:
            return 64;
            break;
        
        case UnknownEnum.Value_32:
            return 72;
            break;
        
        case UnknownEnum.Value_33:
            return 48;
            break;
        
        case UnknownEnum.Value_34:
            return 80;
            break;
        
        case UnknownEnum.Value_35:
            return 80;
            break;
        
        case UnknownEnum.Value_36:
            return 48;
            break;
        
        case UnknownEnum.Value_37:
            return 72;
            break;
        
        case UnknownEnum.Value_38:
            return 88;
            break;
        
        case UnknownEnum.Value_39:
            return 64;
            break;
        
        case UnknownEnum.Value_41:
            return 80;
            break;
        
        case UnknownEnum.Value_40:
            return 32;
            break;
        
        case UnknownEnum.Value_42:
            return 64;
            break;
        
        case UnknownEnum.Value_43:
            return 32;
            break;
        
        case UnknownEnum.Value_44:
            return 64;
            break;
        
        case UnknownEnum.Value_45:
            return 72;
            break;
        
        case UnknownEnum.Value_46:
            return 96;
            break;
        
        case 47:
            return 80;
            break;
        
        case 48:
            return 72;
            break;
        
        case 49:
            return 24;
            break;
    }
}

Height = DepthOffset + get_animatronic_height(AnimatronicID);

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
    Value_14,
    Value_15,
    Value_17 = 17,
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
