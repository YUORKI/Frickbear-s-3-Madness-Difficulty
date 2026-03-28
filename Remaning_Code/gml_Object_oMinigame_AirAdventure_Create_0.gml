function new_cloud()
{
    var _X = 160;
    var _Y = irandom_range(CloudSpace + 4, 136);
    
    with (instance_create_depth(_X, _Y, depth - 1, oAA_Wall))
    {
        Spawner = true;
        XPosition = other.CloudDistance;
    }
    
    with (instance_create_depth(_X, _Y - (CloudSpace + 96), depth - 1, oAA_Wall))
    {
        Spawner = false;
        XPosition = other.CloudDistance;
    }
    
    CloudDistance += ceil(CloudXSpace);
    CloudSpace = max(CloudSpace - 0.5, 48);
    
    if (CloudSpace == 48)
        CloudXSpace = max(CloudXSpace - 0.5, 72);
}

Initialize = true;
Paused = false;
WaitFrames = 1;
