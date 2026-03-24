draw_sprite(sprite_index, 0, 320, 360 + YOffset);
draw_set_halign(fa_center);
draw_set_font(global.FontHanddrawn);
draw_text_color(320, 40 + YOffset, "BEAR IN MIND!", c_red, c_red, c_red, c_red, 1);
draw_set_font(global.FontW97Black);

if (!global.FredbearMode)
{
    draw_text_ext(320, 78 + YOffset, "While deliberately very goofy and unthreatening in tone, this game still contains plenty of rapidly flashing lights, loud noises, and, you guessed it, jumpscares! If you're prone to epilepsy or are easily frightened by cartoon bears, this game may not be for you.", 16, 224);
    draw_text_ext(320, 190 + YOffset, "Additionally, this game heavily relies on audio cues. It's highly recommended you wear a good pair of stereo headphones or earbuds before playing.", 16, 224);
    draw_text_ext(320, 270 + YOffset, "If you accept these terms and conditions, press space to proceed.", 16, 224);
    draw_text(320, 319 + YOffset, "Thank you! -Management");
}
else
{
    draw_text_ext(320, 78 + YOffset, "If you keep trying, I'll just keep killing you.", 16, 224);
    draw_text(320, 319 + YOffset, "Don't be a hero. -Your Pal, Fredbear");
}

if (input_check_pressed(UnknownEnum.Value_0))
{
    audio_play_sound(sfxClick, 10, false);
    room_goto(TitleScreenMap);
    apply_settings(false);
}

YOffset += ((0 - YOffset) / 10);

enum UnknownEnum
{
    Value_0
}
