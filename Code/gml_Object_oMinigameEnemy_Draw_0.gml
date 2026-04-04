draw_sprite_ext(sprite_index, image_index, round(x), round(y), 1, 1, 0, c_red, 1);
draw_triangle(x, y, x + lengthdir_x(sightdist, facing - (cone / 2)), y + lengthdir_y(sightdist, facing - (cone / 2)), x + lengthdir_x(sightdist, facing(cone / 2)), y + lengthdir_y(sightdist, facing + (cone / 2)), false);
