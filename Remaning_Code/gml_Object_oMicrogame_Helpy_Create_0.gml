repeat (3)
{
    with (instance_create_depth(irandom_range(0, 436), irandom_range(0, 232), 10, oPopupFredbear))
    {
        if (global.MicrogameLevel == 1)
        {
            Direction = irandom(3) * 90;
            XSpeed = lengthdir_x(2 * global.MicrogameSpeed, Direction);
            YSpeed = lengthdir_y(2 * global.MicrogameSpeed, Direction);
        }
        else if (global.MicrogameLevel == 2)
        {
            Direction = (irandom(3) * 90) - 45;
            XSpeed = lengthdir_x(2 * global.MicrogameSpeed, Direction);
            YSpeed = lengthdir_y(2 * global.MicrogameSpeed, Direction);
        }
    }
}

global.MicrogameWin = false;
