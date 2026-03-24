VentX = irandom_range(-2, 2);
VentY = round(random_range(-1, -0.25));
Frame = 0;

function CheckOccupiedVents()
{
    var VentsAvailable = [true, true];
    
    for (var i = 0; i < instance_number(oVentParent); i++)
    {
        var CurrentObj = instance_find(oVentParent, i);
        
        if (CurrentObj.VentY >= 2)
            VentsAvailable[sign_to_binary(CurrentObj.VentX)] = false;
    }
    
    if (!VentsAvailable[sign_to_binary(XTarget)] && VentY == 1)
        XTarget *= -1;
}

function DecideTarget()
{
    XTarget = clamp(VentX + irandom_range(-2, 2), -2, 2);
    
    if (VentY == 1)
    {
        XTarget = sign(VentX);
        
        if (XTarget == 0)
            XTarget = -1 + (irandom_range(0, 1) * 2);
    }
}

DecideTarget();
Mode = "Vents";
MaskTime = 0;
HeaterHP = 1;
RandomValue = random_range(0.75, 1.25);

function VentSound(arg0)
{
    simple_sound(sfxVentRumble, 200 * VentX, (100 * VentY) - 100, false, (VentY * 0.1) + arg0);
}

ID = UnknownEnum.Value_14;
LureChance = 1;
EnterSound = [sfxVentSqueak];
LeaveSound = [sfxVentSqueak2];
GlassesLines = [];
SaidGlassesLine = false;
MoveSpeed = 1;
HeaterSpeed = 1;
OfficeSprite = undefined;
HippoSound = undefined;
FaceSide = 0;
Eyes = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);

with (Eyes)
{
    sprite_index = sVentEyes;
    image_index = 0;
    image_alpha = 0;
    image_xscale = 1;
    x = 1664;
    y = 512;
}

EyeDegree = 0;
Funny = 0;

enum UnknownEnum
{
    Value_14 = 14
}
