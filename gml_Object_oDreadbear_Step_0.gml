var ID = UnknownEnum.Value_38;
var AI = global.AILevels[ID];

if (AI <= 0)
{
    Mode = "Reset";
    Frame = 0;
}

switch (Mode)
{
    case "Reset":
        Patience = round((750 / (AI + 10)) * random_range(0.75, 1.25));
        Mode = "Wait";
    
    case "Wait":
        lHand.sprite_index = sNOTHING;
        lHand.DrawDepth = 5;
        rHand.sprite_index = sNOTHING;
        rHand.DrawDepth = 5;
        lLArm.sprite_index = sNOTHING;
        lLArm.DrawDepth = 4;
        rLArm.sprite_index = sNOTHING;
        rLArm.DrawDepth = 4;
        lUArm.sprite_index = sNOTHING;
        lUArm.DrawDepth = 3;
        rUArm.sprite_index = sNOTHING;
        rUArm.DrawDepth = 3;
        head.sprite_index = sNOTHING;
        head.DrawDepth = 2;
        jaw.sprite_index = sNOTHING;
        jaw.DrawDepth = 1;
        brow.sprite_index = sNOTHING;
        brow.DrawDepth = 3;
        torso.sprite_index = sNOTHING;
        torso.DrawDepth = 0;
        TorsoX = x;
        TorsoY = y + 96;
        LHandX = x + 32;
        LHandY = y + 96;
        RHandX = x - 32;
        RHandY = y + 96;
        Frame = 0;
        
        if (Patience <= 0)
        {
            var CanRise = true;
            
            if (instance_exists(oWitheredFoxy))
            {
                if (!(oWitheredFoxy.Mode == "Wait" || oWitheredFoxy.Mode == "Reset"))
                    CanRise = false;
            }
            
            if (instance_exists(oEndoskeleton))
            {
                if (oEndoskeleton.Mode != "Down")
                    CanRise = false;
            }
            
            if (CanRise)
            {
                Mode = "Rise";
                simple_sound(sfxEndoCreak, 0, -200, false, 0.5);
                DesiredCandy = irandom(1);
                
                if (character_active(UnknownEnum.Value_24))
                {
                    if (DesiredCandy == sign_to_binary(oNightmarionne.Side))
                        DesiredCandy = !DesiredCandy;
                }
                
                Patience = 10 - (AI / 4);
            }
            else
            {
                Patience = 0;
            }
        }
        
        Patience -= 0.016666666666666666;
        break;
    
    case "Rise":
        lHand.sprite_index = sDreadbearHand;
        rHand.sprite_index = sDreadbearHand;
        lLArm.sprite_index = sDreadbearArmLower;
        rLArm.sprite_index = sDreadbearArmLower;
        lUArm.sprite_index = sDreadbearArmUpper;
        rUArm.sprite_index = sDreadbearArmUpper;
        torso.sprite_index = sDreadbearTorso;
        LHandY += ((CenterY - 48 - LHandY) / 5);
        RHandY += ((CenterY - 48 - RHandY) / 5);
        LHandX += (((x + 120) - LHandX) / 5);
        RHandX += ((x - 120 - RHandX) / 5);
        lHand.image_index = 0;
        rHand.image_index = 0;
        
        if (round((CenterY - 48 - LHandY) / 4) == 0)
        {
            Mode = "Slam";
            simple_sound(sfxMetalSlam, 50, -200, false);
        }
        
        break;
    
    case "Slam":
        LHandY -= ((CenterY - 50 - LHandY) / 3);
        RHandY -= ((CenterY - 50 - RHandY) / 3);
        lHand.image_index = 0;
        rHand.image_index = 0;
        
        if (LHandY > CenterY)
            Mode = "Clench";
        
        break;
    
    case "Clench":
        LHandY += (((CenterY + 8) - LHandY) / 10);
        RHandY += (((CenterY + 8) - RHandY) / 10);
        lHand.image_index = 1;
        rHand.image_index = 1;
        
        if (round(((CenterY + 8) - LHandY) / 2) == 0)
        {
            Mode = "Hoist";
            audio_play_sound(sfxWindowScare, 5, false, 1);
            var PopupLines = [voc_Dreadbear_Candy1, voc_Dreadbear_Candy2, voc_Dreadbear_FeedMe, voc_Dreadbear_Growl, voc_Dreadbear_TrickOrTreat];
            CurrentClip = PopupLines[irandom(4)];
            reverb_sound(CurrentClip, 0, -200, false, 1);
        }
        
        break;
    
    case "Hoist":
        TorsoY += ((((CenterY - 32) + (dsin(Frame * 4) * 4)) - TorsoY) / 10);
        TorsoX += (((CenterX + (dcos(Frame * 2) * 8)) - TorsoX) / 10);
        
        if (instance_exists(oDreadbearCandy))
        {
            var JawLength = 12 * clamp(200 / (1 + point_distance(CenterX, CenterY, o3DMouse.x, o3DMouse.y)), 0, 2);
            JawOffset += ((JawLength - JawOffset) / 5);
            BrowOffset += ((-4 - BrowOffset) / 5);
        }
        else
        {
            JawOffset += (((4 + (dsin(Frame * 4) * 4)) - JawOffset) / 5);
            BrowOffset -= (BrowOffset / 5);
        }
        
        Patience -= 0.016666666666666666;
        lHand.image_index = 1;
        rHand.image_index = 1;
        
        if (Patience <= 0)
            Mode = "Fall1";
        
        break;
    
    case "Fall1":
        TorsoX += ((CenterX - TorsoX) / 2);
        TorsoY += (((CenterY + 8) - TorsoY) / 2);
        JawOffset -= (JawOffset / 5);
        BrowOffset -= (BrowOffset / 5);
        lHand.image_index = 1;
        rHand.image_index = 1;
        
        if (round(((CenterY + 8) - TorsoY) * 4) == 0)
            Mode = "Fall2";
        
        break;
    
    case "Fall2":
        TorsoX += ((CenterX - TorsoX) / 3);
        TorsoY += ((CenterY - 64 - TorsoY) / 3);
        lHand.image_index = 1;
        rHand.image_index = 1;
        JawOffset -= (JawOffset / 5);
        
        if (round((CenterY - 64 - TorsoY) / 3) == 0)
            Mode = "Fall3";
        
        break;
    
    case "Fall3":
        TorsoY -= ((CenterY - 66 - TorsoY) / 5);
        lHand.image_index = 0;
        rHand.image_index = 0;
        
        if (TorsoY > CenterY)
        {
            LHandY -= ((CenterY - 40 - LHandY) / 5);
            RHandY -= ((CenterY - 40 - RHandY) / 5);
        }
        else
        {
            LHandY += ((CenterY - 32 - LHandY) / 5);
            RHandY += ((CenterY - 32 - RHandY) / 5);
        }
        
        if (TorsoY > (CenterY + 128))
            Mode = "Fall4";
        
        break;
    
    case "Fall4":
        lHand.image_index = 0;
        rHand.image_index = 0;
        LHandY -= ((CenterY - 40 - LHandY) / 5);
        RHandY -= ((CenterY - 40 - RHandY) / 5);
        
        if (LHandY > (CenterY + 128))
        {
            if (Patience <= 0)
            {
                jumpscare(ID, 0);
                exit;
            }
            else
            {
                Mode = "Reset";
            }
        }
        
        break;
}

if (Mode == "Hoist")
{
    head.sprite_index = sDreadbearHead;
    jaw.sprite_index = sDreadbearHead;
    brow.sprite_index = sDreadbearHead;
}

if (Mode == "Hoist")
    BubbleSize += ((1 - BubbleSize) / 10);
else
    BubbleSize -= (BubbleSize / 10);

if (AI <= 0 || Mode == "Reset" || Mode == "Wait")
    exit;

torso.x = TorsoX;
torso.y = TorsoY;
torso.image_angle = (CenterX - TorsoX) / 4;
head.x = TorsoX;
head.y = TorsoY + (JawOffset / -4);
head.image_angle = round(random_range(-1, 1));
head.image_index = 0;
jaw.x = head.x;
jaw.y = head.y + JawOffset;
jaw.image_angle = head.image_angle;
jaw.image_index = 1;
brow.x = head.x;
brow.y = head.y + BrowOffset;
brow.image_angle = head.image_angle;
brow.image_index = 2;
var Inverse = (TorsoY + rot_y(96, -1, torso.image_angle)) <= LHandY;
var results = CalculateInverseKinematics(TorsoX + rot_x(96, -1, torso.image_angle), TorsoY + rot_y(96, -1, torso.image_angle), 79, 79, TorsoX + rot_x(96, -1, torso.image_angle), LHandY, Inverse);
lUArm.image_angle = results[0] * -1;
lUArm.x = TorsoX + 96;
lUArm.y = TorsoY - 1;
lUArm.image_index = 0;
lLArm.x = results[1];
lLArm.y = results[2];
lLArm.image_angle = results[3] * -1;
lHand.x = results[4];
lHand.y = results[5];
Inverse = (TorsoY + rot_y(-96, -1, torso.image_angle)) <= RHandY;
results = CalculateInverseKinematics(TorsoX + rot_x(-96, -1, torso.image_angle), TorsoY + rot_y(-96, -1, torso.image_angle), 79, 79, TorsoX + rot_x(-96, -1, torso.image_angle), RHandY, !Inverse);
rUArm.image_angle = results[0] * -1;
rUArm.x = TorsoX - 96;
rUArm.y = TorsoY - 1;
rUArm.image_index = 1;
rLArm.x = results[1];
rLArm.y = results[2];
rLArm.image_angle = results[3] * -1;
rHand.x = results[4];
rHand.y = results[5];
rHand.image_xscale = -1;
Frame += 2;

enum UnknownEnum
{
    Value_24 = 24,
    Value_38 = 38
}
