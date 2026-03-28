set_target_to_ui();
var Vibration = (Frame / 5) + 1;
var FrameVal = 1 - (floor(Frame) % 3);
var Offset = (round(((FrameVal * 2) / Vibration) * 80) / 10) + (sqrt(Frame) * OriginX * 2);
draw_sprite_ext(sJumpscareEndo, 0, JumpX + Offset, JumpY, SizeBody, SizeBody, 0, -1, 1);
draw_sprite_ext(sJumpscareEndo, 1, JumpX, JumpY, SizeHead, SizeHead, Offset, -1, 1);
draw_sprite_ext(sEndoDeathJaw, 0, 320, -360 + JawOffset, 1, 1, 0, c_white, 1);
draw_sprite_ext(sEndoDeathJaw, 0, 320, 720 - JawOffset, 1, -1, 0, c_white, 1);
surface_reset_target();
