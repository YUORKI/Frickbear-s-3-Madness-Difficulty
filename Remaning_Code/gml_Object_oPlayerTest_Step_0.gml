var MoveX = keyboard_check(ord("A")) - keyboard_check(ord("D"));
var MoveY = keyboard_check(ord("W")) - keyboard_check(ord("S"));
image_angle += ((keyboard_check(vk_left) - keyboard_check(vk_right)) * 5);
x += (MoveY * lengthdir_x(4, image_angle));
y += (MoveY * lengthdir_y(4, image_angle));
x += (MoveX * lengthdir_x(4, image_angle + 90));
y += (MoveX * lengthdir_y(4, image_angle + 90));
