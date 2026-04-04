for (var degree = 0; degree < 180; degree += 30)
{
    var next_degree = degree + 30;
    var inner_x1 = x + lengthdir_x(32, degree);
    var inner_y1 = y - lengthdir_y(32, degree);
    var inner_x2 = x + lengthdir_x(32, next_degree);
    var inner_y2 = y - lengthdir_y(32, next_degree);
    var outer_x1 = x + lengthdir_x(48, degree);
    var outer_y1 = y - lengthdir_y(48, degree);
    var outer_x2 = x + lengthdir_x(48, next_degree);
    var outer_y2 = y - lengthdir_y(48, next_degree);
    draw_line(inner_x1, inner_y1, inner_x2, inner_y2);
    draw_line(outer_x1, outer_y1, outer_x2, outer_y2);
    draw_line(inner_x1, inner_y1, outer_x1, outer_y1);
    draw_line(inner_x2, inner_y2, outer_x2, outer_y2);
}

draw_circle(x, y, 8, false);
