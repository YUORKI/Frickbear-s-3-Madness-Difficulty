shader_reset();
draw_clear(c_black);
var Camera = camera_get_active();
draw_set_font(global.FontW97Black);
var MouseY = (mouse_y * -1) + (room_height / 2);
var CamRotationH = (device_mouse_x_to_gui(0) - (room_width / 2)) / 3;
CamRotationH = clamp(CamRotationH, -90, 90);
var CamRotationV = 256;

if (MonitorUp)
    CamRotationH = 180;

if (global.CamUp)
    CamRotationH = 0;

var CamXToTarget = x - (dsin(CamRotationH) * 128);
var CamYToTarget = y - (dcos(CamRotationH) * 128);
var CamZToTarget = CamRotationV;
CameraX = x;
CameraY = y;
CameraZ = 256;

if (Freeze)
{
    CameraXTo += ((x - CameraXTo) * approach_factor(0.2, global.MicrogameSpeed));
    CameraYTo += ((y - 32 - CameraYTo) * approach_factor(0.2, global.MicrogameSpeed));
    CameraZTo += ((275 - CameraZTo) * approach_factor(0.2, global.MicrogameSpeed));
}
else
{
    CameraXTo += ((CamXToTarget - CameraXTo) * approach_factor(1/15, global.MicrogameSpeed));
    CameraYTo += ((CamYToTarget - CameraYTo) * approach_factor(1/15, global.MicrogameSpeed));
    CameraZTo += ((CamZToTarget - CameraZTo) * approach_factor(1/15, global.MicrogameSpeed));
}

CameraRotation = point_direction(CameraX, CameraY, CameraXTo, CameraYTo);
camera_set_view_mat(Camera, matrix_build_lookat(CameraX, CameraY, CameraZ, CameraXTo, CameraYTo, CameraZTo, 0, 0, -1));
camera_set_proj_mat(Camera, matrix_build_projection_perspective_fov(FOV, 1.7777777777777777, 1, 32000));
camera_apply(Camera);
ViewMat = camera_get_view_mat(Camera);
ProjMat = camera_get_proj_mat(Camera);
var ModifiedRotation = lerp(CameraRotation, 90, 0.75);
audio_listener_position(x, y, depth);
audio_listener_orientation(-dcos(ModifiedRotation), -dsin(ModifiedRotation), 0, 0, 0, -1);

if (global.CamUp && round(CamAnimation * 100) == 100)
{
    global.GoGreen = false;
    CamAlpha = max(CamAlpha - 0.1, 0);
    var CamDirection = 90;
    var CamZoom = 1;
    var SecurityCamX = 960;
    var SecurityCamY = 180;
    var vm = matrix_build_lookat(SecurityCamX, SecurityCamY, -10, SecurityCamX, SecurityCamY, 0, dcos(CamDirection), dsin(CamDirection), 0);
    var pm = matrix_build_projection_ortho(640 * CamZoom, 360 * CamZoom, 1, 10000000);
    camera_set_view_mat(Camera, vm);
    camera_set_proj_mat(Camera, pm);
    camera_apply(Camera);
}
else
{
    CamAlpha = 1;
    global.GoGreen = true;
}

draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
