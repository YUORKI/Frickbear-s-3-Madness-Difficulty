var ID = UnknownEnum.Value_34;
var AI = global.AILevels[ID];

if (AI == 0)
{
    Frame = 0;
    Attacking = false;
}

if (Reset == true)
{
    WaitTime = lerp(30, 15, AI / 20) * random_range(0.8, 1.2);
    Reset = false;
    Attacking = false;
}

if (!Attacking)
{
    ClatterGain = max(ClatterGain - (1/120), 0);
    
    if (ClatterGain == 0)
        audio_stop_sound(sfxMoltenFreddyClatter);
    
    if (Frame > WaitTime)
    {
        Frame = 0;
        Attacking = true;
        Side = random_sign();
        ClatterGain = 0;
        
        if (audio_emitter_exists(CoolEmitter))
            audio_play_sound_on(CoolEmitter, sfxMoltenFreddyClatter, false, 25);
    }
}
else
{
    var KillTime = lerp(6, 2, AI / 20);
    ClatterGain += (1 / (KillTime * 60));
    fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
    
    if (Frame > 1 && global.Doors[sign_to_binary(Side)])
    {
        DoorClosedTime += 0.016666666666666666;
        
        if (DoorClosedTime >= 1 || Frame > KillTime)
        {
            simple_sound(sfxBlock, 256 * Side, 0, false, 1);
            block_tokens();
            Reset = true;
        }
    }
    else if (Frame > KillTime)
    {
        jumpscare(ID, Side);
    }
    else
    {
        DoorClosedTime = 0;
    }
}

global.AudioBusSPECIAL0.effects[1].gain = ClatterGain * 2;
global.AudioBusSPECIAL0.effects[0].mix = (ClatterGain / 2) + 0.5;
global.AudioBusSPECIAL0.effects[0].size = 1 - (ClatterGain / 2);

if (audio_emitter_exists(CoolEmitter))
    audio_emitter_position(CoolEmitter, oCamera.x + (Side * 256), oCamera.y + (ClatterGain * -256), oCamera.depth);

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_4 = 4,
    Value_34 = 34
}
