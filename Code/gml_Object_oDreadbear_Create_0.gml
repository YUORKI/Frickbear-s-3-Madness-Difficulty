function CalculateInverseKinematics(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var lengthX = arg4 - arg0;
    var lengthY = arg1 - arg5;
    var lengthTrue = sqrt(sqr(lengthX) + sqr(lengthY));
    var fstRot = 0;
    var fstX = 0;
    var fstY = 0;
    var sndRot = 0;
    var sndX = 0;
    var sndY = 0;
    var ang = darccos(lengthX / lengthTrue) * sign(lengthY);
    
    if (lengthTrue < (arg2 - arg3))
    {
        lengthX = dcos(ang) * (arg2 - arg3);
        lengthY = dsin(ang) * (arg2 - arg3);
    }
    
    if (lengthTrue > (arg2 + arg3))
    {
        fstRot = ang;
    }
    else
    {
        sndRot = darccos(((sqr(lengthX) + sqr(lengthY)) - sqr(arg2) - sqr(arg3)) / (2 * arg2 * arg3));
        fstRot = darctan2(lengthY, lengthX) - ((1 - (2 * arg6)) * darctan2(arg3 * dsin(sndRot), arg2 + (arg3 * dcos(sndRot))));
    }
    
    sndRot = fstRot + ((1 - (2 * arg6)) * sndRot);
    fstX = arg0 + (dcos(fstRot) * arg2);
    fstY = arg1 - (dsin(fstRot) * arg2);
    sndX = fstX + (dcos(sndRot) * arg3);
    sndY = fstY - (dsin(sndRot) * arg3);
    
    if (fstRot < 0)
        fstRot = 360 + fstRot;
    
    if (sndRot < 0)
        sndRot = 360 + sndRot;
    
    return [fstRot, fstX, fstY, sndRot, sndX, sndY];
}

lHand = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
lHand.sprite_index = sDreadbearHand;
rHand = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
rHand.sprite_index = sDreadbearHand;
lLArm = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
lLArm.sprite_index = sDreadbearArmLower;
rLArm = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
rLArm.sprite_index = sDreadbearArmLower;
rLArm.image_yscale = -1;
lUArm = instance_create_layer(x + 96, y, "Behind_Wall", oOfficeSprite);
lUArm.sprite_index = sDreadbearArmUpper;
rUArm = instance_create_layer(x - 96, y, "Behind_Wall", oOfficeSprite);
rUArm.sprite_index = sDreadbearArmUpper;
rUArm.image_yscale = -1;
brow = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
brow.sprite_index = sNOTHING;
head = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
head.sprite_index = sNOTHING;
jaw = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
jaw.sprite_index = sNOTHING;
torso = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
torso.sprite_index = sDreadbearTorso;

if (!instance_exists(oCandyBowl))
{
    instance_create_layer(643, 671, "OnWall", oCandyBowl);
    instance_create_layer(2034, 704, "OnWall", oCandyBowl);
}

CenterX = 1344;
CenterY = 704;
x = CenterX;
y = CenterY;
TorsoX = x;
TorsoY = y + 96;
LHandX = x + 32;
LHandY = y + 96;
RHandX = x - 32;
RHandY = y + 96;
JawOffset = 0;
BrowOffset = 0;
BubbleSize = 0;
DesiredCandy = 0;
Frame = 0;
Mode = "Reset";
Patience = 10;
CurrentClip = sfxNOTHING;

function eat_candy()
{
    if (DesiredCandy == oDreadbearCandy.Color)
    {
        simple_sound(sfxEat, 0, -200, false, 1);
        Mode = "Fall1";
        JawOffset = -4;
        audio_stop_sound(CurrentClip);
        var PopupLines = [voc_Dreadbear_Om, voc_Dreadbear_OmNomNom, voc_Dreadbear_Tasty, voc_Dreadbear_ThankYou, voc_Dreadbear_Yummy];
        CurrentClip = PopupLines[irandom(4)];
        reverb_sound(CurrentClip, 0, -200, false, 1);
        block_tokens();
    }
    else
    {
        jumpscare(UnknownEnum.Value_38, 0);
    }
}

enum UnknownEnum
{
    Value_38 = 38
}
