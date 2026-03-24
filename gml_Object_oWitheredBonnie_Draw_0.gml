var AnimTimer = Timer * -120;
var CLegs = [1344, 960, round(random_range(-0.8, 0.8)) * random_range(0, 1)];
var CTorso = [CLegs[0] + rot_x(13, -204, CLegs[2]), CLegs[1] + rot_y(13, -204, CLegs[2]), (dsin(AnimTimer) * 2) + random_range(-1, 1)];
var CHead = [CTorso[0] + rot_x(-30, -90, CTorso[2]), CTorso[1] + rot_y(-30, -90, CTorso[2]), random_range(-2, 2)];
var CArm = [CTorso[0] + rot_x(-98, -56, CTorso[2]), CTorso[1] + rot_y(-98, -56, CTorso[2]), (dsin(AnimTimer + 45) * 0.5) + random_range(9, 11)];
var CWires = [CTorso[0] + rot_x(21, -98, CTorso[2]), CTorso[1] + rot_y(21, -98, CTorso[2]), dsin(AnimTimer + 45) * 2];

with (Wires)
{
    x = CWires[0];
    y = CWires[1];
    image_angle = CWires[2] * -1;
}

with (Legs)
{
    x = CLegs[0];
    y = CLegs[1];
    image_angle = CLegs[2] * -1;
}

with (Arm)
{
    x = CArm[0];
    y = CArm[1];
    image_angle = CArm[2] * -1;
}

with (Torso)
{
    x = CTorso[0];
    y = CTorso[1];
    image_angle = CTorso[2] * -1;
}

with (Head)
{
    x = CHead[0];
    y = CHead[1];
    image_angle = CHead[2] * -1;
}
