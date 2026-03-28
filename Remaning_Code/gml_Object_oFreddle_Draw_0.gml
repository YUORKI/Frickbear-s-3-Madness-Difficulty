var BodyX = x + lengthdir_x(HeightOffset, (BodyAngle + image_angle) - 90);
var BodyY = y + lengthdir_y(HeightOffset, (BodyAngle + image_angle) - 90);
var BodyA = BodyAngle + image_angle;
var HeadX = x + lengthdir_x(HeightOffset - 56, (BodyAngle + image_angle) - 90);
var HeadY = y + lengthdir_y(HeightOffset - 56, (BodyAngle + image_angle) - 90);
var HeadA = BodyAngle + image_angle + HeadAngle + round(random_range(-0.6, 0.6));

with (Body)
{
    x = BodyX;
    y = BodyY;
    image_angle = BodyA * -1;
    sprite_index = sNightmareFreddy_FreddleBody;
    DrawDepth = 100;
}

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadA * -1;
    sprite_index = sNightmareFreddy_FreddleHead;
    image_index = other.HeadSprite;
    DrawDepth = 101;
}

sprite_index = sNOTHING;

if (Sound == undefined)
{
    var Direction = 90;
    
    if (x < 1088)
        Direction = 180;
    else if (x > 1600)
        Direction = 0;
    
    Sound = simple_sound(sfxFreddleScreech, lengthdir_x(512, Direction), lengthdir_y(512, Direction), true, 0.75);
    simple_sound(sfxCartoonPop, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 0.25);
}

if (!Flashed)
{
    OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.5, 0.25);
    HeadTiltFrames--;
    TimeToKill -= 0.016666666666666666;
    
    if (HeadTiltFrames <= 0)
    {
        HeadAngleTarget = irandom_range(-3, 3) * 10;
        HeadTiltFrames = random_range(30, 120);
    }
}
else
{
    OffsetSpeed += 0.75;
    BodyAngle = HeadAngle / -4;
    
    if (HeightOffset > 256)
    {
        if (TimeToKill <= 0)
        {
            if (instance_number(oFacehuggerFreddle) == 2)
            {
                jumpscare(UnknownEnum.Value_51, 0);
            }
            else if (instance_exists(oFacehuggerFreddle))
            {
                with (instance_create_depth(-80, -80, 0, oFacehuggerFreddle))
                {
                    image_angle = -135;
                    HeadSprite = other.HeadSprite;
                }
            }
            else
            {
                with (instance_create_depth(720, -80, 0, oFacehuggerFreddle))
                    image_angle = 135;
            }
        }
        
        instance_destroy();
    }
}

HeightOffset += OffsetSpeed;
HeadAngle += HeadAngleSpeed;
HeadAngleSpeed = lerp(HeadAngleSpeed, (HeadAngleTarget - HeadAngle) * 0.8, 0.2);

if (((global.Flashlight && point_distance(o3DMouse.x, o3DMouse.y, HeadX, HeadY) < 80 && !global.CamUp) || TimeToKill <= 0) && !Flashed)
{
    audio_stop_sound(Sound);
    OffsetSpeed = -5;
    HeadAngleSpeed = 20;
    HeadAngleTarget = 0;
    Flashed = true;
    var Direction = 90;
    
    if (x < 1088)
        Direction = 180;
    else if (x > 1600)
        Direction = 0;
    
    simple_sound(sfxFreddleScare, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 1);
    
    with (oNightmareFreddy)
    {
        FreddleSlots[other.SlotID] = false;
        FreddlesActive--;
    }
}

enum UnknownEnum
{
    Value_51 = 51
}
