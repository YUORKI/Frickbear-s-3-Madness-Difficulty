audio_play_sound(sfxSalvageStinger, 5, false);
audio_play_sound(voc_Salvage_Ending2, 5, false);
SoundPlaying = audio_play_sound(voc_Salvage_Ending2, 5, false);
SubtitleQueue = subtitle(voc_Salvage_Ending2);
CurrentSubtitleLine = 0;
Frame = 0;
OriginX = 0;
JumpX = 640;
JumpY = 720;
JumpAngle = 0;
SizeBody = 0.25;
SizeHead = 0.01;
SizeBody = 0;
Frame = 0;

function jump_origin(arg0, arg1)
{
    OriginX = arg0;
    JumpX = 320 + (320 * arg0);
    JumpY = 180 - (540 * arg1);
    JumpAngle = arg0 * 15;
    SizeBody = 0.01;
    SizeHead = 0.01;
    Frame = 0;
}

JawOffset = 0;
Side = 0;
SideVertical = -1;
Alpha = 1;
JumpscareID = 0;
JumpYSpeed = 90;
SizeBodySpeed = 0.2;
SizeHeadSpeed = 0.2;
YOffset = 0;
YOffsetSpeed = 0;
CutscenePosition = 0;
CutsceneQueue = [[0, 0, 0, 12], [1, 2, 0, 16], [1.22, 2, 0, 8], [1.37, 2, 0, 8], [1.52, 2, 0, 8], [1.67, 2, 0, 8], [1.79, 2, 0, 8], [1.92, 2, 0, 16], [2.35, 6, 0, 16], [2.67, 6, 0, 8], [2.86, 6, 0, 8], [2.99, 6, 0, 8], [3.11, 6, 0, 8], [3.23, 6, 0, 16], [4.2, 2, 1, 8], [6.4, 1, 1, 8], [7.3, 4, 1, 8], [10.6, 7, 1, 8], [12.2, 1, 0, 8], [13.6, 4, 0, 8], [15.6, 7, 1, 8], [18.7, 1, 1, 8], [22.8, 4, 1, 8], [25.9, 0, 1, 8], [27.9, 0, 0, 8], [29, 1, 0, 12], [32.8, 5, 2, 8], [34.9, 3, 2, 4], [35.5, 5, 2, 4], [36.7, 0, 2, 8]];

with (oCamera)
    Freeze = true;
