global.PrevMouseX = global.MouseX;
global.PrevMouseY = global.MouseY;
global.MouseX = device_mouse_x_to_gui(0);
global.MouseY = device_mouse_y_to_gui(0);
global.Playtime += 0.016666666666666666;
global.RunTime += 0.016666666666666666;
Timer++;
GlobalTimer += 0.016666666666666666;
instance_activate_object(oDiscordTracker);
