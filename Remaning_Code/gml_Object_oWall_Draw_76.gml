shader_reset();

if (!surface_exists(global.SurfaceF))
    global.SurfaceF = surface_create(sprite_get_width(sOfficeWallFront), sprite_get_height(sOfficeWallFront));

if (!surface_exists(global.SurfaceL))
    global.SurfaceL = surface_create(sprite_get_width(sOfficeWallLeft), sprite_get_height(sOfficeWallLeft));

if (!surface_exists(global.SurfaceB))
    global.SurfaceB = surface_create(sprite_get_width(sOfficeWallBack), sprite_get_height(sOfficeWallBack));

if (!surface_exists(global.SurfaceR))
    global.SurfaceR = surface_create(sprite_get_width(sOfficeWallRight), sprite_get_height(sOfficeWallRight));
