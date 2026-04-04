shader_set(TransparencyShader);

if (global.MonitorSystem == Text)
    image_index = 1;

draw_self();
draw_text(x + 5, y + 1, Text);

if (instance_exists(oMarionette))
{
    if (Text == "Reset Music" && global.Cam == 6)
    {
        if (oMarionette.ShowWarning)
            draw_sprite(sMarionetteWarning, 1, x + sprite_width, y + sprite_height);
        
        draw_pie(x + 104, y + 11, ceil(oMarionette.MusicTimer), oMarionette.MusicMax, 8421504, 8, 1);
    }
    
    if (Text == "Cameras" && global.MonitorSystem != "Cameras" && oMarionette.ShowWarning)
        draw_sprite(sMarionetteWarning, 1, x + sprite_width, y + sprite_height);
}

if (instance_exists(oSalvage_VentCrawler))
{
    if (Text == "Vents" && global.MonitorSystem != "Vents" && !(floor(oSalvage.VentWarningTimer / 15) % 2))
        draw_sprite(sMarionetteWarning, 1, -10 + x + sprite_width, -11 + y + sprite_height);
}

shader_reset();
