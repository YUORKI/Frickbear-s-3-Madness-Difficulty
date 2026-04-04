if (!oCustomNightMenu.ChallengesOpen)
{
    image_index = global.Cheats[CheatID];
    
    if (touching_mouse() && mouse_check_button_pressed(mb_left))
    {
        global.Cheats[CheatID] = !global.Cheats[CheatID];
        audio_play_sound(sfxBump, 5, false);
    }
    
    draw_self();
    draw_text(x + 19, y - 3, Text);
}
