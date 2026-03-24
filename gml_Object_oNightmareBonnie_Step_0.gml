if (AI == 0)
{
    Frame = 0;
    Attacking = false;
}

var FlashX = o3DMouse.x - 1344;

if (Reset == true)
{
    WaitTime = lerp(36, 12, AI / 20) * random_range(0.75, 1.25);
    Reset = false;
    Attacking = false;
}

if (!Attacking)
{
    ClatterGain = max(ClatterGain - (1/120), 0);
    
    if (ClatterGain == 0)
        audio_stop_sound(sfxNightmareBonnieRun);
    
    if (Frame > WaitTime)
    {
        Frame = 0;
        Attacking = true;
        Side = random_sign();
        ClatterGain = 0;
        audio_play_sound_on(CoolEmitter, sfxNightmareBonnieRun, false, 25);
    }
}
else
{
    var KillTime = lerp(7, 4, AI / 20);
    ClatterGain += (1 / (KillTime * 60));
    
    if (Frame > 1 && (abs(FlashX) > 400 && abs(FlashX) < 620) && sign(FlashX) == Side && global.Flashlight)
    {
        DoorClosedTime += 0.016666666666666666;
        
        if ((DoorClosedTime >= 0 || Frame > KillTime) && ClatterGain > 0.25)
        {
            audio_stop_sound(sfxNightmareBonnieRun);
            simple_sound(sfxWindowScare, 256 * Side, 0, false, 1);
            block_tokens();
            Reset = true;
            
            with (instance_create_depth(0, 0, depth, oNightmareBonnieAnimation))
                Side = other.Side * -1;
        }
    }
    else if (Frame > KillTime)
    {
        jumpscare(UnknownEnum.Value_52, Side);
    }
    else
    {
        DoorClosedTime = 0;
    }
}

global.AudioBusSPECIAL3.effects[1].gain = ClatterGain * 2;
global.AudioBusSPECIAL3.effects[0].mix = (ClatterGain / 2) + 0.5;
global.AudioBusSPECIAL3.effects[0].size = 1 - (ClatterGain / 2);

if (audio_emitter_exists(CoolEmitter))
    audio_emitter_position(CoolEmitter, oCamera.x + (Side * 256), oCamera.y + (ClatterGain * -256), oCamera.depth);

if (!Frozen)
    Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_52 = 52
}
