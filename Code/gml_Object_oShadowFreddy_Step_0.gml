var ID = UnknownEnum.Value_17;
var AI = global.AILevels[ID];

if (AI == 0)
    exit;

var PoweroutDuration = 10 + (AI * 2.5);
PoweroutDuration = lerp(PoweroutDuration, PoweroutDuration / global.NightSpeedup, 0.5);

if (AI == 21)
    PoweroutDuration = 360;

if (Mode == "Reset")
    Mode = "Waiting";

if (Mode == "Waiting")
{
    var TimesUp = global.Timer >= ActivationTime || AI == 21;
    
    if (TimesUp && (global.CamUp || AI == 21))
        InOffice = 1;
    
    if (InOffice && !global.CamUp)
    {
        Mode = "PowerOut";
        audio_play_sound(voc_ShadowFreddy_Laugh, 15, false);
        OfficeSprite = instance_create_layer(1120, 448, "InFrontOf_Wall", oOfficeSprite);
        
        with (OfficeSprite)
            DrawDepth = 50;
        
        audio_play_sound(sfxPowerDown, 15, false, 0.5);
        Timer = PoweroutDuration;
    }
}

if (Mode == "PowerOut")
{
    if (global.Brightness < 1)
        global.Brightness += 0.005;
    
    if (Timer < (PoweroutDuration - 0.5))
    {
        with (OfficeSprite)
        {
            image_alpha -= 0.016666666666666666;
            
            if (image_alpha <= 0)
            {
                instance_destroy(self);
                
                with (oShadowFreddy)
                    InOffice = 0;
            }
        }
    }
    
    if (Timer <= 0 && Timer > -0.5)
    {
        if (Timer == 0)
            audio_play_sound(sfxPowerOn, 15, false, 0.5);
        
        global.Brightness = random_range(0.5, 2);
    }
    else if (Timer <= -0.5)
    {
        global.Brightness = global.BaseBrightness;
        instance_destroy();
    }
    
    Timer -= 0.016666666666666666;
}

if (OfficeSprite != undefined)
{
    with (OfficeSprite)
        sprite_index = sShadowFreddy;
}

enum UnknownEnum
{
    Value_17 = 17
}
