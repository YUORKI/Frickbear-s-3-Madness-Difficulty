CurrentSound = sfxNOTHING;
SoundQueue = [];
ReverbQueue = [];

function add_soundclip(arg0, arg1 = false)
{
    array_push(SoundQueue, arg0);
    array_push(ReverbQueue, arg1);
}

MichaelName = "???: ";

if (global.SalvagedMasks[0] || global.UnlockedAnimatronics[UnknownEnum.Value_63])
    MichaelName = "MICHAEL: ";

enum UnknownEnum
{
    Value_63 = 63
}
