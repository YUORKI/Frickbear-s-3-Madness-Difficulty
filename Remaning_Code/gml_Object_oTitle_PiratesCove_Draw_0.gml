event_inherited();
var AngleDiff = 360 / Sides;
var Angle = AngleDiff / -2;

while (Angle < (360 - (AngleDiff / 2)))
{
    var x1 = x + lengthdir_x(Radius, Angle + image_angle);
    var y1 = y + lengthdir_y(Radius, Angle + image_angle);
    var x2 = x + lengthdir_x(Radius, Angle + AngleDiff + image_angle);
    var y2 = y + lengthdir_y(Radius, Angle + AngleDiff + image_angle);
    
    if (Angle != (AngleDiff / -2))
    {
        VertexBuffer = vertex_create_buffer();
        vertex_begin(VertexBuffer, global.VertexFormat);
        vertex_set_point(VertexBuffer, x2, y2, fz(32), 1, 1);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, x2, y2, fz(128), 1, 0.25);
            vertex_set_point(VertexBuffer, x1, y1, fz(32), 0, 1);
        }
        
        vertex_set_point(VertexBuffer, x1, y1, fz(128), 0, 0.25);
        vertex_end(VertexBuffer);
        vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Curtain, 0));
        vertex_delete_buffer(VertexBuffer);
    }
    
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x2, y2, fz(0), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x2, y2, fz(32), 1, 0);
        vertex_set_point(VertexBuffer, x1, y1, fz(0), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, x1, y1, fz(32), 0, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_StageEdge, 0));
    vertex_delete_buffer(VertexBuffer);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, 32, 0, 1);
    vertex_set_point(VertexBuffer, x2, y2, 32, 1, 1);
    vertex_set_point(VertexBuffer, x, y, 32, 0.5, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_StageFloor, 0));
    vertex_delete_buffer(VertexBuffer);
    Angle += AngleDiff;
}
