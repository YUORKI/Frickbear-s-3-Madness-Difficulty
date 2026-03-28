image_index = 0;
JumpX += ((320 - JumpX) / 5);
JumpY += ((180 - JumpY) / 5);
SizeBody += (((1.25 - SizeBody) / 10) + 0.005);
SizeHead += (((1.5 - SizeHead) / 16) + 0.01);

if (Active == false)
{
    switch (global.Jumpscare)
    {
        case -1:
            audio_play_sound(sfxBitExplosion, 99, false);
            break;
        
        case UnknownEnum.Value_6:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_7:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_8:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_9:
            jump_origin(1, 0);
            break;
        
        case UnknownEnum.Value_14:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_16:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_21:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_26:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_30:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_47:
            jump_origin(-1, 0);
            break;
        
        case UnknownEnum.Value_4:
            jump_origin(0, 2);
            break;
        
        case UnknownEnum.Value_10:
            jump_origin(-1, 2);
            break;
        
        case UnknownEnum.Value_11:
            jump_origin(-1, 2);
            break;
        
        case UnknownEnum.Value_13:
            jump_origin(-1, 2);
            break;
        
        case UnknownEnum.Value_20:
            jump_origin(-1, 2);
            break;
        
        case UnknownEnum.Value_38:
            jump_origin(-1, 2);
            break;
        
        case UnknownEnum.Value_18:
            jump_origin(-1, 3);
            break;
        
        case UnknownEnum.Value_22:
            jump_origin(-1, 3);
            break;
        
        case UnknownEnum.Value_24:
            jump_origin(-1, 3);
            break;
        
        case UnknownEnum.Value_34:
            jump_origin(-1, 3);
            break;
        
        case UnknownEnum.Value_36:
            jump_origin(-1, 3);
            break;
        
        case UnknownEnum.Value_55:
            jump_origin(-1, 4);
            break;
        
        default:
            jump_origin(-1, 1);
            break;
    }
    
    Active = true;
}

Frame += 1;

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_13 = 13,
    Value_14,
    Value_16 = 16,
    Value_18 = 18,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_24 = 24,
    Value_26 = 26,
    Value_30 = 30,
    Value_34 = 34,
    Value_36 = 36,
    Value_38 = 38,
    Value_47 = 47,
    Value_55 = 55
}
