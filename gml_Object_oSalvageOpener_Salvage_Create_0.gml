audio_group_load(voc_ToyFreddy_HardlyGaming);
BodyY = 160;
BodyYSpeed = 0;
BodyYTarget = BodyY;
BodyYSnappiness = 0.5;
BodyYBounce = 0.2;
BodyAngle = 75;
BodyAngleSpeed = 0;
BodyAngleTarget = BodyAngle;
BodyAngleSnappiness = BodyYSnappiness;
BodyAngleBounce = BodyYBounce;
BodyImage = -1;
CurrentBodyImage = BodyImage;
HeadY = 0;
HeadYSpeed = 0;
HeadYTarget = HeadY;
HeadYSnappiness = 0.5;
HeadYBounce = 0.2;
HeadAngle = 90;
HeadAngleSpeed = 0;
HeadAngleTarget = HeadAngle;
HeadAngleSnappiness = HeadYSnappiness;
HeadAngleBounce = HeadYBounce;
HeadImage = -2;
CurrentHeadImage = HeadImage;
SequenceStep = 0;
NextPoint = 0;
var GuardLines = [voc_Salvage_Open2_Jeremy, voc_Salvage_Open2_Mike, voc_Salvage_Open2_Vanessa, voc_Salvage_Open2_Fritz, voc_Salvage_Open2_Generic];
var GuardLine = GuardLines[min(global.Guard, 4)];
var GuardName = string_lower(guard_nickname());

if (GuardName == "luigi")
    GuardLine = voc_Salvage_Open2_Luigi;

if (GuardName == "sonic")
    GuardLine = voc_Salvage_Open2_Sonic;

if (GuardName == "goomba")
    GuardLine = voc_Salvage_Open2_Goomba;

if (GuardName == "spongebob")
    GuardLine = voc_Salvage_Open2_Spongebob;

if (GuardName == "strongbad" || GuardName == "strong bad")
    GuardLine = voc_Salvage_Open2_StrongBad;

if (GuardName == "batman" || GuardName == "bat man")
    GuardLine = voc_Salvage_Open2_Batman;

if (GuardName == "bowser")
    GuardLine = voc_Salvage_Open2_Bowser;

if (GuardName == "jack" || GuardName == "jack kennedy")
    GuardLine = voc_Salvage_Open2_Jack;

if (GuardName == "phisnom" || GuardName == "phi")
    GuardLine = voc_Salvage_Open2_Phisnom;

SoundQueue = [voc_Salvage_Open1, GuardLine, (global.Guard == 3) ? voc_Salvage_Open3_Fritz : voc_Salvage_Open3, voc_Salvage_Open4, voc_Salvage_Open5];
SoundQueuePos = 0;
SoundPlaying = audio_play_sound(voc_Salvage_Open1, 5, false);
SubtitleQueue = subtitle(voc_Salvage_Open1);
CurrentSubtitleLine = 0;
Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Body = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Frame = 0;
FadingOut = 0;
