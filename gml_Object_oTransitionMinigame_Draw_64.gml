depth = -1;

if (instance_exists(oCamera3DMaze))
    Color = 0;

draw_set_color(Color);
var X = round(XPosition);
draw_sprite_part_ext(sTransitionMinigame, 0, 0, 0, 640 - X, 360, X, 0, 1, 1, Color, 1);

if (X < 0)
    draw_rectangle(X + 640, 0, X + 1280, 360, false);

if (X < -640)
    draw_sprite_part_ext(sTransitionMinigame, 1, 0, 0, -640 - X, 360, X + 1280, 0, 1, 1, Color, 1);

if (Frame < 60)
    XPosition += ((-640 - XPosition) / 10);

if (Frame == 120)
    room_goto(Destination);
else if (Frame > 120)
    XPosition += ((-640 + XPosition) / 40);

if (XPosition < -1920)
    instance_destroy();

draw_set_color(c_white);
Frame += 1;
