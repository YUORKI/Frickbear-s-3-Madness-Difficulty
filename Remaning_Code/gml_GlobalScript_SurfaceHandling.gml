function surfaceHandling(arg0, arg1, arg2, arg3, arg4)
{
    var Sort = true;
    
    var SortFunc = function(arg0, arg1)
    {
        var Object1 = layer_instance_get_instance(arg0);
        var Object2 = layer_instance_get_instance(arg1);
        
        if (!variable_instance_exists(Object1, "DrawDepth"))
            Object1.DrawDepth = 0;
        
        if (!variable_instance_exists(Object2, "DrawDepth"))
            Object2.DrawDepth = 0;
        
        return Object1.DrawDepth - Object2.DrawDepth;
    };
    
    surface_set_target(arg0);
    draw_clear_alpha(c_black, 0);
    var list = layer_get_all_elements("Background");
    var i;
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    if (Sorted)
    {
        list = List_BehindWall;
    }
    else
    {
        list = layer_get_all_elements("Behind_Wall");
        array_sort(list, SortFunc);
        List_BehindWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    draw_sprite_ext(arg1, arg2, -sprite_get_width(arg1) / 2, sprite_get_height(arg1) * 1.5, 2, i.image_yscale * -2, 0, c_white, 1);
    
    if (arg3 == 576)
    {
        for (var s = 0; s < 20; s++)
        {
            if (!global.ClearedChallenges[s])
                continue;
            
            draw_sprite_ext(sCabinetStickers, s, ((585 - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((710 - arg4) * 2), 2, -2, 0, c_white, 1);
        }
    }
    
    if (Sorted)
    {
        list = List_OnWall;
    }
    else
    {
        list = layer_get_all_elements("OnWall");
        array_sort(list, SortFunc);
        List_OnWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    if (Sorted)
    {
        list = List_InFrontOfWall;
    }
    else
    {
        list = layer_get_all_elements("InFrontOf_Wall");
        array_sort(list, SortFunc);
        List_InFrontOfWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    surface_reset_target();
    return surface_get_texture(arg0);
    Sorted = true;
}
