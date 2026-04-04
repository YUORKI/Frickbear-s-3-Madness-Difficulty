if (AI == 0)
{
    Frame = 0;
    WaitTime = 999;
}

if (Reset == true)
{
    WaitTime = lerp(38, 18, AI / 20) * random_range(0.75, 1.25);
    Reset = false;
    Frame = 0;
}

var WallOriginX = 1088;
var WallOriginY = 448;
var TorsoX = (WallOriginX - 192) + Frame;
var TorsoY = (WallOriginY - abs(dsin(Frame * 3) * 16)) + 306;
var TorsoA = ((dsin(Frame * 6) * 6) - 15) + (Cur_HeadB / 2);
var FrontArmX = TorsoX + rot_x(-17, -70, TorsoA);
var FrontArmY = TorsoY + rot_y(-17, -70, TorsoA);
var FrontArmA = (dsin((Frame * 6) - 30) * 4) + 15;
var BackArmX = TorsoX + rot_x(67, -75, TorsoA);
var BackArmY = TorsoY + rot_y(67, -75, TorsoA);
var BackArmA = dsin((Frame * 6) - 90) * 8;
var HeadX = TorsoX + rot_x(46, -94 + Cur_HeadB, TorsoA);
var HeadY = TorsoY + rot_y(46, -94 + Cur_HeadB, TorsoA);
var HeadA = (dsin((Frame * 6) - 45) * 8) + (Cur_HeadB / 4);

if (Frame == (300 - (AI * 2)) || Frame == (430 + (AI * 2)))
{
    if (HeadTurned)
    {
        CurSpeed_HeadB = 6;
        audio_play_sound(sfxServo, 10, false, 0.5);
    }
    else
    {
        CurSpeed_HeadB = -6;
        audio_play_sound(sfxEndoCreak, 10, false, 0.5);
    }
    
    HeadTurning = true;
}

if (HeadTurning)
{
    if (CurSpeed_HeadB > 0 && !HeadTurned)
    {
        HeadTurned = true;
        HeadTurning = false;
    }
    
    if (CurSpeed_HeadB < 0 && HeadTurned)
    {
        HeadTurned = false;
        HeadTurning = false;
    }
}

CurSpeed_HeadB = lerp(CurSpeed_HeadB, (0 - Cur_HeadB) * 0.95, 0.1);
Cur_HeadB += CurSpeed_HeadB;

if (HeadTurned && !global.MaskDown)
    KillTimer += (1/30);

if (KillTimer > 1)
    jumpscare(UnknownEnum.Value_53, 0);

if (!HeadTurned)
    KillTimer = 0;

if ((Frame % 60) == 45)
    audio_play_sound(sfxMetalFootstep, 10, false, 0.5);

if (WaitTime <= 0)
    Frame++;

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = -1 * HeadA;
    image_index = other.HeadTurned;
    DrawDepth = 4;
}

with (Arm)
{
    x = clamp(FrontArmX, 1050, 1750);
    y = FrontArmY;
    image_angle = -1 * FrontArmA;
    DrawDepth = 3;
}

with (Torso)
{
    x = clamp(TorsoX, 1050, 1800);
    y = TorsoY;
    image_angle = -1 * TorsoA;
    DrawDepth = 2;
}

with (Cupcake)
{
    x = clamp(BackArmX, 0, 1580);
    y = BackArmY;
    image_angle = -1 * BackArmA;
    DrawDepth = 1;
}

if (Frame > 680)
    Reset = true;

if (!Frozen)
    WaitTime -= 0.016666666666666666;

enum UnknownEnum
{
    Value_53 = 53
}
