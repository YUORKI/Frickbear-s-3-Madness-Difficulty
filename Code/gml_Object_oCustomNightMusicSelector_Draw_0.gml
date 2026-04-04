x = 484;
y = 299;
depth = oCustomNightMenu.depth - 1;

if (oCustomNightMenu.ChallengesOpen)
    exit;

var Image = 0;

if (TimeSetting == 0)
    Image = 1;
else if (TimeSetting == (array_length(SettingsArray) - 1))
    Image = 2;

if (clicked(x, y, 16, 22) && Image != 1)
{
    Image = 1;
    TimeSetting--;
    Text = SettingsArray[TimeSetting][0];
    global.CustomNightMusic = SettingsArray[TimeSetting][1];
    audio_play_sound(sfxBump, 2, false);
}

if (clicked(x + 88, y, 16, 22) && Image != 2)
{
    Image = 2;
    TimeSetting++;
    Text = SettingsArray[TimeSetting][0];
    global.CustomNightMusic = SettingsArray[TimeSetting][1];
    audio_play_sound(sfxBump, 2, false);
}

image_index = Image + 3;
draw_self();
draw_set_halign(fa_right);
draw_text(x + 82, y + 1, Text);
draw_set_halign(fa_left);
