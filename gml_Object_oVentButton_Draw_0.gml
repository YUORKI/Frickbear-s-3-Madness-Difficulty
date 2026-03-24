if (global.AudioLureX == ButtonID[0] && global.AudioLureY == ButtonID[1])
    image_index = 1;
else
    image_index = 0;

draw_self();
draw_salvage_wires();

if (global.AILevels[UnknownEnum.Value_14] > 0 && instance_exists(oBB))
    PositionTest(oBB, 0);

if (global.AILevels[UnknownEnum.Value_15] > 0 && instance_exists(oJJ))
    PositionTest(oJJ, 1);

if (global.AILevels[UnknownEnum.Value_7] > 0 && instance_exists(oToyBonnie))
    PositionTest(oToyBonnie, 2);

if (global.AILevels[UnknownEnum.Value_12] > 0 && instance_exists(oWitheredChica))
    PositionTest(oWitheredChica, 3);

if (global.AILevels[UnknownEnum.Value_33] > 0 && instance_exists(oLefty))
    PositionTest(oLefty, 4);

if (global.AILevels[UnknownEnum.Value_32] > 0 && instance_exists(oMrHippo))
    PositionTest(oMrHippo, 5);

enum UnknownEnum
{
    Value_7 = 7,
    Value_12 = 12,
    Value_14 = 14,
    Value_15,
    Value_32 = 32,
    Value_33
}
