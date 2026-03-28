GuardX = 29;
GuardWalking = false;
GuardTarget = GuardX;
GuardSide = 1;
BulliesX = [-64, -48, -32, -16];
BulliesSide = [-1, -1, -1, -1];
BulliesWalking = [false, false, false, false];
BulliesTarget = BulliesX;
CakeX = 0;
CakeHeight = 48;
CakeSpeed = 0;
FloorHeight = 112;
PeopleHeight = [FloorHeight, FloorHeight, FloorHeight, FloorHeight];
PeopleJumpSpeed = [0, 0, 0, 0];
PeopleFloor = [FloorHeight, FloorHeight, FloorHeight, FloorHeight];
GuardHeight = FloorHeight;
GuardJumpSpeed = 0;
CCHeight = FloorHeight;
CCJumpSpeed = 0;
CCFloor = FloorHeight;
BalloonHeight = 0;
BalloonSpeed = 0;
Timer = 0;
Frame = 0;
TextNum = 0;
TextType = 3;
Darkness = 0;
Dialogue = [];
global.MinigameSurface = -1;
application_surface_draw_enable(true);
FadeVal = 0;
Pal = [13695200, 7389320, 5662772, 3354368];

function col(arg0)
{
    return Pal[clamp(arg0 + round(FadeVal), 0, 3)];
}

GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
