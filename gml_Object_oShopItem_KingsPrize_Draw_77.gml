set_target_to_ui();
x = 320;

if (Frame == 0)
    y = -32;

SlotSpeed -= 0.2857142857142857;
SlotSpeed = max(SlotSpeed, 0);

if (Frame == 200)
{
    SlotSpeed = 0;
    CurrentImage = floor(CurrentImage);
    ItemChosen.Function();
}

CurrentImage = (CurrentImage + (SlotSpeed / 60)) % 11;
draw_sprite(sKingsPrizeRoulette, floor(CurrentImage), x, y);

if (Frame >= 200 && Frame < 360)
{
    var Text = ItemChosen.Description;
    draw_set_halign(fa_center);
    var BoxWidth = string_width_ext(Text, 14, 180) + 14;
    var BoxHeight = string_height_ext(Text, 14, 180) + 10;
    draw_sprite_stretched(sTextBox_Windows, 0, x - (BoxWidth / 2), (y + 36) - 3, BoxWidth, BoxHeight);
    draw_text_ext(x, y + 36, Text, 14, 180);
}
else if (Frame >= 360)
{
    y -= ((35 - y) / 5);
    
    if (y < -56)
        instance_destroy();
    
    if (ItemChosen.Image == 10 && Frame == 360)
    {
        with (oFuntimeChica)
        {
            if (WillKill)
                jumpscare(UnknownEnum.Value_47, 0);
        }
    }
}
else
{
    y += ((32 - y) / 10);
}

Frame++;
surface_reset_target();

enum UnknownEnum
{
    Value_47 = 47
}
