with (instance_create_depth(0, 0, 0, oTextBox_Fredbear))
{
    game_text("Microgame_Quiz");
    TextSpeed = global.MicrogameSpeed;
}

global.MicrogameWin = false;
instance_create_depth(0, 0, 0, o3DMaze_CameraLocker);

with (instance_create_depth(160, 160, 0, oInteraction_Animatronic))
{
    AnimatronicID = 47;
    Height = get_animatronic_height(47);
}
