XPosition = 640;
Frame = 0;

if (global.Night == "Custom")
{
    Destination = CustomNightMenu;
}
else
{
    Destination = MinigameStartup;
    global.StartRoom = MinigameStartup;
    create_save();
}

Color = 0;
