x = 95;
y = YOffset + 82;
YOffset -= (YOffset / 5);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_self();
draw_sprite(FaceSprites, global.Guard, x + 6, y + 26);
var TileX = 0;
var TileY = 0;

for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
{
    if (array_length(global.AllTimeSalvages) > 16)
    {
        TileX = (i % 15) * 24;
        TileY = 48 * floor(i / 15);
    }
    else
    {
        TileX = (i % 8) * 48;
        TileY = 48 * floor(i / 8);
    }
    
    draw_sprite(sCustomNightFaces, global.AllTimeSalvages[i], x + 60 + TileX, y + 26 + TileY);
}

shader_set(shRecolor);
var Pal = [16777215, 11316396, 5263440, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
var Tile = 0;
TileX = 0;

for (var i = 0; i < array_length(global.Upgrades); i++)
{
    if (array_length(global.Upgrades) > 12)
        TileX = Tile * 16;
    else
        TileX = Tile * 32;
    
    draw_sprite(sShopItemSalvageIcons, global.Upgrades[i], x + 60 + TileX + 16, y + 128 + 16);
    Tile++;
}

shader_reset();
draw_text(x + 6, y + 75, "Deaths:");
draw_text(x + 6, y + 114, "Earnings:");
draw_text(x + 6, y + 153, "Time:");
draw_set_halign(fa_right);
draw_text(x + 57, y + 95, string(DeathAmount));
draw_text(x + 57, y + 134, "$" + EarningAmount);
draw_text(x + 57, y + 173, TimeAmount);
draw_set_halign(fa_center);
draw_text(x + 225, y + 167, "Press space to continue.");

if (round(YOffset) == 0 && input_check_pressed(UnknownEnum.Value_0) && !instance_exists(oTransitionMinigame))
{
    audio_sound_gain(musCredits, 0, 1000);
    audio_sound_gain(mus_Cassidy, 0, 1000);
    global.CanContinue = false;
    create_save();
    save_permanent_data();
    
    with (instance_create_depth(0, 0, 0, oTransitionMinigame))
        Destination = PFFCloser;
}

enum UnknownEnum
{
    Value_0
}
