var ID = UnknownEnum.Value_4;
var AI = global.AILevels[ID];

if (global.CamUp && Mode == "WaitForCam")
    Mode = "Wait";

if (!global.CamUp && Mode == "Wait")
{
    var CanEnter = true;
    
    if (instance_exists(oShadowFreddy))
    {
        if (oShadowFreddy.InOffice)
            CanEnter = false;
    }
    
    if (instance_exists(oTwistedWolf))
    {
        if (oTwistedWolf.WaitToAttack || oTwistedWolf.InOffice)
            CanEnter = false;
    }
    
    if (irandom_range(1, 20) <= AI && CanEnter)
    {
        FredSuit = instance_create_layer(1120, 448, "InFrontOf_Wall", oOfficeSprite);
        
        with (FredSuit)
            DrawDepth = 35;
        
        audio_play_sound(sfxGoldenFreddyGiggle, 15, false);
        Timer = 2;
        Mode = "Active";
    }
    else
    {
        Mode = "WaitForCam";
    }
}
else if (Mode == "Active")
{
    if (!instance_exists(oJumpscarePhantoms))
        Timer -= 0.016666666666666666;
    
    if (Timer == 0)
    {
        instance_destroy(FredSuit);
        jumpscare(ID, 0);
    }
    
    if (wearing_mask())
        Mode = "Fadeout";
}
else if (Mode == "Fadeout")
{
    with (FredSuit)
    {
        image_alpha -= (1/30);
        
        if (image_alpha <= 0)
        {
            instance_destroy(self);
            
            with (oGoldenFreddy)
                Mode = "WaitForCam";
        }
    }
}

if (FredSuit != undefined)
{
    with (FredSuit)
        sprite_index = sGoldenFreddy;
}

enum UnknownEnum
{
    Value_4 = 4
}
