function rot_x(arg0, arg1, arg2)
{
    return (arg0 * dcos(arg2 * -1)) - (arg1 * dsin(arg2 * -1));
}

function rot_y(arg0, arg1, arg2)
{
    return (arg0 * dsin(arg2 * -1)) + (arg1 * dcos(arg2 * -1));
}
