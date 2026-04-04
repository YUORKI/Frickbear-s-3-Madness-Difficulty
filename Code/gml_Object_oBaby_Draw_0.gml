var ID = UnknownEnum.Value_26;
var AI = global.AILevels[ID];

if (Initialize && AI > 0)
{
    var BidybabLocations = array_create(32, false);
    var BidybabAmount = AI;
    var Destination = irandom_range(0, array_length(BidybabLocations) - 1);
    
    repeat (BidybabAmount)
    {
        while (BidybabLocations[Destination])
            Destination = irandom_range(0, array_length(BidybabLocations) - 1);
        
        BidybabLocations[Destination] = true;
        
        with (instance_create_depth(0, 0, 1, oBidybab))
        {
            Camera = floor(Destination / 4) + 1;
            BabID = Destination % 4;
        }
        
        BidybabsLeft++;
    }
    
    Initialize = false;
}

if (global.Cam == UnknownEnum.Value_7 && BidybabsLeft > 0)
{
    depth = 80;
    var TenDigit = floor(BidybabsLeft / 10);
    var OneDigit = floor(BidybabsLeft) % 10;
    draw_sprite(sBidybabCounter, 0, global.CamX + 378, global.CamY + 66);
    
    if (BidybabsLeft >= 10)
        draw_sprite(sBidybabCounter, TenDigit, global.CamX + 378, global.CamY + 66);
    
    draw_sprite(sBidybabCounter, OneDigit + 3, global.CamX + 378, global.CamY + 66);
    draw_sprite(sCameras_Baby, 0, global.CamX, global.CamY);
}

enum UnknownEnum
{
    Value_7 = 7,
    Value_26 = 26
}
