if (Delay == 0 && global.AILevels[UnknownEnum.Value_39] > 0 && global.AILevels[UnknownEnum.Value_39] != 21 && Head == undefined)
{
    Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    LTenna = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    RTenna = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    Body = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    LArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    RArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
}

if (Delay <= 0)
{
    var BodyX = 1376;
    var BodyY = 480 + (dsin(Frame * 4) * 8) + YOffset;
    var BodyA = 0;
    var HeadX = BodyX + rot_x(0, 160, BodyA);
    var HeadY = ((BodyY + rot_y(0, 160, BodyA)) - (dsin(Frame * 4) * 8)) + (dsin((Frame * 4) - 30) * 15) + (YOffset * 0.1);
    var HeadA = HeadRotation;
    var HeadImage = (floor(Frame / 4) % 2) + 1;
    
    if (!WoahMyHeadsSpinning)
        HeadImage = 0;
    
    var LArmX = BodyX + rot_x(-108, 140, BodyA);
    var LArmY = BodyY + rot_y(-108, 140, BodyA);
    var LArmA = dsin((Frame * 4) - 45) * -8;
    var RArmX = BodyX + rot_x(108, 140, BodyA);
    var RArmY = BodyY + rot_y(108, 140, BodyA);
    var RArmA = dsin((Frame * 4) - 45) * 8;
    var LTennaX = HeadX + rot_x(-31, -85, HeadA);
    var LTennaY = HeadY + rot_y(-31, -85, HeadA);
    var LTennaA = LArmA + HeadA;
    var RTennaX = HeadX + rot_x(31, -85, HeadA);
    var RTennaY = HeadY + rot_y(31, -85, HeadA);
    var RTennaA = RArmA + HeadA;
    
    with (LArm)
    {
        sprite_index = sLolzHax_Arm;
        x = LArmX;
        y = LArmY;
        image_xscale = 1;
        image_angle = LArmA * -1;
    }
    
    with (RArm)
    {
        sprite_index = sLolzHax_Arm;
        x = RArmX;
        y = RArmY;
        image_xscale = -1;
        image_angle = RArmA * -1;
    }
    
    with (Body)
    {
        sprite_index = sLolzHax_Body;
        x = BodyX;
        y = BodyY;
        image_angle = BodyA * -1;
    }
    
    with (LTenna)
    {
        sprite_index = sLolzHax_Antenna;
        x = LTennaX;
        y = LTennaY;
        image_xscale = 1;
        image_angle = LTennaA * -1;
    }
    
    with (RTenna)
    {
        sprite_index = sLolzHax_Antenna;
        x = RTennaX;
        y = RTennaY;
        image_xscale = -1;
        image_angle = RTennaA * -1;
    }
    
    with (Head)
    {
        sprite_index = sLolzHax_Head;
        image_index = HeadImage;
        x = HeadX;
        y = HeadY;
        image_angle = HeadA * -1;
    }
    
    YOffset += YOffsetSpeed;
    
    if (!SelectionMade)
        YOffsetSpeed = lerp(YOffsetSpeed, (0 - YOffset) * 0.1, 0.2);
    else
        YOffsetSpeed = lerp(YOffsetSpeed, (-360 - YOffset) * 0.2, 0.05);
    
    HeadRotation += HeadRotationSpeed;
    HeadRotationSpeed = lerp(HeadRotationSpeed, (0 - HeadRotation) * 0.25, 0.1);
    
    if (Frame > 45)
        WoahMyHeadsSpinning = false;
    
    if (YOffset < -360 && SelectionMade)
        instance_destroy();
    
    Frame++;
}

if (global.AILevels[UnknownEnum.Value_39] == 21)
{
    if (ChallengeTimer == 0 && array_length(ChallengeArray) > 0)
    {
        ChallengeTimer = 60;
        var CharsSummoned = [];
        
        repeat (min(AmountToSummon, array_length(ChallengeArray)))
        {
            var Summon = array_last(ChallengeArray);
            array_push(CharsSummoned, Summon);
            array_push(global.SummonedAnimatronics, Summon);
            global.AILevels[Summon] = 20;
            array_pop(ChallengeArray);
        }
        
        with (instance_create_depth(0, 0, 0, oSalvage_Summoner))
            Summons = CharsSummoned;
        
        reverb_sound(choose(voc_LolzHax_Laugh1, voc_LolzHax_Laugh2, voc_LolzHax_Laugh3), 0, 0, false, 1.5);
    }
    
    ChallengeTimer -= 0.016666666666666666;
    Delay = 1;
}

enum UnknownEnum
{
    Value_39 = 39
}
