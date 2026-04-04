image_index = 0;

if (Frame == 0)
    jump_origin(0, -1);

var JumpYTarget = 180;
var SizeBodyTarget = 1;
var SizeHeadTarget = 1;
JumpYSpeed = lerp(JumpYSpeed, (JumpYTarget - JumpY) * 0.2, 0.25);
JumpY += JumpYSpeed;
SizeBodySpeed = lerp(SizeBodySpeed, (SizeBodyTarget - SizeBody) * 0.2, 0.25);
SizeBody += SizeBodySpeed;
SizeHeadSpeed = lerp(SizeBodySpeed, (SizeHeadTarget - SizeHead) * 0.2, 0.2);
SizeHead += SizeHeadSpeed;
YOffsetSpeed = lerp(YOffsetSpeed, (0 - YOffset) * 0.3, 0.2);
YOffset += YOffsetSpeed;
Frame += 1;

if (CutscenePosition < (array_length(CutsceneQueue) - 1) && audio_sound_get_track_position(SoundPlaying) > CutsceneQueue[CutscenePosition + 1][0])
{
    CutscenePosition += 1;
    YOffsetSpeed = CutsceneQueue[CutscenePosition][3];
}

global.Brightness += ((global.BaseBrightness - global.Brightness) / 10);
