var AI = global.AILevels[ID];

if (AI == 0)
    Frame = 0;

if (AI == 21)
{
    Mode = "InOffice";
    Frame = 90;
}

WaitTime = lerp(25, 5, AI / 20) * 60 * (RandomValue / MoveSpeed);

if (Mode == "Vents")
{
    if (ID == UnknownEnum.Value_33 && (VentX == global.AudioLureX && VentY == global.AudioLureY))
        WaitTime = 0;
    
    if (global.Heater)
    {
        Frame--;
        HeaterHP -= ((HeaterSpeed / 60) * lerp(1.5, 0.75, AI / 20));
        
        if (HeaterHP <= 0 && VentY > -1)
        {
            HeaterHP = 1;
            VentY--;
            audio_play_sound(sfxBitCrunch, 5, false);
        }
    }
    else
    {
        HeaterHP = 1;
    }
    
    MaskTime = 0;
    
    if (Frame > WaitTime)
    {
        if (ID == UnknownEnum.Value_33)
        {
            var CanMoveLeft = VentX != -2 && !((VentX - 1) == global.AudioLureX && VentY == global.AudioLureY);
            var CanMoveRight = VentX != 2 && !((VentX + 1) == global.AudioLureX && VentY == global.AudioLureY);
            var CanMoveDown = (VentY != 1 || abs(VentX) == 1) && !(VentX == global.AudioLureX && (VentY + 1) == global.AudioLureY);
            var CanMoveUp = VentY != -1 && !(VentX == global.AudioLureX && (VentY - 1) == global.AudioLureY);
            var ChosenDirection = [0, -1];
            var DistToLure = -1;
            point_distance(VentX, VentY, global.AudioLureX, global.AudioLureY);
            
            if (CanMoveDown)
                ChosenDirection = [0, 1];
            
            if (!(CanMoveDown && abs(VentX) == 1 && VentY == 1))
            {
                var DirectionPriority = -1;
                
                if (VentX != 0)
                    DirectionPriority = 0 - sign(VentX);
                
                var TestDist = point_distance(VentX + 1, VentY, global.AudioLureX, global.AudioLureY);
                
                if ((TestDist > DistToLure || (TestDist == DistToLure && DirectionPriority == 1)) && CanMoveRight)
                {
                    ChosenDirection = [1, 0];
                    DistToLure = TestDist;
                }
                
                TestDist = point_distance(VentX - 1, VentY, global.AudioLureX, global.AudioLureY);
                
                if ((TestDist > DistToLure || (TestDist == DistToLure && DirectionPriority == -1)) && CanMoveLeft)
                {
                    ChosenDirection = [-1, 0];
                    DistToLure = TestDist;
                }
                
                TestDist = point_distance(VentX, VentY + 1, global.AudioLureX, global.AudioLureY);
                
                if (!(abs(VentX) == 2))
                    TestDist += 1;
                
                if (TestDist >= DistToLure && CanMoveDown)
                {
                    ChosenDirection = [0, 1];
                    DistToLure = TestDist;
                }
            }
            
            if (VentX == global.AudioLureX && VentY == global.AudioLureY)
            {
                var WayToMove = [];
                
                if (CanMoveLeft)
                    array_push(WayToMove, [-1, 0]);
                
                if (CanMoveRight)
                    array_push(WayToMove, [1, 0]);
                
                if (CanMoveUp)
                    array_push(WayToMove, [0, -1]);
                
                if (CanMoveDown)
                    array_push(WayToMove, [0, 1]);
                
                WayToMove = WayToMove[irandom_range(0, array_length(WayToMove) - 1)];
                ChosenDirection[0] = WayToMove[0];
                ChosenDirection[1] = WayToMove[1];
            }
            
            VentX += ChosenDirection[0];
            VentY += ChosenDirection[1];
        }
        else
        {
            if (abs(XTarget) == 1)
                CheckOccupiedVents();
            
            var GullibilityRoll = random_range(0, 1);
            
            if (point_distance(VentX, VentY, global.AudioLureX, global.AudioLureY) <= 1 && GullibilityRoll <= LureChance)
            {
                VentX = global.AudioLureX;
                VentY = global.AudioLureY;
                DecideTarget();
            }
            else if (VentX == XTarget)
            {
                VentY += 1;
                DecideTarget();
            }
            else
            {
                VentX += sign(XTarget - VentX);
            }
        }
        
        if (VentY >= 2)
        {
            Mode = "Office";
            FaceSide = VentX;
        }
        
        Frame = 0;
        RandomValue = random_range(0.75, 1.1);
        VentSound(0.1);
    }
    
    EyeDegree += ((0 - EyeDegree) / 15);
}
else if (Mode == "Office")
{
    if (Frame == 1)
    {
        MaskTime = 100;
        VentSound(1);
        var EntryLine = EnterSound[irandom(array_length(EnterSound) - 1)];
        
        if (ID == UnknownEnum.Value_12 && irandom(1000) == 1 && !array_contains(global.UnlockFlags, "BigButtFlag"))
        {
            EntryLine = voc_WitheredChica_BigButt;
            array_push(global.UnlockFlags, "BigButtFlag");
        }
        
        reverb_sound(EntryLine, 200 * VentX, -200, false, 1);
    }
    
    if (Frame > (360 + (WaitTime / 5)))
    {
        if (ID == UnknownEnum.Value_14)
        {
            var BBKillChance = 1;
            
            if (numbered_night())
                BBKillChance = global.Night * global.Night;
            
            if (irandom(99) < BBKillChance || nonlethal_characters_only() || global.Difficulty == 3)
            {
                jumpscare(ID, sign(VentX));
            }
            else
            {
                Frame = 0;
                Mode = "InOffice";
                reverb_sound(voc_BB_Laugh3, 12, -16, false, 1);
            }
        }
        else if (ID == UnknownEnum.Value_15)
        {
            Frame = 0;
            Mode = "InOffice";
            reverb_sound(voc_JJ_Oopsies, 12, -16, false, 1);
        }
        else if (ID == UnknownEnum.Value_32)
        {
            Frame = 0;
            Mode = "InOffice";
            HippoSound = reverb_sound(choose(voc_MrHippo_Ramble_Magic, voc_MrHippo_Ramble_Toys, voc_MrHippo_Ramble_VideoGames, voc_MrHippo_Ramble_Monty), 500, 0, false, 3, 0.75, 0.1, 2);
        }
        else
        {
            jumpscare(ID, sign(VentX));
        }
    }
    
    if ((wearing_mask() && Frame > 60) && ID != UnknownEnum.Value_33)
    {
        MaskTime -= 1;
        Frame -= 1;
    }
    else
    {
        MaskTime += 0.25;
    }
    
    if (MaskTime <= 0)
    {
        Frame = 0;
        Mode = "Vents";
        VentSound(1);
        var LeaveClip = LeaveSound[irandom(array_length(LeaveSound) - 1)];
        
        if (!SaidGlassesLine && irandom(3) == 1 && array_length(GlassesLines) > 0 && array_contains(global.Upgrades, UnknownEnum.Value_37))
        {
            LeaveClip = GlassesLines[irandom(array_length(GlassesLines) - 1)];
            SaidGlassesLine = true;
        }
        
        reverb_sound(LeaveClip, 200 * VentX, -200, false, 1);
        VentX = irandom_range(-2, 2);
        VentY = -1;
        block_tokens();
    }
    
    EyeDegree += ((1 - EyeDegree) / 15);
}
else if (Mode == "InOffice")
{
    if (ID == UnknownEnum.Value_14 || ID == UnknownEnum.Value_15)
    {
        if (ID == UnknownEnum.Value_14)
            disable_flashlight(0.016666666666666666);
        else if (!instance_exists(oLaserDoor))
            disable_doors(0.016666666666666666);
        
        if (Frame >= 1800)
        {
            if (ID == UnknownEnum.Value_14)
                reverb_sound(voc_BB_Laugh2, 12, -16, false, 1);
            else
                reverb_sound(voc_JJ_ByeBye1, 12, -16, false, 1);
            
            Frame = 0;
            Mode = "Vents";
            VentX = irandom_range(-2, 2);
            VentY = -1;
        }
    }
    
    if (ID == UnknownEnum.Value_32)
    {
        if (!audio_is_playing(HippoSound))
        {
            Frame = 0;
            Mode = "Vents";
            VentX = irandom_range(-2, 2);
            VentY = -1;
        }
        
        if (Funny == 1)
        {
            Funny = 2;
            audio_sound_gain(HippoSound, 0, 0);
            reverb_sound(voc_MrHippo_FakeDeathcoin, 0, 0, false, 1.75, 1, 0.1);
            audio_pause_sound(HippoSound);
        }
        else if (Funny == 2 && !audio_is_playing(voc_MrHippo_FakeDeathcoin))
        {
            Funny = 0;
            audio_resume_sound(HippoSound);
            audio_sound_gain(HippoSound, 1, 1000);
        }
    }
    
    EyeDegree += ((0 - EyeDegree) / 15);
}

Frame += 1;

with (Eyes)
{
    switch (other.ID)
    {
        case UnknownEnum.Value_7:
            image_index = 0;
            break;
        
        case UnknownEnum.Value_12:
            image_index = 1;
            break;
        
        case UnknownEnum.Value_14:
            image_index = 2;
            break;
        
        case UnknownEnum.Value_15:
            image_index = 3;
            break;
        
        case UnknownEnum.Value_32:
            image_index = 4;
            break;
        
        case UnknownEnum.Value_33:
            image_index = 5;
            break;
    }
    
    image_alpha = other.EyeDegree;
    image_xscale = sign(other.FaceSide);
    x = 1344 + ((340 - (16 * other.EyeDegree)) * sign(other.FaceSide));
    y = 516 - (4 * other.EyeDegree);
}

enum UnknownEnum
{
    Value_7 = 7,
    Value_12 = 12,
    Value_14 = 14,
    Value_15,
    Value_32 = 32,
    Value_33,
    Value_37 = 37
}
