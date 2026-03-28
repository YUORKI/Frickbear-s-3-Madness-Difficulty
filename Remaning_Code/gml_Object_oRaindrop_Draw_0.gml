image_angle = 0;
var x1 = x - 0.125;
var y1 = y - 0.125;
var x2 = x + 0.125;
var y2 = y + 0.125;
shader_set(TransparencyShaderAlpha);
shader_set_uniform_f(shader_get_uniform(TransparencyShaderAlpha, "Alpha_Value"), 0.5);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x1, y1, depth + 4, 0, 0);
vertex_set_point(VertexBuffer, x2, y2, depth, 1, 1);
vertex_set_point(VertexBuffer, x1, y1, depth, 0, 1);
vertex_set_point(VertexBuffer, x1, y1, depth + 4, 0, 0);
vertex_set_point(VertexBuffer, x2, y2, depth, 1, 1);
vertex_set_point(VertexBuffer, x2, y2, depth + 4, 1, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, -1);
vertex_delete_buffer(VertexBuffer);
shader_reset();
depth -= 8;

if (depth < 0)
    instance_destroy();
