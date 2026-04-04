set_target_to_ui();
var Phases = 5;
var HPPerPhase = MaxHP / Phases;
var BarX = 223;
var BarY = 321 + HPBarOffset + HPBarCursorOffset;
var Flash = SiphonCam != 0 && (floor(global.Timer * 2) % 2) == 0;
draw_sprite(sBossSalvage_HPBar, 0, BarX, BarY);

for (var b = 0; b < 5; b++)
{
    var BarPosX = BarX + 8 + (b * 39);
    var Color = 0;
    
    if (Flash)
        Color = 255;
    
    if (b >= floor(HP / HPPerPhase))
    {
        var BarWidth = 37 * ((HP % HPPerPhase) / HPPerPhase);
        draw_rectangle_color(BarPosX, BarY + 23, BarPosX + BarWidth, BarY + 28, Color, Color, Color, Color, false);
        break;
    }
    else
    {
        draw_rectangle_color(BarPosX, BarY + 23, BarPosX + 37, BarY + 28, Color, Color, Color, Color, false);
    }
}

if (Flash)
    draw_sprite(sMarionetteWarning, 1, 220, 336);

surface_reset_target();
HPBarSpeed = lerp(HPBarSpeed, (0 - HPBarOffset) * 0.5, 0.2);
HPBarOffset += HPBarSpeed;
HPBarCursorOffset -= (HPBarCursorOffset / 5);
