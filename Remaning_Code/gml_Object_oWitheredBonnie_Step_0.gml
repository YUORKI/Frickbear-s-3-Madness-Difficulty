var ID = UnknownEnum.Value_11;
var AI = global.AILevels[ID];
var BaseX = 1344;
var BaseY = 960;

if (AI == 0)
    exit;

var ExposureLimit = lerp(120, 60, AI / 20);

if (Mode == "Reset")
{
    Timer = (1800 / (AI + 10)) * random_range(0.8, 1.2);
    Mode = "Waiting";
    Exposure = 0;
}

if (Mode == "Waiting")
{
    var CanEnter = true;
    
    if (instance_exists(oShadowFreddy))
    {
        if (oShadowFreddy.InOffice)
            CanEnter = false;
    }
    
    if (Timer > 0)
    {
        Timer -= 0.016666666666666666;
    }
    else if (!global.CamUp && CanEnter)
    {
        Mode = "Attack";
        
        with (oCamera)
            StareFrames = 240;
        
        disable_camera(1);
        Head = instance_create_layer(BaseX, BaseY, "InFrontOf_Wall", oOfficeSprite);
        Torso = instance_create_layer(BaseX, BaseY, "InFrontOf_Wall", oOfficeSprite);
        Arm = instance_create_layer(BaseX, BaseY, "InFrontOf_Wall", oOfficeSprite);
        Legs = instance_create_layer(BaseX, BaseY, "InFrontOf_Wall", oOfficeSprite);
        Wires = instance_create_layer(BaseX, BaseY, "InFrontOf_Wall", oOfficeSprite);
        
        with (Head)
        {
            sprite_index = sWitheredBonnieHead;
            DrawDepth = 32;
        }
        
        with (Arm)
        {
            sprite_index = sWitheredBonnieArm;
            DrawDepth = 30;
        }
        
        with (Torso)
        {
            sprite_index = sWitheredBonnieTorso;
            DrawDepth = 31;
        }
        
        with (Legs)
        {
            sprite_index = sWitheredBonnieLegs;
            DrawDepth = 30;
        }
        
        with (Wires)
        {
            sprite_index = sWitheredBonnieWires;
            DrawDepth = 30;
        }
        
        audio_play_sound(sfxStareStatic, 15, false, 0.5);
        Timer = 4;
    }
}

if (Mode == "Attack")
{
    if (!(wearing_mask() || global.CamUp))
        Exposure++;
    
    if (Timer <= 0)
    {
        if (Exposure > ExposureLimit)
        {
            Mode = "Kill";
        }
        else
        {
            Mode = "Reset";
            block_tokens();
        }
        
        with (Head)
            instance_destroy();
        
        with (Arm)
            instance_destroy();
        
        with (Torso)
            instance_destroy();
        
        with (Legs)
            instance_destroy();
        
        with (Wires)
            instance_destroy();
    }
    
    if (!global.CamUp)
    {
        Timer -= 0.016666666666666666;
    }
    else
    {
        with (oCamera)
            StareFrames++;
    }
    
    disable_camera(1/30);
}

if (Mode == "Kill")
{
    if (!wearing_mask())
        jumpscare(ID, 0);
}

enum UnknownEnum
{
    Value_11 = 11
}
