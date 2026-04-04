var TileX = 0;
var TileY = 0;
var i = 0;

repeat (6)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_white, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (7)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_red, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (7)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_blue, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (7)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_green, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (7)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_purple, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (6)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_fuchsia, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}

TileX = 0;
TileY += 48;

repeat (7)
{
    draw_sprite_ext(sVentButton, 0, TileX + 24, TileY + 24, 1, 1, 0, c_orange, 1);
    draw_sprite(sCustomNightFaces, Arrangement[i], TileX, TileY);
    TileX += 48;
    i++;
}
