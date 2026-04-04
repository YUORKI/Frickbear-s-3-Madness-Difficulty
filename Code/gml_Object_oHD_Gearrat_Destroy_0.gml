with (instance_create_depth(x, y, depth, oHD_Respawner))
{
    Object = other.object_index;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
}

instance_create_depth(x, y, depth, oHD_Puff);
