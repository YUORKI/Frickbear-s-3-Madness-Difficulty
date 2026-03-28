var PhoneButtonX = 320;
var ButtonWidth = 80;
var ButtonHeight = 24;

if (global.BossPhase > 0 || global.Night == "Custom" || (mouse_in_zone(PhoneButtonX - (ButtonWidth / 2), PhoneButtonY - (ButtonHeight / 2), ButtonWidth, ButtonHeight) && mouse_check_button_pressed(mb_left)))
{
    audio_stop_all();
    
    with (oCamera)
        start_salvage_fight();
    
    instance_destroy(oSalvageOpener_Vanny);
    instance_destroy(oSalvageOpener_Salvage);
    instance_destroy(oSalvageOpener_DeadVanny);
}

PhoneButtonY += ((336 - PhoneButtonY) / 10);
set_target_to_ui();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.FontW97Black);
var Text = "Skip";
draw_sprite_stretched(sWindowBase, 0, PhoneButtonX - (ButtonWidth / 2), PhoneButtonY, ButtonWidth, ButtonHeight);
draw_text(PhoneButtonX, (PhoneButtonY + (ButtonHeight / 2)) - 2, Text);
surface_reset_target();
