var ID = UnknownEnum.Value_44;
var AI = global.AILevels[UnknownEnum.Value_44];

if (AI == 0)
{
    Mode = 2;
    WaitTime = 999;
}

var WaitMax = ceil(lerp(90, 30, AI / 20));
WaitTime = min(WaitTime, WaitMax);
WaitTime -= 0.016666666666666666;
WaitTime = max(WaitTime, 0);

switch (Mode)
{
    case 0:
        Position += Speed;
        Speed += 0.005;
        
        if (Position >= 1)
            Mode = 1;
        
        break;
    
    case 1:
        Speed = lerp(Speed, (1 - Position) * 0.8, 0.25);
        Frame++;
        
        if (Frame >= 60)
        {
            Speed = 0.02;
            Mode = 2;
            WaitTime = WaitMax - (global.Timer % 1);
        }
        
        break;
    
    case 2:
        Speed -= 0.003;
        Frame = 0;
        
        if (WaitTime <= 10 && !audio_is_playing(sfxClockTickdown))
            simple_sound(sfxClockTickdown, 500, 250, true, 0.3);
        
        if (WaitTime <= 0)
        {
            Speed = 0.05;
            Mode = 0;
            audio_play_sound(sfxWindowScare, 5, false, 1);
            audio_stop_sound(sfxClockTickdown);
        }
        
        break;
}

if (!(Mode == 2 || wearing_mask()))
    jumpscare(ID, 0);

Position += Speed;
Position = max(Position, 0);

enum UnknownEnum
{
    Value_44 = 44
}
