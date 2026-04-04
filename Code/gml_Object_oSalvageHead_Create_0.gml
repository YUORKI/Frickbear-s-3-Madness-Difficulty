event_inherited();
TargetX = x;
TargetY = 0;
BaseY = y;
YOffset = 8;
YOffsetSpeed = 0;
Size = 0.75;
SizeSpeed = 0;
SizeTarget = 1;
HP = 3;
BonkHeight = 0;
Frame = 0;
Timer = 10;
Side = 1;
Doorway = sign_to_binary(Side);
WobbleSpeed = 2;
StaticFrames = 0;

if (oSalvage.Phase < 3)
    StaticFrames = 30;

Width = 1;
WidthSpeed = 0;

function slam()
{
    WidthSpeed = 0.2;
    WobbleSpeed += (10 * random_sign());
    TargetY += 32;
    YOffsetSpeed = 24;
    HP--;
    Timer += 1;
    audio_play_sound(sfxMetalImpact, 5, false, 0.6);
    StaticFrames = 15;
    
    if (HP == 0)
    {
        TargetY = 32;
        SizeSpeed = 0.05;
        
        with (instance_find(oDoor, Doorway))
        {
            Bounce = false;
            BounceFloor = 999;
        }
        
        with (oSalvage)
        {
            TargetCam = UnknownEnum.Value_1;
            var Sound = choose(voc_Salvage_HurtFinish1, voc_Salvage_HurtFinish2, voc_Salvage_HurtFinish3);
            
            if (irandom(100) == 77)
                Sound = voc_Salvage_HurtFinish_SuperRare;
            
            reverb_sound(Sound, 0, 0, false, 0.5, 1, 0.1);
            lose_hp(2);
        }
    }
    else
    {
        with (oSalvage)
        {
            lose_hp(2, false);
            var Sound = choose(voc_Salvage_Hurt1, voc_Salvage_Hurt2, voc_Salvage_Hurt3, voc_Salvage_Hurt4);
            reverb_sound(Sound, 0, 0, false, 0.5, 1, 0.1);
        }
    }
}

DrawDepth = 10;

enum UnknownEnum
{
    Value_1 = 1
}
