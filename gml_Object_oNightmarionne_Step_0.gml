var ID = UnknownEnum.Value_24;
var AI = global.AILevels[ID];
var BodyY = (dcos(SwingTimer * 4) * -512) / (1 + (SwingTimer / 5));
var HeadY = (dcos((SwingTimer - 5) * 4) * -32) / (1 + ((SwingTimer - 5) / 5));
var BounceOffset = (dsin(BounceFrame) * 20) / ((floor(BounceFrame / 90) * 2) + 1);
HeadY += BounceOffset;

if (BounceFrame == 90)
{
    HeadState = 0;
    simple_sound(sfxWindowScare, 400 * Side, 0, false, 1);
    audio_sound_gain(sfxNightmarionneGarble, 0.25, 500);
    simple_sound(sfxNightmarionneGarble, 400 * Side, 0, true, 1);
}

if (Mode == "Descend")
    Height = BodyY;

ArmSquish = 15 + (60 * Aggro);
Angle = (dsin(SwingTimer) * 5) + (Aggro * Aggro * random_range(-3, 3));
var AngleB = dsin(SwingTimer - (10 * ReturnDegree)) * 10;
var AngleC = dsin(SwingTimer - (20 * ReturnDegree)) * 20;
var FaceSprite = HeadState;

if (Aggro > 0)
    FaceSprite = 2;

var ArmAngleA = ArmSquish;
TorsoCoords = [1344 + (512 * Side), 448 + Height, Angle];
HeadCoords = [TorsoCoords[0] + rot_x(0, 246 + HeadY, Angle), TorsoCoords[1] + rot_y(0, 246 + HeadY, Angle), (AngleB * -0.5) + (Aggro * random_range(-2, 2))];
ArmRCoords = [TorsoCoords[0] + rot_x(56, 196, Angle), TorsoCoords[1] + rot_y(56, 196, Angle), ArmAngleA + AngleB];
HandRCoords = [ArmRCoords[0] + rot_x(-6, 116, ArmAngleA + AngleB), ArmRCoords[1] + rot_y(-6, 116, ArmAngleA + AngleB), (ArmSquish * -0.25) + AngleC];
ArmLCoords = [TorsoCoords[0] + rot_x(-56, 196, Angle), TorsoCoords[1] + rot_y(-56, 196, Angle), (ArmAngleA * -1) + AngleB];
HandLCoords = [ArmLCoords[0] + rot_x(6, 116, (ArmAngleA * -1) + AngleB), ArmLCoords[1] + rot_y(6, 116, (ArmAngleA * -1) + AngleB), (ArmSquish * 0.25) + AngleC];
LookedAt = abs(o3DMouse.x - (1344 + (512 * Side))) < 360 && !HeadState && !global.CamUp;
var WaitTime = (45 - (AI * 1.5)) * RandomValue * 60;

if (Mode == "Descend")
{
    SwingTimer += (2 * (1 + (Aggro * 3)));
    
    if (Timer == 60)
        BounceFrame = 0;
    
    if (LookedAt)
        audio_sound_gain(sfxNightmarionneGarble, 1, 0);
    else
        audio_sound_gain(sfxNightmarionneGarble, 0.25, 0);
    
    if (Timer > (60 * lerp(4, 8, AI / 20)))
    {
        Mode = "Return";
        Timer = 0;
        audio_sound_gain(sfxNightmarionneGarble, 0, 500);
    }
    
    if (Aggro > 1)
        jumpscare(ID, Side);
}
else if (Mode == "Return")
{
    SwingTimer += ((900 - ((SwingTimer % 180) + 900)) / 10);
    ReturnDegree += ((0 - ReturnDegree) / 10);
    Height = dcos(Timer * 4) * 512 * (Timer / 30);
    Aggro -= (Aggro / 10);
    
    if (Height <= -512)
    {
        Mode = "Idle";
        Timer = 0;
        SwingTimer = 0;
        RandomValue = random_range(0.8, 1.2);
        Side *= -1;
        instance_destroy(Head);
        instance_destroy(Torso);
        instance_destroy(ArmL);
        instance_destroy(ArmR);
        instance_destroy(HandL);
        instance_destroy(HandR);
        Head = undefined;
    }
}

if (Mode == "Idle")
{
    Height = -600;
    audio_stop_sound(sfxNightmarionneGarble);
    
    if (Timer > WaitTime)
    {
        ArmSquish = 20;
        SwingTimer = 0;
        BounceFrame = 900;
        HeadState = 1;
        Timer = 0;
        Mode = "Descend";
        ReturnDegree = 1;
        Aggro = 0;
        Height = -512;
        simple_sound(sfxNightmarionneAppear, 400 * Side, 0, false, 0.6);
        Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Torso = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        ArmL = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        ArmR = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        HandL = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        HandR = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
    }
}

if (LookedAt)
    Aggro += (0.016666666666666666 / lerp(2.5, 1.25, AI / 20));

BounceFrame = min(BounceFrame + 15, 900);

if (AI > 0)
    Timer += 1;

enum UnknownEnum
{
    Value_24 = 24
}
