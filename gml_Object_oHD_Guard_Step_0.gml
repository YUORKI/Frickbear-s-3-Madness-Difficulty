var InGame = true;

if (instance_exists(oHappiestDayDrawer))
    InGame = oHappiestDayDrawer.InGame;

if (!place_meeting(x, y, oHD_CutsceneZone))
{
    if (input_check_pressed(UnknownEnum.Value_0) && (place_meeting(x, y + 1, oHD_Wall) || (!place_meeting(x, y, oHD_Bridge) && place_meeting(x, y + 1, oHD_Bridge))))
    {
        YVelocity = -3.75;
        SpringJump = false;
        audio_play_sound(sfxBitJump, 5, false);
    }
    
    XMove = input_check(UnknownEnum.Value_5) - input_check(UnknownEnum.Value_3);
}
else if (x < (instance_nearest(x, y, oHD_CutsceneZone).x + 32))
{
    XMove = 0.5;
}
else
{
    XMove = 0;
    
    with (oHappiestDayDrawer)
    {
        if (Screen != "KidTalk")
        {
            if (Level == 5)
            {
                if (instance_exists(oNightmareFreddy))
                {
                    with (oNightmare)
                    {
                        global.Temperature = 0;
                        Timer = 10;
                        audio_stop_all();
                    }
                    
                    instance_destroy(oNightmareFreddy);
                    instance_destroy(oNightmareBonnie);
                    instance_destroy(oNightmareChica);
                    instance_destroy(oNightmareFoxy);
                    update_boss_scores();
                    
                    if (global.Night == "Custom")
                        win_night();
                }
            }
            else
            {
                if (InGame)
                    Screen = "KidTalk";
                
                TextNum = 0;
                TextType = 0;
            }
        }
    }
}

XVelocity += (XMove * 0.25);

if (LockFrames > 0)
{
    XVelocity = 0;
    YVelocity = 0;
    LockFrames--;
}

if (place_meeting(x + XVelocity, y, oHD_Wall))
{
    while (!place_meeting(x + sign(XVelocity), y, oHD_Wall))
        x += sign(XVelocity);
    
    XVelocity = 0;
}

if (place_meeting(x + XVelocity, y, oHD_Gearrat))
    die();

x += XVelocity;
XVelocity *= 0.85;

if (place_meeting(x, y + YVelocity, oHD_Wall))
{
    while (!place_meeting(x, y + sign(YVelocity), oHD_Wall))
        y += sign(YVelocity);
    
    YVelocity = 0;
}

if (place_meeting(x, y + YVelocity, oHD_Bridge) && YVelocity >= 0 && !place_meeting(x, y, oHD_Bridge))
{
    while (!place_meeting(x, y + sign(YVelocity), oHD_Bridge))
        y += sign(YVelocity);
    
    YVelocity = 0;
}

if (place_meeting(x, y + YVelocity, oHD_Gearrat) && YVelocity > 0)
{
    while (!place_meeting(x, y + sign(YVelocity), oHD_Gearrat))
        y += sign(YVelocity);
    
    instance_destroy(instance_place(x, y + 1, oHD_Gearrat));
    audio_play_sound(sfxBitThud, 5, false);
    
    if (input_check(UnknownEnum.Value_0))
        YVelocity = -4;
    else
        YVelocity = -2;
    
    SpringJump = true;
}

y += YVelocity;
YVelocity += 0.2;

if (!input_check(UnknownEnum.Value_0) && YVelocity < 0 && !SpringJump)
    YVelocity *= 0.5;

if (XVelocity != 0)
    image_xscale = sign(XVelocity);

if (place_meeting(x, y + 1, oHD_Bouncepot))
{
    with (instance_place(x, y + 1, oHD_Bouncepot))
    {
        if (!Active)
        {
            Active = true;
            Frame = 1;
        }
    }
}

if (place_meeting(x, y, oHD_Checkpoint))
{
    with (instance_place(x, y, oHD_Checkpoint))
    {
        if (Active == false)
        {
            audio_play_sound(sfxBitBoost, 5, false);
            
            with (oNightmare)
                global.Temperature = 0;
        }
        
        Active = true;
        other.RespawnX = x + 8;
        other.RespawnY = y + 8;
    }
}

if (place_meeting(x, y, oHD_Spike))
    die();

WalkTimer += (abs(XVelocity) / 10);
var BaseSprite = global.Guard * 4;
image_index = BaseSprite;

if (XMove != 0)
{
    var WalkFrame = floor(WalkTimer) % 4;
    
    switch (WalkFrame)
    {
        case 1:
            image_index += 1;
            break;
        
        case 3:
            image_index += 2;
            break;
    }
}
else
{
    WalkTimer = 0;
}

if (!place_meeting(x, y + 1, oHD_WallParent))
    image_index = BaseSprite + 3;

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_5 = 5
}
