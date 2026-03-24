var LetterPos = [];

for (var i = 0; i < 5; i++)
    LetterPos[i] = [round(random_range(-1 * LetterVibrate, LetterVibrate)), round(random_range(-1 * LetterVibrate, LetterVibrate))];

if (!surface_exists(Surf))
    Surf = surface_create(640, 360);

surface_set_target(Surf);
draw_clear_alpha(c_white, 0);
draw_sprite(sMCISpringtrapSlashCutscene, 0, 0, round(YOffset));
draw_sprite(sMCISpringtrapSlashCutscene, 1, 0, round(YOffset));
draw_rectangle_color(0, -360 + round(YOffset), 640, 0 + round(YOffset), c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 360 + round(YOffset), 640, 720 + round(YOffset), c_black, c_black, c_black, c_black, false);
gpu_set_colorwriteenable(1, 1, 1, 0);

for (var i = 0; i < 5; i++)
    draw_sprite_ext(sMCISpringtrapSlashCutscene, 2 + i, LetterPos[i][0], LetterPos[i][1], 1, 1, 0, c_red, 1);

surface_reset_target();
gpu_set_colorwriteenable(1, 1, 1, 1);
draw_rectangle_color(0, 0, 640, 360, c_red, c_red, c_red, c_red, false);

for (var i = 0; i < 5; i++)
    draw_sprite_ext(sMCISpringtrapSlashCutscene, 2 + i, LetterPos[i][0], LetterPos[i][1], 1, 1, 0, c_white, 1);

draw_surface(Surf, 0, 0);
LetterVibrate *= 0.97;
YSpeed = lerp(YSpeed, (0 - YOffset) * 0.99, 0.2);
YOffset += YSpeed;
draw_set_alpha(Alpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
Alpha += (1/120);

if (Alpha >= 1)
    instance_destroy();
