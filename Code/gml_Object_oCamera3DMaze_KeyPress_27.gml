exit;

if (!instance_exists(oTextBox))
{
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text("Pause");
    
    LockOnTarget = 1;
}
