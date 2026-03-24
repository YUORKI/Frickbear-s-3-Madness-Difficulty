Frame = 0;
Alpha = 0;
texturegroup_load("DeathScreen");

if (global.Jumpscare == -1)
{
    Tip = "You passed out.";
}
else
{
    Tip = get_tips(global.Jumpscare);
    
    if (global.Jumpscare == UnknownEnum.Value_49)
        Tip = choose("The flashlight will force Salvage to move faster.", "Salvage will always go for the doors after being zapped, and will typically go for the breakers after that.", "Wires in the vents will squeak when they first appear. Listen out for them.");
}

application_surface_draw_enable(true);
SelectedOption = 0;
OptionOffset = 0;
ExitFrame = 0;
ExitDegree = 0;
audio_listener_position(0, 0, 0);
SubtitleList = [];
SubtitleTimingList = [];
SubtitleEntry = 0;
SoundPlaying = undefined;
Sound = undefined;
CustomDeathscreen = skin_sprite(sNOTHING, global.Jumpscare, "jumpscare_deathscreen.png", 1, 320, 320);

enum UnknownEnum
{
    Value_49 = 49
}
