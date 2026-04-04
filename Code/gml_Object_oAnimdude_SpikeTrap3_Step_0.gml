if (Speed == 0)
    Speed = oAnimdude_Player.Speed;

if (place_meeting(x + Speed, y, oAnimdude_Wall) || (x + Speed) <= -4 || (x + Speed) > 292)
{
    var Step = sign(Speed) * 0.1;
    
    while (!place_meeting(x + Step, y, oAnimdude_Wall) && (x + Step) > -4 && (x + Step) <= 292)
        x += Step;
    
    Speed *= -1;
}

x += Speed;
