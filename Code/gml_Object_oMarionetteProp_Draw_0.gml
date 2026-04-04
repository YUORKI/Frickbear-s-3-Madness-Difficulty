depth = (dsin(Timer / 2) * 2) + HeightOffset;
pw = 4;
ph = 4;
shader_set(TransparencyShader);
var Texture = sprite_get_texture(sMazeTex_Marionette, 0);

function fx(arg0, arg1)
{
    return (x + (arg0 * dcos(image_angle))) - (arg1 * dsin(image_angle));
}

function fy(arg0, arg1)
{
    return y + (arg1 * dcos(image_angle)) + (arg0 * dsin(image_angle));
}

function fz(arg0)
{
    return depth + arg0;
}

tcoord_x = 0;
tcoord_y = 0;
coords = [];

function set_points()
{
    vertex_set_point(VertexBuffer, fx(coords[0][0], coords[0][1]), fy(coords[0][0], coords[0][1]), fz(coords[0][2]), (tcoord_x + 1) / pw, (tcoord_y + 1) / ph);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(coords[1][0], coords[1][1]), fy(coords[1][0], coords[1][1]), fz(coords[1][2]), (tcoord_x + 1) / pw, tcoord_y / ph);
        vertex_set_point(VertexBuffer, fx(coords[2][0], coords[2][1]), fy(coords[2][0], coords[2][1]), fz(coords[2][2]), tcoord_x / pw, (tcoord_y + 1) / ph);
    }
    
    vertex_set_point(VertexBuffer, fx(coords[3][0], coords[3][1]), fy(coords[3][0], coords[3][1]), fz(coords[3][2]), tcoord_x / pw, tcoord_y / ph);
}

VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);

if (Activated)
{
    tcoord_x = 1;
    tcoord_y = 0;
}
else
{
    tcoord_x = 0;
    tcoord_y = 0;
}

coords = [[16, 7.8494, 89.8899], [16, 13.4061, 121.4085], [-16, 7.8494, 89.8899], [-16, 13.4061, 121.4085]];
set_points();

if (Activated)
{
    tcoord_x = 3;
    tcoord_y = 0;
}
else
{
    tcoord_x = 2;
    tcoord_y = 0;
}

coords = [[16, 5.8798, 90.2387], [16, 11.4366, 121.7518], [-16, 5.8798, 90.2387], [-16, 11.4366, 121.7518]];
set_points();
tcoord_x = 0;
tcoord_y = 1;
coords = [[16, -13.5612, 74.1168], [16, 9.065, 96.7841], [-16, -13.5612, 74.1168], [-16, 9.065, 96.7841]];
set_points();
tcoord_x = 0;
tcoord_y = 2;
coords = [[16, -27.0682, 45.155], [16, -13.5612, 74.1168], [-16, -27.0682, 45.155], [-16, -13.5612, 74.1168]];
set_points();
tcoord_x = 0;
tcoord_y = 3;
coords = [[16, -27.0682, 13.155], [16, -27.0682, 45.155], [-16, -27.0682, 13.155], [-16, -27.0682, 45.155]];
set_points();
tcoord_x = 1;
tcoord_y = 1;
coords = [[27.9567, 50.843, 64.9057], [27.9567, 28.2148, 42.2992], [0.2439, 62.1567, 53.592], [0.2439, 39.5293, 30.7646]];
set_points();
tcoord_x = 2;
tcoord_y = 1;
coords = [[33.514, 28.6394, 87.1888], [33.514, 5.9319, 64.5619], [27.9567, 50.843, 64.9057], [27.9567, 28.2148, 42.2992]];
set_points();
tcoord_x = 3;
tcoord_y = 1;
coords = [[9, 14.0157, 101.74], [9, -8.6127, 79.1056], [33.514, 28.6394, 87.1888], [33.514, 5.9319, 64.5619]];
set_points();
tcoord_x = 1;
tcoord_y = 1;
coords = [[-27.9567, 28.2148, 42.2992], [-27.9567, 50.843, 64.9057], [-0.2439, 39.5293, 30.7646], [-0.2439, 62.1567, 53.592]];
set_points();
tcoord_x = 2;
tcoord_y = 1;
coords = [[-33.514, 5.9319, 64.5619], [-33.514, 28.6394, 87.1888], [-27.9567, 28.2148, 42.2992], [-27.9567, 50.843, 64.9057]];
set_points();
tcoord_x = 3;
tcoord_y = 1;
coords = [[-9, -8.6127, 79.1056], [-9, 14.0157, 101.74], [-33.514, 5.9319, 64.5619], [-33.514, 28.6394, 87.1888]];
set_points();
tcoord_x = 1;
tcoord_y = 2;
coords = [[-25, 18.3218, 128], [-25, 18.3218, 75.1929], [-41, 18.3218, 128], [-41, 18.3218, 75.1929]];
set_points();
tcoord_x = 1;
tcoord_y = 2;
coords = [[25, 18.3218, 128], [25, 18.3218, 75.1929], [41, 18.3218, 128], [41, 18.3218, 75.1929]];
set_points();

if (!Activated && Holding == 2)
{
    switch (global.Night)
    {
        default:
            tcoord_x = 2;
            tcoord_y = 2;
            break;
        
        case 2:
            tcoord_x = 3;
            tcoord_y = 2;
            break;
        
        case 3:
            tcoord_x = 1;
            tcoord_y = 3;
            break;
        
        case 4:
            tcoord_x = 2;
            tcoord_y = 3;
            break;
    }
    
    coords = [[16, 46.9056, 46.8431], [16, 46.9056, 78.8431], [-16, 46.9056, 46.8431], [-16, 46.9056, 78.8431]];
    set_points();
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
shader_reset();
Timer += 1;
var CanAppear = (array_length(global.SalvagesCurrent) >= global.SalvageQuota || Holding == 2) && (has_been_good() || global.Night == 1);

if (CanAppear && Holding != 1)
{
    HeightOffset += ((0 - HeightOffset) / 20);
    x = OriginalX;
    y = OriginalY;
}
else
{
    HeightOffset += ((128 - HeightOffset) / 10);
}
