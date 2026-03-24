Frame = 0;
Stage = "ShowStage";
WaitTime = 90;
EyeSize = 0;
BaseY = 640;
Side = -1;
RandomValue = random_range(0.75, 1.25);
ID = UnknownEnum.Value_0;
AI = global.AILevels[ID];
SPRITE_Cameras = skin_sprite(sCameras_Freddy, UnknownEnum.Value_0, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png", "sprite_05.png", "sprite_06.png"]);
SOUND_Laugh1 = skin_sound(sfxFreddyLaugh1, UnknownEnum.Value_0, "sq_move1");
SOUND_Laugh2 = skin_sound(sfxFreddyLaugh2, UnknownEnum.Value_0, "sq_move2");

enum UnknownEnum
{
    Value_0
}
