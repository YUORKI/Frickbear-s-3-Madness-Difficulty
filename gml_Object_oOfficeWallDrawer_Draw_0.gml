shader_set(TransparencyShader);
set_target_to_wall(0);
draw_sprite(sOfficeWallFront, 0, 0, 0);
draw_sprite_ext(sOfficeWallFront, 0, -sprite_get_width(sOfficeWallFront) / 2, sprite_get_height(sOfficeWallFront) * 1.5, 2, -2, 0, c_white, 1);
surface_reset_target();
