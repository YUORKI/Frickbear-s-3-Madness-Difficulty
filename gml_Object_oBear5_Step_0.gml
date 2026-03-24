if (global.CamUp && Mode == "WaitForCam")
    Mode = "Wait";

if (!global.CamUp && Mode == "Wait")
{
    if (irandom_range(1, 1024) == 5)
    {
        FredSuit = instance_create_layer(1120, 448, "InFrontOf_Wall", oOfficeSprite);
        Timer = 5;
        Mode = "Active";
    }
    else
    {
        Mode = "WaitForCam";
    }
}
else if (Mode == "Active")
{
    Timer -= 1;
    
    if (Timer <= 0)
    {
        instance_destroy(FredSuit);
        FredSuit = undefined;
        instance_destroy();
    }
    
    if (global.MaskDown)
        Mode = "Fadeout";
}

if (FredSuit != undefined)
{
    with (FredSuit)
        sprite_index = sBear5;
}
