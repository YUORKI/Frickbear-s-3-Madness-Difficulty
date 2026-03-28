WaitForFlip = false;
Exposure = 0;
CamOrder = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);

while (CamOrder[0] == 1)
    CamOrder = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);

CamNum = 0;
CurrentCam = CamOrder[CamNum];
StickyNote = instance_create_layer(1480, 570, "OnWall", oOfficeSprite);

with (StickyNote)
    sprite_index = sMangleStickyNote;
