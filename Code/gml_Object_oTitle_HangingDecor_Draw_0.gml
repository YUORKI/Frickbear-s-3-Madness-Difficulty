event_inherited();

if (FacePlayer)
    image_angle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;

var x1 = x - lengthdir_x(sprite_width / 2, image_angle);
var y1 = y - lengthdir_y(sprite_width / 2, image_angle);
var x2 = x + lengthdir_x(sprite_width / 2, image_angle);
var y2 = y + lengthdir_y(sprite_width / 2, image_angle);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var Segment = 0;
var s = 0;

while (s < image_xscale)
{
    var SegmentRatio = s / image_xscale;
    var HeightOffset = sin(SegmentRatio * pi);
    var zTop = Height - (HeightOffset * ValleyHeight);
    var zBottom = zTop - 16;
    var zTopNext = Height - (sin(((s + 0.5) / image_xscale) * pi) * ValleyHeight);
    var zBottomNext = zTopNext - 16;
    var sub_x1 = (x1 * (1 - SegmentRatio)) + (x2 * SegmentRatio);
    var sub_y1 = (y1 * (1 - SegmentRatio)) + (y2 * SegmentRatio);
    SegmentRatio = (s + 0.5) / image_xscale;
    var sub_x2 = (x1 * (1 - SegmentRatio)) + (x2 * SegmentRatio);
    var sub_y2 = (y1 * (1 - SegmentRatio)) + (y2 * SegmentRatio);
    var TexC1 = (Segment % 2) / 2;
    var TexC2 = TexC1 + 0.5;
    vertex_set_point(VertexBuffer, sub_x1, sub_y1, zTop, TexC1, 0);
    vertex_set_point(VertexBuffer, sub_x2, sub_y2, zBottomNext, TexC2, 1);
    vertex_set_point(VertexBuffer, sub_x1, sub_y1, zBottom, TexC1, 1);
    vertex_set_point(VertexBuffer, sub_x1, sub_y1, zTop, TexC1, 0);
    vertex_set_point(VertexBuffer, sub_x2, sub_y2, zBottomNext, TexC2, 1);
    vertex_set_point(VertexBuffer, sub_x2, sub_y2, zTopNext, TexC2, 0);
    Segment++;
    s += 0.5;
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(Sprite, 0));
vertex_delete_buffer(VertexBuffer);
