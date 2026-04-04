randomize();
Initialize = true;

function check_for_matches(arg0)
{
    var CardX = arg0 % 5;
    var CardY = floor(arg0 / 5);
    var TestX = CardX;
    var TestY = CardY;
    var TestID = arg0;
    
    for (var d = 0; d < 360; d += 45)
    {
        TestX = CardX + round(lengthdir_x(1, d));
        TestY = CardY + round(lengthdir_y(1, d));
        TestID = -1;
        
        if (TestX >= 0 && TestX < 5 && TestY >= 0 && TestY < 4)
        {
            TestID = (TestY * 5) + TestX;
            
            if (ds_list_find_value(CardDeck, arg0) == ds_list_find_value(CardDeck, TestID))
                return true;
        }
    }
    
    return false;
}

global.MicrogameWin = false;
