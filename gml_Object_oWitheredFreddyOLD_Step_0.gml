var ID = UnknownEnum.Value_10;
var AI = global.AILevels[ID];
var GracePeriod = lerp(180, 90, AI / 20);

if (DelayTime == 0)
{
    with (HallwaySprite)
    {
        y = (OriginalY - abs(dsin(Frame * 6) * 5)) + 5 + YOffset;
        
        if (AI == 0)
        {
            YOffset += ((512 - YOffset) / 20);
        }
        else
        {
            YOffset += ((0 - YOffset) / 100);
            var Walkspeed = 0.1 + ((AI / 20) * 0.9);
            x += (Walkspeed * WalkDirection);
            Frame += Walkspeed;
            image_xscale = WalkDirection;
            image_angle = dsin(Frame * 12) * 2 * WalkDirection;
            
            if (x > 1600 || x < 1088)
            {
                if ((x < 1088 && !global.Doors[0]) || (x > 1600 && !global.Doors[1]))
                {
                    Rage++;
                    
                    if (Rage > GracePeriod)
                        jumpscare(ID, WalkDirection);
                }
                else
                {
                    WalkDirection *= -1;
                    x = clamp(x, 1088, 1600);
                    simple_sound(sfxBlock, x - 1344, -20, false, 1);
                    reverb_sound(sfxWitheredFreddyBlocked, x - 1344, -20);
                    block_tokens();
                    Rage = 0;
                    other.DelayTime = lerp(120, 60, AI / 20);
                }
            }
            
            if (Frame >= 30 && Rage == 0)
            {
                simple_sound(sfxMetalFootstep, x - 1344, -64, false, 0.1);
                Frame = 0;
            }
        }
    }
}
else
{
    DelayTime--;
}

enum UnknownEnum
{
    Value_10 = 10
}
