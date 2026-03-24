set_target_to_ui();
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (TimeToNextAttack <= 0)
{
    Frame = 0;
    
    if (AttacksUsed == 0)
        notification("ALL your old friends are here!", 2);
    
    if (AttacksUsed < 3)
    {
        TimeToNextAttack = 9;
    }
    else if ((global.Timer + TimeToNextAttack) > 350)
    {
        TimeToNextAttack = 999;
    }
    else
    {
        TimeToNextAttack = AttackDelay;
        AttackDelay = max(AttackDelay - 1, 10);
    }
    
    ChosenTitle = AttackList[CurrentAttack].Title;
    ChosenAttack = AttackList[CurrentAttack].AttackObj;
    TextSize = 0;
    TextOffset = 0;
    TextOffsetSpeed = 0;
    CurrentAttack = (CurrentAttack + 1) % array_length(AttackList);
    AttacksUsed++;
}

var WaitTime = 60;

if (Frame >= (WaitTime + 15))
{
    TextOffsetSpeed -= 1;
    TextOffset = max(TextOffset + TextOffsetSpeed, -360);
}
else if (Frame >= WaitTime)
{
    TextOffsetSpeed = 2;
    TransitionSpeed += 0.005;
    TextSize += ((3 - TextSize) / 5);
}
else if (Frame >= (WaitTime - 60))
{
    TextOffset = 0;
    TextOffsetSpeed = 0;
    TransitionSpeed = 0.05;
    
    if (Frame >= (WaitTime - 15))
        TextSize += ((3 - TextSize) / 5);
}

if (Frame == WaitTime)
    instance_create_depth(0, 0, 0, ChosenAttack);

for (var i = 0; i < 360; i += 45)
{
    draw_set_color(c_black);
    draw_text_transformed(320 + (TextSize * round(lengthdir_x(1, i))), TextOffset + 180 + (TextSize * round(lengthdir_y(1, i))), ChosenTitle, TextSize, TextSize, 0);
}

draw_set_color(c_white);
draw_text_transformed(320, TextOffset + 180, ChosenTitle, TextSize, TextSize, 0);
draw_set_valign(fa_top);
surface_reset_target();
Frame++;
TimeToNextAttack -= 0.016666666666666666;
