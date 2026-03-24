var WallX = 1088;
var WallY = 448;
x = WallX + 301;
y = WallY + 253 + YOffset;
var WireX = WallX;
var WireY = y + 12;
var TorsoX = x;
var TorsoY = y;
var TorsoA = lerp(0, 5, Percent);
var WireA = point_direction(WireX, WireY, TorsoX, TorsoY);
var HipsX = TorsoX;
var HipsY = TorsoY;
var HipsA = lerp(0, -5, Percent);
var HeadX = TorsoX + rot_x(-29, -30, TorsoA);
var HeadY = TorsoY + rot_y(-29, -30, TorsoA);
var HeadA = lerp(0, 10, Percent + HeadTwitch);
var UpperArmX = TorsoX + rot_x(-34, -23, TorsoA);
var UpperArmY = TorsoY + rot_y(-34, -23, TorsoA);
var UpperArmA = lerp(0, 5, Percent + HeadTwitch);
var LowerArmX = UpperArmX + rot_x(-9, 30, UpperArmA);
var LowerArmY = UpperArmY + rot_y(-9, 30, UpperArmA);
var LowerArmA = lerp(0, 20, Percent + ArmTwitch);

with (Wire)
{
    sprite_index = sBossSalvage_CutsceneVannyWire;
    image_index = 1;
    x = WireX;
    y = WireY;
    image_xscale = other.WireLength;
    image_angle = WireA * -1;
}

with (Torso)
{
    sprite_index = sBossSalvage_CutsceneVannyDies;
    image_index = 2;
    x = TorsoX;
    y = TorsoY;
    image_angle = TorsoA * -1;
}

with (Head)
{
    sprite_index = sBossSalvage_CutsceneVannyDies;
    image_index = other.Stabbed;
    x = HeadX;
    y = HeadY;
    image_angle = HeadA * -1;
}

with (Hips)
{
    sprite_index = sBossSalvage_CutsceneVannyDies;
    image_index = 3;
    x = HipsX;
    y = HipsY;
    image_angle = HipsA * -1;
}

with (UpperArm)
{
    sprite_index = sBossSalvage_CutsceneVannyDies;
    image_index = 4;
    x = UpperArmX;
    y = UpperArmY;
    image_angle = UpperArmA * -1;
}

with (LowerArm)
{
    sprite_index = sBossSalvage_CutsceneVannyDies;
    image_index = 5;
    x = LowerArmX;
    y = LowerArmY;
    image_angle = LowerArmA * -1;
}

if (Stabbed)
{
    if (Falling)
    {
        YSpeed += 0.75;
        
        if (YOffset > 128)
            YSpeed = 0;
    }
    else
    {
        YSpeed = lerp(PercentSpeed, (0.5 - YOffset) * 0.2, 0.2);
    }
    
    YOffset += YSpeed;
    
    if (Retreating)
        PercentSpeed = lerp(PercentSpeed, (0.5 - Percent) * 0.2, 0.1);
    else
        PercentSpeed = lerp(PercentSpeed, (0.5 - Percent) * 0.33, 0.25);
    
    Percent += PercentSpeed;
    ArmTwitchSpeed = lerp(ArmTwitchSpeed, (0 - ArmTwitch) * 0.2, 0.25);
    ArmTwitch += ArmTwitchSpeed;
    HeadTwitchSpeed = lerp(HeadTwitchSpeed, (0 - HeadTwitch) * 0.2, 0.25);
    HeadTwitch += HeadTwitchSpeed;
    Frame++;
}

if (Retreating)
{
    WireLength -= (WireLength / 2);
    
    if (WireLength <= 19 && !Falling)
    {
        Falling = true;
        PercentSpeed = -1;
        YSpeed = -1;
        audio_play_sound(sfxGore, 5, false);
    }
}
else
{
    WireLength += ((40 - WireLength) / 8);
    
    if (WireLength >= 19 && !Stabbed)
    {
        PercentSpeed = 2;
        Frame = 0;
        YSpeed = 2;
        Stabbed = true;
        audio_play_sound(sfxScoop, 10, false);
        audio_play_sound(sfxGore, 5, false);
        
        with (oCamera)
            audio_play_sound(mus_BossSalvage_Opening, 10, false);
    }
}

if (Frame == 30)
    HeadTwitchSpeed = -0.25;

if (Frame == 40)
    ArmTwitchSpeed = -0.25;

if (Frame == 140)
    audio_play_sound(sfxSwoosh, 5, false);

if (Frame == 150)
{
    Retreating = true;
    YSpeed = 1;
}

if (Frame == 180)
    instance_create_depth(0, 0, depth - 1, oSalvageOpener_Salvage);

if (Frame >= 300)
    instance_destroy();
