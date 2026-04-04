Frame = 0;

function spin_x(arg0, arg1)
{
    return x + round((arg0 * dcos(Frame * -1)) - (arg1 * dsin(Frame * -1)));
}

function spin_y(arg0, arg1)
{
    return 72 + round((arg1 * dcos(Frame * -1)) + (arg0 * dsin(Frame * -1)));
}
