var ID = UnknownEnum.Value_11;
var AI = 20;
var BaseX = 1344;
var BaseY = 960;

if (AI == 0)
    exit;

var ExposureLimit = lerp(90, 60, global.MicrogameLevel / 2);

if (Mode == "Reset")
{
    Timer = lerp(1, 0, global.MicrogameLevel / 2);
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
        Timer -= (global.MicrogameSpeed / 60);
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
            sprite_index = sWitheredBonnieHead;
        
        with (Arm)
            sprite_index = sWitheredBonnieArm;
        
        with (Torso)
            sprite_index = sWitheredBonnieTorso;
        
        with (Legs)
            sprite_index = sWitheredBonnieLegs;
        
        with (Wires)
            sprite_index = sWitheredBonnieWires;
        
        audio_play_sound(sfxStareStatic, 15, false, 0.5);
        Timer = 4;
    }
}

if (Mode == "Attack")
{
    if (!(wearing_mask() || global.CamUp))
    {
        Exposure += global.MicrogameSpeed;
    }
    else if (!MaskOn)
    {
        MaskOn = true;
        audio_play_sound(sfxBitBoost, 10, false);
        end_microgame();
    }
    
    if (Exposure > ExposureLimit)
        Mode = "Kill";
    
    if (Timer <= 0)
    {
        if (Exposure <= ExposureLimit)
            Mode = "Reset";
        
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
        Timer -= (global.MicrogameSpeed / 60);
    }
    else
    {
        with (oCamera)
            StareFrames++;
    }
}

if (Mode == "Kill")
{
    global.MicrogameWin = false;
    audio_bus_main.effects[0] = undefined;
    audio_stop_sound(sfxStareStatic);
    jumpscare(ID, 0, 0, false);
    end_microgame();
}

enum UnknownEnum
{
    Value_11 = 11
}
