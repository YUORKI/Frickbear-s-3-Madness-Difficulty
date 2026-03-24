var ID = UnknownEnum.Value_21;
var AI = global.AILevels[ID];
var FlashX = o3DMouse.x - 1344;

if (Mode == "Wait" && global.CamUp && AI > 0)
{
    Mode = "WaitForFlip";
}
else if (Mode == "WaitForFlip" && !global.CamUp)
{
    if (instance_exists(oLaserDoor))
    {
        Mode = "Wait";
    }
    else
    {
        Mode = "Window";
        _x = 160;
        _y = 0;
        _angle = 30;
        XSpeed = -4;
        EarAngle = 30;
        
        if (random(2) > 1)
        {
            Side = 1;
            Door = 1;
        }
        else
        {
            Side = -1;
            Door = 0;
        }
        
        simple_sound(sfxPlushtrapScrape, 500 * Side, -100, false, 0.8);
    }
}
else if (Mode == "Window")
{
    Move = true;
    
    if (instance_exists(oTwistedWolf))
    {
        if (oTwistedWolf.InOffice)
        {
            Side = 1;
            Door = 1;
        }
    }
}
else if (Mode == "Door" && ((global.Flashlight && abs(FlashX) > 400 && abs(FlashX) < 620) || instance_exists(oLaserDoor)) && !Move)
{
    if (instance_exists(oLaserDoor))
    {
        reverb_sound(voc_Plushtrap_ACK, -256 * Side, 0, false, 1);
        Move = true;
        _x = -400;
        Anger = 0;
    }
    
    if (global.Doors[Door] == 0)
    {
        if (sign(FlashX) != (Side * -1))
        {
            Mode = "KILL";
            Timer = 0;
        }
        else
        {
            reverb_sound(voc_Plushtrap_ACK, -256 * Side, 0, false, 1);
        }
        
        Move = true;
        _x = -400;
        Anger = 0;
    }
}
else if (Mode == "KILL")
{
    Timer++;
    
    if (Timer > 10)
        jumpscare(ID, Side * -1);
}

if (Mode == "Door" && !Move)
{
    Anger += 0.016666666666666666;
    
    if (global.Doors[Door])
        Anger -= 0.016666666666666666;
    
    if (Anger > (5 - ((AI / 20) * 3)))
        jumpscare(ID, Side * -1);
}

if (Move)
{
    _x += XSpeed;
    
    if (XSpeed < 0)
    {
        _y -= (XSpeed / 2);
        _angle += (XSpeed / 2);
        
        if (Mode == "Door")
            _angle = 90 + (irandom_range(-2, 2) * XSpeed);
        
        EarAngle += XSpeed;
    }
    else
    {
        _y += ((0 - _y) / 15);
        _angle += ((90 - _angle) / 20);
        EarAngle += ((15 - _angle - EarAngle) / 20);
    }
    
    XSpeed += 0.75;
    
    if (Mode == "Window")
        XSpeed += ((1 * (AI / 20)) - 0.25);
    
    if (_x > 320 && Mode == "Window")
    {
        Mode = "Door";
        _x = -301;
        _y = 0;
        _angle = 75;
        EarAngle = 60;
        Side *= -1;
        XSpeed = -8;
        Move = false;
    }
    else if (Mode == "Door" && _x > -300)
    {
        Mode = "Wait";
        Move = false;
    }
}

enum UnknownEnum
{
    Value_21 = 21
}
