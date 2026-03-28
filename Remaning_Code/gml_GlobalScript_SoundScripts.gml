function simple_sound(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = 10, arg6 = 1)
{
    return audio_play_sound_at(arg0, oCamera.x + arg1, oCamera.y + arg2, oCamera.depth, 5000, 10000, 1, arg3, arg5, arg4, 0, arg6);
}

function play_music(arg0, arg1 = 1, arg2 = 1)
{
    with (instance_create_depth(0, 0, 0, oLoopingMusicPlayer))
    {
        MusicPlaying = audio_play_sound(arg0, 150, false, arg1, 0, arg2);
        return MusicPlaying;
    }
}

global.AudioBus00 = audio_bus_create();
global.AudioBus01 = audio_bus_create();
global.AudioBus02 = audio_bus_create();
global.AudioBus03 = audio_bus_create();
global.AudioBus04 = audio_bus_create();
global.AudioBus05 = audio_bus_create();
global.AudioBus06 = audio_bus_create();
global.AudioBus07 = audio_bus_create();
global.AudioBus08 = audio_bus_create();
global.AudioBus09 = audio_bus_create();
global.AudioBus10 = audio_bus_create();
global.AudioBus11 = audio_bus_create();
global.AudioBus12 = audio_bus_create();
global.AudioBus13 = audio_bus_create();
global.AudioBus14 = audio_bus_create();
global.AudioBus15 = audio_bus_create();
global.AudioBusSPECIAL0 = audio_bus_create();
global.AudioBusSPECIAL1 = audio_bus_create();
global.AudioBusSPECIAL2 = audio_bus_create();
global.AudioBusSPECIAL3 = audio_bus_create();
global.CurrentBus = 0;

function get_bus(arg0 = undefined)
{
    if (arg0 == undefined)
    {
        switch (global.CurrentBus)
        {
            case 0:
                return global.AudioBus00;
            
            case 1:
                return global.AudioBus01;
            
            case 2:
                return global.AudioBus02;
            
            case 3:
                return global.AudioBus03;
            
            case 4:
                return global.AudioBus04;
            
            case 5:
                return global.AudioBus05;
            
            case 6:
                return global.AudioBus06;
            
            case 7:
                return global.AudioBus07;
            
            case 8:
                return global.AudioBus08;
            
            case 9:
                return global.AudioBus09;
            
            case 10:
                return global.AudioBus10;
            
            case 11:
                return global.AudioBus11;
            
            case 12:
                return global.AudioBus12;
            
            case 13:
                return global.AudioBus13;
            
            case 14:
                return global.AudioBus14;
            
            case 15:
                return global.AudioBus15;
        }
    }
    else
    {
        switch (arg0)
        {
            case 0:
                return global.AudioBusSPECIAL0;
            
            case 1:
                return global.AudioBusSPECIAL1;
            
            case 2:
                return global.AudioBusSPECIAL2;
            
            case 3:
                return global.AudioBusSPECIAL3;
        }
    }
}

function reverb_sound(arg0, arg1, arg2, arg3 = false, arg4 = 1, arg5 = 1, arg6 = 0.2, arg7 = undefined)
{
    with (instance_create_depth(0, 0, 0, oSoundPlayer))
    {
        emitter = audio_emitter_create();
        var ListenerX = 0;
        var ListenerY = 0;
        
        if (instance_exists(oCamera))
        {
            ListenerX = oCamera.x;
            ListenerY = oCamera.y;
        }
        
        var _ef_reverb = audio_effect_create(AudioEffectType.Reverb1);
        var _ef_gain = audio_effect_create(AudioEffectType.Gain);
        _ef_reverb.size = arg5;
        _ef_reverb.mix = arg6;
        _ef_gain.gain = arg4;
        audio_emitter_position(emitter, ListenerX + arg1, ListenerY + arg2, 0);
        audio_emitter_bus(emitter, get_bus(arg7));
        get_bus(arg7).effects[0] = _ef_reverb;
        get_bus(arg7).effects[1] = _ef_gain;
        PlayingSound = audio_play_sound_on(emitter, arg0, arg3, random_range(20, 30));
        global.CurrentBus = (global.CurrentBus + 1) % 16;
        return PlayingSound;
        break;
    }
}

function bitcrush_sound(arg0, arg1 = 0, arg2 = 0, arg3 = false, arg4 = 1, arg5 = 8)
{
    with (instance_create_depth(0, 0, 0, oSoundPlayer))
    {
        emitter = audio_emitter_create();
        var ListenerX = 0;
        var ListenerY = 0;
        
        if (instance_exists(oCamera))
        {
            ListenerX = oCamera.x;
            ListenerY = oCamera.y;
        }
        else if (instance_exists(oCamera3DMaze))
        {
            ListenerX = oCamera3DMaze.x;
            ListenerY = oCamera3DMaze.y;
        }
        
        var _ef_reverb = audio_effect_create(AudioEffectType.Bitcrusher);
        var _ef_gain = audio_effect_create(AudioEffectType.Gain);
        _ef_reverb.factor = arg5;
        _ef_gain.gain = arg4;
        audio_emitter_position(emitter, ListenerX + arg1, ListenerY + arg2, 0);
        audio_emitter_bus(emitter, get_bus());
        get_bus().effects[0] = _ef_reverb;
        get_bus().effects[1] = _ef_gain;
        PlayingSound = audio_play_sound_on(emitter, arg0, arg3, random_range(20, 30));
        global.CurrentBus = (global.CurrentBus + 1) % 16;
        return PlayingSound;
    }
}

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
