draw_surface_ext(global.MinigameSurface, 0, 0, 1, 1, 0, c_white, 1);
exit;

if (keyboard_check_pressed(ord("1")))
    load_level(1);

if (keyboard_check_pressed(ord("2")))
    load_level(2);

if (keyboard_check_pressed(ord("3")))
    load_level(3);

if (keyboard_check_pressed(ord("4")))
    load_level(4);

if (keyboard_check_pressed(ord("5")))
    load_level(5);

if (keyboard_check_pressed(vk_numpad1))
    save_level(1);

if (keyboard_check_pressed(vk_numpad2))
    save_level(2);

if (keyboard_check_pressed(vk_numpad3))
    save_level(3);

if (keyboard_check_pressed(vk_numpad4))
    save_level(4);

if (keyboard_check_pressed(vk_numpad5))
    save_level(5);
