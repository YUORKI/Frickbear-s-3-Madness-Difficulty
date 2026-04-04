shader_set(TransparencyShader);

if (global.Cam == CamNumber)
    image_index = 1;
else
    image_index = 0;

draw_self();
draw_text(x + 5, y + 1, "CAM " + string(CamNumber));

if (instance_exists(oMarionette))
{
    if (CamNumber == 6 && oMarionette.ShowWarning && global.Cam != 6)
        draw_sprite(sMarionetteWarning, 1, x + sprite_width, y + sprite_height);
}

if (instance_exists(oSalvage))
{
    if (array_contains(oSalvage.BreakerWarnings, CamNumber) && floor(oSalvage.VentWarningTimer / 15) % 2)
        draw_sprite(sMarionetteWarning, 1, x + sprite_width, y);
}

if (RadarMode > 0)
{
    CharsOnCam = [];
    
    if (instance_exists(oFreddy) && global.AILevels[UnknownEnum.Value_0] > 0)
    {
        if (oFreddy.Stage == "ShowStage")
            radar_draw(UnknownEnum.Value_1, UnknownEnum.Value_1);
        
        if (oFreddy.Stage == "DiningArea")
            radar_draw(UnknownEnum.Value_1, UnknownEnum.Value_2);
        
        if ((oFreddy.Stage == "Hallway" || oFreddy.Stage == "Doorway" || oFreddy.Stage == "Blocked") && oFreddy.Side == -1)
            radar_draw(UnknownEnum.Value_1, UnknownEnum.Value_4);
        
        if ((oFreddy.Stage == "Hallway" || oFreddy.Stage == "Doorway" || oFreddy.Stage == "Blocked") && oFreddy.Side == 1)
            radar_draw(UnknownEnum.Value_1, UnknownEnum.Value_5);
    }
    
    if (instance_exists(oBonnie) && global.AILevels[UnknownEnum.Value_1] > 0)
    {
        if (oBonnie.Stage == "ShowStage")
            radar_draw(UnknownEnum.Value_2, UnknownEnum.Value_1);
        
        if (oBonnie.Stage == "DiningArea")
            radar_draw(UnknownEnum.Value_2, UnknownEnum.Value_2);
        
        if (oBonnie.Stage == "Hallway")
            radar_draw(UnknownEnum.Value_2, UnknownEnum.Value_4);
    }
    
    if (instance_exists(oChica) && global.AILevels[UnknownEnum.Value_2] > 0)
    {
        if (oChica.Stage == "ShowStage")
            radar_draw(UnknownEnum.Value_3, UnknownEnum.Value_1);
        
        if (oChica.Stage == "DiningArea")
            radar_draw(UnknownEnum.Value_3, UnknownEnum.Value_2);
        
        if (oChica.Stage == "Hallway")
            radar_draw(UnknownEnum.Value_3, UnknownEnum.Value_5);
    }
    
    if (instance_exists(oFoxy) && global.AILevels[UnknownEnum.Value_3] > 0)
    {
        if (oFoxy.Mode == "Wait")
            radar_draw(UnknownEnum.Value_4, UnknownEnum.Value_3);
    }
    
    if (instance_exists(oMangle) && global.AILevels[UnknownEnum.Value_9] > 0)
        radar_draw(UnknownEnum.Value_5, oMangle.CurrentCam);
    
    if (instance_exists(oPhantoms) && global.AILevels[UnknownEnum.Value_19] > 0)
    {
        for (var p = 1; p < array_length(oPhantoms.CurrentCams); p++)
        {
            if (oPhantoms.CurrentCams[p] != 0 && oPhantoms.CurrentCams[p] <= oPhantoms.AmountOfPhantoms)
                radar_draw((UnknownEnum.Value_8 + oPhantoms.CurrentCams[p]) - 1, p);
        }
    }
    
    if (instance_exists(oSpringtrap) && global.AILevels[UnknownEnum.Value_20] > 0)
    {
        if (oSpringtrap.Stage == 0)
            radar_draw(UnknownEnum.Value_14, UnknownEnum.Value_8);
        
        if (oSpringtrap.Stage == 1)
            radar_draw(UnknownEnum.Value_14, UnknownEnum.Value_1);
        
        if (oSpringtrap.Stage == 2)
            radar_draw(UnknownEnum.Value_14, UnknownEnum.Value_2);
        
        if (oSpringtrap.Stage == 3 || oSpringtrap.Stage == 4)
            radar_draw(UnknownEnum.Value_14, UnknownEnum.Value_4);
    }
    
    if (instance_exists(oNightmareBB) && global.AILevels[UnknownEnum.Value_23] > 0)
    {
        if (oNightmareBB.HitsLeft > 0)
            radar_draw(UnknownEnum.Value_15, oNightmareBB.Camera);
    }
    
    if (instance_exists(oBaby) && global.AILevels[UnknownEnum.Value_26] > 0)
    {
        if (oBaby.BidybabsLeft > 0)
            radar_draw(UnknownEnum.Value_16, UnknownEnum.Value_7);
        
        for (var p = 0; p < instance_number(oBidybab); p++)
            radar_draw(UnknownEnum.Value_17, instance_find(oBidybab, p).Camera);
    }
    
    if (instance_exists(oFuntimeFreddy) && global.AILevels[UnknownEnum.Value_27] > 0)
    {
        if (oFuntimeFreddy.Mode != "Waiting")
        {
            radar_draw(UnknownEnum.Value_18, UnknownEnum.Value_4 + sign_to_binary(oFuntimeFreddy.Side));
            radar_draw(UnknownEnum.Value_19, UnknownEnum.Value_4 + sign_to_binary(oFuntimeFreddy.ActualSide));
        }
    }
    
    if (instance_exists(oBallora) && global.AILevels[UnknownEnum.Value_29] > 0)
    {
        for (var p = 0; p < array_length(oBallora.SliceLocations); p++)
        {
            if (oBallora.SliceLocations[p])
                radar_draw(UnknownEnum.Value_20, p);
        }
    }
    
    if (instance_exists(oScrapBaby) && global.AILevels[UnknownEnum.Value_35] > 0)
    {
        if (oScrapBaby.Active)
            radar_draw(UnknownEnum.Value_21, UnknownEnum.Value_8);
    }
    
    if (character_active(UnknownEnum.Value_43))
    {
        if (oSparky.Active)
            radar_draw(UnknownEnum.Value_22, oSparky.CurrentCam);
    }
    
    if (character_active(UnknownEnum.Value_45))
        radar_draw(UnknownEnum.Value_23, oPopgoes.CurrentCam);
    
    if (instance_exists(oSalvage))
        radar_draw(UnknownEnum.Value_24, oSalvage.CurrentCam);
    
    var a = array_length(CharsOnCam) - 1;
    
    while (a >= 0)
    {
        var Sep = 8;
        
        if (array_length(CharsOnCam) > 4)
            Sep = 4;
        
        draw_sprite(sCamRadarIcons, CharsOnCam[a], x + 3 + (Sep * a), y + 3);
        a--;
    }
}

shader_reset();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_7 = 7,
    Value_8,
    Value_9,
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_26 = 26,
    Value_27,
    Value_29 = 29,
    Value_35 = 35,
    Value_43 = 43,
    Value_45 = 45
}
