var wall = oMinigameWall;
var player = oMinigamePlayer;

if (state == 0)
{
    facing = point_direction(x, y, wanderx, wandery);
    
    if (distance_to_point(wanderx, wandery) < 1)
    {
        wanderx = x + irandom_range(-120, 120);
        wandery = y + irandom_range(-120, 120);
    }
    else
    {
        mp_potential_step_object(wanderx, wandery, 0.6, wall);
    }
    
    while (!place_meeting(wanderx, wandery, wall))
    {
        wanderx = x + irandom_range(-120, 120);
        wandery = y + irandom_range(-120, 120);
    }
    
    if (abs(angle_difference(facing, point_direction(x, y, player.x, player.y))) < cone && distance_to_point(player.x, player.y) < sightdist && !collision_line(x, y, player.x, player.y, wall, 1, 1))
        state = 1;
}
else if (state == 1)
{
    if (!collision_line(x, y, player.x, player.y, wall, 1, 1))
    {
        seenx = player.x;
        seeny = player.y;
    }
    
    if (distance_to_point(seenx, seeny) > 0)
        mp_potential_step_object(seenx, seeny, 2, wall);
    else
        state = 0;
}
