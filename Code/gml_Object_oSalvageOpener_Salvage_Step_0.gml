var WallX = 1088;
var WallY = 448;
var _BodyX = WallX + 256;
var _BodyY = WallY + 288 + BodyY + (dsin(Frame) * 2);
var HeadOffset = -80 + HeadY + (BodyY / 4) + (dsin(Frame - 30) * 4);
var _HeadX = _BodyX + rot_x(0, HeadOffset, BodyAngle);
var _HeadY = _BodyY + rot_y(0, HeadOffset, BodyAngle);
BodyAngleSpeed = lerp(BodyAngleSpeed, (BodyAngleTarget - BodyAngle) * BodyAngleSnappiness, BodyAngleBounce);
BodyAngle += BodyAngleSpeed;
BodyYSpeed = lerp(BodyYSpeed, (BodyYTarget - BodyY) * BodyYSnappiness, BodyYBounce);
BodyY += BodyYSpeed;

if (sign(BodyAngleSpeed) == -1 || sign(BodyYSpeed) == -1)
    CurrentBodyImage = BodyImage;

HeadAngleSpeed = lerp(HeadAngleSpeed, (HeadAngleTarget - HeadAngle) * HeadAngleSnappiness, HeadAngleBounce);
HeadAngle += HeadAngleSpeed;
HeadYSpeed = lerp(HeadYSpeed, (HeadYTarget - HeadY) * HeadYSnappiness, HeadYBounce);
HeadY += HeadYSpeed;

if (!audio_is_playing(SoundPlaying))
{
    if (SoundQueuePos >= (array_length(SoundQueue) - 1))
    {
        if (FadingOut == 0)
        {
            FadingOut = 30;
            audio_play_sound(sfxSalvageClatter, 10, false);
        }
        else
        {
            HeadImage = 3;
            FadingOut--;
            var BrightnessAmount = lerp(1, 0.5, FadingOut / 30);
            global.Brightness = random_range(BrightnessAmount, BrightnessAmount * 2);
            
            if (FadingOut == 0)
            {
                global.Brightness = 1;
                instance_destroy(oSalvageOpener_Manager);
                
                with (oCamera)
                    start_salvage_fight();
                
                instance_destroy();
            }
        }
    }
    else
    {
        SoundPlaying = audio_play_sound(SoundQueue[++SoundQueuePos], 5, false);
        SubtitleQueue = subtitle(SoundQueue[SoundQueuePos]);
        CurrentSubtitleLine = 0;
        NextPoint = 0;
        SequenceStep = 0;
    }
}

if (sign(HeadAngleSpeed) == -1 || sign(HeadYSpeed) == -1)
    CurrentHeadImage = HeadImage;

if (audio_sound_get_track_position(SoundPlaying) > NextPoint || NextPoint <= 0)
{
    SequenceStep++;
    
    switch (SoundQueuePos)
    {
        case 0:
            switch (SequenceStep)
            {
                case 1:
                    BodyYTarget = 0;
                    BodyYBounce = 1;
                    BodyYSnappiness = 0.08;
                    BodyAngleTarget = 15;
                    BodyAngleBounce = 0.9;
                    BodyAngleSnappiness = 0.08;
                    HeadAngleTarget = 5;
                    HeadAngleBounce = 0.5;
                    HeadAngleSnappiness = 0.05;
                    NextPoint = 1.3;
                    break;
                
                case 2:
                    HeadAngleTarget = 10;
                    HeadAngleSpeed = 8;
                    HeadAngleSnappiness = 0.2;
                    HeadAngleBounce = 0.25;
                    BodyAngleTarget = 20;
                    NextPoint = 2.1;
                    break;
                
                case 3:
                    HeadYSpeed = 5;
                    HeadImage = -1;
                    BodyAngleTarget = 0;
                    NextPoint = 2.9;
                    break;
                
                case 4:
                    BodyYTarget = 8;
                    BodyYBounce = 0.1;
                    BodyYSnappiness = 0.3;
                    BodyAngleTarget = 0;
                    BodyAngleBounce = 0.2;
                    BodyAngleSnappiness = 0.1;
                    HeadAngleTarget = 0;
                    HeadAngleBounce = 0.2;
                    HeadAngleSnappiness = 0.5;
                    HeadYTarget = 16;
                    HeadYBounce = 0.05;
                    HeadYSnappiness = 0.5;
                    HeadImage = -3;
                    BodyImage = 0;
                    NextPoint = 99;
                    break;
            }
            
            break;
        
        case 1:
            switch (SequenceStep)
            {
                case 1:
                    BodyYBounce = 0.3;
                    BodyYSnappiness = 0.2;
                    HeadYBounce = 0.3;
                    HeadYSnappiness = 0.2;
                    BodyAngleBounce = 0.3;
                    BodyAngleSnappiness = 0.2;
                    HeadAngleBounce = 0.3;
                    HeadAngleSnappiness = 0.2;
                    HeadYSpeed = 8;
                    HeadImage = 0;
                    NextPoint = (global.Guard == 3) ? 0 : 0.9;
                    break;
                
                case 2:
                    HeadAngleTarget = 30;
                    NextPoint = 2;
                    break;
            }
            
            break;
        
        case 2:
            if (global.Guard == 3)
            {
                switch (SequenceStep)
                {
                    case 1:
                        HeadImage = 1;
                        HeadAngleTarget = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 3.6;
                        break;
                    
                    case 2:
                        HeadImage = 2;
                        BodyImage = 1;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        BodyAngleTarget = -15;
                        NextPoint = 7.1;
                        break;
                    
                    case 3:
                        HeadAngleTarget = -30;
                        NextPoint = 10.2;
                        break;
                    
                    case 4:
                        HeadImage = -3;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        NextPoint = 17.4;
                        break;
                    
                    case 5:
                        BodyAngleTarget = 0;
                        HeadImage = -3;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        NextPoint = 18.9;
                        break;
                    
                    case 6:
                        HeadImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 21.4;
                        break;
                    
                    case 7:
                        HeadImage = -1;
                        BodyYSpeed = -2;
                        HeadYSpeed = -4;
                        BodyAngleTarget = 5;
                        NextPoint = 23.4;
                        break;
                    
                    case 8:
                        HeadImage = -2;
                        BodyYSpeed = -2;
                        HeadYSpeed = -4;
                        BodyAngleTarget = 10;
                        HeadAngleTarget = 20;
                        NextPoint = 27.1;
                        break;
                    
                    case 9:
                        HeadImage = -3;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        BodyAngleTarget = 0;
                        NextPoint = 32.3;
                        break;
                    
                    case 10:
                        HeadImage = 0;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        BodyAngleTarget = 0;
                        NextPoint = 35;
                        break;
                    
                    case 11:
                        HeadImage = -3;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 99;
                        break;
                }
            }
            else
            {
                switch (SequenceStep)
                {
                    case 1:
                        HeadImage = 1;
                        HeadAngleTarget = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 4;
                        break;
                    
                    case 2:
                        HeadImage = 2;
                        BodyImage = 1;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        BodyAngleTarget = -15;
                        NextPoint = 10.1;
                        break;
                    
                    case 3:
                        HeadAngleTarget = -30;
                        NextPoint = 12.5;
                        break;
                    
                    case 4:
                        HeadImage = -3;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        NextPoint = 15.1;
                        break;
                    
                    case 5:
                        HeadImage = 2;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        BodyAngleTarget = 0;
                        NextPoint = 17.1;
                        break;
                    
                    case 6:
                        HeadAngleTarget = -30;
                        NextPoint = 18.4;
                        break;
                    
                    case 7:
                        HeadImage = 0;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        NextPoint = 20.7;
                        break;
                    
                    case 8:
                        HeadImage = -3;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 24.9;
                        break;
                    
                    case 9:
                        HeadImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 27.3;
                        break;
                    
                    case 10:
                        HeadImage = -1;
                        BodyYSpeed = -2;
                        HeadYSpeed = -4;
                        BodyAngleTarget = 5;
                        NextPoint = 29.3;
                        break;
                    
                    case 11:
                        HeadImage = -2;
                        BodyYSpeed = -2;
                        HeadYSpeed = -4;
                        BodyAngleTarget = 10;
                        HeadAngleTarget = 20;
                        NextPoint = 33;
                        break;
                    
                    case 12:
                        HeadImage = -3;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        BodyAngleTarget = 0;
                        NextPoint = 38.2;
                        break;
                    
                    case 13:
                        HeadImage = 0;
                        BodyImage = 0;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        HeadAngleTarget = 0;
                        BodyAngleTarget = 0;
                        NextPoint = 40.9;
                        break;
                    
                    case 14:
                        HeadImage = -3;
                        BodyYSpeed = 2;
                        HeadYSpeed = 4;
                        NextPoint = 99;
                        break;
                }
            }
            
            break;
        
        case 3:
            switch (SequenceStep)
            {
                case 1:
                    HeadImage = 2;
                    BodyImage = 1;
                    BodyYSpeed = 2;
                    HeadYSpeed = 4;
                    BodyAngleTarget = -10;
                    HeadAngleTarget = -15;
                    NextPoint = 5.4;
                    break;
                
                case 2:
                    BodyYSpeed = 2;
                    HeadYSpeed = 4;
                    BodyAngleTarget = -5;
                    HeadAngleTarget = 15;
                    NextPoint = 10.4;
                    break;
                
                case 3:
                    HeadImage = 0;
                    BodyImage = 1;
                    BodyYSpeed = 2;
                    HeadYSpeed = 4;
                    BodyAngleTarget = 0;
                    HeadAngleTarget = -5;
                    NextPoint = 13.2;
                    break;
                
                case 4:
                    HeadImage = 0;
                    BodyImage = 0;
                    BodyYSpeed = 2;
                    HeadYSpeed = 4;
                    HeadAngleTarget = 0;
                    NextPoint = 15.5;
                    break;
                
                case 5:
                    HeadImage = -3;
                    BodyImage = 0;
                    BodyYSpeed = 2;
                    HeadYSpeed = 4;
                    HeadAngleTarget = 0;
                    HeadYTarget = 32;
                    NextPoint = 99;
                    break;
            }
            
            break;
        
        case 4:
            HeadImage = 0;
            HeadYSnappiness = 0.05;
            HeadYBounce = 0.5;
            BodyYSnappiness = 0.05;
            BodyYBounce = 0.5;
            HeadYSpeed = -4;
            BodyYSpeed = -4;
            HeadYTarget = 8;
            BodyYTarget /= 2;
            NextPoint = 99;
            break;
    }
}

with (Body)
{
    DrawDepth = 1;
    sprite_index = sBossSalvage_CutsceneBody;
    image_index = other.CurrentBodyImage + 1;
    x = _BodyX;
    y = _BodyY;
    image_angle = other.BodyAngle * -1;
    image_blend = c_black;
}

with (Head)
{
    DrawDepth = 2;
    sprite_index = sBossSalvage_CutsceneHead;
    image_index = other.CurrentHeadImage + 3;
    x = _HeadX;
    y = _HeadY;
    image_angle = other.HeadAngle * -1;
    image_blend = c_dkgray;
}

Frame++;
show_debug_message(SequenceStep);
