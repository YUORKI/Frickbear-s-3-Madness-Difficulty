Frame = 0;
OriginX = 0;
JumpX = 640;
JumpY = 720;
SizeBody = 0.25;
SizeHead = 0.01;
audio_stop_all();
Frame = 0;

function jump_origin(arg0, arg1)
{
    OriginX = arg0;
    JumpX = 320 + (320 * arg0);
    JumpY = 180 - (540 * arg1);
    SizeBody = 0.25;
    SizeHead = 0.01;
    Frame = 0;
    audio_play_sound(sfxJumpscareNormal, 99, false);
}

JawOffset = 0;
jump_origin(0, -1);
