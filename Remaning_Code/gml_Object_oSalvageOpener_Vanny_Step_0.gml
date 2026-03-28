var WallX = 1088;
var WallY = 448;
x = WallX + 256;
y = WallY + 288 + YOffset;
image_index = Image;

if (Timer == -8.5)
{
    audio_stop_all();
    audio_play_sound(sfxVannyOpener, 10, false);
}

if (Timer < -2)
    global.Brightness = 1;
else if (Timer == -2)
    audio_play_sound(sfxPowerOn, 15, false, 0.5);
else if (Timer < -1.5)
    global.Brightness = random_range(0.5, 2);
else
    global.Brightness = global.BaseBrightness;

if (Timer == 0)
    Audio = reverb_sound(voc_Vanny_Opener, 0, 200, false, 1, 0.5, 0.25);

if (YSpeed < 0)
    Image = CutsceneQueue[CutscenePosition][1];

YOffset += YSpeed;
YSpeed = lerp(YSpeed, (YTarget - YOffset) * YSnap, YBounce);

if (CutscenePosition < (array_length(CutsceneQueue) - 1) && Timer > CutsceneQueue[CutscenePosition + 1][0])
{
    CutscenePosition += 1;
    YSpeed = 8;
}

if (Timer == 30.7)
    instance_create_depth(0, 0, depth - 1, oSalvageOpener_DeadVanny);

if (Timer > 30.7)
    instance_destroy();

Timer += 0.016666666666666666;
