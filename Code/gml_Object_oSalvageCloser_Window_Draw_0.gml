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
FistX += ((FistXTarget - FistX) * FistSnappiness);
FistY += ((FistYTarget - FistY) * FistSnappiness);
FistSizeSpeed = lerp(FistSizeSpeed, (FistSizeTarget - FistSize) * 0.25, 0.5);
FistSize += FistSizeSpeed;

if (Delay > 60)
    global.Brightness = 1;
else if (Delay > 0)
    global.Brightness = lerp(global.BaseBrightness, 1, Delay / 90);

if (Delay == 60)
{
    SoundPlaying = audio_play_sound(voc_Salvage_Ending1, 5, false);
    SubtitleQueue = subtitle(voc_Salvage_Ending1);
    update_boss_scores();
    
    if (global.Night == "Custom")
        win_night();
}

if (Delay < 60)
{
    if (audio_sound_get_track_position(SoundPlaying) > NextPoint)
    {
        CurrentHeadImage++;
        HeadYSnappiness = 0.05;
        HeadYBounce = 0.5;
        BodyYSnappiness = 0.05;
        BodyYBounce = 0.5;
        HeadYSpeed = -4;
        BodyYSpeed = -4;
        HeadYTarget = 16;
        NextPoint = 99;
    }
    
    if (!audio_is_playing(SoundPlaying))
    {
        PostVoiceTimer++;
        
        if (PostVoiceTimer == 1)
        {
            audio_play_sound(sfxEndoCreak, 10, false);
            BodyAngleTarget = 15;
            BodyAngleBounce = 1;
            BodyAngleSnappiness = 0.1;
            BodyImage = 1;
            CurrentBodyImage = BodyImage;
            BodyYTarget = 8;
            HeadYTarget = 24;
            FistYTarget = 192;
        }
        
        if (PostVoiceTimer == 30)
        {
            FistSizeTarget = 1;
            FistXTarget = 288;
            FistYTarget = 288;
            FistSnappiness = 0.5;
            FistSizeSpeed = 1;
            BodyImage = -1;
            CurrentBodyImage = -1;
            BodyYSpeed = 5;
            HeadYSpeed = 2;
            BodyAngleTarget = 5;
            BodyAngleBounce = 0.25;
            BodyAngleSnappiness = 0.5;
            BodyAngleTarget = 0;
            Glass = instance_create_layer(WallX + 323, WallY + 211, "OnWall", oOfficeSprite);
            
            with (Glass)
                sprite_index = sBrokenGlass;
            
            instance_destroy(Fist);
            Fist = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
            audio_play_sound(sfxJumpscare_Funny_OurTable, 30, false);
        }
        
        if (PostVoiceTimer > 60)
        {
            if (FistTimer == 0)
                audio_play_sound(sfxPowerOn, 5, false);
            
            var BrightnessAmount = lerp(0.5, 1, min(FistTimer, 30) / 30);
            global.Brightness = random_range(BrightnessAmount, BrightnessAmount * 2);
            FistTimer++;
            
            if (FistTimer == 60)
            {
                instance_create_depth(0, 0, 0, oSalvageCloser_UpClose);
                instance_destroy();
            }
            
            global.MaskDown = false;
        }
    }
}

if (PostVoiceTimer == 0)
{
    if (irandom(100) == 1)
        HeadAngleSpeed = random_sign();
    
    if (irandom(100) == 5)
        BodyAngleSpeed = random_sign();
}

with (Body)
{
    DrawDepth = 1;
    sprite_index = sBossSalvage_CutsceneBody;
    image_index = other.CurrentBodyImage + 1;
    x = _BodyX;
    y = _BodyY;
    image_angle = other.BodyAngle * -1;
}

with (Head)
{
    DrawDepth = 2;
    sprite_index = sBossSalvage_CutsceneHead;
    image_index = other.CurrentHeadImage + 3;
    x = _HeadX;
    y = _HeadY;
    image_angle = other.HeadAngle * -1;
}

with (Fist)
{
    DrawDepth = 3;
    sprite_index = sBossSalvage_CutsceneFist;
    image_index = 0;
    x = other.FistX + WallX;
    y = other.FistY + WallY;
    image_angle = lerp(-45, 0, other.FistSize);
    image_xscale = other.FistSize;
    image_yscale = other.FistSize;
}

Frame++;
Delay--;
