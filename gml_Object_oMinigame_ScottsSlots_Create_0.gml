Bet = 0;

function draw_bet_line(arg0)
{
    draw_circle(arg0[0], arg0[1], 2, false);
    draw_circle(arg0[2], arg0[3], 2, false);
    draw_line_width(arg0[0], arg0[1], arg0[2], arg0[3], 2);
}

function draw_line_number(arg0)
{
    switch (arg0)
    {
        case 0:
            draw_bet_line([51, 71, 155, 71]);
            break;
        
        case 1:
            draw_bet_line([51, 39, 155, 39]);
            break;
        
        case 2:
            draw_bet_line([51, 103, 155, 103]);
            break;
        
        case 3:
            draw_bet_line([51, 19, 155, 123]);
            break;
        
        case 4:
            draw_bet_line([51, 123, 155, 19]);
            break;
    }
}

function check_for_match(arg0, arg1, arg2)
{
    if ((Slots[0][arg0] == Slots[1][arg1] || (Slots[0][arg0] == 5 || Slots[1][arg1] == 5)) && (Slots[1][arg1] == Slots[2][arg2] || (Slots[1][arg1] == 5 || Slots[2][arg2] == 5)) && (Slots[0][arg0] == Slots[2][arg2] || (Slots[0][arg0] == 5 || Slots[2][arg2] == 5)))
    {
        audio_play_sound(sfxBitCollect, 5, false);
        var Earnings = max(FaceValues[Slots[0][arg0]], FaceValues[Slots[1][arg1]], FaceValues[Slots[2][arg2]]);
        TokenQueue += Earnings;
        return true;
    }
    else
    {
        return false;
    }
}

FaceValues = [5, 10, 15, 20, 30, 0];
var Icons = [];
var IconAmounts = [15, 12, 10, 8, 4, 5];

for (var i = 0; i < 6; i++)
{
    repeat (IconAmounts[i])
        array_push(Icons, i);
}

Slots = [array_shuffle(Icons), array_shuffle(Icons), array_shuffle(Icons)];
SlotsOffsets = [0, 0, 0];
SpinTimer = [0, 0, 0];
FlashTimer = 0;
LinesToDraw = [0, 0, 0, 0, 0];
TokenQueue = 0;
TotalEarnings = 0;

if (room != Office)
    global.Tokens = 10;
