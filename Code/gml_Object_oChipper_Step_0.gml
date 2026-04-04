var ID = UnknownEnum.Value_42;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (!PicklesConverted)
{
    with (oCamButtonShopItem)
    {
        if (Text == "Pickles")
        {
            Text = "High-Quality Lumber";
            Description = "Buy this to keep Chipper happy.";
            Price = 5;
            Stock = 1;
            oChipper.Lumber = self;
            oChipper.PicklesConverted = true;
        }
    }
}

if (instance_exists(Lumber))
{
    Lumber.Price = 10 + AI;
    
    if (AI == 21)
        Lumber.Price = 300;
}
else if (PicklesConverted)
{
    reverb_sound(voc_Chipper_Yahoo, 0, 0, false, 1);
    PicklesConverted = false;
    
    if (AI == 21)
        global.Timer = max(global.Timer, 358);
}

enum UnknownEnum
{
    Value_42 = 42
}
