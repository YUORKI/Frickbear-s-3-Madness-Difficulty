var textureFront = surfaceHandling(global.SurfaceF, sOfficeWallFront, 0, 1088, 448);
var textureLeft = surfaceHandling(global.SurfaceL, sOfficeWallLeft, 0, 576, 448);
var textureBack = surfaceHandling(global.SurfaceB, sOfficeWallBack, 0, 1088, 960);
var textureRight = surfaceHandling(global.SurfaceR, sOfficeWallRight, 0, 1600, 448);
shader_set(TransparencyShader);
draw_3d_square(x1, y1, x2, y2, x3, y3, x4, y4, depth, 0, 1, 1, textureFront, textureLeft, textureBack, textureRight);
shader_reset();
