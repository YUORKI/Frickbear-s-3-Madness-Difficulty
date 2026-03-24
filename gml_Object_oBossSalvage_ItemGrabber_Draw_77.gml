set_target_to_ui();

if (x > -160 && !ItemsGrabbed)
{
    audio_play_sound(sfxScoop, 10, false);
    
    for (var i = 0; i < instance_number(oShopItem); i++)
    {
        var Object = instance_find(oShopItem, i);
        array_push(ItemArray, Object.image_index);
        array_push(ItemOffsets, Object.x - x);
    }
    
    instance_destroy(oShopItem);
    ItemsGrabbed = true;
    ItemShift = 0.1;
}

if (Frame == 60)
{
    Target = -400;
    Speed = 30;
    audio_play_sound(sfxSalvage_WireShoot, 10, false);
}

if (x < -400 && Frame > 60)
    instance_destroy();

ItemShiftSpeed = lerp(ItemShiftSpeed, (1 - ItemShift) * 0.2, 0.2);
ItemShift += ItemShiftSpeed;
Speed = lerp(Speed, (Target - x) * 0.2, 0.2);
x += Speed;
draw_self();

for (var i = 0; i < array_length(ItemArray); i++)
{
    draw_sprite(sShopItemIcons, ItemArray[i], ItemOffsets[i] + x, (y + (ItemShift * 5)) - 8);
    draw_sprite_ext(sBossSalvage_ItemGrabber_Coil, 0, ItemOffsets[i] + x, (y + (ItemShift * 5)) - 8, ItemShift, ItemShift, 0, c_white, 1);
}

Frame++;
surface_reset_target();
