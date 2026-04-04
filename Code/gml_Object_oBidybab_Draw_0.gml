shader_set(TransparencyShader);
sprite_index = sBidybabs;
image_index = ((Camera - 1) * 4) + BabID;
x = global.CamX;
y = global.CamY;

if (global.Cam == Camera)
{
    depth = 80;
    draw_self();
    
    if (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxBaby, 1, false, 1, 0, random_range(0.75, 1.25));
        fuzz_up(Camera);
        
        with (oBaby)
            BidybabsLeft--;
        
        block_tokens();
        instance_destroy(self);
    }
}

shader_reset();
