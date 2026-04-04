Alpha = 0;
Frame = -60;
MainOffset = 0;
SecondaryOffset = 640;
CurCassidy = 0;
Squish = 1;
SquishSpeed = 0;
VisualMode = 0;

function switch_cassidy_sprite(arg0)
{
    CurCassidy = arg0;
    
    if (arg0 == 0)
        SquishSpeed = 0.05;
    else
        SquishSpeed = -0.05;
}

application_surface_draw_enable(true);
GuardSprites = import_sprites("SPOILERS/cutscenes/conversation.png", sCassidyCutscene2, 2);
