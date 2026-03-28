if (instance_exists(oFredbearManager))
{
    draw_clear_alpha(c_black, 0);
    application_surface_draw_enable(false);
    instance_destroy();
}
else if (!instance_exists(oTextBox))
{
    with (instance_create_depth(0, 0, depth - 1, oTextBox))
    {
        game_text("FredbearFightOpener");
        TextBoxSprite = sNOTHING;
    }
}
