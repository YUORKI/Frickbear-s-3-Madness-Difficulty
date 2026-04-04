event_inherited();
Frame = 0;
OriginX = 0;
JumpX = 640;
JumpY = 720;
JumpAngle = 0;
SizeBody = 0.25;
SizeHead = 0.01;
Side = 0;
Sprite = sJumpscare;
BodyImage = 0;
HeadImage = 0;
Frame = 0;

function jump_origin(arg0, arg1)
{
    OriginX = Side;
    JumpX = 320 + (320 * Side);
    JumpY = 180 - (540 * arg0);
    SizeBody = 0.25;
    SizeHead = 0.01;
    JumpAngle = Side * 15;
    Frame = 0;
    
    if (global.Settings[2][4] == 3 && arg1 != 4)
    {
        audio_group_set_gain(voc_Rodney_Idle_TooManyNights, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        var JumpSound = choose(sfxJumpscare_Funny_AmongUs, sfxJumpscare_Funny_BigMouth, sfxJumpscare_Funny_Burp, sfxJumpscare_Funny_CarHorn, sfxJumpscare_Funny_Foghorn, sfxJumpscare_Funny_Goofy, sfxJumpscare_Funny_OurTable, sfxJumpscare_Funny_Spongebob, sfxJumpscare_Funny_Tom, sfxJumpscare_Funny_Yodel, sfxJumpscare_Funny_Pingas, sfxJumpscare_Funny_Wega, sfxJumpscare_Funny_Bitch, sfxJumpscare_Funny_Buzzer);
        audio_play_sound(JumpSound, 99, false);
    }
    else
    {
        var Volume = 1;
        
        if (global.Settings[2][4] == 1)
            Volume = 0;
        else if (global.Settings[2][4] == 2)
            Volume = 0.25;
        
        audio_group_set_gain(voc_Rodney_Idle_TooManyNights, (Volume * global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        var JumpSounds = [sfxJumpscareHigh, sfxJumpscareNormal, sfxJumpscareLow, sfxJumpscareLowest, sfxFredbearGrowl2];
        audio_play_sound(JumpSounds[arg1], 99, false);
    }
}

Active = false;
alarm[0] = 90;
global.TimeOfDeath = global.Timer;
