draw_clear(c_black);
var Camera = camera_get_active();
camera_set_view_mat(Camera, matrix_build_lookat(CameraX, CameraY, CameraZ, CameraXTo, CameraYTo, CameraZTo, 0, 0, -1));
camera_set_proj_mat(Camera, matrix_build_projection_perspective_fov(FOV, -1.7777777777777777, 1, 32000));
camera_apply(Camera);
ViewMat = camera_get_view_mat(Camera);
ProjMat = camera_get_proj_mat(Camera);
audio_listener_position(x, y, depth);
audio_listener_orientation(lengthdir_x(1, CameraRotationH), lengthdir_y(1, CameraRotationH), 0, 0, 0, 1);
