var Seconds = 10;
DeathTimer = Seconds;

switch (global.MicrogameLevel * random_sign())
{
    case -2:
        OriginalX = 608;
        OriginalY = 673;
        break;
    
    case -1:
        OriginalX = 691;
        OriginalY = 673;
        break;
    
    case 0:
        OriginalX = 1321;
        OriginalY = 750;
        break;
    
    case 1:
        OriginalX = 1698;
        OriginalY = 663;
        break;
    
    case 2:
        OriginalX = 2000;
        OriginalY = 706;
        break;
}

Mode = "Wait";
simple_sound(sfxCartoonPop, 0, 0, false, 0.75);
layer = layer_get_id("OnWall");
global.MicrogameWin = false;
event_inherited();
