Frame = 0;
Reset = true;
Attacking = false;
Side = 0;
WaitTime = 99;
ClatterGain = 0;
CoolEmitter = audio_emitter_create();
audio_emitter_bus(CoolEmitter, global.AudioBusSPECIAL0);
var _ef_reverb = audio_effect_create(AudioEffectType.Reverb1);
var _ef_gain = audio_effect_create(AudioEffectType.Gain);
_ef_reverb.size = 1;
_ef_reverb.mix = 0.2;
_ef_gain.gain = 0;
global.AudioBusSPECIAL0.effects[0] = _ef_reverb;
global.AudioBusSPECIAL0.effects[1] = _ef_gain;
DoorClosedTime = 0;

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
