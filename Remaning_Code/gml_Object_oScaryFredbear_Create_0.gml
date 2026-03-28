with (instance_create_depth(0, 0, 0, oTextBox))
{
    game_text("FredbearMonologue");
    TextBoxSprite = sNOTHING;
}

depth = 10;
Frame = 0;
audio_stop_all();
FadeIn = false;
ShowMasks = false;
FadeSpeed = 15;
FadeOffset = 640;
FadeOffsetHeads = 640;
Eyes = UnknownEnum.Value_4;
EntranceFrame = 0;
EyeOffset = 0;
EyeOffsetSpeed = 0;

enum UnknownEnum
{
    Value_4 = 4
}
