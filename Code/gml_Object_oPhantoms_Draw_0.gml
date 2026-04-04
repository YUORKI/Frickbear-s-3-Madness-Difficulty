if (CurrentCams[global.Cam] != 0 && CurrentCams[global.Cam] <= AmountOfPhantoms && global.CamUp)
{
    depth = 8;
    draw_set_alpha(random_range(0.25, 0.5) + (Aggro / 2));
    draw_sprite(sCameras_Phantoms, CurrentCams[global.Cam] - 1, global.CamX, global.CamY);
    draw_set_alpha(1);
    
    if (oCamera.CamAlpha == 0)
        Aggro += (lerp(0.333, 0.75, global.AILevels[UnknownEnum.Value_19] / 20) / 60);
    
    if (global.Flashlight)
        Aggro = max(Aggro - ((1.5 * oCamera.FlashlightPower) / 60), -1);
}

enum UnknownEnum
{
    Value_19 = 19
}
