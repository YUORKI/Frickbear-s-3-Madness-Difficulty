if (QuitSelected)
{
    if (global.Night == "Custom")
        room_goto(Extras);
    else
        game_end();
}
else
{
    room_goto(FredbearHome);
}
