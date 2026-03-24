event_inherited();

function ax(arg0, arg1)
{
    return x + lengthdir_x(arg0, arg1 + image_angle);
}

function ay(arg0, arg1)
{
    return y + lengthdir_y(arg0, arg1 + image_angle);
}

function az(arg0)
{
    return round(depth + arg0);
}

VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);

for (var angle = 0; angle < 360; angle += 45)
{
    vertex_set_point(VertexBuffer, ax(8, angle), ay(8, angle), fz(Height), angle / 180, 2);
    vertex_set_point(VertexBuffer, x, y, fz(Height + 16), 0, 0);
    vertex_set_point(VertexBuffer, ax(8, angle + 45), ay(8, angle + 45), fz(Height), (angle + 45) / 180, 2);
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_PartyHat, Image));
vertex_delete_buffer(VertexBuffer);
